-- King Legacy Script - Optimized Version
-- Removed: UI library, visual gimmicks, broken features, and unnecessary bloat

_G.Settings = {
    Select_Weapon = 'Sword',
    Auto_Farm_Level1 = false,
    Select_Skill = true,
    SkillZ = false,
    SkillX = false,
    SkillC = false,
    SkillV = false,
    SkillB = false,
    SkillE = false,
    PositionFarm = 'Above',
    Disfarm = 7.5,
    Bring_Nearest_Mobs_Together = false,
}

-- Services
local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local VirtualUser = game:GetService('VirtualUser')
local VirtualInputManager = game:GetService('VirtualInputManager')
local HttpService = game:GetService('HttpService')
local TeleportService = game:GetService('TeleportService')

-- Client Setup
local Client = Players.LocalPlayer
repeat Client = Players.LocalPlayer; wait() until Client

-- Sea Detection
local Sea1 = game.PlaceId == 4520749081
local Sea2 = game.PlaceId == 6381829480
local Sea3 = game.PlaceId == 15759515082

-- Weapon Tracking
local myWeapon = {Melee = '', Sword = '', Fruit = ''}
local addSkill = '?'

-- Utility Functions
function EquipTools(toolName)
    local tool = Client.Backpack:FindFirstChild(toolName)
    if tool and Client.Character and Client.Character:FindFirstChild('Humanoid') then
        Client.Character.Humanoid:EquipTool(tool)
    end
end

function getTool()
    if not Client.Character then return nil end
    for _, v in pairs(Client.Character:GetChildren()) do
        if v:IsA('Tool') then
            if v.ToolTip == 'Fruit Power' then addSkill = 'DF' end
            return tostring(v.Name), v.ToolTip
        end
    end
    return nil
end

-- Cooldown Check
local SkillCooldown = {
    CheckOnCooldown = function(key)
        local skillKey = string.upper(key or 'Z')
        local frame = nil
        local _, toolTip = getTool()
        
        if toolTip == 'Sword' then
            frame = Client.PlayerGui.SkillCooldown:FindFirstChild('SWFrame')
        elseif toolTip == 'Combat' then
            frame = Client.PlayerGui.SkillCooldown:FindFirstChild('FSFrame')
        elseif toolTip == 'Fruit Power' then
            frame = Client.PlayerGui.SkillCooldown:FindFirstChild('DFFrame')
        end
        
        if not (frame and frame:FindFirstChild(skillKey)) then return true end
        local skill = frame[skillKey]
        return not skill:FindFirstChild('Locked').Visible and skill.Frame.Frame.AbsoluteSize.X > 0
    end
}

-- Attack Function
function Attack()
    local weapon = _G.Settings.Select_Weapon
    local toolName, toolTip = getTool()
    
    if weapon == 'Melee' then
        addSkill = 'FS'
        ReplicatedStorage.Chest.Remotes.Functions.SkillAction:InvokeServer('FS_' .. (toolName or 'Combat') .. '_M1')
    elseif weapon == 'Sword' then
        addSkill = 'SW'
        ReplicatedStorage.Chest.Remotes.Functions.SkillAction:InvokeServer('SW_' .. (toolName or 'Sword') .. '_M1')
    elseif weapon == 'Fruit Power' then
        addSkill = 'FP'
        ReplicatedStorage.Chest.Remotes.Functions.SkillAction:InvokeServer('FP_' .. (toolName or 'Fruit') .. '_M1')
    end
    
    if toolName then EquipTools(toolName) end
end

-- Skill Usage
local skillHoldTimes = {Z = 0, X = 0, C = 0, V = 0, B = 0, E = 0}

function UseSkills()
    if not _G.Settings.Select_Skill then return end
    
    local skills = {
        {key = 'Z', enabled = _G.Settings.SkillZ, holdTime = skillHoldTimes.Z},
        {key = 'X', enabled = _G.Settings.SkillX, holdTime = skillHoldTimes.X},
        {key = 'C', enabled = _G.Settings.SkillC, holdTime = skillHoldTimes.C},
        {key = 'V', enabled = _G.Settings.SkillV, holdTime = skillHoldTimes.V},
        {key = 'B', enabled = _G.Settings.SkillB, holdTime = skillHoldTimes.B},
        {key = 'E', enabled = _G.Settings.SkillE, holdTime = skillHoldTimes.E},
    }
    
    for _, skill in ipairs(skills) do
        if skill.enabled and not SkillCooldown.CheckOnCooldown(skill.key) then
            VirtualInputManager:SendKeyEvent(true, skill.key, false, game)
            wait(skill.holdTime)
            VirtualInputManager:SendKeyEvent(false, skill.key, false, game)
        end
    end
end

-- Teleport Functions
function tp(targetCFrame, offset)
    offset = offset or CFrame.new(0, 0, 0)
    pcall(function()
        if Client.Character and Client.Character:FindFirstChild('HumanoidRootPart') then
            Client.Character.HumanoidRootPart.CFrame = targetCFrame * offset
        end
    end)
