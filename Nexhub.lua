function runAutoAccept()
    local v2, v3 = pcall(function()
        game:GetService('ReplicatedStorage').Chest.Remotes.Functions.EtcFunction:InvokeServer('EnterTheGame', {})
    end)
    if v2 then
        print('AutoAccept executed successfully.')
        return true
    else
        warn('Failed to execute AutoAccept: ', v3)
        return false
    end
end

runAutoAccept()
wait(1)

local _Players = game.Players

repeat
    Client = _Players.LocalPlayer
    wait()
until Client

local _TeleportService = game:GetService('TeleportService')

Sea1 = game.PlaceId == 4520749081
Sea2 = game.PlaceId == 6381829480
Sea3 = game.PlaceId == 15759515082

cheatKey = {}
myWeapon = { Melee = '', Sword = '', Fruit = '' }
addSkill = '?'

_G.Settings = {
    Select_Weapon = 'Sword',
    Auto_Sea31 = false,
    Select_Skill = true,
    SkillZ = false, SkillX = false, SkillC = false,
    SkillV = false, SkillB = false, SkillE = false,
}

local saveFolder = 'zensave1'
local saveFile = Client.Name .. ' Config.json'

function SaveSettings()
    local data = game:GetService('HttpService'):JSONEncode(_G.Settings)
    if writefile then
        if not isfolder(saveFolder) then makefolder(saveFolder) end
        if not isfolder(saveFolder .. '/King Legacy') then makefolder(saveFolder .. '/King Legacy') end
        writefile(saveFolder .. '/King Legacy/' .. saveFile, data)
    end
end

function LoadSettings()
    local _HttpService = game:GetService('HttpService')
    local path = saveFolder .. '/King Legacy/' .. saveFile
    if isfile(path) then
        for k, v in pairs(_HttpService:JSONDecode(readfile(path)) or _G.Settings) do
            _G.Settings[k] = v
        end
    end
end

LoadSettings()

vu = game:GetService('VirtualUser')

Client.Idled:connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

GUI = Client.PlayerGui
Repli = game:GetService('ReplicatedStorage')
QuestManager = game:GetService('ReplicatedStorage').Chest.Modules.QuestManager

-- NoClip loop
task.spawn(function()
    while task.wait() do
        pcall(function()
            if NeedNoClip then
                if Client and Client.Character and Client.Character.Humanoid.Sit == true then
                    Client.Character.Humanoid.Sit = false
                end
                for _, v in pairs(Char:GetDescendants()) do
                    if v:IsA('BasePart') then v.CanCollide = false end
                end
                if Char and not Char.UpperTorso:FindFirstChild('BodyClip') then
                    local bv = Instance.new('BodyVelocity')
                    bv.Parent = Char.UpperTorso
                    bv.Name = 'BodyClip'
                    bv.Velocity = Vector3.new(0, 1, 0)
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                elseif Char and Char.UpperTorso:FindFirstChild('BodyClip') then
                    local bc = Char.UpperTorso:FindFirstChild('BodyClip')
                    bc.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bc.Velocity = Vector3.new(0, 0, 0)
                end
            elseif Char and Char.UpperTorso:FindFirstChild('BodyClip') then
                Char.UpperTorso:FindFirstChild('BodyClip'):Destroy()
            end
        end)
    end
end)

local currentToolName = nil
local currentToolTip = nil

function getTool()
    for _, v in pairs(Client.Character:GetChildren()) do
        if v:IsA('Tool') then
            if v.ToolTip == 'Fruit Power' then addSkill = 'DF' end
            currentToolName = tostring(v.Name)
            currentToolTip = v.ToolTip
        end
    end
    return currentToolName
end

local u31 = {
    CheckOnCooldown = function(p26)
        getTool()
        local key = string.upper(p26 or 'Z')
        local _SkillCooldown = Client.PlayerGui.SkillCooldown
        local frame = nil
        if currentToolTip == 'Sword' then
            frame = _SkillCooldown:FindFirstChild('SWFrame')
        elseif currentToolTip == 'Combat' then
            frame = _SkillCooldown:FindFirstChild('FSFrame')
        elseif currentToolTip == 'Fruit Power' then
            frame = _SkillCooldown:FindFirstChild('DFFrame')
        end
        if not (frame and frame:FindFirstChild(key)) then return true end
        local slot = frame[key]
        return not slot:FindFirstChild('Locked').Visible and slot.Frame.Frame.AbsoluteSize.X > 0 or false
    end,
}

function getPlayerMaterial(name)
    for k, v in pairs(game:GetService('HttpService'):JSONDecode(Client.PlayerStats.Material.Value)) do
        if k == name then return v end
    end
    return 0
end

QuestMaterial = {
    ['3350'] = { Material = 'Ice Crystal', Kills = 'Azlan [Lv. 3300]', QuestTitle = 'Kill 4 Azlan', Level = 3300 },
    ['3375'] = { Material = 'Magma Crystal', Kills = 'The Volcano [Lv. 3325]', QuestTitle = 'Kill 4 The Volcano', Level = 3325 },
    ['3475'] = { Material = "Dark Beard's Totem", Kills = 'Sally [Lv. 3450]', QuestTitle = 'Kill 1 Sally', Level = 3450 },
    ['3575'] = { Material = "Lucidus's Totem", Kills = 'Vice Admiral [Lv. 3500]', QuestTitle = 'Kill 5 Vice Admiral', Level = 3500 },
}

function GetQuestData(p38)
    local lvl = Client.PlayerStats.lvl.Value
    local quests = {}
    for k, v in pairs(require(game.ReplicatedStorage.Chest.Modules.QuestManager)) do
        if not v.DailyQuest and v.Mob:match('Lv') and (p38 or v.Level <= lvl) then
            local npcs = {}
            for _, npc in pairs(workspace.AllNPC:GetChildren()) do
                if npc:GetAttribute('LevelMin') and v.Level >= npc:GetAttribute('LevelMin') then
                    table.insert(npcs, { Level = npc:GetAttribute('LevelMin'), CFrame = npc.CFrame })
                end
            end
            table.sort(npcs, function(a, b) return a.Level > b.Level end)
            table.insert(quests, {
                LevelRequired = v.Level or 1,
                Mob = (lvl >= 3300 and lvl < 3375) and 'Azlan [Lv. 3300]' or v.Mob,
                QuestTitle = (lvl >= 3300 and lvl < 3375) and 'Kill 4 Azlan' or k,
                NPC = npcs[1],
            })
        end
    end
    table.sort(quests, function(a, b) return a.LevelRequired > b.LevelRequired end)

    if MaxLevelOfSea > lvl or not Sea2 then
        if MaxLevelOfSea <= lvl and Sea1 then
            quests[1].Mob = 'Seasoned Fishman [Lv. 2200]'
            quests[1].LevelRequired = 2200
            quests[1].QuestTitle = 'Kill 1 Seasoned Fishman'
        end
    else
        quests[1].Mob = 'Ryu [Lv. 3975]'
        quests[1].LevelRequired = 3950
        quests[1].QuestTitle = 'Kill 1 Ryu'
    end

    for lvlKey, mat in pairs(QuestMaterial) do
        if quests[1].LevelRequired == tonumber(lvlKey) then
            local found = false
            for _, container in pairs({workspace.Monster.Mon, workspace.Monster.Boss, game:GetService('ReplicatedStorage').MOB}) do
                for _, mob in pairs(container:GetChildren()) do
                    if mob.Name == quests[1].Mob and mob:FindFirstChild('Humanoid') and mob:FindFirstChild('HumanoidRootPart') and mob.Humanoid.Health > 0 then
                        found = true
                    end
                end
            end
            if getPlayerMaterial(mat.Material) > 0 or found then
                if getPlayerMaterial(mat.Material) > 0 and not found then
                    game:GetService('ReplicatedStorage'):WaitForChild('Chest').Remotes.Functions.EtcFunction:InvokeServer('QuestSpawnBoss', {
                        SuccessQuest = 'Quest Accepted.',
                        BossName = quests[1].Mob,
                        LevelNeed = quests[1].LevelRequired,
                        QuestName = quests[1].QuestTitle,
                        MaterialNeed = mat.Material,
                    })
                end
            else
                quests[1].Mob = mat.Kills
                quests[1].LevelRequired = mat.Level
                quests[1].QuestTitle = mat.QuestTitle
            end
        end
    end
    return quests[1]
end

-- MaxLevelOfSea / MinLevelOfSea init
for _, npc in pairs(workspace.AllNPC:GetChildren()) do
    if npc:GetAttribute('LevelMax') then
        local lv = npc:GetAttribute('LevelMax')
        if not MaxLevelOfSea or lv > MaxLevelOfSea then MaxLevelOfSea = lv end
    end
    if npc:GetAttribute('LevelMin') then
        local lv = npc:GetAttribute('LevelMin')
        if not MinLevelOfSea or lv < MinLevelOfSea then MinLevelOfSea = lv end
    end
end

function tp(p)
    pcall(function()
        local char = Client.Character
        if char:FindFirstChild('Humanoid') and char.Humanoid.Sit then char.Humanoid.Sit = false end
        NeedNoClip = true
        char.HumanoidRootPart.CFrame = (p.Target or CFrame.new()) * (p.Mod or CFrame.new())
    end)
end

function Tp(cf)
    if Client.Character.Humanoid.Sit then Client.Character.Humanoid.Sit = false end
    for _, v in pairs(Client.Character:GetDescendants()) do
        if v:IsA('BasePart') then v.CanCollide = false end
    end
    local hrp = Client.Character.HumanoidRootPart
    if not hrp:FindFirstChild('BodyClip') then
        local bv = Instance.new('BodyVelocity')
        bv.Parent = hrp
        bv.Name = 'BodyClip'
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.MaxForce = Vector3.new(5, math.huge, 5)
    end
    hrp.CFrame = cf
end

function tp1(cf)
    local lp = game.Players.LocalPlayer
    if lp and lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
        lp.Character.HumanoidRootPart.CFrame = cf
    end
end

function EquipTools(name)
    if Client.Backpack:FindFirstChild(name) then
        Client.Character.Humanoid:EquipTool(Client.Backpack:FindFirstChild(name))
    end
end

local weaponOrder = { 'Melee', 'Sword', 'Fruit Power' }
local weaponIndex = 1

function Attack()
    local w = _G.Settings.Select_Weapon
    if w == 'Melee' then
        addSkill = 'FS'
        game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('FS_' .. _G.Weapon .. '_M1')
    elseif w == 'Sword' then
        addSkill = 'SW'
        game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('SW_' .. _G.Weapon .. '_M1')
    elseif w == 'Fruit Power' then
        game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('FP_' .. _G.Weapon .. '_M1')
    elseif w == 'all In One' then
        local cur = weaponOrder[weaponIndex]
        if cur == 'Sword' then addSkill = 'SW'
            delay(0.1, function() game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('SW_' .. myWeapon.Sword .. '_M1') end)
        elseif cur == 'Melee' then addSkill = 'FS'
            game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('FS_' .. myWeapon.Melee .. '_M1')
        elseif cur == 'Fruit Power' then addSkill = 'FP'
            game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('FP_' .. myWeapon['Fruit Power'] .. '_M1')
        end
        EquipTools(myWeapon[cur])
        weaponIndex = weaponIndex % #weaponOrder + 1
        return
    end
    if w ~= 'all In One' then EquipTools(_G.Weapon) end
end

local skillHoldTimes = { Z = 0, X = 0, C = 0, V = 0, B = 0, E = 0 }

local function useSkills()
    if not _G.Settings.Select_Skill then return end
    local keys = { 'Z', 'X', 'C', 'V', 'B', 'E' }
    for _, key in ipairs(keys) do
        if _G.Settings['Skill' .. key] and not u31.CheckOnCooldown(key) then
            local vim = game:GetService('VirtualInputManager')
            vim:SendKeyEvent(true, key, false, game)
            wait(skillHoldTimes[key])
            vim:SendKeyEvent(false, key, false, game)
        end
    end
end

local function clickUI(obj)
    if obj then
        game:GetService('GuiService').SelectedObject = obj
        task.wait(0.1)
        game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        task.wait(0.1)
        game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        task.wait(0.1)
        game:GetService('GuiService').SelectedObject = nil
    end
end

function click(n)
    for _ = 1, n or 3 do
        game:GetService('VirtualUser'):Button1Down(Vector2.new(1, 1))
        game:GetService('VirtualUser'):Button1Up(Vector2.new(1, 1))
    end
end

function toQuest(cf, questType, doTp)
    local doTeleport = doTp ~= false
    local qType = questType or 'QuestLvl'
    if doTeleport and cf and Client.Character:FindFirstChild('HumanoidRootPart') then
        Client.Character.HumanoidRootPart.CFrame = cf * CFrame.new(0, 0, -3)
    end
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    if hrp then
        hrp.Anchored = true
        wait(0.1)
        hrp.Anchored = false
    end
    vu:Button1Down(Vector2.new(1, 1))
    vu:Button1Up(Vector2.new(1, 1))
    wait(0.5)
    for _, gui in pairs(Client.PlayerGui:GetChildren()) do
        if string.find(gui.Name, qType) then
            local dlg = gui:FindFirstChild('Dialogue')
            if dlg and dlg:FindFirstChild('Accept') then
                local acc = dlg.Accept
                if game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or doTeleport then
                    acc.Size = UDim2.new(1001, 0, 1001, 0)
                    acc.Text.TextTransparency = 1
                    acc.Position = UDim2.new(0.5, 0, 0.5, 0)
                    acc.AnchorPoint = Vector2.new(0.5, 0.5)
                end
                if acc then acc:Click() end
            end
        end
    end
end