end

function Tp(targetCFrame)
    if Client.Character and Client.Character:FindFirstChild('HumanoidRootPart') then
        Client.Character.HumanoidRootPart.CFrame = targetCFrame
    end
end

-- Quest Data
function GetQuestData()
    local level = Client.PlayerStats.lvl.Value
    local questData = {}
    
    for questName, questInfo in pairs(require(ReplicatedStorage.Chest.Modules.QuestManager)) do
        if not questInfo.DailyQuest and questInfo.Level <= level then
            table.insert(questData, {
                LevelRequired = questInfo.Level or 1,
                Mob = questInfo.Mob,
                QuestTitle = questName,
                NPC = questInfo.NPC,
            })
        end
    end
    
    table.sort(questData, function(a, b) return a.LevelRequired > b.LevelRequired end)
    return questData[1]
end

-- Monster Finding
function findMonsters(monsterNames)
    local locations = {
        workspace.Monster.Mon:GetChildren(),
        workspace.Monster.Boss:GetChildren(),
        workspace.SeaMonster:GetChildren(),
        ReplicatedStorage.MOB:GetChildren(),
    }
    
    for _, location in ipairs(locations) do
        for _, mob in ipairs(location) do
            if table.find(monsterNames, mob.Name) then
                local humanoid = mob:FindFirstChild('Humanoid')
                local hrp = mob:FindFirstChild('HumanoidRootPart')
                if humanoid and hrp and humanoid.Health > 0 then
                    return mob
                end
            end
        end
    end
    return nil
end

-- Auto Farm Level
function AutoFarmLevel()
    while _G.Settings.Auto_Farm_Level1 do
        local success, err = pcall(function()
            local quest = GetQuestData()
            if not quest then return end
            
            -- Get quest if needed
            if Client.CurrentQuest.Value ~= quest.QuestTitle then
                tp(quest.NPC.CFrame, CFrame.new(0, 0, -3))
                ReplicatedStorage.Chest.Remotes.Functions.Quest:InvokeServer('take', quest.QuestTitle)
                wait(0.5)
            end
            
            -- Find and attack mob
            local target = findMonsters({quest.Mob})
            if target and target:FindFirstChild('HumanoidRootPart') then
                local hrp = target.HumanoidRootPart
                local posOffset = _G.Settings.PositionFarm == 'Above' and CFrame.new(0, _G.Settings.Disfarm, 0) or
                                  _G.Settings.PositionFarm == 'Beside' and CFrame.new(_G.Settings.Disfarm, 0, 0) or
                                  CFrame.new(0, -_G.Settings.Disfarm, 0)
                
                while target:FindFirstChild('Humanoid') and target.Humanoid.Health > 0 and _G.Settings.Auto_Farm_Level1 do
                    tp(hrp.CFrame, posOffset)
                    Attack()
                    UseSkills()
                    
                    if _G.Settings.Bring_Nearest_Mobs_Together then
                        -- Bring nearby mobs
                        for _, mob in pairs(workspace.Monster.Mon:GetChildren()) do
                            if mob.Name == quest.Mob and mob:FindFirstChild('HumanoidRootPart') then
                                mob.HumanoidRootPart.CFrame = hrp.CFrame
                            end
                        end
                    end
                    
                    wait(0.1)
                end
            end
        end)
        
        if not success then warn('AutoFarm Error:', err) end
        wait(0.5)
    end
end

-- Server Hop
function HopServer()
    local servers = {}
    local url = 'https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'
    
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    
    if success and result and result.data then
        for _, server in ipairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                table.insert(servers, server.id)
            end
        end
        
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Client)
        end
    end
end

-- Anti-AFK
Client.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- Weapon Detection
spawn(function()
    while task.wait(1) do
        pcall(function()
            for _, tool in pairs(Client.Backpack:GetChildren()) do
                if tool:IsA('Tool') then
                    if tool.ToolTip == 'Combat' then myWeapon.Melee = tool.Name
                    elseif tool.ToolTip == 'Sword' then myWeapon.Sword = tool.Name
                    elseif tool.ToolTip == 'Fruit Power' then myWeapon.Fruit = tool.Name
                    end
                end
            end
        end)
    end
end)

-- Simple Command Interface
print('=== King Legacy Script Loaded ===')
print('Commands:')
print('/farm - Toggle auto farm level')
print('/weapon [Melee/Sword/Fruit] - Change weapon')
print('/hop - Server hop')
print('/skill [Z/X/C/V/B/E] - Toggle skill usage')

-- Start farm with command (or set _G.Settings.Auto_Farm_Level1 = true)
spawn(function()
    while wait() do
        if _G.Settings.Auto_Farm_Level1 then
            AutoFarmLevel()
        end
    end
end)