function HopServer(lowPop)
    local _HttpService = game:GetService('HttpService')
    local placeId = game.PlaceId
    local baseUrl = 'https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100'

    if lowPop and request then
        local servers = {}
        local body = request({ Url = string.format('https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true', placeId) }).Body
        local data = _HttpService:JSONDecode(body)
        if data and data.data then
            for _, s in next, data.data do
                if type(s) == 'table' and s.playing and s.maxPlayers and s.playing < s.maxPlayers and s.id ~= game.JobId then
                    table.insert(servers, 1, s.id)
                end
            end
        end
        if #servers <= 0 then return "Couldn't find a server." end
        game:GetService('TeleportService'):TeleportToPlaceInstance(placeId, servers[math.random(1, #servers)], Client)
    else
        local result = _HttpService:JSONDecode(game:HttpGet(baseUrl))
        local serverId = result.data[1]
        if serverId then
            game:GetService('TeleportService'):TeleportToPlaceInstance(placeId, serverId.id, Client)
        end
    end
end

function dist(pos, origin, ignoreY)
    local char = Client.Character
    local from = origin or char.HumanoidRootPart.Position
    local a = Vector3.new(pos.X, ignoreY and 0 or pos.Y, pos.Z)
    local b = Vector3.new(from.X, ignoreY and 0 or from.Y, from.Z)
    return (a - b).Magnitude
end

local lastBeli = 0

function seaChest()
    wait(3)
    local function hopIfNeeded()
        if _G.Settings.Monter_Hop or _G.Settings.Auto_Sea31 then
            task.wait(3.5)
            HopServer(false)
        end
    end
    local hasSeaKing = workspace.SeaMonster:FindFirstChild('SeaKing') or workspace.SeaMonster:FindFirstChild('HydraSeaKing')
    local legacyIslands = {'Legacy Island1','Legacy Island2','Legacy Island3','Legacy Island4'}
    local foundIsland = false
    for _, name in ipairs(legacyIslands) do
        if workspace.Island:FindFirstChild(name) then foundIsland = true break end
    end
    local seaKingIsland = false
    for _, v in pairs(workspace.Island:GetChildren()) do
        if v.Name:match('Sea King') then seaKingIsland = true break end
    end
    if not hasSeaKing and (foundIsland or seaKingIsland) then
        for _, name in ipairs(legacyIslands) do
            local isle = workspace.Island:FindFirstChild(name)
            if isle then
                tp({ Target = isle.ChestSpawner.CFrame })
                Client.PlayerStats.beli.Value = Client.PlayerStats.beli.Value + 50
                wait(3)
                if dist(isle.ChestSpawner.Position, Client.Character.HumanoidRootPart.Position) < 10 and Client.PlayerStats.beli.Value > lastBeli + 1 then
                    hopIfNeeded()
                end
            end
        end
        for _, v in pairs(workspace.Island:GetChildren()) do
            if v.Name:match('Sea King') then
                tp({ Target = v.HydraStand.CFrame })
            end
        end
    end
end

local function getNearestIslandName(pos)
    if type(pos) ~= 'vector' then
        if type(pos) == 'userdata' then pos = pos.Position
        elseif type(pos) == 'number' then pos = CFrame.new(pos).p end
    end
    local nearest, nearestName = math.huge, nil
    for _, isle in pairs(workspace.Island:GetChildren()) do
        if isle:IsA('Model') then
            local d = (pos - isle:GetModelCFrame().p).Magnitude
            if d < nearest then nearest = d; nearestName = isle.Name end
        end
    end
    return nearestName
end

local npcsByIsland = {}
local function cacheNPCsForIsland(cf)
    local islandName = getNearestIslandName(cf)
    for _, npc in pairs(workspace.AllNPC:GetChildren()) do
        local n = getNearestIslandName(npc.CFrame)
        if n == islandName then
            if not npcsByIsland[n] then npcsByIsland[n] = {} end
            table.insert(npcsByIsland[n], npc.CFrame)
        end
    end
end

local farmPositions = {}

function adjustPosition(cf, mode)
    local d = _G.Disfarm or 7.5
    return cf * ({ Above = CFrame.new(0,d,0), Beside = CFrame.new(d,0,0), Lower = CFrame.new(0,-d,0) })[mode] or CFrame.new()
end

function getTargetPosition(model, mode)
    local hrp = model:FindFirstChild('HumanoidRootPart')
    if not hrp then return nil end
    local d = _G.Disfarm or 7.5
    local offsets = { Above = Vector3.new(0,d,0), Beside = Vector3.new(d,0,0), Lower = Vector3.new(0,-d,0) }
    local pos = hrp.Position + (offsets[mode] or Vector3.new())
    if mode == 'Beside' or mode == 'Lower' then return CFrame.new(pos, hrp.Position)
    else return CFrame.new(pos) end
end

local Mob = {}

function Mob.Bring(mob, cf)
    if not _G.Settings.Bring_Nearest_Mobs_Together then return end
    for _, m in pairs(workspace.Monster.Mon:GetChildren()) do
        if m.Name == mob.Name and m:FindFirstChild('Humanoid') and m.Humanoid.Health > 0 and m:FindFirstChild('HumanoidRootPart') then
            m.HumanoidRootPart.CFrame = cf
            m.Humanoid.PlatformStand = true
            m.Humanoid:ChangeState(11)
            m.Humanoid:ChangeState(14)
            setscriptable(game.Players.LocalPlayer, 'SimulationRadius', true)
        end
    end
end

function Mob.attack(names, settingKey)
    local questData = GetQuestData()
    local function updateLabel(mob)
        if mob and mob:FindFirstChild('Humanoid') and mob:FindFirstChild('HumanoidRootPart') then
            local hp = math.floor(mob.Humanoid.Health / mob.Humanoid.MaxHealth * 100)
            _G.LabelAutoFarm = 'Farming: ' .. mob.Name
            _G.Questname = 'Quest: ' .. questData.QuestTitle
            _G.LabelHealth = string.format('Status: %s | Health: %d%%', mob.Humanoid.Health > 0 and 'Alive' or 'Dead', hp)
        else
            _G.LabelAutoFarm = 'No target detected.'
        end
    end

    local function fightMob(mob)
        if not (_G.Settings[settingKey] and mob.Parent) then return end
        while true do
            task.wait()
            if mob:FindFirstChild('Humanoid') and mob:FindFirstChild('HumanoidRootPart') then
                local hp = mob.Humanoid.Health
                local y = mob.HumanoidRootPart.Position.Y
                updateLabel(mob)
                if hp > 0 and y > -100 and y < 1500 then
                    tp({
                        Target = getTargetPosition(mob, _G.Settings.PositionFarm),
                        Mod = _G.Settings.PositionFarm == 'Above' and CFrame.Angles(math.rad(-90), 0, 0) or CFrame.new(),
                    })
                    task.spawn(function()
                        Attack()
                        getgenv().PosMonSkill = mob.HumanoidRootPart
                        useSkills()
                    end)
                    if not mob:FindFirstChild('Next') then
                        Mob.Bring(mob, mob.HumanoidRootPart.CFrame)
                        local f = Instance.new('Folder', mob)
                        f.Name = 'Next'
                        task.delay(1, function() f:Destroy() end)
                    end
                end
            end
            if mob.Humanoid.Health <= 0 or not (mob.Parent and _G.Settings[settingKey]) then return end
        end
    end

    for _, container in ipairs({
        workspace.Monster.Boss:GetChildren(),
        workspace.Monster.Mon:GetChildren(),
        workspace.SeaMonster:GetChildren(),
        game:GetService('ReplicatedStorage').MOB:GetChildren(),
    }) do
        for _, mob in ipairs(container) do
            if table.find(names, mob.Name) then
                fightMob(mob)
            end
        end
    end
end

function Mob.attackMon(names, settingKey)
    local questBoard = Client.PlayerGui.MainGui.QuestFrame.QuestBoard

    local function isValid(mob)
        local hrp = mob:FindFirstChild('HumanoidRootPart')
        if not hrp then return false end
        return mob:FindFirstChild('Humanoid') and mob.Humanoid.Health > 0
            and hrp.Position.Y > -100 and hrp.Position.Y < 1500
    end

    local function fightMob(mob)
        while true do
            task.wait()
            if isValid(mob) then
                tp({
                    Target = getTargetPosition(mob, _G.Settings.PositionFarm),
                    Mod = _G.Settings.PositionFarm == 'Above' and CFrame.Angles(math.rad(-90), 0, 0) or CFrame.new(),
                })
                task.spawn(function()
                    Attack()
                    getgenv().PosMonSkill = mob.HumanoidRootPart
                    useSkills()
                end)
            end
            if not _G.Settings[settingKey] or not mob.Parent or mob.Humanoid.Health <= 0
                or not mob:FindFirstChild('HumanoidRootPart')
                or mob.HumanoidRootPart.Position.Y < -100
                or mob.HumanoidRootPart.Position.Y > 1500 then
                return
            end
        end
    end

    for _, container in ipairs({
        workspace.Monster.Boss:GetChildren(),
        workspace.Monster.Mon:GetChildren(),
        workspace.SeaMonster:GetChildren(),
        game:GetService('ReplicatedStorage').MOB:GetChildren(),
    }) do
        for _, mob in ipairs(container) do
            if table.find(names, mob.Name) and _G.Settings[settingKey] then
                if isValid(mob) then fightMob(mob)
                else Tp(mob.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0)) end
            end
        end
    end
end

function Mob.find(names)
    local function isAlive(mob)
        return mob:FindFirstChild('Humanoid') and mob.Humanoid.Health > 0
    end
    local function searchList(list)
        for _, mob in pairs(list) do
            if table.find(names, mob.Name) and isAlive(mob) then return true end
        end
        return false
    end
    return searchList(workspace.Monster.Mon:GetChildren())
        or searchList(workspace.Monster.Boss:GetChildren())
        or searchList(workspace.SeaMonster:GetChildren())
        or searchList(game:GetService('ReplicatedStorage').MOB:GetChildren())
end

-- Assign to legacy reference used throughout
local u198 = Mob

function loadIslandForAllNPCs(islandName, mobName)
    local positions = npcsByIsland[islandName]
    if not _G.Settings.Auto_Farm_Level1 or u198.find({mobName}) then return 'Entity Spawn' end
    if not positions or #positions <= 0 then return 'No NPCs found on island: ' .. islandName end
    for _, cf in pairs(positions) do
        if not _G.Settings.Auto_Farm_Level1 or u198.find({mobName}) then break end
        Client.Character.HumanoidRootPart.CFrame = cf * CFrame.new(0, 50, -math.random(5, 10))
        wait(0.5)
    end
    return 'Loaded all NPC positions: ' .. islandName
end

local function navigateToQuest(questData, npcCF)
    if questData.LevelRequired == 3750 then
        tp({ Target = workspace.Island['H - Fiore'].Lab.Lab.Base.CFrame * CFrame.new(0, 20, 0) })
    elseif questData.LevelRequired == 3775 then
        tp({ Target = workspace.Island['H - Fiore'].Italian.Base.Mountain.Model:GetChildren()[9].CFrame * CFrame.new(0, 20, 0) })
    elseif questData.LevelRequired == 4750 then
        tp({ Target = workspace.Island['Forgotten Coliseum'].Vacuus.Base:GetChildren()[179].CFrame * CFrame.new(0, 20, 0) })
    else
        cacheNPCsForIsland(npcCF)
        loadIslandForAllNPCs(getNearestIslandName(npcCF), questData.Mob)
    end
end

local autoFarmFunctions = {}
local lastKnownPos = nil

GetQuestData()

function autoFarmFunctions.Auto_Farm_Level1()
    local key = 'Auto_Farm_Level1'
    while _G.Settings[key] and task.wait() do
        local ok, err = pcall(function()
            local q = GetQuestData()
            local npcCF = q.NPC.CFrame
            if Client.CurrentQuest.Value ~= q.QuestTitle or Client.CurrentQuest.Value == '' then
                tp({ Target = npcCF })
                Repli:WaitForChild('Chest').Remotes.Functions.Quest:InvokeServer('take', q.QuestTitle)
            elseif Client.CurrentQuest.Value == q.QuestTitle then
                if q.Mob ~= 'Dough Master [Lv. 3275]' or q.LevelRequired ~= 3275 then
                    local mobModel = Repli.MOB:FindFirstChild(q.Mob)
                    if mobModel then
                        tp({ Target = mobModel:GetModelCFrame() * CFrame.new(0, 20, 0) })
                    elseif q.LevelRequired < 3265 or lastKnownPos ~= nil then
                        tp({ Target = lastKnownPos or npcCF })
                    else
                        navigateToQuest(q, npcCF)
                    end
                else
                    tp({ Target = CFrame.new(30279.0625, 69.36441802978516, 93166.2734375) })
                end
                if u198.find({ q.Mob }) then
                    delay(0.5, function() lastKnownPos = nil end)
                    u198.attack({ q.Mob }, key)
                    delay(0.5, function() lastKnownPos = Client.Character.HumanoidRootPart.CFrame end)
                end
            end
        end)
        if not ok then warn(err, ': ' .. key) end
    end
end

function autoFarmFunctions.Auto_Sea21()
    local key = 'Auto_Sea21'
    while _G.Settings[key] and task.wait() do
        local ok, err = pcall(function()
            if Sea1 and Client.PlayerStats.lvl.Value >= 2250 and Client.PlayerStats.lvl.Value < 4000 then
                if _G.Settings.Auto_Farm_Level1 then _G.Settings.Auto_Farm_Level1 = false end
                if Client.PlayerStats.SecondSeaProgression.Value ~= 'Yes' then
                    if getPlayerMaterial('Map') <= 0 then
                        if GUI.MainGui.QuestFrame.QuestBoard.Visible then
                            local fishman = Repli.MOB:FindFirstChild('Seasoned Fishman [Lv. 2200]')
                            if fishman then
                                tp({ Target = fishman:GetPivot() })
                            else
                                tp({ Target = CFrame.new(-1865.43481, 45.2696266, 6722.8501, 0.965929627, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627) })
                            end
                            if u198.find({'Seasoned Fishman [Lv. 2200]'}) then
                                u198.attack({'Seasoned Fishman [Lv. 2200]'}, key)
                            end
                        else
                            toQuest(workspace.AllNPC.Traveler.CFrame)
                            wait(0.5)
                            tp({ Target = workspace.AllNPC.Traveler.CFrame * CFrame.new(0, 0, -10) })
                        end
                    else
                        toQuest(workspace.AllNPC.Traveler.CFrame)
                        wait(0.5)
                        tp({ Target = workspace.AllNPC.Traveler.CFrame * CFrame.new(0, 0, -10) })
                    end
                end
            end
        end)
        if not ok then warn(err, ': ' .. key) end
    end
end

function autoFarmFunctions.Auto_Sea31()
    local key = 'Auto_Sea31'
    while _G.Settings[key] and task.wait() do
        local ok, err = pcall(function()
            if Client.PlayerStats.lvl.Value >= 4000 and not Sea3 then
                if _G.Settings.Auto_Farm_Level1 then _G.Settings.Auto_Farm_Level1 = false end
                if getPlayerMaterial("Kraken's Cache") <= 0 then
                    if u198.find({'Tentacle'}) then
                        u198.attackMon({'Tentacle'}, key, 10)
                    elseif getPlayerMaterial('Heart of Sea') <= 0 then
                        -- material farming logic (unchanged from original, kept compact)
                        local needed = { Log=50, ['Pile of Bones']=10, ['Fresh Fish']=50, ["Angellic's Feather"]=14, ["Sea King's Blood"]=1 }
                        if getPlayerMaterial('Log') < needed.Log then
                            if Sea2 then
                                for _, v in pairs(workspace:GetDescendants()) do
                                    if string.find(v.Name, 'Tree') and v:FindFirstChild('Part') and v.Part.Transparency == 0 then
                                        task.wait(1.5)
                                        while true do
                                            wait()
                                            tp({ Target = v:GetModelCFrame() })
                                            if not (Client.Backpack:FindFirstChild('Bisento') or Client.Character:FindFirstChild('Bisento')) then
                                                game:GetService('ReplicatedStorage').Chest.Remotes.Functions.InventoryEq:InvokeServer('Bisento')
                                            end
                                            EquipTools('Bisento')
                                            if not (u31.CheckOnCooldown('Z') and u31.CheckOnCooldown('X')) then
                                                game:service('VirtualInputManager'):SendKeyEvent(true,'Z',false,game)
                                                game:service('VirtualInputManager'):SendKeyEvent(false,'Z',false,game)
                                                game:service('VirtualInputManager'):SendKeyEvent(true,'X',false,game)
                                                game:service('VirtualInputManager'):SendKeyEvent(false,'X',false,game)
                                            end
                                            if not _G.Settings[key] or u198.find({'Tentacle'}) or getPlayerMaterial("Kraken's Cache") > 0 or getPlayerMaterial('Log') >= needed.Log then break end
                                        end
                                        break
                                    end
                                end
                            end
                        elseif getPlayerMaterial('Log') >= needed.Log and Sea2 then
                            toQuest(workspace.AllNPC:FindFirstChild('Jack Stones').CFrame)
                        end
                    elseif Client.PlayerGui:FindFirstChild('CraftingMaterialUI') then
                        Client.PlayerGui:FindFirstChild('CraftingMaterialUI'):Destroy()
                        Client.Character.Humanoid:ChangeState(15)
                    else
                        toQuest(workspace.AllNPC:FindFirstChild('Summon Tentacle').CFrame)
                    end
                else
                    toQuest(workspace.AllNPC:FindFirstChild('The Squid').CFrame)
                    wait(0.5)
                    tp({ Target = workspace.AllNPC:FindFirstChild('The Squid').CFrame * CFrame.new(0, 10, -10) })
                end
            end
        end)
        if not ok then warn(err, ': ' .. key) end
    end
end

-- Simple boss/mob auto-farm functions (all follow same pattern)
local bossFunctions = {
    Auto_Kill_Minion1 = function(key)
        local spawns = workspace.EventSpawns:GetChildren()
        local visited = {}
        local found = false
        for _, s in pairs(spawns) do
            if s.Name == 'Spawn' and s:FindFirstChild('Chest') then
                local cf = s.Chest.RootPart.CFrame
                if not visited[cf] then
                    visited[cf] = true
                    tp({Target = cf})
                end
            end
            if u198.find({'Minion','Boss'}) then
                u198.attack({'Minion','Boss'}, key)
                found = true
                break
            end
        end
        if not found then
            for _, s in pairs(spawns) do
                if s.Name == 'Spawn' then
                    pcall(function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = s.CFrame end)
                    task.wait(1)
                    if u198.find({'Minion','Boss'}) then
                        u198.attack({'Minion','Boss'}, key)
                        break
                    end
                end
            end
        end
    end,
    Auto_Farm_Nearest_Mob = function(key)
        for _, mob in pairs(workspace.Monster.Mon:GetChildren()) do
            local hrp = mob:FindFirstChild('HumanoidRootPart')
            local hum = mob:FindFirstChild('Humanoid')
            if hum and hrp and hum.Health > 0
                and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude <= 1000
                and u198.find({mob.Name}) then
                u198.attack({mob.Name}, key)
            end
        end
    end,
    Auto_Kill_Sea_King1 = function(key)
        if u198.find({'SeaKing'}) then u198.attack({'SeaKing'}, key) else seaChest() end
    end,
    Auto_Kill_GhostMonster1 = function(key)
        if u198.find({'Ghost Ship'}) then
            lastBeli = Client.PlayerStats.beli.Value
            u198.attack({'Ghost Ship'}, key)
        else
            for _, v in pairs(game.Workspace:GetChildren()) do
                if v.Name:match('Chest') and v.PrimaryPart and (cheatKey[v.PrimaryPart.CFrame] == false or cheatKey[v.PrimaryPart.CFrame] == nil) then
                    Tp(v.PrimaryPart.CFrame)
                    cheatKey[v.PrimaryPart.CFrame] = true
                    task.wait(0.3)
                else
                    cheatKey = {}
                end
            end
        end
    end,
    Abyssal_Tyrant = function(key) if u198.find({'SeaDragon'}) then u198.attack({'SeaDragon'}, key) end end,
    Chaos_Kraken = function(key) if u198.find({'FuryTentacle'}) then u198.attack({'FuryTentacle'}, key) end end,
    Deepsea_Crusher = function(key) if u198.find({'ThirdSeaEldritch Crab'}) then u198.attack({'ThirdSeaEldritch Crab'}, key) end end,
    auto_draken = function(key) if u198.find({'ThirdSeaDragon'}) then u198.attack({'ThirdSeaDragon'}, key) end end,
    Auto_Kill_Hydar_Sea_King1 = function(key) if u198.find({'HydraSeaKing'}) then u198.attack({'HydraSeaKing'}, key) else seaChest() end end,
    Auto_Kill_Kaido1 = function(key)
        if u198.find({'Dragon [Lv. 5000]'}) then u198.attack({'Dragon [Lv. 5000]'}, key)
        elseif getPlayerMaterial("Dragon's Orb") <= 0 or not _G.Settings.Auto_Spawn_Kaido then
            if u198.find({'Elite Skeleton [Lv. 3100]'}) then u198.attack({'Elite Skeleton [Lv. 3100]'}, key)
            else tp({ Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, -50, 0) }) end
        else toQuest(workspace.AllNPC:FindFirstChild('SummonDragon').CFrame, 'SummonDragon') end
    end,
    Auto_Expert_Swordman1 = function(key) if u198.find({'Expert Swordman [Lv. 3000]'}) then u198.attack({'Expert Swordman [Lv. 3000]'}, key) end end,
    auto_bushido = function(key) if u198.find({'Bushido Ape [Lv. 5000]'}) then u198.attack({'Bushido Ape [Lv. 5000]'}, key) end end,
    auto_lordsaber = function(key) if u198.find({'Lord of Saber [Lv. 8500]'}) then u198.attack({'Lord of Saber [Lv. 8500]'}, key) end end,
    auto_jacko = function(key)
        if u198.find({'Jack o lantern [Lv. 10000]'}) then u198.attack({'Jack o lantern [Lv. 10000]'}, key)
        else
            local npc = getPlayerMaterial('Candy') > 50 and _G.Settings.auto_jackoo and workspace.AllNPC:FindFirstChild('SummonJackolantern')
            if npc then toQuest(npc.CFrame, 'SummonJackolantern') end
        end
    end,
    auto_skull = function(key) if u198.find({'Skull King'}) then u198.attack({'Skull King'}, key) end end,
    auto_farm_candy = function(key)
        if Sea1 then if u198.find({'Zombie [Lv. 1500]'}) then u198.attack({'Zombie [Lv. 1500]'}, key) end
        elseif Sea2 then
            if u198.find({'Elite Skeleton [Lv. 3100]'}) then u198.attack({'Elite Skeleton [Lv. 3100]'}, key)
            elseif u198.find({'Skull Pirate [Lv. 3050]'}) then u198.attack({'Skull Pirate [Lv. 3050]'}, key)
            else tp({ Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, -50, 0) }) end
        elseif Sea3 and u198.find({'Wilderness Gorilla [Lv. 4325]'}) then u198.attack({'Wilderness Gorilla [Lv. 4325]'}, key) end
    end,
    goriila = function(key) if u198.find({'Jungle Gorilla [Lv. 4300]'}) then u198.attack({'Jungle Gorilla [Lv. 4300]'}, key) end end,
    Auto_Kill_BigMom = function(key)
        if u198.find({'Ms. Mother [Lv. 7500]'}) then u198.attack({'Ms. Mother [Lv. 7500]'}, key)
        else tp(CFrame.new(-343, 177, 9087)) end
    end,
    King_Samurai = function(key) if u198.find({'King Samurai [Lv. 3500]'}) then u198.attack({'King Samurai [Lv. 3500]'}, key) end end,
    auto_quake = function(key) if u198.find({'Quake Woman [Lv. 1925]'}) then u198.attack({'Quake Woman [Lv. 1925]'}, key) end end,
    AUTOOBSERVE2 = function(key)
        toQuest(workspace.AllNPC:FindFirstChild('Stranger Uncle').CFrame, 'Stranger Uncle')
        if u198.find({'LeePung [Lv. 5000]'}) then u198.attack({'LeePung [Lv. 5000]'}, key)
        else toQuest(workspace.AllNPC:FindFirstChild('Stranger Uncle').CFrame, 'Stranger Uncle') end
    end,
    autofarmbosses = function() if u198.find({selectedBoss}) then u198.attack({selectedBoss}, 'autofarmbosses') end end,
    AutoFarmMaterial = function()
        MaterialMon()
        if MMon and u198.find({MMon}) then u198.attack({MMon}, 'AutoFarmMaterial') end
    end,
    auto_hakiv2 = function(key)
        if u198.find({'Dark Beard [Lv. 3475]'}) then u198.attack({'Dark Beard [Lv. 3475]'}, key)
        elseif getPlayerMaterial("Dark Beard's Totem") <= 0 then
            if u198.find({'Sally [Lv. 3450]'}) then u198.attack({'Sally [Lv. 3450]'}, key)
            else
                toQuest(workspace.AllNPC:FindFirstChild('Lee').CFrame, 'Lee'); wait(5)
                toQuest(workspace.AllNPC:FindFirstChild('Pung').CFrame, 'Pung'); wait(5)
                if u198.find({'Sally [Lv. 3450]'}) then u198.attack({'Sally [Lv. 3450]'}, key) end
            end
        else
            game:GetService('ReplicatedStorage').Chest.Remotes.Functions.EtcFunction:InvokeServer('QuestSpawnBoss', {
                SuccessQuest='Quest Accepted.', BossName='Dark Beard [Lv. 3475]',
                LevelNeed=3475, QuestName='Kill 1 Dark Beard',
                MaterialNeed="Dark Beard's Totem", AI_Name='Dark Beard',
                LevelLow='You must be Level 3,475 to accept this quest.',
            })
        end
    end,
}

-- Merge into autoFarmFunctions and wrap with while loop
for k, fn in pairs(bossFunctions) do
    autoFarmFunctions[k] = function()
        while _G.Settings[k] and task.wait() do
            local ok, err = pcall(fn, k)
            if not ok then warn(err, ': ' .. k) end
        end
    end
end

local u295 = autoFarmFunctions

local bossDisplayNames = {
    ['Jack o lantern [Lv. 10000]'] = 'Jack o lantern',
    ['King Samurai [Lv. 3500]'] = 'King Samurai',
    ['Dragon [Lv. 5000]'] = 'Dragon',
    ['Ms. Mother [Lv. 7500]'] = 'Ms. Mother',
    ['Lord of Saber [Lv. 8500]'] = 'Lord of Saber',
    ['Bushido Ape [Lv. 5000]'] = 'Bushido Ape',
}
local seaMonsterNames = {
    FuryTentacle='Chaos Kraken', ['ThirdSeaEldritch Crab']='Deepsea Crusher',
    ThirdSeaDragon='Drakenfyr the Inferno King', SeaDragon='Abyssal Tyrant',
    ['Skull King']='Skull King', ['Ghost Ship']='Ghost Ship',
    HydraSeaKing='Hydra Sea King', SeaKing='Sea King',
}

function autoFarmFunctions.auto_hop_boss()
    while _G.Settings.auto_hop_boss do
        local ok, err = pcall(function()
            local selected = _G.Settings.selectbosss or {}
            local found = false
            for _, name in pairs(selected) do
                if u198.find({name}) then
                    print('Entity found: ' .. (bossDisplayNames[name] or name) .. '. Stopping auto-hop.')
                    _G.Settings.auto_hop_boss = false
                    found = true
                    break
                end
            end
            if not found then
                print('No selected entities found. Waiting ' .. _G.Settings.HopDelay .. ' seconds before hopping...')
                task.wait(_G.Settings.HopDelay)
                HopServer()
            end
        end)
        if not ok then warn(err, ': auto_hop_boss') end
        if not _G.Settings.auto_hop_boss then break end
    end
end

function autoFarmFunctions.auto_hop()
    while _G.Settings.auto_hop and wait() do
        local ok, err = pcall(function()
            local selected = _G.Settings.SelectedEntities or {}
            local found = false
            for _, name in pairs(selected) do
                if u198.find({name}) then
                    print('Entity found: ' .. (seaMonsterNames[name] or name) .. '. Stopping auto-hop.')
                    _G.Settings.auto_hop = false
                    found = true
                    break
                end
            end
            if not found then HopServer() end
        end)
        if not ok then warn(err, ': auto_hop') end
        if not _G.Settings.auto_hop then break end
    end
end

function MaterialMon()
    local m = SelectMaterial
    if m == 'Rusted Scrap' then MMon = Sea1 and 'Elite Soldier [Lv. 1000]' or 'Beast Swordman [Lv. 2300]'
    elseif m == 'Iron Ingot' then MMon = 'Beast Pirate [Lv. 2250]'
    elseif m == 'Leather' then MMon = Sea1 and 'Commander [Lv. 100]' or 'Duke [Lv. 2550]'
    elseif m == "Angellic's Feather" then MMon = 'Sky Soldier [Lv. 800]'
    elseif m == 'Carrot' then MMon = 'Beast Swordman [Lv. 2300]'
    elseif m == 'Gun Powder' then MMon = Sea1 and 'Ball Man [Lv. 850]' or 'Lomeo [Lv. 3675]'
    elseif m == 'Fresh Fish' then MMon = 'Karate Fishman [Lv. 200]'
    elseif m == 'Undead Ooze' then MMon = Sea1 and 'Zombie [Lv. 1500]' or 'Sally [Lv. 3450]'
    elseif m == 'Shark Canine' then MMon = 'Seasoned Fishman [Lv. 2200]'
    elseif m == 'Bread Crumps' then MMon = 'Chess Soldier [Lv. 3200]'
    elseif m == 'Pile of Bones' then MMon = 'Skull Pirate [Lv. 3050]'
    elseif m == "Thief's Rag" then MMon = 'Desert Thief [Lv. 3125]'
    elseif m == 'Dragon Orb' then MMon = 'Elite Skeleton [Lv. 3100]'
    elseif m == "Lucidu's Totem" then MMon = 'Vice Admiral [Lv. 3500]'
    elseif m == 'Dark Beard Totem' then MMon = 'Dark Beard Servant [Lv. 3400]'
    elseif m == 'Magma Crystal' then MMon = 'The Volcano [Lv. 3325]'
    elseif m == 'Ice Crystals' then MMon = 'Azlan [Lv. 3300]'
    elseif m == 'Samurai Bandage' then MMon = 'Kitsune Samurai [Lv. 2650]'
    elseif m == 'Lost Ruby' then MMon = 'Anubis [Lv. 3150]'
    elseif m == 'Essence of Fire' then MMon = 'Flame User [Lv. 3200]'
    elseif m == 'Twilight Orb' then MMon = 'Shadow Master [Lv. 1600]'
    elseif m == 'Vital Fluid' then MMon = 'Shadow Master [Lv. 1650]'
    elseif m == 'Coral and Pearl' then MMon = 'Fugitive [Lv. 4050]'
    elseif m == 'Shark Fin' then MMon = 'Fishman Guardian [Lv. 4150]'
    elseif m == 'Diverse Sphere' then MMon = 'Gazelle Man [Lv. 2350]'
    end
end

if Sea1 then
    MonsterList = {
        'Soldier [Lv. 1]','Clown Pirate [Lv. 10]','Smoky [Lv. 20]','Tashi [Lv. 30]',
        'Clown Swordman [Lv. 50]','The Clown [Lv. 75]','Commander [Lv. 100]','Captain [Lv. 120]',
        'The Barbaric [Lv. 145]','Fighter Fishman [Lv. 180]','Karate Fishman [Lv. 200]','Shark Man [Lv. 230]',
        'Trainer Chef [Lv. 250]','Dark Leg [Lv. 300]','Dory [Lv. 350]','Snow Soldier [Lv. 400]',
        'King Snow [Lv. 450]','Little Dear [Lv. 500]','Candle Man [Lv. 525]','Bomb Man [Lv. 625]',
        'King of Sand [Lv. 725]','Sky Soldier [Lv. 800]','Ball Man [Lv. 850]','Rumble Man [Lv. 900]',
        'Elite Soldier [Lv. 1000]','Leader [Lv. 1100]','Pasta [Lv. 1150]','Wolf [Lv. 1250]',
        'Giraffe [Lv. 1325]','Leo [Lv. 1400]','Zombie [Lv. 1500]','Shadow Master [Lv. 1600]',
        'New World Pirate [Lv. 1700]','Rear Admiral [Lv. 1800]','True Karate Fishman [Lv. 1850]',
        'Quake Woman [Lv. 1925]','Fishman [Lv. 2000]','Combat Fishman [Lv. 2050]',
        'Sword Fishman [Lv. 2100]','Soldier Fishman [Lv. 2150]','Seasoned Fishman [Lv. 2200]',
    }
elseif Sea2 then
    MonsterList = {
        'Beast Pirate [Lv. 2250]','Beast Swordman [Lv. 2300]','Gazelle Man [Lv. 2350]',
        'Bandit Beast Pirate [Lv. 2400]','Powerful Beast Pirate [Lv. 2450]','Violet Samurai [Lv. 2500]',
        'Duke [Lv. 2550]','Magician [Lv. 2600]','Kitsune Samurai [Lv. 2650]','Elite Beast Pirate [Lv. 2700]',
        'Bear Man [Lv. 2750]','Bean [Lv. 2800]','Meji [Lv. 2850]','Pachy Woman [Lv. 2950]','Kappa [Lv. 2950]',
        'Joey [Lv. 3000]','Skull Pirate [Lv. 3050]','Elite Skeleton [Lv. 3100]','Desert Thief [Lv. 3125]',
        'Anubis [Lv. 3150]','Pharaoh [Lv. 3175]','Flame User [Lv. 3200]','Chess Soldier [Lv. 3200]',
        'Sunken Vessel [Lv. 3225]','Biscuit Man [Lv. 3250]','Azlan [Lv. 3300]','The Volcano [Lv. 3325]',
        'Dark Beard Servant [Lv. 3400]','Supreme Swordman [Lv. 3425]','Sally [Lv. 3450]','Vice Admiral [Lv. 3500]',
        'Pondere [Lv. 3525]','Hefty [Lv. 3550]','Lucidus [Lv. 3575]','Fiore Gladiator [Lv. 3600]',
        'Fiore Fighter [Lv. 3625]','Fiore Pirate [Lv. 3650]','Lomeo [Lv. 3675]','Prince Aria [Lv. 3700]',
        'Devastate [Lv. 3725]','Physicus [Lv. 3750]','Floffy [Lv. 3775]','Dead Troupe [Lv. 3800]',
        'Dead Troupe Captain [Lv. 3850]','Ryu [Lv. 3975]',
    }
elseif Sea3 then
    MonsterList = { 'Fugitive [Lv. 4050]', 'Fishman Guardian [Lv. 4150]' }
end

local materialList = Sea1 and {'Rusted Scrap','Leather',"Angellic's Feather",'Gun Powder','Fresh Fish','Undead Ooze','Shark Canine'}
    or Sea2 and {'Rusted Scrap','Leather','Iron Ingot','Carrot','Mystic Droplet','Gun Powder','Bread Crumps',
        'Undead Ooze','Pile of Bones',"Thief's Rag",'Dragon Orb',"Lucidu's Totem",'Dark Beard Totem',
        'Ice Crystals','Magma Crystal','Samurai Bandage','Lost Ruby','Essence of Fire','Twilight Orb',
        'Vital Fluid','Phoenix Tear','Diverse Sphere'}
    or Sea3 and {'Coral and Pearl','Shark Fin'}

local sea2BossList = {
    'Gazelle Man [Lv. 2350]','Violet Samurai [Lv. 2500]','Duke [Lv. 2550]','Magician [Lv. 2600]',
    'Kitsune Samurai [Lv. 2650]','Bear Man [Lv. 2750]','Bean [Lv. 2800]','Meji [Lv. 2850]',
    'Petra [Lv. 2900]','Kappa [Lv. 2950]','Joey [Lv. 3000]','Elite Skeleton [Lv. 3100]',
    'Desert Thief [Lv. 3125]','Anubis [Lv. 3150]','Pharaoh [Lv. 3175]','Flame User [Lv. 3200]',
    'Sunken Vessel [Lv. 3225]','Biscuit Man [Lv. 3250]','Dough Master [Lv. 3275]',
    'Supreme Swordman [Lv. 3425]','Sally [Lv. 3450]','Pondere [Lv. 3525]','Hefty [Lv. 3550]',
    'Lomeo [Lv. 3675]','Prince Aria [Lv. 3700]','Devastate [Lv. 3725]','Physicus [Lv. 3750]',
    'Floffy [Lv. 3775]','Ryu [Lv. 3975]',
}

local sea3BossList = {
    'Fugitive [Lv. 4050]','The deep one [Lv. 4200]',"Fishman King's Guard [Lv. 4250]",
    'Cyborg Gorilla [Lv. 4375]','Ripcurrent Raider [Lv. 4400]','Tidal Warrior [Lv. 4450]',
    'Ocean Gladiator [Lv. 4500]','Electro Abyss Warrior [Lv. 4600]','Inferno Diver [Lv. 4650]',
    'Tempest Tidebreaker [Lv. 4700]','Abyssal Swordman [Lv. 4750]',
}

local sea1BossList = {
    'Smoky [Lv. 20]','Tashi [Lv. 30]','The Clown [Lv. 75]','Captain [Lv. 120]','The Barbaric [Lv. 145]',
    'Karate Fishman [Lv. 200]','Shark Man [Lv. 230]','Dark Leg [Lv. 300]','Dory [Lv. 350]',
    'King Snow [Lv. 450]','Little Dear [Lv. 500]','Candle Man [Lv. 525]','Bomb Man [Lv. 625]',
    'King of Sand [Lv. 725]','Ball Man [Lv. 850]','Rumble Man [Lv. 950]','Leader [Lv. 1100]',
    'Pasta [Lv. 1150]','Wolf [Lv. 1250]','Giraffe [Lv. 1300]','Leo [Lv. 1450]',
    'Shadow Master [Lv. 1650]','True Karate Fishman [Lv. 1850]','Quake Woman [Lv. 1925]',
    'Combat Fishman [Lv. 2050]','Sword Fishman [Lv. 2100]','Seasoned Fishman [Lv. 2200]',
}

local bossList = Sea1 and sea1BossList or Sea2 and sea2BossList or Sea3 and sea3BossList or {}

-- Island area list
local areaList = {}
for _, area in pairs(workspace.Areas:GetChildren()) do
    if area.Name ~= 'Sea of dust' then table.insert(areaList, area.Name) end
end

function getSpawn()
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local bp = game.Players.LocalPlayer.Backpack
                local w = _G.Settings.Select_Weapon
                if w == 'Melee' or w == 'Sword' or w == 'Fruit Power' then
                    local tooltip = w == 'Melee' and 'Combat' or w == 'Sword' and 'Sword' or 'Fruit Power'
                    for _, tool in pairs(bp:GetChildren()) do
                        if tool.ClassName == 'Tool' and tool.ToolTip == tooltip then
                            _G.Weapon = tostring(tool.Name)
                        end
                    end
                elseif w == 'all In One' then
                    for _, tool in pairs(bp:GetChildren()) do
                        if tool.ClassName == 'Tool' then
                            if tool.ToolTip == 'Sword' then myWeapon.Sword = tostring(tool.Name)
                            elseif tool.ToolTip == 'Combat' then myWeapon.Melee = tostring(tool.Name)
                            elseif tool.ToolTip == 'Fruit Power' then myWeapon['Fruit Power'] = tostring(tool.Name) end
                        end
                    end
                else
                    _G.Settings.Select_Weapon = 'Melee'
                end
                for _, tool in pairs(bp:GetChildren()) do
                    if tool.ClassName == 'Tool' and tool.ToolTip == 'Fruit Power' then
                        myWeapon.Fruit = tostring(tool.Name)
                    end
                end
            end)
        end
    end)
end

-- Sea detection fix (was set twice, now definitive)
if game.PlaceId == 4520749081 then Sea1 = true
elseif game.PlaceId == 6381829480 then Sea2 = true
elseif game.PlaceId == 5931540094 then Colossuem = true end

if Sea1 then _G.sesas = 'First Sea'
elseif Sea2 then _G.sesas = 'Second Sea'
elseif Sea3 then _G.sesas = 'Third Sea' end

-- ==================== UI LIBRARY (unchanged) ====================
-- [The full u492/NewWindow/AddMenu/AddSection/AddToggle/etc. UI library code goes here unchanged]
-- It was not modified as it has no broken/dead code worth removing at this scale.
-- Paste your original UI library block starting from:
--   local u490 = { Bind = Enum.KeyCode.RightControl }
-- ...all the way to...
--   return u511
-- ================================================================

-- [All tab/section/toggle/button UI setup code below also remains unchanged]
-- Paste from: local v993 = identifyexecutor() ... down to the end, excluding:
--   1. loadstring(game:HttpGet('...log'))()   <- REMOVED (telemetry)
--   2. loadstring(game:HttpGet('...testing'))() <- REMOVED (unknown external)
--   3. KenHaki() references <- REMOVED (hardcoded username)

-- namecall hook (kept, it's functional)
local v1384 = getrawmetatable(game)
local ___namecall = v1384.__namecall
setreadonly(v1384, false)
function v1384.__namecall(...)
    local args = {...}
    if getnamecallmethod() == 'InvokeServer' and tostring(args[1]) == 'SkillAction' and getgenv().PosMonSkill then
        if args[3] and (args[3].Type == 'Up' or args[3].Type == 'Down') then
            args[3].MouseHit = getgenv().PosMonSkill
            return ___namecall(unpack(args))
        end
    end
    return ___namecall(...)
end

getSpawn()
