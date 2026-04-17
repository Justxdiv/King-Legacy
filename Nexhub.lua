-- ts file was generated at discord.gg/25ms

function runAutoAccept()
    local u1 = {
        'EnterTheGame',
        {},
    }
    local v2, v3 = pcall(function()
        game:GetService('ReplicatedStorage').Chest.Remotes.Functions.EtcFunction:InvokeServer(unpack(u1))
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

game:GetService('Players')

local _ = game.PlaceId

Char = Client.Character
vu = game:GetService('VirtualUser')
Sea1 = game.PlaceId == 4520749081
Sea2 = game.PlaceId == 6381829480
Sea3 = game.PlaceId == 15759515082
cheatKey = {}
myWeapon = {
    Melee = '',
    Sword = '',
    Fruit = '',
}
addSkill = '?'
_G.Settings = {
    Select_Weapon = 'Sword',
    Auto_Sea31 = false,
    Select_Skill = true,
    SkillZ = false,
    SkillX = false,
    SkillC = false,
    SkillV = false,
    SkillB = false,
    SkillE = false,
}

local u6 = 'zensave1'
local u7 = Client.Name .. ' Config.json'

function SaveSettings()
    local v8 = game:GetService('HttpService'):JSONEncode(_G.Settings)

    if writefile then
        if isfolder(u6) then
            if isfolder(u6 .. '/King Legacy') then
                writefile(u6 .. '/King Legacy/' .. u7, v8)
            else
                makefolder(u6 .. '/King Legacy')
                writefile(u6 .. '/King Legacy/' .. u7, v8)
            end
        else
            makefolder(u6)
            makefolder(u6 .. '/King Legacy')
            writefile(u6 .. '/King Legacy/' .. u7, v8)
        end
    end
end
function LoadSettings()
    local _HttpService = game:GetService('HttpService')

    if isfile(u6 .. '/King Legacy/' .. u7) then
        local v10, v11, v12 = pairs(_HttpService:JSONDecode(readfile(u6 .. '/King Legacy/' .. u7)) or _G.Settings)

        while true do
            local v13

            v12, v13 = v10(v11, v12)

            if v12 == nil then
                break
            end

            _G.Settings[v12] = v13
        end
    end
end

LoadSettings()
Client.Idled:connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

GUI = Client.PlayerGui
Repli = game:GetService('ReplicatedStorage')
QuestManager = game:GetService('ReplicatedStorage').Chest.Modules.QuestManager

task.spawn(function()
    while task.wait() do
        pcall(function()
            if NeedNoClip then
                if Client and (Client:FindFirstChild('Character') and Client.Character.Humanoid.Sit == true) then
                    Client.Character.Humanoid.Sit = false
                end

                local v14, v15, v16 = pairs(Char:GetDescendants())

                while true do
                    local v17

                    v16, v17 = v14(v15, v16)

                    if v16 == nil then
                        break
                    end
                    if v17:IsA('BasePart') then
                        v17.CanCollide = false
                    end
                end

                if Char and not Char.UpperTorso:FindFirstChild('BodyClip') then
                    local _BodyVelocity = Instance.new('BodyVelocity')

                    _BodyVelocity.Parent = Char.UpperTorso
                    _BodyVelocity.Name = 'BodyClip'

                    local v19 = Vector3.new(math.huge, math.huge, math.huge)

                    _BodyVelocity.Velocity = Vector3.new(0, 1, 0)
                    _BodyVelocity.MaxForce = v19
                elseif Char and (Char.UpperTorso:FindFirstChild('BodyClip') and Char and Char.UpperTorso:FindFirstChild('BodyClip')) then
                    Char.UpperTorso:FindFirstChild('BodyClip').MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    Char.UpperTorso:FindFirstChild('BodyClip').Velocity = Vector3.new(0, 0, 0)
                end
            elseif Char and Char.UpperTorso:FindFirstChild('BodyClip') then
                Char.UpperTorso:FindFirstChild('BodyClip'):Destroy()
            end
        end)
    end
end)

local u20 = nil
local u21 = nil

function getTool()
    local v22, v23, v24 = pairs(Client.Character:GetChildren())

    while true do
        local v25

        v24, v25 = v22(v23, v24)

        if v24 == nil then
            break
        end
        if v25:IsA('Tool') then
            if v25.ToolTip == 'Fruit Power' then
                addSkill = 'DF'
            end

            u20 = tostring(v25.Name)
            u21 = v25.ToolTip
        end
    end

    return u20
end

local u31 = {
    CheckOnCooldown = function(p26)
        getTool()

        local v27 = string.upper(p26 or 'Z')
        local _SkillCooldown = Client.PlayerGui.SkillCooldown
        local v29 = nil

        if u21 ~= 'Sword' then
            if u21 ~= 'Combat' then
                if u21 == 'Fruit Power' then
                    v29 = _SkillCooldown:FindFirstChild('DFFrame')
                end
            else
                v29 = _SkillCooldown:FindFirstChild('FSFrame')
            end
        else
            v29 = _SkillCooldown:FindFirstChild('SWFrame')
        end
        if not (v29 and v29:FindFirstChild(v27)) then
            return true
        end

        local v30 = v29[v27]

        return not v30:FindFirstChild('Locked').Visible and v30.Frame.Frame.AbsoluteSize.X > 0 and true or false
    end,
}

function getPlayerMaterial(p32)
    local _HttpService2 = game:GetService('HttpService')
    local v34, v35, v36 = pairs(_HttpService2:JSONDecode(Client.PlayerStats.Material.Value))

    while true do
        local v37

        v36, v37 = v34(v35, v36)

        if v36 == nil then
            break
        end
        if v36 == p32 then
            return v37
        end
    end

    return 0
end

QuestMaterial = {
    ['3350'] = {
        Material = 'Ice Crystal',
        Kills = 'Azlan [Lv. 3300]',
        QuestTitle = 'Kill 4 Azlan',
        Level = 3300,
    },
    ['3375'] = {
        Material = 'Magma Crystal',
        Kills = 'The Volcano [Lv. 3325]',
        QuestTitle = 'Kill 4 The Volcano',
        Level = 3325,
    },
    ['3475'] = {
        Material = "Dark Beard's Totem",
        Kills = 'Sally [Lv. 3450]',
        QuestTitle = 'Kill 1 Sally',
        Level = 3450,
    },
    ['3575'] = {
        Material = "Lucidus's Totem",
        Kills = 'Vice Admiral [Lv. 3500]',
        QuestTitle = 'Kill 5 Vice Admiral',
        Level = 3500,
    },
}

function GetQuestData(p38)
    local _Value = Client.PlayerStats.lvl.Value
    local v40, v41, v42 = pairs(require(game.ReplicatedStorage.Chest.Modules.QuestManager))
    local v43 = {}

    while true do
        local u44, u45 = v40(v41, v42)

        if u44 == nil then
            break
        end

        v42 = u44

        if not u45.DailyQuest then
            local _ = u45.Level ~= 0

            tonumber(u45.Mob:match('Lv%. (%d+)'))

            if u45.Mob:match('Lv') and (p38 or u45.Level <= _Value) then
                table.insert(v43, {
                    LevelRequired = u45.Level or 1,
                    Mob = (function()
                        return _Value >= 3300 and _Value < 3375 and 'Azlan [Lv. 3300]' or u45.Mob
                    end)(),
                    QuestTitle = (function()
                        return _Value >= 3300 and _Value < 3375 and 'Kill 4 Azlan' or u44
                    end)(),
                    NPC = (function()
                        local v46, v47, v48 = pairs(game:GetService('Workspace'):FindFirstChild('AllNPC'):GetChildren())
                        local v49 = {}

                        while true do
                            local v50

                            v48, v50 = v46(v47, v48)

                            if v48 == nil then
                                break
                            end
                            if v50:GetAttribute('LevelMin') and u45.Level >= v50:GetAttribute('LevelMin') then
                                v49[#v49 + 1] = {
                                    Level = v50:GetAttribute('LevelMin'),
                                    CFrame = v50.CFrame,
                                }
                            end
                        end

                        table.sort(v49, function(p51, p52)
                            return p51.Level > p52.Level
                        end)

                        return v49[1]
                    end)(),
                })
            end
        end
    end

    table.sort(v43, function(p53, p54)
        return p53.LevelRequired > p54.LevelRequired
    end)

    if MaxLevelOfSea > _Value or not Sea2 then
        if MaxLevelOfSea <= _Value and Sea1 then
            v43[1].Mob = 'Seasoned Fishman [Lv. 2200]'
            v43[1].LevelRequired = 2200
            v43[1].QuestTitle = 'Kill 1 Seasoned Fishman'
        end
    else
        v43[1].Mob = 'Ryu [Lv. 3975]'
        v43[1].LevelRequired = 3950
        v43[1].QuestTitle = 'Kill 1 Ryu'
    end

    local v55, v56, v57 = pairs(QuestMaterial)

    while true do
        local v58, v59 = v55(v56, v57)

        if v58 == nil then
            break
        end

        v57 = v58

        if v43[1].LevelRequired == tonumber(v58) then
            local v60, v61, v62 = pairs(workspace.Monster.Mon:GetChildren())
            local v63 = nil

            while true do
                local v64

                v62, v64 = v60(v61, v62)

                if v62 == nil then
                    break
                end
                if v64.Name == v43[1].Mob and (v64:FindFirstChild('Humanoid') and (v64:FindFirstChild('HumanoidRootPart') and v64.Humanoid.Health > 0)) then
                    v63 = true
                end
            end

            local v65, v66, v67 = pairs(workspace.Monster.Boss:GetChildren())

            while true do
                local v68

                v67, v68 = v65(v66, v67)

                if v67 == nil then
                    break
                end
                if v68.Name == v43[1].Mob and (v68:FindFirstChild('Humanoid') and (v68:FindFirstChild('HumanoidRootPart') and v68.Humanoid.Health > 0)) then
                    v63 = true
                end
            end

            local v69, v70, v71 = pairs(game:GetService('ReplicatedStorage').MOB:GetChildren())

            while true do
                local v72

                v71, v72 = v69(v70, v71)

                if v71 == nil then
                    break
                end
                if v72.Name == v43[1].Mob and (v72:FindFirstChild('Humanoid') and (v72:FindFirstChild('HumanoidRootPart') and v72.Humanoid.Health > 0)) then
                    v63 = true
                end
            end

            if getPlayerMaterial(v59.Material) > 0 or v63 then
                if getPlayerMaterial(v59.Material) > 0 and not v63 then
                    local v73 = {
                        'QuestSpawnBoss',
                        {
                            SuccessQuest = 'Quest Accepted.',
                            BossName = v43[1].Mob,
                            LevelNeed = v43[1].LevelRequired,
                            QuestName = v43[1].QuestTitle,
                            MaterialNeed = v59.Material,
                        },
                    }

                    game:GetService('ReplicatedStorage'):WaitForChild('Chest'):WaitForChild('Remotes'):WaitForChild('Functions'):WaitForChild('EtcFunction'):InvokeServer(unpack(v73))
                end
            else
                v43[1].Mob = v59.Kills
                v43[1].LevelRequired = v59.Level
                v43[1].QuestTitle = v59.QuestTitle
            end
        end
    end

    return v43[1]
end

local v74, v75, v76 = pairs(game:GetService('Workspace'):FindFirstChild('AllNPC'):GetChildren())

while true do
    local v77, v78 = v74(v75, v76)

    if v77 == nil then
        break
    end

    v76 = v77

    if v78:GetAttribute('LevelMax') then
        lvmax = v78:GetAttribute('LevelMax')

        if not MaxLevelOfSea or lvmax > MaxLevelOfSea then
            MaxLevelOfSea = lvmax
        end
    end
    if v78:GetAttribute('LevelMin') then
        lvmin = v78:GetAttribute('LevelMin')

        if not MinLevelOfSea or lvmin < MinLevelOfSea then
            MinLevelOfSea = lvmax
        end
    end
end

function tp(p79)
    pcall(function()
        local v80 = Client

        if v80 then
            v80 = Client.Character
        end
        if v80:FindFirstChild('Humanoid') and v80.Humanoid.Sit == true then
            v80.Humanoid.Sit = false
        end

        NeedNoClip = true

        local v81 = {
            Target = p79.Target or print('mae mung tai.'),
            Mod = p79.Mod or CFrame.new(0, 0, 0),
        }

        v80:FindFirstChild('HumanoidRootPart').CFrame = v81.Target * v81.Mod
    end)
end
function Tp(p82)
    if Client.Character.Humanoid.Sit == true then
        Client.Character.Humanoid.Sit = false
    end

    local v83, v84, v85 = pairs(Client.Character:GetDescendants())

    while true do
        local v86

        v85, v86 = v83(v84, v85)

        if v85 == nil then
            break
        end
        if v86:IsA('BasePart') then
            v86.CanCollide = false
        end
    end

    if not Client.Character.HumanoidRootPart:FindFirstChild('BodyClip') then
        local _BodyVelocity2 = Instance.new('BodyVelocity')

        _BodyVelocity2.Parent = Client.Character.HumanoidRootPart
        _BodyVelocity2.Name = 'BodyClip'

        local v88 = Vector3.new(5, math.huge, 5)

        _BodyVelocity2.Velocity = Vector3.new(0, 0, 0)
        _BodyVelocity2.MaxForce = v88
    end

    Client.Character.HumanoidRootPart.CFrame = p82
end
function tp1(p89)
    local _LocalPlayer = game.Players.LocalPlayer

    if _LocalPlayer and _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
        _LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame = p89
    else
        warn("Player's character or HumanoidRootPart not found!")
    end
end
function EquipTools(p91)
    if Client.Backpack:FindFirstChild(p91) then
        local v92 = Client.Backpack:FindFirstChild(p91)

        Client.Character.Humanoid:EquipTool(v92)
    end
end
function UnEquipTools(p93)
    if Client.Character:FindFirstChild(p93) then
        wait(0.5)

        Client.Character:FindFirstChild(p93).Parent = Client.LocalPlayer.Backpack

        wait(0.1)
    end
end

local u94 = {
    'Melee',
    'Sword',
    'Fruit Power',
}
local u95 = 1

function Attack()
    if _G.Settings.Select_Weapon ~= 'Melee' then
        if _G.Settings.Select_Weapon ~= 'Sword' then
            if _G.Settings.Select_Weapon ~= 'all In One' then
                game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('FS_' .. _G.Weapon .. '_M1')
            else
                local v96 = u94[u95]

                if v96 == 'Sword' then
                    addSkill = 'SW'

                    delay(0.1, function()
                        game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('SW_' .. myWeapon.Sword .. '_M1')
                    end)
                elseif v96 == 'Melee' then
                    addSkill = 'FS'

                    game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('FS_' .. myWeapon.Melee .. '_M1')
                elseif v96 == 'Fruit Power' then
                    addSkill = 'FP'

                    game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('FP_' .. myWeapon['Fruit Power'] .. '_M1')
                end

                EquipTools(myWeapon[v96])

                u95 = u95 + 1

                if u95 > #u94 then
                    u95 = 1
                end
            end
        else
            addSkill = 'SW'

            game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('SW_' .. _G.Weapon .. '_M1')
        end
    else
        addSkill = 'FS'

        game:GetService('ReplicatedStorage').Chest.Remotes.Functions.SkillAction:InvokeServer('FS_' .. _G.Weapon .. '_M1')
    end
    if _G.Settings.Select_Weapon ~= 'all In One' then
        EquipTools(_G.Weapon)
    end
end

local u97 = {
    Z = 0,
    X = 0,
    C = 0,
    V = 0,
    B = 0,
    E = 0,
}

local function u104()
    if _G.Settings.Select_Skill then
        local v98 = {
            {
                key = 'Z',
                enabled = _G.Settings.SkillZ,
                holdTime = u97.Z,
            },
            {
                key = 'X',
                enabled = _G.Settings.SkillX,
                holdTime = u97.X,
            },
            {
                key = 'C',
                enabled = _G.Settings.SkillC,
                holdTime = u97.C,
            },
            {
                key = 'V',
                enabled = _G.Settings.SkillV,
                holdTime = u97.V,
            },
            {
                key = 'B',
                enabled = _G.Settings.SkillB,
                holdTime = u97.B,
            },
            {
                key = 'E',
                enabled = _G.Settings.SkillE,
                holdTime = u97.E,
            },
        }
        local v99, v100, v101 = ipairs(v98)

        while true do
            local v102

            v101, v102 = v99(v100, v101)

            if v101 == nil then
                break
            end
            if v102.enabled and not u31.CheckOnCooldown(v102.key) then
                local _VirtualInputManager = game:GetService('VirtualInputManager')

                _VirtualInputManager:SendKeyEvent(true, v102.key, false, game)
                wait(v102.holdTime)
                _VirtualInputManager:SendKeyEvent(false, v102.key, false, game)
            end
        end
    end
end
local function u106(p105)
    if p105 then
        game:GetService('GuiService').SelectedObject = p105

        task.wait(0.1)
        game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        task.wait(0.1)
        game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        task.wait(0.1)

        game:GetService('GuiService').SelectedObject = nil
    else
        warn('Invalid UI path provided to ClickUI')
    end
end

function click(p107)
    for _ = 1, p107 or 3 do
        game:GetService('VirtualUser'):Button1Down(Vector2.new(1, 1))
        game:GetService('VirtualUser'):Button1Up(Vector2.new(1, 1))
    end
end
function Click(p108)
    for _ = 1, p108 or 3 do
        game:GetService('VirtualUser'):Button1Down(Vector2.new(1, 1))
        game:GetService('VirtualUser'):Button1Up(Vector2.new(1, 1))
    end
end
function toQuest(p109, p110, p111)
    local v112 = p111 or true
    local v113 = p110 or 'QuestLvl'
    local v114 = p109 or (Sea1 and 'Elite Pirate' or (Sea3 and 'The Squid' or p109))
    local v115 = p110 == 1 and Sea2 and 'Elite Pirate' or (p110 == 3 and Sea2 and 'The Squid' or v114)
    local v116 = workspace.AllNPC:FindFirstChild(v115)

    if v116 then
        v115 = v116.CFrame
    end

    local v117 = v112 and v115 and Client.Character:FindFirstChild('HumanoidRootPart')

    if v117 then
        v117.CFrame = v115 * CFrame.new(0, 0, -3)
    end

    local _HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

    if _HumanoidRootPart then
        _HumanoidRootPart.Anchored = true

        wait(0.1)

        _HumanoidRootPart.Anchored = false
    end

    vu:Button1Down(Vector2.new(1, 1))
    vu:Button1Up(Vector2.new(1, 1))
    wait(0.5)

    local v119, v120, v121 = pairs(Client.PlayerGui:GetChildren())

    while true do
        local v122

        v121, v122 = v119(v120, v121)

        if v121 == nil then
            break
        end
        if string.find(v122.Name, v113) then
            local _Dialogue = v122:FindFirstChild('Dialogue')

            if _Dialogue and _Dialogue:FindFirstChild('Accept') then
                local _Accept = _Dialogue.Accept

                if game.PlaceId == 4520749081 or (game.PlaceId == 6381829480 or v112) then
                    _Accept.Size = UDim2.new(1001, 0, 1001, 0)
                    _Accept.Text.TextTransparency = 1
                    _Accept.Position = UDim2.new(0.5, 0, 0.5, 0)
                    _Accept.AnchorPoint = Vector2.new(0.5, 0.5)
                else
                    local v125, v126, v127 = pairs(_Dialogue:GetChildren())

                    while true do
                        local v128

                        v127, v128 = v125(v126, v127)

                        if v127 == nil then
                            break
                        end
                        if string.find(v128.Name, 'Quest') or v128.Name == 'QuestAccept' then
                            v128.Size = UDim2.new(1001, 0, 1001, 0)
                            v128.Text.TextTransparency = 1
                            v128.Position = UDim2.new(0.5, 0, 0.5, 0)
                            v128.AnchorPoint = Vector2.new(0.5, 0.5)
                        end
                    end

                    if string.find(v122.Text.Text, 'Talk') then
                        local _QuestAccept = _Dialogue:FindFirstChild('QuestAccept')

                        if _QuestAccept then
                            _QuestAccept.Size = UDim2.new(1001, 0, 1001, 0)
                            _QuestAccept.Text.TextTransparency = 1
                            _QuestAccept.Position = UDim2.new(0.5, 0, 0.5, 0)
                            _QuestAccept.AnchorPoint = Vector2.new(0.5, 0.5)
                        end
                    end
                end
                if _Accept then
                    _Accept:Click()
                end
            end
        end
    end
end
function HopServer(p130)
    local v131 = p130 or false
    local _HttpService3 = game:GetService('HttpService')
    local _PlaceId = game.PlaceId
    local u134 = 'https://games.roblox.com/v1/games/' .. _PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'

    local function v136(p135)
        return _HttpService3:JSONDecode((game:HttpGet(u134 .. (p135 and '&cursor=' .. p135 or ''))))
    end

    local v137 = nil

    repeat
        local v138 = v136(v137)
        local v139 = v138.data[1]

        v137 = v138.nextPageCursor
    until v139

    while true do
        if v131 then
            if request then
                local v140 = {}
                local _Body = request({
                    Url = string.format('https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true', game.PlaceId),
                }).Body
                local v142 = game:GetService('HttpService'):JSONDecode(_Body)

                if v142 and v142.data then
                    local v143 = next
                    local _data = v142.data
                    local v145 = nil

                    while true do
                        local v146

                        v145, v146 = v143(_data, v145)

                        if v145 == nil then
                            break
                        end
                        if type(v146) == 'table' and (tonumber(v146.playing) and (tonumber(v146.maxPlayers) and (v146.playing < v146.maxPlayers and v146.id ~= game.JobId))) then
                            table.insert(v140, 1, v146.id)
                        end
                    end
                end
                if #v140 <= 0 then
                    return "Couldn't find a server."
                end

                game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v140[math.random(1, #v140)], Client)
            end
        else
            game:GetService('TeleportService'):TeleportToPlaceInstance(_PlaceId, v139.id, Client)
        end

        wait()

        if game.PlaceId ~= game.PlaceId then
            return
        end
    end
end
function dist(p147, p148, p149)
    local v150 = Client

    if v150 then
        v150 = Client.Character
    end

    local v151 = p148 or v150.HumanoidRootPart.Position
    local _new = Vector3.new
    local _X = p147.X
    local v154

    if p149 then
        v154 = false
    else
        v154 = p147.Y
    end

    local v155 = _new(_X, v154, p147.Z)
    local _new2 = Vector3.new
    local _X2 = v151.X
    local v158

    if p149 then
        v158 = false
    else
        v158 = v151.Y
    end

    return (v155 - _new2(_X2, v158, v151.Z)).magnitude
end

local u159 = 0

function seaChest()
    wait(3)

    local function v160()
        if _G.Settings.Monter_Hop or _G.Settings.Auto_Sea31 then
            task.wait(3.5)
            HopServer(false)
        end
    end

    if not workspace.SeaMonster:FindFirstChild('SeaKing') and (not game:GetService('Workspace').SeaMonster:FindFirstChild('HydraSeaKing') and ((function()
        local v161, v162, v163 = ipairs({
            'Legacy Island1',
            'Legacy Island2',
            'Legacy Island3',
            'Legacy Island4',
        })

        while true do
            local v164

            v163, v164 = v161(v162, v163)

            if v163 == nil then
                break
            end

            local v165 = game:GetService('Workspace').Island:FindFirstChild(v164)

            if v165 then
                return v165
            end
        end

        return nil
    end)() or (function()
        local v166, v167, v168 = pairs(workspace:FindFirstChild('Island'):GetChildren())

        while true do
            local v169

            v168, v169 = v166(v167, v168)

            if v168 == nil then
                break
            end
            if v169.Name:match('Sea King') then
                return true
            end
        end

        return false
    end)())) then
        local v170, v171, v172 = ipairs({
            'Legacy Island1',
            'Legacy Island2',
            'Legacy Island3',
            'Legacy Island4',
        })

        while true do
            local v173

            v172, v173 = v170(v171, v172)

            if v172 == nil then
                break
            end

            local v174 = game:GetService('Workspace').Island:FindFirstChild(v173)

            if v174 then
                tp({
                    Target = v174.ChestSpawner.CFrame,
                })

                Client.PlayerStats.beli.Value = Client.PlayerStats.beli.Value + 50

                wait(3)

                if dist(v174.ChestSpawner.Position, Client.Character.HumanoidRootPart.Position) < 10 and Client.PlayerStats.beli.Value > u159 + 1 then
                    print(u159, ' : ', Client.PlayerStats.beli.Value)
                    v160()
                end
            end
        end

        local v175, v176, v177 = pairs(workspace:FindFirstChild('Island'):GetChildren())

        while true do
            local v178

            v177, v178 = v175(v176, v177)

            if v177 == nil then
                break
            end
            if v178.Name:match('Sea King') then
                tp({
                    Target = v178.HydraStand.CFrame,
                })
            end
        end
    end
end

local function u189(...)
    local v179 = {...}
    local v180 = v179[1]
    local v181 = nil

    if type(v180) ~= 'vector' then
        if type(v180) ~= 'userdata' then
            if type(v180) == 'number' then
                v181 = CFrame.new(unpack(v179)).p
            end
        else
            v181 = v180.Position
        end
    else
        v181 = v180
    end

    local _huge = math.huge
    local v183, v184, v185 = pairs(workspace.Island:GetChildren())
    local v186 = nil

    while true do
        local v187

        v185, v187 = v183(v184, v185)

        if v185 == nil then
            break
        end
        if v187:IsA('Model') then
            local _Magnitude = (v181 - v187:GetModelCFrame().p).Magnitude

            if _Magnitude < _huge then
                v186 = v187.Name
                _huge = _Magnitude
            end
        end
    end

    if v186 then
        return v186
    end
end

local u190 = {}

local function u197(p191)
    local v192, v193, v194 = pairs(workspace.AllNPC:GetChildren())

    while true do
        local v195

        v194, v195 = v192(v193, v194)

        if v194 == nil then
            break
        end

        local v196 = u189(v195.CFrame)

        if v196 == u189(p191) then
            if not u190[v196] then
                u190[v196] = {}
            end

            table.insert(u190[v196], v195.CFrame)
        end
    end
end

local u198 = {}

function adjustPosition(p199, p200)
    local v201 = _G.Disfarm or 7.5

    return p199 * (({
        Above = CFrame.new(0, v201, 0),
        Beside = CFrame.new(v201, 0, 0),
        Lower = CFrame.new(0, -v201, 0),
    })[p200] or CFrame.new())
end
function getTargetPosition(p202, p203)
    local _HumanoidRootPart2 = p202:FindFirstChild('HumanoidRootPart')

    if _HumanoidRootPart2 then
        local _Position = _HumanoidRootPart2.Position
        local v206 = _Position + (({
            Above = Vector3.new(0, _G.Disfarm or 7.5, 0),
            Beside = Vector3.new(_G.Disfarm or 7.5, 0, 0),
            Lower = Vector3.new(0, -(_G.Disfarm or 7.5), 0),
        })[p203] or Vector3.new())

        if p203 == 'Beside' or p203 == 'Lower' then
            return CFrame.new(v206, _Position)
        else
            return CFrame.new(v206)
        end
    else
        return nil
    end
end
function u198.Bring(p207, p208)
    if _G.Settings.Bring_Nearest_Mobs_Together then
        local v209, v210, v211 = pairs(workspace.Monster.Mon:GetChildren())

        while true do
            local v212

            v211, v212 = v209(v210, v211)

            if v211 == nil then
                break
            end

            local _Humanoid = v212:FindFirstChild('Humanoid')
            local _HumanoidRootPart3 = v212:FindFirstChild('HumanoidRootPart')

            if v212.Name == p207.Name and (_Humanoid and (_Humanoid.Health > 0 and _HumanoidRootPart3)) then
                _HumanoidRootPart3.CFrame = p208
                _Humanoid.PlatformStand = true

                _Humanoid:ChangeState(11)
                _Humanoid:ChangeState(14)
                setscriptable(game.Players.LocalPlayer, 'SimulationRadius', true)
            end
        end
    end
end
function u198.attack(p215, p216, _)
    local u217 = GetQuestData()
    local v218, v219

    if Sea2 then
        v218 = game:GetService('Workspace').SeaMonster:GetChildren()
        v219 = game.Workspace:FindFirstChild('GhostMonster') and (game.Workspace.GhostMonster:GetChildren() or {}) or {}
    elseif Sea3 then
        v218 = game:GetService('Workspace').SeaMonster:GetChildren()
        v219 = {}
    else
        v218 = game:GetService('ReplicatedStorage').MOB:GetChildren()
        v219 = game:GetService('ReplicatedStorage').MOB:GetChildren()
    end

    local function u223(p220)
        if p220 and (p220:FindFirstChild('Humanoid') and p220:FindFirstChild('HumanoidRootPart')) then
            local v221 = math.floor(p220.Humanoid.Health / p220.Humanoid.MaxHealth * 100)
            local v222 = p220.Humanoid.Health > 0 and 'Alive' or 'Dead'

            _G.LabelAutoFarm = string.format('Farming: %s', p220.Name)
            _G.Questname = string.format('Quest: %s', u217.QuestTitle)
            _G.LabelHealth = string.format('Status: %s | Health: %d%%', v222, v221)
        else
            _G.LabelAutoFarm = 'No target detected.'
        end
    end
    local function v228(p224)
        if not (_G.Settings[p216] and p224.Parent) then
            return
        end

        while true do
            task.wait()

            if p224:FindFirstChild('Humanoid') and p224:FindFirstChild('HumanoidRootPart') then
                local _Health = p224.Humanoid.Health
                local _Y = p224.HumanoidRootPart.Position.Y

                u223(p224)

                if 0 < _Health and (-100 < _Y and _Y < 1500) then
                    tp({
                        Target = getTargetPosition(p224, _G.Settings.PositionFarm),
                        Mod = _G.Settings.PositionFarm == 'Above' and CFrame.Angles(math.rad(-90), 0, 0) or CFrame.new(),
                    })
                    task.spawn(function()
                        Attack()

                        getgenv().PosMonSkill = p224.HumanoidRootPart

                        u104()
                    end)

                    if not p224:FindFirstChild('Next') then
                        u198.Bring(p224, p224.HumanoidRootPart.CFrame)

                        local _Folder = Instance.new('Folder', p224)

                        _Folder.Name = 'Next'

                        task.delay(1, function()
                            _Folder:Destroy()
                        end)
                    end
                end
            end
            if p224.Humanoid.Health <= 0 or not (p224.Parent and _G.Settings[p216]) then
                return
            end
        end
    end

    local v229, v230, v231 = ipairs({
        workspace.Monster.Boss:GetChildren(),
        workspace.Monster.Mon:GetChildren(),
        game:GetService('Workspace').SeaMonster:GetChildren(),
        v219,
        v218,
        game:GetService('ReplicatedStorage').MOB:GetChildren(),
    })

    while true do
        local v232

        v231, v232 = v229(v230, v231)

        if v231 == nil then
            break
        end

        local v233, v234, v235 = ipairs(v232)

        while true do
            local v236

            v235, v236 = v233(v234, v235)

            if v235 == nil then
                break
            end
            if table.find(p215, v236.Name) then
                v228(v236)
            elseif v236:FindFirstChild('Humanoid') and (v236:FindFirstChild('HumanoidRootPart') and v236.Humanoid.Health > 0) then
                tp({
                    Target = v236.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0),
                })
            end
        end
    end
end
function u198.find(p237)
    local v238, v239

    if Sea2 then
        v238 = game:GetService('Workspace').SeaMonster:GetChildren()
        v239 = game.Workspace:FindFirstChild('GhostMonster'):GetChildren()
    elseif Sea3 then
        v238 = game:GetService('Workspace').SeaMonster:GetChildren()
        v239 = game:GetService('ReplicatedStorage').MOB:GetChildren()
    else
        v238 = game:GetService('ReplicatedStorage').MOB:GetChildren()
        v239 = game:GetService('ReplicatedStorage').MOB:GetChildren()
    end

    local function u242(p240)
        local _Humanoid2 = p240:FindFirstChild('Humanoid')

        if _Humanoid2 then
            _Humanoid2 = p240.Humanoid.Health > 0
        end

        return _Humanoid2
    end
    local function v248(p243)
        local v244, v245, v246 = pairs(p243)

        while true do
            local v247

            v246, v247 = v244(v245, v246)

            if v246 == nil then
                break
            end
            if table.find(p237, v247.Name) and u242(v247) then
                return true
            end
        end

        return false
    end

    return v248(workspace.Monster.Mon:GetChildren()) or (v248(workspace.Monster.Boss:GetChildren()) or (v248(v239) or v248(v238)) or v248(game:GetService('ReplicatedStorage').MOB:GetChildren()) or (v248(workspace.Monster.Mon:GetChildren()) or v248(workspace.Monster.Boss:GetChildren())))
end
function u198.attackMon(p249, p250, _)
    local _QuestBoard = Client.PlayerGui.MainGui.QuestFrame.QuestBoard
    local v252, v253

    if Sea2 or Sea3 then
        v252 = game:GetService('Workspace').SeaMonster:GetChildren()
        v253 = game.Workspace:FindFirstChild('GhostMonster'):GetChildren()
    else
        v252 = game:GetService('ReplicatedStorage').MOB:GetChildren()
        v253 = game:GetService('ReplicatedStorage').MOB:GetChildren()
    end

    local function u254()
        return _G.Settings[p250] ~= nil
    end
    local function u257(p255)
        local v256 = p255:FindFirstChild('Humanoid') and p255:FindFirstChild('HumanoidRootPart')

        if v256 then
            v256 = p255.Humanoid.Health > 0 and (p255.HumanoidRootPart.Position.Y > -100 and p255.HumanoidRootPart.Position.Y < 1500)
        end

        return v256
    end
    local function u259(p258)
        while true do
            task.wait()

            if u257(p258) then
                tp({
                    Target = getTargetPosition(p258, _G.Settings.PositionFarm),
                    Mod = _G.Settings.PositionFarm == 'Above' and CFrame.Angles(math.rad(-90), 0, 0) or CFrame.new(),
                })
                task.spawn(function()
                    Attack()

                    getgenv().PosMonSkill = p258.HumanoidRootPart

                    u104()
                end)
            end
            if not u254() or p250 == 'Auto_Farm_Level1' and not (_QuestBoard.Visible and _QuestBoard.TextFrame.QuestCount.Text:find(p258.Name:gsub('%[Lv%.%s*%d+%]', ''))) or (not p258.Parent or (p258.Humanoid.Health <= 0 or (not p258:FindFirstChild('HumanoidRootPart') or (p258.HumanoidRootPart.Position.Y < -100 or p258.HumanoidRootPart.Position.Y > 1500)))) then
                return
            end
        end
    end

    (function(p260)
        local v261, v262, v263 = ipairs(p260)

        while true do
            local v264

            v263, v264 = v261(v262, v263)

            if v263 == nil then
                break
            end

            local v265, v266, v267 = ipairs(v264)

            while true do
                local v268

                v267, v268 = v265(v266, v267)

                if v267 == nil then
                    break
                end
                if table.find(p249, v268.Name) and u254() then
                    if u257(v268) then
                        u259(v268)
                    elseif v264 == game:GetService('ReplicatedStorage').MOB:GetChildren() then
                        Tp(v268.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
                    end
                end
            end
        end
    end)({
        workspace.Monster.Boss:GetChildren(),
        workspace.Monster.Mon:GetChildren(),
        v253,
        v252,
        game:GetService('ReplicatedStorage').MOB:GetChildren(),
    })
end
function u198.find(p269)
    local v270, v271

    if Sea2 then
        v270 = game:GetService('Workspace').SeaMonster:GetChildren()
        v271 = game.Workspace:FindFirstChild('GhostMonster'):GetChildren()
    elseif Sea3 then
        v270 = game:GetService('Workspace').SeaMonster:GetChildren()
        v271 = game:GetService('ReplicatedStorage').MOB:GetChildren()
    else
        v270 = game:GetService('ReplicatedStorage').MOB:GetChildren()
        v271 = game:GetService('ReplicatedStorage').MOB:GetChildren()
    end

    local function u274(p272)
        local _Humanoid3 = p272:FindFirstChild('Humanoid')

        if _Humanoid3 then
            _Humanoid3 = p272.Humanoid.Health > 0
        end

        return _Humanoid3
    end
    local function v280(p275)
        local v276, v277, v278 = pairs(p275)

        while true do
            local v279

            v278, v279 = v276(v277, v278)

            if v278 == nil then
                break
            end
            if table.find(p269, v279.Name) and u274(v279) then
                return true
            end
        end

        return false
    end

    return v280(workspace.Monster.Mon:GetChildren()) or (v280(workspace.Monster.Boss:GetChildren()) or (v280(v271) or v280(v270)) or v280(game:GetService('ReplicatedStorage').MOB:GetChildren()) or (v280(workspace.Monster.Mon:GetChildren()) or v280(workspace.Monster.Boss:GetChildren())))
end
function loadIslandForAllNPCs(p281, p282)
    local v283 = u190[p281]

    if not _G.Settings.Auto_Farm_Level1 or u198.find({p282}) then
        return 'Entity Spawn'
    end
    if not v283 or #v283 <= 0 then
        return 'No NPCs found on island: ' .. p281
    end

    local v284, v285, v286 = pairs(v283)

    while true do
        local v287

        v286, v287 = v284(v285, v286)

        if v286 == nil or (not _G.Settings.Auto_Farm_Level1 or u198.find({p282})) then
            break
        end

        Client.Character.HumanoidRootPart.CFrame = v287 * CFrame.new(0, 50, -math.random(5, 10))

        wait(0.5)
    end

    return 'Loaded all NPC positions on island: ' .. p281
end

local function u294(p288, p289)
    if p288.LevelRequired ~= 3750 then
        if p288.LevelRequired ~= 3775 then
            if p288.LevelRequired ~= 4750 then
                u197(p289)
                loadIslandForAllNPCs(u189(p289), p288.Mob)
            else
                local v290 = tp
                local v291 = {
                    Target = workspace.Island['Forgotten Coliseum'].Vacuus.Base:GetChildren()[179].CFrame * CFrame.new(0, 20, 0),
                }

                v290(v291)
            end
        else
            local v292 = tp
            local v293 = {
                Target = workspace.Island['H - Fiore'].Italian.Base.Mountain.Model:GetChildren()[9].CFrame * CFrame.new(0, 20, 0),
            }

            v292(v293)
        end
    else
        tp({
            Target = workspace.Island['H - Fiore'].Lab.Lab.Base.CFrame * CFrame.new(0, 20, 0),
        })
    end
end

local u295 = {}
local u296 = nil

GetQuestData()

function u295.Auto_Farm_Level1()
    local u297 = 'Auto_Farm_Level1'

    while _G.Settings[u297] and task.wait() do
        local v302, v303 = pcall(function()
            local v298 = GetQuestData()
            local _CFrame = v298.NPC.CFrame

            if Client.CurrentQuest.Value ~= v298.QuestTitle or Client.CurrentQuest.Value == '' then
                tp({Target = _CFrame})
                Repli:WaitForChild('Chest').Remotes.Functions.Quest:InvokeServer('take', v298.QuestTitle)
            elseif Client.CurrentQuest.Value == v298.QuestTitle then
                if v298.Mob ~= 'Dough Master [Lv. 3275]' or v298.LevelRequired ~= 3275 then
                    local v300 = Repli.MOB:FindFirstChild(v298.Mob)

                    if v300 then
                        tp({
                            Target = v300:GetModelCFrame() * CFrame.new(0, 20, 0),
                        })
                    elseif v298.LevelRequired < 3265 or u296 ~= nil then
                        local v301 = {
                            Target = u296 or _CFrame,
                        }

                        tp(v301)
                    else
                        u294(v298, _CFrame)
                    end
                else
                    tp({
                        Target = CFrame.new(30279.0625, 69.36441802978516, 93166.2734375),
                    })
                end
                if u198.find({
                    v298.Mob,
                }) then
                    delay(0.5, function()
                        u296 = nil
                    end)
                    u198.attack({
                        v298.Mob,
                    }, u297)
                    delay(0.5, function()
                        u296 = Client.Character.HumanoidRootPart.CFrame
                    end)
                end
            end
        end)

        if not v302 then
            warn(v303, ': ' .. u297)
        end
    end
end

local u304 = {}

function u295.Auto_Sea21()
    local u305 = 'Auto_Sea21'

    while _G.Settings[u305] and task.wait() do
        local v308, v309 = pcall(function()
            if Sea1 and (Client.PlayerStats.lvl.Value >= 2250 and Client.PlayerStats.lvl.Value < 4000) then
                if _G.Settings.Auto_Farm_Level1 then
                    _G.Settings.Auto_Farm_Level1 = false
                end
                if Client.PlayerStats.SecondSeaProgression.Value ~= 'Yes' then
                    if getPlayerMaterial('Map') <= 0 then
                        if GUI.MainGui.QuestFrame.QuestBoard.Visible then
                            if Repli.MOB:FindFirstChild('Seasoned Fishman [Lv. 2200]') then
                                local v306 = tp
                                local v307 = {
                                    Target = Repli.MOB:FindFirstChild('Seasoned Fishman [Lv. 2200]'):GetPivot(),
                                }

                                v306(v307)
                            else
                                tp({
                                    Target = CFrame.new(-1865.43481, 45.2696266, 6722.8501, 0.965929627, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627),
                                })
                            end
                            if u198.find({
                                'Seasoned Fishman [Lv. 2200]',
                            }) then
                                u198.attack({
                                    'Seasoned Fishman [Lv. 2200]',
                                }, u305)
                            end
                        else
                            toQuest(workspace.AllNPC.Traveler.CFrame)
                            wait(0.5)
                            tp({
                                Target = workspace.AllNPC.Traveler.CFrame * CFrame.new(0, 0, -10),
                            })
                        end
                    else
                        toQuest(workspace.AllNPC.Traveler.CFrame)
                        wait(0.5)
                        tp({
                            Target = workspace.AllNPC.Traveler.CFrame * CFrame.new(0, 0, -10),
                        })
                    end
                else
                    toQuest(u304['Teleport To Sea 2'], 2)
                end
            end
        end)

        if not v308 then
            warn(v309, ': ' .. u305)
        end
    end
end
function u295.Auto_Sea31()
    local u310 = 'Auto_Sea31'

    while _G.Settings[u310] and task.wait() do
        local v322, v323 = pcall(function()
            if Client.PlayerStats.lvl.Value >= 4000 and not Sea3 then
                if _G.Settings.Auto_Farm_Level1 then
                    _G.Settings.Auto_Farm_Level1 = false
                end
                if getPlayerMaterial("Kraken's Cache") <= 0 then
                    if u198.find({
                        'Tentacle',
                    }) then
                        u198.attackMon({
                            'Tentacle',
                        }, u310, 10)
                    elseif getPlayerMaterial('Heart of Sea') <= 0 then
                        if getPlayerMaterial("Kraken's Cache") > 0 then
                            return
                        end
                        if not u198.find({
                            'Tentacle',
                        }) then
                            local v311 = {
                                Log = 50,
                                ['Pile of Bones'] = 10,
                                ['Fresh Fish'] = 50,
                                ["Angellic's Feather"] = 14,
                                ["Sea King's Blood"] = 1,
                            }
                            local v312 = {
                                Sea1 = workspace.AllNPC:FindFirstChild('Elite Pirate').CFrame,
                                Sea2 = workspace.AllNPC:FindFirstChild('Elite Pirate').CFrame,
                            }

                            if getPlayerMaterial('Log') >= v311.Log then
                                if getPlayerMaterial('Pile of Bones') >= v311['Pile of Bones'] then
                                    if getPlayerMaterial('Fresh Fish') >= v311['Fresh Fish'] then
                                        if getPlayerMaterial("Angellic's Feather") >= v311["Angellic's Feather"] then
                                            if getPlayerMaterial("Sea King's Blood") >= v311["Sea King's Blood"] then
                                                if Sea2 then
                                                    toQuest(workspace.AllNPC:FindFirstChild('Jack Stones').CFrame)

                                                    local v313, v314, v315 = pairs(Client.PlayerGui:GetChildren())

                                                    while true do
                                                        local v316

                                                        v315, v316 = v313(v314, v315)

                                                        if v315 == nil then
                                                            break
                                                        end
                                                        if v316.Name == 'CraftingMaterialUI' then
                                                            if v316:FindFirstChild('Frame') and v316.Frame.OrbName.Text ~= 'Heart of Sea' then
                                                                v316.Frame.Materials.AnchorPoint = Vector2.new(0, 0)
                                                                v316.Frame.Materials.Position = UDim2.new(0, 0, 0, 0)
                                                                v316.Frame.Materials.Visible = true

                                                                if v316.Frame.Materials:FindFirstChild('ScrollingFrame') then
                                                                    v316.Frame.Materials:FindFirstChild('ScrollingFrame').ClipsDescendants = false

                                                                    if v316.Frame.Materials:FindFirstChild('ScrollingFrame'):FindFirstChild('UIGridLayout') then
                                                                        v316.Frame.Materials:FindFirstChild('ScrollingFrame'):FindFirstChild('UIGridLayout').CellSize = UDim2.new(1001, 0, 1001, 0)
                                                                    end
                                                                    if v316.Frame.Materials:FindFirstChild('ScrollingFrame'):FindFirstChild('Diamond Key') then
                                                                        v316.Frame.Materials:FindFirstChild('ScrollingFrame'):FindFirstChild('Diamond Key').Visible = false
                                                                    end

                                                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1, 1))
                                                                    game:GetService('VirtualUser'):Button1Up(Vector2.new(1, 1))
                                                                end
                                                            elseif v316.Frame.OrbName.Text == 'Heart of Sea' then
                                                                v316.Frame.CraftButton.Size = UDim2.new(1001, 0, 1001, 0)

                                                                game:GetService('VirtualUser'):Button1Down(Vector2.new(1, 1))
                                                                game:GetService('VirtualUser'):Button1Up(Vector2.new(1, 1))
                                                            end
                                                        end
                                                    end
                                                else
                                                    toQuest(v312.Sea2)
                                                end
                                            elseif Sea2 then
                                                warn("Sea King's Blood Not Have")

                                                if u198.find({
                                                    'SeaKing',
                                                    'HydraSeaKing',
                                                }) then
                                                    u198.attack({
                                                        'SeaKing',
                                                        'HydraSeaKing',
                                                    }, u310)
                                                else
                                                    seaChest()
                                                end
                                            else
                                                toQuest(v312.Sea2)
                                            end
                                        elseif Sea1 then
                                            if u198.find({
                                                'Sky Soldier [Lv. 800]',
                                                'Ball Man [Lv. 850]',
                                            }) then
                                                u198.attack({
                                                    'Sky Soldier [Lv. 800]',
                                                    'Ball Man [Lv. 850]',
                                                }, u310)
                                            else
                                                tp({
                                                    Target = workspace.Island['H - Skyland'].Sky.Base:GetChildren()[4].CFrame,
                                                })
                                            end
                                        else
                                            toQuest(v312.Sea1)
                                        end
                                    elseif Sea1 then
                                        if u198.find({
                                            'Karate Fishman [Lv. 200]',
                                            'Fighter Fishman [Lv. 180]',
                                            'Shark Man [Lv. 230]',
                                        }) then
                                            u198.attack({
                                                'Karate Fishman [Lv. 200]',
                                                'Fighter Fishman [Lv. 180]',
                                                'Shark Man [Lv. 230]',
                                            }, u310)
                                        else
                                            tp({
                                                Target = workspace.Island['D - Shark Island'].D.Base:GetChildren()[57].CFrame,
                                            })
                                        end
                                    else
                                        toQuest(v312.Sea1)
                                    end
                                elseif Sea2 then
                                    if u198.find({
                                        'Skull Pirate [Lv. 3050]',
                                    }) then
                                        u198.attack({
                                            'Skull Pirate [Lv. 3050]',
                                        }, u310)
                                    else
                                        tp({
                                            Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, -50, 0),
                                        })
                                    end
                                else
                                    toQuest(v312.Sea2)
                                end
                            else
                                if not Sea2 then
                                    toQuest(v312.Sea2)

                                    return
                                end

                                local v317, v318, v319 = pairs(game:GetService('Workspace'):GetDescendants())

                                while true do
                                    local v320

                                    v319, v320 = v317(v318, v319)

                                    if v319 == nil then
                                        break
                                    end
                                    if string.find(v320.Name, 'Tree') and (v320:FindFirstChild('Part') and v320.Part.Transparency == 0) then
                                        task.wait(1.5)

                                        if _G.Settings[u310] or (getPlayerMaterial('Log') <= v311.Log or not u198.find({
                                            'Tentacle',
                                        })) then
                                            while true do
                                                wait()

                                                local v321 = {
                                                    Target = v320:GetModelCFrame(),
                                                }

                                                tp(v321)

                                                if not (Client.Backpack:FindFirstChild('Bisento') or Client.Character:FindFirstChild('Bisento')) then
                                                    game:GetService('ReplicatedStorage'):WaitForChild('Chest'):WaitForChild('Remotes'):WaitForChild('Functions'):WaitForChild('InventoryEq'):InvokeServer(unpack({
                                                        'Bisento',
                                                    }))
                                                end

                                                EquipTools('Bisento')

                                                if not (u31.CheckOnCooldown('Z') and u31.CheckOnCooldown('X')) then
                                                    game:service('VirtualInputManager'):SendKeyEvent(true, 'Z', false, game)
                                                    game:service('VirtualInputManager'):SendKeyEvent(false, 'Z', false, game)
                                                    game:service('VirtualInputManager'):SendKeyEvent(true, 'X', false, game)
                                                    game:service('VirtualInputManager'):SendKeyEvent(false, 'X', false, game)
                                                end
                                                if not _G.Settings[u310] or (u31.CheckOnCooldown('Z') or (u31.CheckOnCooldown('X') or (u198.find({
                                                    'Tentacle',
                                                }) or getPlayerMaterial("Kraken's Cache") > 0))) then
                                                end
                                            end
                                        end
                                    end
                                    if not _G.Settings[u310] or (getPlayerMaterial('Log') >= v311.Log or (u198.find({
                                        'Tentacle',
                                    }) or getPlayerMaterial("Kraken's Cache") > 0)) then
                                        break
                                    end
                                end
                            end
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
                    tp({
                        Target = workspace.AllNPC:FindFirstChild('The Squid').CFrame * CFrame.new(0, 10, -10),
                    })
                end
            end
        end)

        if not v322 then
            warn(v323, ': ' .. u310)
        end
    end
end

local u324 = {}

function u295.Auto_Kill_Minion1()
    local u325 = 'Auto_Kill_Minion1'

    while _G.Settings[u325] and task.wait() do
        local v340, v341 = pcall(function()
            local v326 = workspace.EventSpawns:GetChildren()
            local v327, v328, v329 = pairs(v326)
            local v330 = false

            while true do
                local v331

                v329, v331 = v327(v328, v329)

                if v329 == nil then
                    break
                end
                if v331.Name == 'Spawn' and v331:FindFirstChild('Chest') then
                    local _CFrame2 = v331.Chest.RootPart.CFrame

                    if not u324[_CFrame2] then
                        u324[_CFrame2] = true

                        tp({Target = _CFrame2})

                        for v333 = 1, 7 do
                            local v334 = 'Chest' .. v333
                            local u335 = game:GetService('Workspace'):FindFirstChild(v334)

                            if u335 then
                                pcall(function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u335.RootPart.CFrame
                                end)
                            end
                        end
                    end
                end
                if u198.find({
                    'Minion',
                    'Boss',
                }) then
                    u198.attack({
                        'Minion',
                        'Boss',
                    }, u325)

                    v330 = true

                    break
                end
            end

            if not v330 then
                local v336, v337, v338 = pairs(v326)

                while true do
                    local u339

                    v338, u339 = v336(v337, v338)

                    if v338 == nil then
                        break
                    end
                    if u339.Name == 'Spawn' then
                        pcall(function()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u339.CFrame
                        end)
                        task.wait(1)

                        if u198.find({
                            'Minion',
                            'Boss',
                        }) then
                            u198.attack({
                                'Minion',
                                'Boss',
                            }, u325)

                            break
                        end
                    end
                end
            end
        end)

        if not v340 then
            warn(v341, ': ' .. u325)
        end
    end
end
function u295.Auto_Farm_Nearest_Mob()
    local u342 = 'Auto_Farm_Nearest_Mob'

    while _G.Settings[u342] and task.wait() do
        local v349, v350 = pcall(function()
            local v343, v344, v345 = pairs(game:GetService('Workspace').Monster.Mon:GetChildren())

            while true do
                local v346

                v345, v346 = v343(v344, v345)

                if v345 == nil then
                    break
                end

                local _Humanoid4 = v346:FindFirstChild('Humanoid')
                local _HumanoidRootPart4 = v346:FindFirstChild('HumanoidRootPart')

                if _Humanoid4 and (_HumanoidRootPart4 and (_Humanoid4.Health > 0 and ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _HumanoidRootPart4.Position).Magnitude <= 1000 and u198.find({
                    v346.Name,
                })))) then
                    u198.attack({
                        v346.Name,
                    }, u342)
                end
            end
        end)

        if not v349 then
            warn(v350, ': ' .. u342)
        end
    end
end
function u295.Auto_Kill_Sea_King1()
    local u351 = 'Auto_Kill_Sea_King1'

    while _G.Settings[u351] and task.wait() do
        local v352, v353 = pcall(function()
            if u198.find({
                'SeaKing',
            }) then
                u198.attack({
                    'SeaKing',
                }, u351)
            else
                seaChest()
            end
        end)

        if not v352 then
            warn(v353, ': ' .. u351)
        end
    end
end
function u295.Auto_Kill_GhostMonster1()
    local u354 = 'Auto_Kill_GhostMonster1'

    while _G.Settings[u354] and task.wait() do
        local v359, v360 = pcall(function()
            if u198.find({
                'Ghost Ship',
            }) then
                u159 = Client.PlayerStats.beli.Value

                u198.attack({
                    'Ghost Ship',
                }, u354)
            else
                local v355, v356, v357 = pairs(game.Workspace:GetChildren())

                while true do
                    local v358

                    v357, v358 = v355(v356, v357)

                    if v357 == nil then
                        break
                    end
                    if v358.Name:match('Chest') and (v358.PrimaryPart and (cheatKey[v358.PrimaryPart.CFrame] == false or cheatKey[v358.PrimaryPart.CFrame] == nil)) then
                        Tp(v358.PrimaryPart.CFrame)

                        cheatKey[v358.PrimaryPart.CFrame] = true

                        task.wait(0.3)
                    else
                        cheatKey = {}
                    end
                end
            end
        end)

        if not v359 then
            print('Error in Auto_Kill_GhostMonster1:', v360)
        end

        task.wait()
    end
end
function u295.Abyssal_Tyrant()
    local u361 = 'Abyssal_Tyrant'

    while _G.Settings[u361] and task.wait() do
        local v362, v363 = pcall(function()
            if u198.find({
                'SeaDragon',
            }) then
                u198.attack({
                    'SeaDragon',
                }, u361)
            end
        end)

        if not v362 then
            warn(v363, ': ' .. u361)
        end
    end
end
function u295.Chaos_Kraken()
    local u364 = 'Chaos_Kraken'

    while _G.Settings[u364] and task.wait() do
        local v365, v366 = pcall(function()
            if u198.find({
                'FuryTentacle',
            }) then
                u198.attack({
                    'FuryTentacle',
                }, u364)
            end
        end)

        if not v365 then
            warn(v366, ': ' .. u364)
        end
    end
end
function u295.Deepsea_Crusher()
    local u367 = 'Deepsea_Crusher'

    while _G.Settings[u367] and task.wait() do
        local v368, v369 = pcall(function()
            if u198.find({
                'ThirdSeaEldritch Crab',
            }) then
                u198.attack({
                    'ThirdSeaEldritch Crab',
                }, u367)
            end
        end)

        if not v368 then
            warn(v369, ': ' .. u367)
        end
    end
end
function u295.auto_draken()
    local u370 = 'auto_draken'

    while _G.Settings[u370] and task.wait() do
        local v371, v372 = pcall(function()
            if u198.find({
                'ThirdSeaDragon',
            }) then
                u198.attack({
                    'ThirdSeaDragon',
                }, u370)
            end
        end)

        if not v371 then
            warn(v372, ': ' .. u370)
        end
    end
end
function u295.Auto_Kill_Hydar_Sea_King1()
    local u373 = 'Auto_Kill_Hydar_Sea_King1'

    while _G.Settings[u373] and task.wait() do
        local v374, v375 = pcall(function()
            if u198.find({
                'HydraSeaKing',
            }) then
                u198.attack({
                    'HydraSeaKing',
                }, u373)
            else
                seaChest()
            end
        end)

        if not v374 then
            warn(v375, ': ' .. u373)
        end
    end
end
function u295.Auto_Kill_Kaido1()
    local u376 = 'Auto_Kill_Kaido1'

    while _G.Settings[u376] and task.wait() do
        local v377, v378 = pcall(function()
            if u198.find({
                'Dragon [Lv. 5000]',
            }) then
                u198.attack({
                    'Dragon [Lv. 5000]',
                }, u376)
            elseif getPlayerMaterial("Dragon's Orb") <= 0 or not _G.Settings.Auto_Spawn_Kaido then
                if u198.find({
                    'Elite Skeleton [Lv. 3100]',
                }) then
                    u198.attack({
                        'Elite Skeleton [Lv. 3100]',
                    }, u376)
                else
                    tp({
                        Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, -50, 0),
                    })
                end
            else
                toQuest(workspace.AllNPC:FindFirstChild('SummonDragon').CFrame, 'SummonDragon')
            end
        end)

        if not v377 then
            warn(v378, ': ' .. u376)
        end
    end
end
function u295.Auto_Expert_Swordman1()
    local u379 = 'Auto_Expert_Swordman1'

    while _G.Settings[u379] and task.wait() do
        local v380, v381 = pcall(function()
            if u198.find({
                'Expert Swordman [Lv. 3000]',
            }) then
                u198.attack({
                    'Expert Swordman [Lv. 3000]',
                }, u379)
            end
        end)

        if not v380 then
            warn(v381, ': ' .. u379)
        end
    end
end
function u295.auto_bushido()
    local u382 = 'auto_bushido'

    while _G.Settings[u382] and task.wait() do
        local v383, v384 = pcall(function()
            if u198.find({
                'Bushido Ape [Lv. 5000]',
            }) then
                u198.attack({
                    'Bushido Ape [Lv. 5000]',
                }, u382)
            end
        end)

        if not v383 then
            warn(v384, ': ' .. u382)
        end
    end
end
function u295.auto_lordsaber()
    local u385 = 'auto_lordsaber'

    while _G.Settings[u385] and task.wait() do
        local v386, v387 = pcall(function()
            if u198.find({
                'Lord of Saber [Lv. 8500]',
            }) then
                u198.attack({
                    'Lord of Saber [Lv. 8500]',
                }, u385)
            end
        end)

        if not v386 then
            warn(v387, ': ' .. u385)
        end
    end
end
function u295.auto_jacko()
    local u388 = 'auto_jacko'

    while _G.Settings[u388] and task.wait() do
        local v390, v391 = pcall(function()
            if u198.find({
                'Jack o lantern [Lv. 10000]',
            }) then
                u198.attack({
                    'Jack o lantern [Lv. 10000]',
                }, u388)
            else
                local v389 = (getPlayerMaterial('Candy') > 50 and _G.Settings.auto_jackoo and true or false) and workspace.AllNPC:FindFirstChild('SummonJackolantern')

                if v389 then
                    toQuest(v389.CFrame, 'SummonJackolantern')
                end
            end
        end)

        if not v390 then
            warn(v391, ': ' .. u388)
        end
    end
end
function u295.auto_skull()
    local u392 = 'auto_skull'

    while _G.Settings[u392] and task.wait() do
        local v393, v394 = pcall(function()
            if u198.find({
                'Skull King',
            }) then
                u198.attack({
                    'Skull King',
                }, u392)
            end
        end)

        if not v393 then
            warn(v394, ': ' .. u392)
        end
    end
end
function u295.auto_farm_candy()
    local u395 = 'auto_farm_candy'

    while _G.Settings[u395] and task.wait() do
        local v396, v397 = pcall(function()
            if Sea1 then
                if u198.find({
                    'Zombie [Lv. 1500]',
                }) then
                    u198.attack({
                        'Zombie [Lv. 1500]',
                    }, u395)
                end
            elseif Sea2 then
                if u198.find({
                    'Elite Skeleton [Lv. 3100]',
                }) then
                    u198.attack({
                        'Elite Skeleton [Lv. 3100]',
                    }, u395)
                elseif u198.find({
                    'Skull Pirate [Lv. 3050]',
                }) then
                    u198.attack({
                        'Skull Pirate [Lv. 3050]',
                    }, u395)
                else
                    tp({
                        Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, -50, 0),
                    })
                end
            elseif Sea3 and u198.find({
                'Wilderness Gorilla [Lv. 4325]',
            }) then
                u198.attack({
                    'Wilderness Gorilla [Lv. 4325]',
                }, u395)
            end
        end)

        if not v396 then
            warn(v397, ': ' .. u395)
        end
    end
end
function u295.auto_third_event()
    funcx = 'auto_third_event'

    local v398 = {
        {
            name = 'SeaDragon',
        },
        {
            name = 'ThirdSeaEldritch Crab',
        },
        {
            name = 'ThirdSeaDragon',
        },
        {
            name = 'FuryTentacle',
        },
    }

    while _G.Settings[funcx] and task.wait(1) do
        local v399, v400, v401 = ipairs(v398)

        while true do
            local u402

            v401, u402 = v399(v400, v401)

            if v401 == nil then
                break
            end
            if _G.Settings[u402.name] then
                local v403, v404 = pcall(function()
                    u198.attack({
                        u402.name,
                    }, funcx)
                end)

                if not v403 then
                    warn('Error in ' .. funcx .. ': ' .. v404)
                end
            end
        end
    end
end
function u295.goriila()
    local u405 = 'goriila'

    while _G.Settings[u405] and task.wait() do
        local v406, v407 = pcall(function()
            if u198.find({
                'Jungle Gorilla [Lv. 4300]',
            }) then
                u198.attack({
                    'Jungle Gorilla [Lv. 4300]',
                }, u405)
            end
        end)

        if not v406 then
            warn(v407, ': ' .. u405)
        end
    end
end
function u295.Auto_Kill_BigMom()
    local u408 = 'Auto_Kill_BigMom'

    while _G.Settings[u408] and task.wait() do
        local v409, v410 = pcall(function()
            if u198.find({
                'Ms. Mother [Lv. 7500]',
            }) then
                u198.attack({
                    'Ms. Mother [Lv. 7500]',
                }, u408)
            else
                tp(CFrame.new(-343, 177, 9087))
            end
        end)

        if not v409 then
            warn(v410, ': ' .. u408)
        end
    end
end
function u295.King_Samurai()
    local u411 = 'King_Samurai'

    while _G.Settings[u411] and task.wait() do
        local v412, v413 = pcall(function()
            if u198.find({
                'King Samurai [Lv. 3500]',
            }) then
                u198.attack({
                    'King Samurai [Lv. 3500]',
                }, u411)
            end
        end)

        if not v412 then
            warn(v413, ': ' .. u411)
        end
    end
end
function u295.auto_quake()
    local u414 = 'auto_quake'

    while _G.Settings[u414] and task.wait() do
        local v415, v416 = pcall(function()
            if u198.find({
                'Quake Woman [Lv. 1925]',
            }) then
                u198.attack({
                    'Quake Woman [Lv. 1925]',
                }, u414)
            end
        end)

        if not v415 then
            warn(v416, ': ' .. u414)
        end
    end
end
function u295.AUTOOBSERVE2()
    local u417 = 'AUTOOBSERVE2'

    while _G.Settings[u417] and task.wait() do
        local v418, v419 = pcall(function()
            toQuest(workspace.AllNPC:FindFirstChild('Stranger Uncle').CFrame, 'Stranger Uncle')

            if u198.find({
                'LeePung [Lv. 5000]',
            }) then
                u198.attack({
                    'LeePung [Lv. 5000]',
                }, u417)
            else
                toQuest(workspace.AllNPC:FindFirstChild('Stranger Uncle').CFrame, 'Stranger Uncle')
            end

            toQuest(workspace.AllNPC:FindFirstChild('Stranger Uncle').CFrame, 'Stranger Uncle')
        end)

        if not v418 then
            warn(v419, ': ' .. u417)
        end
    end
end

local u420 = {
    ['Jack o lantern [Lv. 10000]'] = 'Jack o lantern',
    ['King Samurai [Lv. 3500]'] = 'King Samurai',
    ['Dragon [Lv. 5000]'] = 'Dragon',
    ['Ms. Mother [Lv. 7500]'] = 'Ms. Mother',
    ['Lord of Saber [Lv. 8500]'] = 'Lord of Saber',
    ['Bushido Ape [Lv. 5000]'] = 'Bushido Ape',
}

local function u422(p421)
    return u420[p421] or p421
end

function u295.auto_hop_boss()
    local u423 = 'auto_hop_boss'

    while true do
        if not _G.Settings[u423] then
            print('Auto-hop disabled. Stopping the function.')

            break
        end

        local v431, v432 = pcall(function()
            local v424 = _G.Settings.selectbosss or {}
            local v425, v426, v427 = pairs(v424)
            local v428 = false

            while true do
                local v429

                v427, v429 = v425(v426, v427)

                if v427 == nil then
                    break
                end
                if u198.find({v429}) then
                    local v430 = u422(v429)

                    print('Entity found: ' .. v430 .. '. Stopping auto-hop.')

                    _G.Settings[u423] = false
                    v428 = true

                    break
                end
            end

            if not v428 then
                print('No selected entities found. Waiting ' .. _G.Settings.HopDelay .. ' seconds before hopping...')
                task.wait(_G.Settings.HopDelay)
                HopServer()
            end
        end)

        if not v431 then
            warn(v432, ': ' .. u423)
        end
        if not _G.Settings[u423] then
            break
        end
    end
end

local u433 = {
    FuryTentacle = 'Chaos Kraken',
    ['ThirdSeaEldritch Crab'] = 'Deepsea Crusher',
    ThirdSeaDragon = 'Drakenfyr the Inferno King',
    SeaDragon = 'Abyssal Tyrant',
    ['Skull King'] = 'Skull King',
    ['Ghost Ship'] = 'Ghost Ship',
    HydraSeaKing = 'Hydra Sea King',
    SeaKing = 'Sea King',
}

local function u435(p434)
    return u433[p434] or p434
end

function u295.auto_hop()
    local u436 = 'auto_hop'

    while wait() do
        if not _G.Settings[u436] then
            print('Auto-hop disabled. Stopping the function.')

            break
        end

        local v444, v445 = pcall(function()
            local v437 = _G.Settings.SelectedEntities or {}
            local v438, v439, v440 = pairs(v437)
            local v441 = false

            while true do
                local v442

                v440, v442 = v438(v439, v440)

                if v440 == nil then
                    break
                end
                if u198.find({v442}) then
                    local v443 = u435(v442)

                    print('Entity found: ' .. v443 .. '. Stopping auto-hop.')

                    _G.Settings[u436] = false
                    v441 = true

                    break
                end
            end

            if not v441 then
                HopServer()
            end
        end)

        if not v444 then
            warn(v445, ': ' .. u436)
        end
        if not _G.Settings[u436] then
            break
        end
    end
end
function u295.auto_hakiv2()
    local u446 = 'auto_hakiv2'

    while _G.Settings[u446] and task.wait() do
        local v447, v448 = pcall(function()
            if u198.find({
                'Dark Beard [Lv. 3475]',
            }) then
                u198.attack({
                    'Dark Beard [Lv. 3475]',
                }, u446)
            elseif getPlayerMaterial("Dark Beard's Totem") <= 0 then
                if u198.find({
                    'Sally [Lv. 3450]',
                }) then
                    u198.attack({
                        'Sally [Lv. 3450]',
                    }, u446)
                else
                    toQuest(workspace.AllNPC:FindFirstChild('Lee').CFrame, 'Lee')
                    wait(5)
                    toQuest(workspace.AllNPC:FindFirstChild('Pung').CFrame, 'Pung')
                    wait(5)

                    if getPlayerMaterial("Dark Beard's Totem") <= 0 and u198.find({
                        'Sally [Lv. 3450]',
                    }) then
                        u198.attack({
                            'Sally [Lv. 3450]',
                        }, u446)
                    end
                    if getPlayerMaterial("Dark Beard's Totem") > 0 then
                        game:GetService('ReplicatedStorage'):WaitForChild('Chest'):WaitForChild('Remotes'):WaitForChild('Functions'):WaitForChild('EtcFunction'):InvokeServer(unpack(args))
                    end
                end
            else
                game:GetService('ReplicatedStorage'):WaitForChild('Chest'):WaitForChild('Remotes'):WaitForChild('Functions'):WaitForChild('EtcFunction'):InvokeServer(unpack({
                    'QuestSpawnBoss',
                    {
                        SuccessQuest = 'Quest Accepted.',
                        BossName = 'Dark Beard [Lv. 3475]',
                        LevelNeed = 3475,
                        QuestName = 'Kill 1 Dark Beard',
                        MaterialNeed = "Dark Beard's Totem",
                        AI_Name = 'Dark Beard',
                        LevelLow = 'You must be Level 3,475 to accept this quest.',
                    },
                }))
            end
        end)

        if not v447 then
            warn(v448, ': ' .. u446)
        end
    end
end
function MaterialMon()
    if SelectMaterial ~= 'Rusted Scrap' then
        if SelectMaterial ~= 'Iron Ingot' then
            if SelectMaterial ~= 'Leather' then
                if SelectMaterial ~= "Angellic's Feather" then
                    if SelectMaterial ~= 'Carrot' then
                        if SelectMaterial ~= 'Gun Powder' then
                            if SelectMaterial ~= 'Fresh Fish' then
                                if SelectMaterial ~= 'Undead Ooze' then
                                    if SelectMaterial ~= 'Shark Canine' then
                                        if SelectMaterial ~= 'Bread Crumps' then
                                            if SelectMaterial ~= 'Pile of Bones' then
                                                if SelectMaterial ~= "Thief's Rag" then
                                                    if SelectMaterial ~= 'Dragon Orb' then
                                                        if SelectMaterial ~= "Lucidu's Totem" then
                                                            if SelectMaterial ~= 'Dark Beard Totem' then
                                                                if SelectMaterial ~= 'Magma Crystal' then
                                                                    if SelectMaterial ~= 'Ice Crystals' then
                                                                        if SelectMaterial ~= 'Samurai Bandage' then
                                                                            if SelectMaterial ~= 'Lost Ruby' then
                                                                                if SelectMaterial ~= 'Essence of Fire' then
                                                                                    if SelectMaterial ~= 'Twilight Orb' then
                                                                                        if SelectMaterial ~= 'Vital Fluid' then
                                                                                            if SelectMaterial ~= 'Coral and Pearl' then
                                                                                                if SelectMaterial ~= 'Shark Fin' then
                                                                                                    if SelectMaterial == 'Diverse Sphere' then
                                                                                                        MMon = 'Gazelle Man [Lv. 2350]'
                                                                                                    end
                                                                                                else
                                                                                                    MMon = 'Fishman Guardian [Lv. 4150]'
                                                                                                end
                                                                                            else
                                                                                                MMon = 'Fugitive [Lv. 4050]'
                                                                                            end
                                                                                        else
                                                                                            MMon = 'Shadow Master [Lv. 1650]'
                                                                                        end
                                                                                    else
                                                                                        MMon = 'Shadow Master [Lv. 1600]'
                                                                                    end
                                                                                else
                                                                                    MMon = 'Flame User [Lv. 3200]'
                                                                                end
                                                                            else
                                                                                MMon = 'Anubis [Lv. 3150]'
                                                                            end
                                                                        else
                                                                            MMon = 'Kitsune Samurai [Lv. 2650]'
                                                                        end
                                                                    else
                                                                        MMon = 'Azlan [Lv. 3300]'
                                                                    end
                                                                else
                                                                    MMon = 'The Volcano [Lv. 3325]'
                                                                end
                                                            else
                                                                MMon = 'Dark Beard Servant [Lv. 3400]'
                                                            end
                                                        else
                                                            MMon = 'Vice Admiral [Lv. 3500]'
                                                        end
                                                    else
                                                        MMon = 'Elite Skeleton [Lv. 3100]'
                                                    end
                                                else
                                                    MMon = 'Desert Thief [Lv. 3125]'
                                                end
                                            else
                                                MMon = 'Skull Pirate [Lv. 3050]'
                                            end
                                        else
                                            MMon = 'Chess Soldier [Lv. 3200]'
                                        end
                                    else
                                        MMon = 'Seasoned Fishman [Lv. 2200]'
                                    end
                                elseif Sea1 then
                                    MMon = 'Zombie [Lv. 1500]'
                                elseif Sea2 then
                                    MMon = 'Sally [Lv. 3450]'
                                end
                            else
                                MMon = 'Karate Fishman [Lv. 200]'
                            end
                        elseif Sea1 then
                            MMon = 'Ball Man [Lv. 850]'
                        elseif Sea2 then
                            MMon = 'Lomeo [Lv. 3675]'
                        end
                    else
                        MMon = 'Beast Swordman [Lv. 2300]'
                    end
                else
                    MMon = 'Sky Soldier [Lv. 800]'
                end
            elseif Sea1 then
                MMon = 'Commander [Lv. 100]'
            elseif Sea2 then
                MMon = 'Duke [Lv. 2550]'
            end
        else
            MMon = 'Beast Pirate [Lv. 2250]'
        end
    elseif Sea1 then
        MMon = 'Elite Soldier [Lv. 1000]'
    elseif Sea2 then
        MMon = 'Beast Swordman [Lv. 2300]'
    end
end

if Sea1 then
    MonsterList = {
        'Soldier [Lv. 1]',
        'Clown Pirate [Lv. 10]',
        'Smoky [Lv. 20]',
        'Tashi [Lv. 30]',
        'Clown Swordman [Lv. 50]',
        'The Clown [Lv. 75]',
        'Commander [Lv. 100]',
        'Captain [Lv. 120]',
        'The Barbaric [Lv. 145]',
        'Fighter Fishman [Lv. 180]',
        'Karate Fishman [Lv. 200]',
        'Shark Man [Lv. 230]',
        'Trainer Chef [Lv. 250]',
        'Dark Leg [Lv. 300]',
        'Dory [Lv. 350]',
        'Snow Soldier [Lv. 400]',
        'King Snow [Lv. 450]',
        'Little Dear [Lv. 500]',
        'Candle Man [Lv. 525]',
        'Bomb Man [Lv. 625]',
        'King of Sand [Lv. 725]',
        'Sky Soldier [Lv. 800]',
        'Ball Man [Lv. 850]',
        'Rumble Man [Lv. 900]',
        'Elite Soldier [Lv. 1000]',
        'Leader [Lv. 1100]',
        'Pasta [Lv. 1150]',
        'Wolf [Lv. 1250]',
        'Giraffe [Lv. 1325]',
        'Leo [Lv. 1400]',
        'Zombie [Lv. 1500]',
        'Shadow Master [Lv. 1600]',
        'New World Pirate [Lv. 1700]',
        'Rear Admiral [Lv. 1800]',
        'True Karate Fishman [Lv. 1850]',
        'Quake Woman [Lv. 1925]',
        'Fishman [Lv. 2000]',
        'Combat Fishman [Lv. 2050]',
        'Sword Fishman [Lv. 2100]',
        'Soldier Fishman [Lv. 2150]',
        'Seasoned Fishman [Lv. 2200]',
    }
elseif Sea2 then
    MonsterList = {
        'Beast Pirate [Lv. 2250]',
        'Beast Swordman [Lv. 2300]',
        'Gazelle Man [Lv. 2350]',
        'Bandit Beast Pirate [Lv. 2400]',
        'Powerful Beast Pirate [Lv. 2450]',
        'Violet Samurai [Lv. 2500]',
        'Duke [Lv. 2550]',
        'Magician [Lv. 2600]',
        'Kitsune Samurai [Lv. 2650]',
        'Elite Beast Pirate [Lv. 2700]',
        'Bear Man [Lv. 2750]',
        'Bean [Lv. 2800]',
        'Meji [Lv. 2850]',
        'Pachy Woman [Lv. 2950]',
        'Kappa [Lv. 2950]',
        'Joey [Lv. 3000]',
        'Skull Pirate [Lv. 3050]',
        'Elite Skeleton [Lv. 3100]',
        'Desert Thief [Lv. 3125]',
        'Anubis [Lv. 3150]',
        'Pharaoh [Lv. 3175]',
        'Flame User [Lv. 3200]',
        'Chess Soldier [Lv. 3200]',
        'Sunken Vessel [Lv. 3225]',
        'Biscuit Man [Lv. 3250]',
        'Azlan [Lv. 3300]',
        'The Volcano [Lv. 3325]',
        'Dark Beard Servant [Lv. 3400]',
        'Supreme Swordman [Lv. 3425]',
        'Sally [Lv. 3450]',
        'Vice Admiral [Lv. 3500]',
        'Pondere [Lv. 3525]',
        'Hefty [Lv. 3550]',
        'Lucidus [Lv. 3575]',
        'Fiore Gladiator [Lv. 3600]',
        'Fiore Fighter [Lv. 3625]',
        'Fiore Pirate [Lv. 3650]',
        'Lomeo [Lv. 3675]',
        'Prince Aria [Lv. 3700]',
        'Devastate [Lv. 3725]',
        'Physicus [Lv. 3750]',
        'Floffy [Lv. 3775]',
        'Dead Troupe [Lv. 3800]',
        'Dead Troupe Captain [Lv. 3850]',
        'Ryu [Lv. 3975]',
    }
elseif Sea3 then
    MonsterList = {
        'Fugitive [Lv. 4050]',
        'Fishman Guardian [Lv. 4150]',
    }
end

local v449 = Sea1 and {
    'Rusted Scrap',
    'Leather',
    "Angellic's Feather",
    'Gun Powder',
    'Fresh Fish',
    'Undead Ooze',
    'Shark Canine',
} or (Sea2 and {
    'Rusted Scrap',
    'Leather',
    'Iron Ingot',
    'Carrot',
    'Mystic Droplet',
    'Gun Powder',
    'Bread Crumps',
    'Undead Ooze',
    'Pile of Bones',
    "Thief's Rag",
    'Dragon Orb',
    "Lucidu's Totem",
    'Dark Beard Totem',
    'Ice Crystals',
    'Magma Crystal',
    'Samurai Bandage',
    'Lost Ruby',
    'Essence of Fire',
    'Twilight Orb',
    'Vital Fluid',
    'Phoenix Tear',
    'Diverse Sphere',
} or (Sea3 and {
    'Coral and Pearl',
    'Shark Fin',
} or nil))
local v450 = {
    'Gazelle Man [Lv. 2350]',
    'Violet Samurai [Lv. 2500]',
    'Duke [Lv. 2550]',
    'Magician [Lv. 2600]',
    'Kitsune Samurai [Lv. 2650]',
    'Bear Man [Lv. 2750]',
    'Bean [Lv. 2800]',
    'Meji [Lv. 2850]',
    'Petra [Lv. 2900]',
    'Kappa [Lv. 2950]',
    'Joey [Lv. 3000]',
    'Elite Skeleton [Lv. 3100]',
    'Desert Thief [Lv. 3125]',
    'Anubis [Lv. 3150]',
    'Pharaoh [Lv. 3175]',
    'Flame User [Lv. 3200]',
    'Sunken Vessel [Lv. 3225]',
    'Biscuit Man [Lv. 3250]',
    'Dough Master [Lv. 3275]',
    'Supreme Swordman [Lv. 3425]',
    'Sally [Lv. 3450]',
    'Pondere [Lv. 3525]',
    'Hefty [Lv. 3550]',
    'Lomeo [Lv. 3675]',
    'Prince Aria [Lv. 3700]',
    'Devastate [Lv. 3725]',
    'Physicus [Lv. 3750]',
    'Floffy [Lv. 3775]',
    'Ryu [Lv. 3975]',
}
local v451 = {
    'Fugitive [Lv. 4050]',
    'The deep one [Lv. 4200]',
    "Fishman King's Guard [Lv. 4250]",
    'Cyborg Gorilla [Lv. 4375]',
    'Ripcurrent Raider [Lv. 4400]',
    'Tidal Warrior [Lv. 4450]',
    'Ocean Gladiator [Lv. 4500]',
    'Electro Abyss Warrior [Lv. 4600]',
    'Inferno Diver [Lv. 4650]',
    'Tempest Tidebreaker [Lv. 4700]',
    'Abyssal Swordman [Lv. 4750]',
}
local v452 = nil

if Sea1 then
    v451 = {
        'Smoky [Lv. 20]',
        'Tashi [Lv. 30]',
        'The Clown [Lv. 75]',
        'Captain [Lv. 120]',
        'The Barbaric [Lv. 145]',
        'Karate Fishman [Lv. 200]',
        'Shark Man [Lv. 230]',
        'Dark Leg [Lv. 300]',
        'Dory [Lv. 350]',
        'King Snow [Lv. 450]',
        'Little Dear [Lv. 500]',
        'Candle Man [Lv. 525]',
        'Bomb Man [Lv. 625]',
        'King of Sand [Lv. 725]',
        'Ball Man [Lv. 850]',
        'Rumble Man [Lv. 950]',
        'Leader [Lv. 1100]',
        'Pasta [Lv. 1150]',
        'Wolf [Lv. 1250]',
        'Giraffe [Lv. 1300]',
        'Leo [Lv. 1450]',
        'Shadow Master [Lv. 1650]',
        'True Karate Fishman [Lv. 1850]',
        'Quake Woman [Lv. 1925]',
        'Combat Fishman [Lv. 2050]',
        'Sword Fishman [Lv. 2100]',
        'Seasoned Fishman [Lv. 2200]',
    }
elseif Sea2 then
    v451 = v450
elseif not Sea3 then
    v451 = v452
end

local v453, v454, v455 = pairs(game:GetService('Workspace').Areas:GetChildren())
local u456 = u97
local v457 = u422
local v458 = u435
local u459 = u198
local v460 = {}

while true do
    local v461

    v455, v461 = v453(v454, v455)

    if v455 == nil then
        break
    end
    if v461.Name ~= 'Sea of dust' then
        table.insert(v460, v461.Name)
    end
end

function u295.autofarmbosses()
    local v462 = 'autofarmbosses'

    while _G.Settings[v462] and task.wait() do
        if u459.find({selectedBoss}) then
            u459.attack({selectedBoss}, v462)
        end
    end
end
function u295.AutoFarmMaterial()
    local v463 = 'AutoFarmMaterial'

    while _G.Settings[v463] and task.wait() do
        MaterialMon()

        if MMon and u459.find({MMon}) then
            u459.attack({MMon}, v463)
        end
    end
end
function getSpawn()
    task.spawn(function()
        while task.wait(1) do
            local v478, v479 = pcall(function()
                local _Backpack = game.Players.LocalPlayer.Backpack

                if _G.Settings.Select_Weapon == 'Melee' or (_G.Settings.Select_Weapon == 'Sword' or _G.Settings.Select_Weapon == 'Fruit Power') then
                    local v465 = _G.Settings.Select_Weapon == 'Melee' and 'Combat' or (_G.Settings.Select_Weapon == 'Sword' and 'Sword' or 'Fruit Power')
                    local v466, v467, v468 = pairs(_Backpack:GetChildren())

                    while true do
                        local v469

                        v468, v469 = v466(v467, v468)

                        if v468 == nil then
                            break
                        end
                        if v469.ClassName == 'Tool' and v469.ToolTip == v465 then
                            _G.Weapon = tostring(v469.Name)
                        end
                    end
                elseif _G.Settings.Select_Weapon ~= 'all In One' then
                    _G.Settings.Select_Weapon = 'Melee'
                else
                    local v470, v471, v472 = pairs(_Backpack:GetChildren())

                    while true do
                        local v473

                        v472, v473 = v470(v471, v472)

                        if v472 == nil then
                            break
                        end
                        if v473.ClassName == 'Tool' then
                            if v473.ToolTip ~= 'Sword' then
                                if v473.ToolTip ~= 'Combat' then
                                    if v473.ToolTip == 'Fruit Power' then
                                        myWeapon['Fruit Power'] = tostring(v473.Name)
                                    end
                                else
                                    myWeapon.Melee = tostring(v473.Name)
                                end
                            else
                                myWeapon.Sword = tostring(v473.Name)
                            end
                        end
                    end
                end

                local v474, v475, v476 = pairs(_Backpack:GetChildren())

                while true do
                    local v477

                    v476, v477 = v474(v475, v476)

                    if v476 == nil then
                        break
                    end
                    if v477.ClassName == 'Tool' and v477.ToolTip == 'Fruit Power' then
                        myWeapon.Fruit = tostring(v477.Name)
                    end
                end
            end)

            if not v478 then
                print('Error in getSpawn: ', v479)
            end
        end
    end)
end

local _PlaceId2 = game.PlaceId

if _PlaceId2 ~= 4520749081 then
    if _PlaceId2 ~= 6381829480 then
        if _PlaceId2 == 5931540094 then
            Colossuem = true
        end
    else
        Sea2 = true
    end
else
    Sea1 = true
end

local _ = game:GetService('Players').LocalPlayer

game:GetService('TextService')
game:GetService('TweenService')
game:GetService('UserInputService')
game:GetService('HttpService')
game:GetService('CoreGui')

local _LocalPlayer2 = game:GetService('Players').LocalPlayer

game:GetService('UserInputService')
game:GetService('TweenService')
game:GetService('RunService')

local v482 = _LocalPlayer2

_LocalPlayer2.GetMouse(v482)
game:GetService('VirtualInputManager')
game:GetService('VirtualUser')
game:GetService('HttpService')
game:GetService('Lighting')
game:GetService('ReplicatedStorage')
game:GetService('TeleportService')

local _ = game:GetService('StarterGui')

local function _()
    return _LocalPlayer2.Character or _LocalPlayer2.CharacterAdded:Wait()
end

local u483 = pairs
local u484 = ipairs
local _ = game:GetService('Players').LocalPlayer
local _TextService = game:GetService('TextService')
local _TweenService = game:GetService('TweenService')

game:GetService('UserInputService')
game:GetService('HttpService')
game:GetService('CoreGui')

local _LocalPlayer3 = game:GetService('Players').LocalPlayer
local _UserInputService = game:GetService('UserInputService')

game:GetService('TweenService')
game:GetService('RunService')

local v489 = _LocalPlayer3

_LocalPlayer3.GetMouse(v489)
game:GetService('VirtualInputManager')
game:GetService('VirtualUser')
game:GetService('HttpService')
game:GetService('Lighting')
game:GetService('ReplicatedStorage')
game:GetService('TeleportService')

local _ = game:GetService('StarterGui')

local function _()
    return _LocalPlayer3.Character or _LocalPlayer3.CharacterAdded:Wait()
end

local u490 = {
    Bind = Enum.KeyCode.RightControl,
}
local _UserInputService2 = game:GetService('UserInputService')
local u492 = {
    Config = {
        MainColor = Color3.fromRGB(128, 0, 128),
        DropColor = Color3.fromRGB(100, 0, 100),
        ['UI Size'] = UDim2.new(0.1, 400, 0.1, 250),
    },
    CoreGui = game:FindFirstChild('CoreGui') or game.Players.LocalPlayer.PlayerGui,
    Windows = {},
}
local u493 = protectgui or (syn and syn.protect_gui or function() end)

local function u496(p494)
    local _TextButton = Instance.new('TextButton')

    _TextButton.Size = UDim2.new(1, 0, 1, 0)
    _TextButton.BackgroundTransparency = 1
    _TextButton.TextTransparency = 1
    _TextButton.Text = ''
    _TextButton.Parent = p494
    _TextButton.ZIndex = 5000

    return _TextButton
end

function u492.GetTextSize(_, p497)
    return _TextService:GetTextSize(p497.Text, p497.TextSize, p497.Font, Vector2.new(math.huge, math.huge))
end

local function u502(p498)
    task.spawn(function()
        local u499 = 1
        local _UIListLayout = p498:WaitForChild('UIListLayout', 9999999)

        p498.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout.AbsoluteContentSize.Y + u499)

        local v501 = _UIListLayout

        _UIListLayout.GetPropertyChangedSignal(v501, 'AbsoluteContentSize'):Connect(function()
            p498.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout.AbsoluteContentSize.Y + u499)
        end)
    end)
end
local function u507(p503)
    task.spawn(function()
        local u504 = 1
        local _UIListLayout2 = p503:WaitForChild('UIListLayout', 9999999)

        p503.CanvasSize = UDim2.new(0, _UIListLayout2.AbsoluteContentSize.X + u504, 0, 0)

        local v506 = _UIListLayout2

        _UIListLayout2.GetPropertyChangedSignal(v506, 'AbsoluteContentSize'):Connect(function()
            p503.CanvasSize = UDim2.new(0, _UIListLayout2.AbsoluteContentSize.X + u504, 0, 0)
        end)
    end)
end

function u492.NewWindow(_, _, p508, p509)
    local u510 = p509 or '0'
    local u511 = {
        Toggle = Enum.KeyCode.LeftControl,
        Tabs = {},
        TabSelect = 1,
    }
    local _ScreenGui = Instance.new('ScreenGui')
    local _Frame = Instance.new('Frame')
    local _UICorner = Instance.new('UICorner')
    local _ImageLabel = Instance.new('ImageLabel')
    local _Frame2 = Instance.new('Frame')
    local _ImageLabel2 = Instance.new('ImageLabel')
    local _UICorner2 = Instance.new('UICorner')
    local _TextLabel = Instance.new('TextLabel')
    local _TextLabel2 = Instance.new('TextLabel')
    local _UIGradient = Instance.new('UIGradient')

    Instance.new('UIGradient')

    local _Frame3 = Instance.new('Frame')
    local _ScrollingFrame = Instance.new('ScrollingFrame')
    local _UIListLayout3 = Instance.new('UIListLayout')
    local _Frame4 = Instance.new('Frame')
    local _ImageLabel3 = Instance.new('ImageLabel')
    local _UICorner3 = Instance.new('UICorner')
    local _UICorner4 = Instance.new('UICorner')
    local _Frame5 = Instance.new('Frame')
    local _UICorner5 = Instance.new('UICorner')

    _ScreenGui.Name = 'Main'
    _ScreenGui.Parent = u492.CoreGui
    _ScreenGui.ResetOnSpawn = false
    _ScreenGui.IgnoreGuiInset = true
    _ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    u493(_ScreenGui)

    _Frame.Parent = _ScreenGui
    _Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    _Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _Frame.BackgroundTransparency = 0
    _Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame.BorderSizePixel = 0
    _Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    _Frame.Size = UDim2.fromScale(0, 0)
    _Frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
    _Frame.ClipsDescendants = true

    _TweenService:Create(_Frame, TweenInfo.new(1.5), {
        Size = u492.Config['UI Size'],
    }):Play()

    _UICorner.Parent = _Frame
    _ImageLabel.Name = 'DropShadow'
    _ImageLabel.Parent = _Frame
    _ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel.BackgroundTransparency = 1
    _ImageLabel.BorderSizePixel = 0
    _ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel.Size = UDim2.new(1, 47, 1, 47)
    _ImageLabel.ZIndex = 0
    _ImageLabel.Image = 'rbxassetid://6015897843'
    _ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel.ImageTransparency = 0.5
    _ImageLabel.ScaleType = Enum.ScaleType.Slice
    _ImageLabel.SliceCenter = Rect.new(49, 49, 450, 450)
    _ImageLabel.Rotation = 0.01
    _Frame2.Name = 'Topbar'
    _Frame2.Parent = _Frame
    _Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame2.BackgroundTransparency = 1
    _Frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame2.BorderSizePixel = 0
    _Frame2.Size = UDim2.new(1, 0, 0.09, 0)
    _Frame2.ZIndex = 2
    _Frame5.Parent = _Frame
    _Frame5.AnchorPoint = Vector2.new(0.5, 0.5)
    _Frame5.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    _Frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame5.BorderSizePixel = 0
    _Frame5.BackgroundTransparency = 0.5
    _Frame5.Position = UDim2.new(0.5, 0, 0.1, 0)
    _Frame5.Size = UDim2.new(0.95, 0, 0.005, 0)
    _Frame5.ZIndex = 5

    local _UIGradient2 = Instance.new('UIGradient')

    _UIGradient2.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(221, 160, 221)),
        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0)),
    })
    _UIGradient2.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.6, 0),
        NumberSequenceKeypoint.new(1, 0.5),
    })
    _UIGradient2.Parent = _Frame5
    _UICorner5.CornerRadius = UDim.new(0, 3)
    _UICorner5.Parent = _Frame5
    _ImageLabel2.Name = 'HubLogo'
    _ImageLabel2.Parent = _Frame2
    _ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel2.BackgroundTransparency = 1
    _ImageLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel2.BorderSizePixel = 0
    _ImageLabel2.Position = UDim2.new(0.0450000018, 0, 0.6, 0)
    _ImageLabel2.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
    _ImageLabel2.SizeConstraint = Enum.SizeConstraint.RelativeYY
    _ImageLabel2.ZIndex = 3
    _ImageLabel2.Image = u510
    _UICorner2.Parent = _ImageLabel2
    _TextLabel.Name = 'TextTitle'
    _TextLabel.Parent = _Frame2
    _TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.BackgroundTransparency = 1
    _TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _TextLabel.BorderSizePixel = 0
    _TextLabel.Position = UDim2.new(0.103366353, 0, 0.2099998972, 0)
    _TextLabel.Size = UDim2.new(0.896555603, 0, 0.433997005, 0)
    _TextLabel.ZIndex = 3
    _TextLabel.Font = Enum.Font.GothamBold
    _TextLabel.Text = "TSUO HUB<font color='rgb(128,0,128)'> KING LEGACY</font>"
    _TextLabel.RichText = true
    _TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.TextScaled = true
    _TextLabel.TextSize = 14
    _TextLabel.TextWrapped = true
    _TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel2.Name = 'TextDescription'
    _TextLabel2.Parent = _Frame2
    _TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel2.BackgroundTransparency = 1
    _TextLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _TextLabel2.BorderSizePixel = 0
    _TextLabel2.Position = UDim2.new(0.103366353, 0, 0.65399694, 0)
    _TextLabel2.Size = UDim2.new(0, 80, 0.300000012, 0)
    _TextLabel2.ZIndex = 3
    _TextLabel2.Font = Enum.Font.GothamBold
    _TextLabel2.Text = p508 or '...'
    _TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel2.TextScaled = false
    _TextLabel2.TextSize = 10
    _TextLabel2.TextWrapped = true
    _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left

    game:GetService('TweenService')

    local _ImageButton = Instance.new('ImageButton')

    _ImageButton.Name = 'Exit'
    _ImageButton.Parent = _Frame2
    _ImageButton.AnchorPoint = Vector2.new(1, 0)
    _ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageButton.BackgroundTransparency = 1
    _ImageButton.BorderSizePixel = 0
    _ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ImageButton.Position = UDim2.new(1, -8, 0, 10)
    _ImageButton.Size = UDim2.new(0, 20, 0, 20)
    _ImageButton.Image = 'rbxassetid://10747384394'

    local _ImageButton2 = Instance.new('ImageButton')

    _ImageButton2.Name = 'Minimize'
    _ImageButton2.Parent = _Frame2
    _ImageButton2.AnchorPoint = Vector2.new(1, 0)
    _ImageButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageButton2.BackgroundTransparency = 1
    _ImageButton2.BorderSizePixel = 0
    _ImageButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ImageButton2.Position = UDim2.new(1, -33, 0, 10)
    _ImageButton2.Size = UDim2.new(0, 20, 0, 20)
    _ImageButton2.Image = 'rbxassetid://10734896206'

    _ImageButton2.MouseButton1Click:Connect(function() end)
    _ImageButton.MouseButton1Click:Connect(function()
        _ScreenGui:Destroy()
        _Frame:Destroy()
        Frames:Destroy()
        Toggle:Destroy()
    end);
    (function()
        local v534 = u492:GetTextSize(_TextLabel2)

        _TweenService:Create(_TextLabel2, TweenInfo.new(0.5), {
            Size = UDim2.new(0, v534.X, 0.3, 0),
        }):Play()
    end)()

    _UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, u492.Config.MainColor),
        ColorSequenceKeypoint.new(1, u492.Config.DropColor),
    })
    _UIGradient.Parent = _TextLabel2
    _Frame3.Name = 'MenuFrames'
    _Frame3.Parent = _Frame
    _Frame3.AnchorPoint = Vector2.new(0.5, 0)
    _Frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame3.BackgroundTransparency = 1
    _Frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame3.BorderSizePixel = 0
    _Frame3.Position = UDim2.new(0.5, 0, 0.075000003, 0)
    _Frame3.Size = UDim2.new(0.949999988, 0, 0.0799999982, 0)
    _Frame3.ZIndex = 2
    _ScrollingFrame.Name = 'MenuScroll'
    _ScrollingFrame.Parent = _Frame3
    _ScrollingFrame.Active = true
    _ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ScrollingFrame.BackgroundTransparency = 1
    _ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ScrollingFrame.BorderSizePixel = 0
    _ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    _ScrollingFrame.ZIndex = 3
    _ScrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0)
    _ScrollingFrame.ScrollBarThickness = 0
    _ScrollingFrame.TopImage = ''

    u507(_ScrollingFrame)

    _UIListLayout3.Parent = _ScrollingFrame
    _UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
    _UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
    _UIListLayout3.VerticalAlignment = Enum.VerticalAlignment.Center
    _UIListLayout3.Padding = UDim.new(0, 8)
    _Frame4.Name = 'CloseUI'
    _Frame4.Parent = _Frame
    _Frame4.AnchorPoint = Vector2.new(0.5, 0.5)
    _Frame4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _Frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame4.BorderSizePixel = 0
    _Frame4.Position = UDim2.new(0.5, 0, 0.5, 0)
    _Frame4.Visible = false
    _Frame4.ZIndex = 45
    _Frame4.Size = UDim2.fromScale(1, 1)

    _TweenService:Create(_Frame4, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.fromScale(0, 0),
    }):Play()

    _ImageLabel3.Name = 'HubLogo'
    _ImageLabel3.Parent = _Frame4
    _ImageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel3.BackgroundTransparency = 1
    _ImageLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel3.BorderSizePixel = 0
    _ImageLabel3.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel3.Size = UDim2.new(0.25, 0, 0.25, 0)
    _ImageLabel3.SizeConstraint = Enum.SizeConstraint.RelativeYY
    _ImageLabel3.ZIndex = 55
    _ImageLabel3.Image = u510
    _UICorner3.Parent = _ImageLabel3
    _UICorner4.Parent = _Frame4

    local _UIStroke = Instance.new('UIStroke')

    _UIStroke.Color = Color3.fromRGB(37, 37, 37)
    _UIStroke.Parent = _Frame4

    local u536 = nil
    local u537 = 0.1
    local u538 = nil
    local u539 = nil
    local u540 = true
    local v541 = _Frame

    _Frame.GetPropertyChangedSignal(v541, 'Size'):Connect(function()
        if _Frame.Size.X.Scale > 0 then
            _Frame.Visible = true
        else
            _Frame.Visible = false
        end
    end)

    local v542 = _Frame4

    _Frame4.GetPropertyChangedSignal(v542, 'Size'):Connect(function()
        if _Frame4.Size.X.Scale > 0 then
            _Frame4.Visible = true
        else
            _Frame4.Visible = false
        end
    end)

    local function u544(p543)
        if p543 then
            _TweenService:Create(_Frame, TweenInfo.new(0.5), {
                Size = u492.Config['UI Size'],
            }):Play()
            _TweenService:Create(_Frame4, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(0, 0),
            }):Play()
        else
            _TweenService:Create(_Frame, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(0, 0),
            }):Play()
            _TweenService:Create(_Frame4, TweenInfo.new(0.5), {
                Size = UDim2.fromScale(1, 1),
            }):Play()
        end
    end

    task.spawn(function()
        local _ScreenGui2 = Instance.new('ScreenGui')
        local _Frame6 = Instance.new('Frame')
        local _UICorner6 = Instance.new('UICorner')
        local _UIStroke2 = Instance.new('UIStroke')
        local _ImageLabel4 = Instance.new('ImageLabel')
        local _ImageLabel5 = Instance.new('ImageLabel')

        _ScreenGui2.Name = 'Toggle'
        _ScreenGui2.Parent = u492.CoreGui or game.Players.LocalPlayer:WaitForChild('PlayerGui')
        _ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Global
        _Frame6.Name = 'c4'
        _Frame6.Parent = _ScreenGui2
        _Frame6.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame6.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        _Frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        _Frame6.BorderSizePixel = 0
        _Frame6.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
        _Frame6.Size = UDim2.new(0, 65, 0, 65)
        _Frame6.SizeConstraint = Enum.SizeConstraint.RelativeYY
        _Frame6.ZIndex = 67
        _UICorner6.Parent = _Frame6
        _UIStroke2.Color = Color3.fromRGB(121, 121, 121)
        _UIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        _UIStroke2.Parent = _Frame6
        _ImageLabel4.Name = 'logo'
        _ImageLabel4.Parent = _Frame6
        _ImageLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
        _ImageLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _ImageLabel4.BackgroundTransparency = 1.01
        _ImageLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        _ImageLabel4.BorderSizePixel = 0
        _ImageLabel4.Position = UDim2.new(0.5, 0, 0.5, 0)
        _ImageLabel4.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
        _ImageLabel4.ZIndex = 68
        _ImageLabel4.Image = u510
        _ImageLabel5.Name = 'DropShadow'
        _ImageLabel5.Parent = _Frame6
        _ImageLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
        _ImageLabel5.BackgroundTransparency = 1
        _ImageLabel5.BorderSizePixel = 0
        _ImageLabel5.Position = UDim2.new(0.5, 0, 0.5, 0)
        _ImageLabel5.Size = UDim2.new(1, 47, 1, 47)
        _ImageLabel5.ZIndex = 66
        _ImageLabel5.Image = 'rbxassetid://6015897843'
        _ImageLabel5.ImageColor3 = Color3.fromRGB(0, 0, 0)
        _ImageLabel5.ImageTransparency = 0.5
        _ImageLabel5.ScaleType = Enum.ScaleType.Slice
        _ImageLabel5.SliceCenter = Rect.new(49, 49, 450, 450)

        local u551 = false
        local u552 = nil
        local u553 = nil
        local _Position2 = _Frame6.Position

        local function u558(p555)
            local v556 = p555.Position - u552
            local v557 = UDim2.new(u553.X.Scale, u553.X.Offset + v556.X, u553.Y.Scale, u553.Y.Offset + v556.Y)

            game:GetService('TweenService'):Create(_Frame6, TweenInfo.new(u537), {Position = v557}):Play()
        end

        local v559 = u496(_Frame6)

        v559.ZIndex = 68

        v559.MouseButton1Click:Connect(function()
            if _Position2 == _Frame6.Position then
                u540 = not u540

                u544(u540)
            end
        end)
        v559.InputBegan:Connect(function(p560)
            if p560.UserInputType == Enum.UserInputType.MouseButton1 or p560.UserInputType == Enum.UserInputType.Touch then
                u551 = true
                u552 = p560.Position
                u553 = _Frame6.Position
                _Position2 = _Frame6.Position

                p560.Changed:Connect(function()
                    if p560.UserInputState == Enum.UserInputState.End then
                        u551 = false
                    end
                end)
            end
        end)
        _UserInputService2.InputChanged:Connect(function(p561)
            if (p561.UserInputType == Enum.UserInputType.MouseMovement or p561.UserInputType == Enum.UserInputType.Touch) and u551 then
                u558(p561)
            end
        end)
    end)
    _UserInputService.InputBegan:Connect(function(p562, _)
        if p562.KeyCode == u490.Bind then
            if uitoggled ~= false then
                _Frame:TweenSize(UDim2.new(0.100000001, 410, 0.100000001, 240), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)

                _ScreenGui.Enabled = true
                uitoggled = false
            else
                _Frame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)

                uitoggled = true

                task.wait(0.5)

                _ScreenGui.Enabled = false
            end
        end
    end)

    local function u566(p563)
        local v564 = p563.Position - u538
        local v565 = UDim2.new(u539.X.Scale, u539.X.Offset + v564.X, u539.Y.Scale, u539.Y.Offset + v564.Y)

        game:GetService('TweenService'):Create(_Frame, TweenInfo.new(u537), {Position = v565}):Play()
    end

    _Frame2.InputBegan:Connect(function(p567)
        if p567.UserInputType == Enum.UserInputType.MouseButton1 or p567.UserInputType == Enum.UserInputType.Touch then
            u536 = true
            u538 = p567.Position
            u539 = _Frame.Position

            p567.Changed:Connect(function()
                if p567.UserInputState == Enum.UserInputState.End then
                    u536 = false
                end
            end)
        end
    end)
    _UserInputService2.InputChanged:Connect(function(p568)
        if (p568.UserInputType == Enum.UserInputType.MouseMovement or p568.UserInputType == Enum.UserInputType.Touch) and u536 then
            u566(p568)
        end
    end)
    _UserInputService2.InputBegan:Connect(function(p569, p570)
        if not p570 then
            if p569.KeyCode == u511.Toggle then
                u540 = not u540

                u544(u540)
            end
        end
    end)

    function u511.AddMenu(_, p571, p572, p573, p574)
        local u575 = p574 or 'tab'
        local u576 = {Checker = {}}
        local _Frame7 = Instance.new('Frame')
        local _UIAspectRatioConstraint = Instance.new('UIAspectRatioConstraint')
        local _UICorner7 = Instance.new('UICorner')
        local _ImageLabel6 = Instance.new('ImageLabel')
        local _TextLabel3 = Instance.new('TextLabel')
        local _TextLabel4 = Instance.new('TextLabel')
        local _TextButton2 = Instance.new('TextButton')

        _Frame7.Name = 'MenuButton'
        _Frame7.Parent = _ScrollingFrame
        _Frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _Frame7.BackgroundTransparency = 1
        _Frame7.BorderColor3 = Color3.fromRGB(0, 0, 0)
        _Frame7.BorderSizePixel = 0
        _Frame7.ClipsDescendants = false
        _Frame7.Size = UDim2.new(0.5, 0, 0.75, 0)
        _Frame7.ZIndex = 4
        _UIAspectRatioConstraint.Parent = _Frame7
        _UIAspectRatioConstraint.AspectRatio = 0.1
        _UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
        _UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height

        _TweenService:Create(_UIAspectRatioConstraint, TweenInfo.new(0.3 + #u511.Tabs / 10, Enum.EasingStyle.Back), {AspectRatio = 4}):Play()

        _UICorner7.CornerRadius = UDim.new(0, 3)
        _UICorner7.Parent = _Frame7
        _ImageLabel6.Name = 'MenuLogo'
        _ImageLabel6.Parent = _Frame7
        _ImageLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _ImageLabel6.BackgroundTransparency = 1
        _ImageLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        _ImageLabel6.BorderSizePixel = 0
        _ImageLabel6.Size = UDim2.new(1, 0, 1, 0)
        _ImageLabel6.SizeConstraint = Enum.SizeConstraint.RelativeYY
        _ImageLabel6.ZIndex = 5
        _ImageLabel6.Image = p573
        _TextLabel3.Name = 'MenuText'
        _TextLabel3.Parent = _Frame7
        _TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel3.BackgroundTransparency = 1
        _TextLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        _TextLabel3.BorderSizePixel = 0
        _TextLabel3.Position = UDim2.new(0.010877919, 0, 0.5, 0)
        _TextLabel3.Size = UDim2.new(2.10955262, 0, 0.5, 0)
        _TextLabel3.ZIndex = 5
        _TextLabel3.Font = Enum.Font.GothamBold
        _TextLabel3.Text = p571 or 'Menu'
        _TextLabel3.TextColor3 = Color3.fromRGB(100, 100, 15)
        _TextLabel3.TextTransparency = 0.8
        _TextLabel3.TextScaled = true
        _TextLabel3.TextSize = 14
        _TextLabel3.TextWrapped = true
        _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
        _TextLabel4.Name = 'MenuDesc'
        _TextLabel4.Parent = _Frame7
        _TextLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel4.BackgroundTransparency = 1
        _TextLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        _TextLabel4.BorderSizePixel = 0
        _TextLabel4.Position = UDim2.new(0.11100589, 0, 0.600000083, 0)
        _TextLabel4.Size = UDim2.new(2.10955262, 0, 0.349999547, 0)
        _TextLabel4.ZIndex = 5
        _TextLabel4.Font = Enum.Font.GothamBold
        _TextLabel4.Text = p572 or 'Description'
        _TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel4.TextScaled = true
        _TextLabel4.TextSize = 14
        _TextLabel4.TextTransparency = 0.8
        _TextLabel4.TextWrapped = true
        _TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
        _TextButton2.Name = 'Button'
        _TextButton2.Parent = _Frame7
        _TextButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton2.BackgroundTransparency = 1
        _TextButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        _TextButton2.BorderSizePixel = 0
        _TextButton2.Size = UDim2.new(1, 0, 1, 0)
        _TextButton2.ZIndex = 25
        _TextButton2.Font = Enum.Font.SourceSans
        _TextButton2.Text = ''
        _TextButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
        _TextButton2.TextSize = 14
        _TextButton2.TextTransparency = 1

        local u584 = nil

        if u575:find('tab') then
            u584 = Instance.new('Frame')

            local _Frame8 = Instance.new('Frame')
            local _Frame9 = Instance.new('Frame')
            local _UICorner8 = Instance.new('UICorner')
            local _UIStroke3 = Instance.new('UIStroke')
            local _TextLabel5 = Instance.new('TextLabel')
            local _ImageLabel7 = Instance.new('ImageLabel')
            local _UICorner9 = Instance.new('UICorner')
            local _TextBox = Instance.new('TextBox')
            local _Frame10 = Instance.new('Frame')
            local _Frame11 = Instance.new('Frame')
            local _ScrollingFrame2 = Instance.new('ScrollingFrame')
            local _UIListLayout4 = Instance.new('UIListLayout')
            local _Frame12 = Instance.new('Frame')

            u584.Name = 'PageFrames'
            u584.Parent = _Frame
            u584.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            u584.BackgroundTransparency = 1
            u584.BorderColor3 = Color3.fromRGB(0, 0, 0)
            u584.BorderSizePixel = 0
            u584.ClipsDescendants = true
            u584.Position = UDim2.new(0, 0, 0.163185388, 0)
            u584.Size = UDim2.new(1, 0, 0.836814642, 0)
            u584.ZIndex = 4
            _Frame8.Name = 'Search'
            _Frame8.Parent = u584
            _Frame8.AnchorPoint = Vector2.new(0.5, 0.5)
            _Frame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame8.BackgroundTransparency = 1
            _Frame8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame8.BorderSizePixel = 0
            _Frame8.ClipsDescendants = true
            _Frame8.Position = UDim2.new(0.187006071, 0, 0.5, 0)
            _Frame8.Size = UDim2.new(0.354012221, 0, 0.980000138, 0)
            _Frame8.ZIndex = 4
            _Frame9.Name = 'SearchEngine'
            _Frame9.Parent = _Frame8
            _Frame9.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            _Frame9.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame9.BorderSizePixel = 0
            _Frame9.ClipsDescendants = true
            _Frame9.Size = UDim2.new(1, 0, 0.0680000037, 0)
            _Frame9.ZIndex = 6
            _UICorner8.CornerRadius = UDim.new(0, 2)
            _UICorner8.Parent = _Frame9
            _UIStroke3.Thickness = 0.5
            _UIStroke3.Color = Color3.fromRGB(39, 39, 39)
            _UIStroke3.Parent = _Frame9
            _TextLabel5.Name = 'LabelText'
            _TextLabel5.Parent = _Frame9
            _TextLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
            _TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel5.BackgroundTransparency = 1
            _TextLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _TextLabel5.BorderSizePixel = 0
            _TextLabel5.Position = UDim2.new(0.612374663, 0, 0.499999851, 0)
            _TextLabel5.Size = UDim2.new(0.871346772, 0, 0.50000006, 0)
            _TextLabel5.ZIndex = 6
            _TextLabel5.Font = Enum.Font.GothamBold
            _TextLabel5.Text = 'Search'
            _TextLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel5.TextScaled = true
            _TextLabel5.TextSize = 14
            _TextLabel5.TextTransparency = 0.75
            _TextLabel5.TextWrapped = true
            _TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
            _ImageLabel7.Name = 'SearchIcon'
            _ImageLabel7.Parent = _Frame9
            _ImageLabel7.AnchorPoint = Vector2.new(0.5, 0.5)
            _ImageLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ImageLabel7.BackgroundTransparency = 1
            _ImageLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _ImageLabel7.BorderSizePixel = 0
            _ImageLabel7.Position = UDim2.new(0.075000003, 0, 0.5, 0)
            _ImageLabel7.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
            _ImageLabel7.SizeConstraint = Enum.SizeConstraint.RelativeYY
            _ImageLabel7.ZIndex = 6
            _ImageLabel7.Image = 'rbxassetid://7734052925'
            _ImageLabel7.ImageTransparency = 0.75
            _UICorner9.CornerRadius = UDim.new(0, 6)
            _UICorner9.Parent = _ImageLabel7
            _TextBox.Name = 'searchbox'
            _TextBox.Parent = _Frame9
            _TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
            _TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextBox.BackgroundTransparency = 1
            _TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _TextBox.BorderSizePixel = 0
            _TextBox.Position = UDim2.new(1.46321285, 0, 0.499999851, 0)
            _TextBox.Size = UDim2.new(2.66615963, 0, 0.50000006, 0)
            _TextBox.ZIndex = 7
            _TextBox.ClearTextOnFocus = false
            _TextBox.Font = Enum.Font.GothamBold
            _TextBox.Text = ''
            _TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextBox.TextScaled = true
            _TextBox.TextSize = 14
            _TextBox.TextWrapped = true
            _TextBox.TextXAlignment = Enum.TextXAlignment.Left
            _Frame10.Parent = _Frame8
            _Frame10.Active = true
            _Frame10.AnchorPoint = Vector2.new(0, 0.5)
            _Frame10.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
            _Frame10.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame10.BorderSizePixel = 0
            _Frame10.Position = UDim2.new(1.01999998, 0, 0.5, 0)
            _Frame10.Rotation = 0
            _Frame10.Size = UDim2.new(0.00499999989, 0, 1, 0)
            _Frame10.ZIndex = 3
            _Frame11.Parent = _Frame10
            _Frame11.Active = true
            _Frame11.AnchorPoint = Vector2.new(0, 0.5)
            _Frame11.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
            _Frame11.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame11.BorderSizePixel = 0
            _Frame11.Position = UDim2.new(1.00999999, 0, 0.5, 0)
            _Frame11.Size = UDim2.new(1, 0, 1, 0)
            _Frame11.ZIndex = 3
            _ScrollingFrame2.Name = 'TabFrames'
            _ScrollingFrame2.Parent = _Frame8
            _ScrollingFrame2.Active = true
            _ScrollingFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
            _ScrollingFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ScrollingFrame2.BackgroundTransparency = 1
            _ScrollingFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _ScrollingFrame2.BorderSizePixel = 0
            _ScrollingFrame2.ClipsDescendants = false
            _ScrollingFrame2.Position = UDim2.new(0.500000119, 0, 0.549316823, 0)
            _ScrollingFrame2.Size = UDim2.new(0.949999988, 0, 0.901000023, 0)
            _ScrollingFrame2.ZIndex = 6
            _ScrollingFrame2.ScrollBarThickness = 0

            u502(_ScrollingFrame2)

            _UIListLayout4.Parent = _ScrollingFrame2
            _UIListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Center
            _UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
            _UIListLayout4.Padding = UDim.new(0, 4)
            _Frame12.Name = 'Main'
            _Frame12.Parent = u584
            _Frame12.AnchorPoint = Vector2.new(0.5, 0.5)
            _Frame12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame12.BackgroundTransparency = 1
            _Frame12.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame12.BorderSizePixel = 0
            _Frame12.ClipsDescendants = true
            _Frame12.Position = UDim2.new(0.685165405, 0, 0.5, 0)
            _Frame12.Size = UDim2.new(0.609669089, 0, 0.980000019, 0)
            _Frame12.ZIndex = 4

            _TextBox.Focused:Connect(function()
                _TweenService:Create(_TextLabel5, TweenInfo.new(0.1), {TextTransparency = 1}):Play()
                _TweenService:Create(_ImageLabel7, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
            end)
            _TextBox.FocusLost:Connect(function()
                if #_TextBox.Text <= 0 then
                    _TweenService:Create(_TextLabel5, TweenInfo.new(0.1), {TextTransparency = 0.75}):Play()
                    _TweenService:Create(_ImageLabel7, TweenInfo.new(0.1), {ImageTransparency = 0.75}):Play()

                    local v598, v599, v600 = u484(_ScrollingFrame2:GetChildren())

                    while true do
                        local v601

                        v600, v601 = v598(v599, v600)

                        if v600 == nil then
                            break
                        end
                        if v601:IsA('Frame') then
                            v601.Visible = true
                        end
                    end
                else
                    local v602, v603, v604 = u484(_ScrollingFrame2:GetChildren())

                    while true do
                        local v605

                        v604, v605 = v602(v603, v604)

                        if v604 == nil then
                            break
                        end
                        if v605:IsA('Frame') then
                            if v605.Name:lower():find(_TextBox.Text:lower()) then
                                v605.Visible = true
                            else
                                v605.Visible = false
                            end
                        end
                    end
                end
            end)

            local v606 = _TextBox

            _TextBox.GetPropertyChangedSignal(v606, 'Text'):Connect(function()
                if #_TextBox.Text <= 0 then
                    _TweenService:Create(_TextLabel5, TweenInfo.new(0.1), {TextTransparency = 0.75}):Play()
                    _TweenService:Create(_ImageLabel7, TweenInfo.new(0.1), {ImageTransparency = 0.75}):Play()

                    local v607, v608, v609 = u484(_ScrollingFrame2:GetChildren())

                    while true do
                        local v610

                        v609, v610 = v607(v608, v609)

                        if v609 == nil then
                            break
                        end
                        if v610:IsA('Frame') then
                            v610.Visible = true
                        end
                    end
                else
                    _TweenService:Create(_TextLabel5, TweenInfo.new(0.1), {TextTransparency = 1}):Play()
                    _TweenService:Create(_ImageLabel7, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()

                    local v611, v612, v613 = u484(_ScrollingFrame2:GetChildren())

                    while true do
                        local v614

                        v613, v614 = v611(v612, v613)

                        if v613 == nil then
                            break
                        end
                        if v614:IsA('Frame') then
                            if v614.Name:lower():find(_TextBox.Text:lower()) then
                                v614.Visible = true
                            else
                                v614.Visible = false
                            end
                        end
                    end
                end
            end)
        elseif u575:find('change') then
            u584 = Instance.new('Frame')

            local _Frame13 = Instance.new('Frame')
            local _ScrollingFrame3 = Instance.new('ScrollingFrame')
            local _UIListLayout5 = Instance.new('UIListLayout')
            local _Frame14 = Instance.new('Frame')
            local _UICorner10 = Instance.new('UICorner')

            u502(_ScrollingFrame3)

            u584.Name = 'ChangeLog'
            u584.Parent = _Frame
            u584.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            u584.BackgroundTransparency = 1
            u584.BorderColor3 = Color3.fromRGB(0, 0, 0)
            u584.BorderSizePixel = 0
            u584.Position = UDim2.new(0, 0, 0.163185388, 0)
            u584.Size = UDim2.new(1, 0, 0.836814642, 0)
            u584.Visible = true
            u584.ZIndex = 4
            _Frame13.Name = 'Main'
            _Frame13.Parent = u584
            _Frame13.AnchorPoint = Vector2.new(0.5, 0.5)
            _Frame13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame13.BackgroundTransparency = 1
            _Frame13.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame13.BorderSizePixel = 0
            _Frame13.ClipsDescendants = true
            _Frame13.Position = UDim2.new(0.5, 0, 0.5, 0)
            _Frame13.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
            _Frame13.ZIndex = 4
            _ScrollingFrame3.Name = 'MainScrolling'
            _ScrollingFrame3.Parent = _Frame13
            _ScrollingFrame3.Active = true
            _ScrollingFrame3.AnchorPoint = Vector2.new(0.5, 0.5)
            _ScrollingFrame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ScrollingFrame3.BackgroundTransparency = 1
            _ScrollingFrame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _ScrollingFrame3.BorderSizePixel = 0
            _ScrollingFrame3.ClipsDescendants = false
            _ScrollingFrame3.Position = UDim2.new(0.5, 0, 0.5, 0)
            _ScrollingFrame3.Size = UDim2.new(0.99000001, 0, 1, 0)
            _ScrollingFrame3.ZIndex = 2
            _ScrollingFrame3.ScrollBarThickness = 0
            _UIListLayout5.Parent = _ScrollingFrame3
            _UIListLayout5.HorizontalAlignment = Enum.HorizontalAlignment.Center
            _UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
            _UIListLayout5.Padding = UDim.new(0, 5)
            _Frame14.Parent = u584
            _Frame14.AnchorPoint = Vector2.new(0.5, 1)
            _Frame14.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
            _Frame14.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame14.BorderSizePixel = 0
            _Frame14.Position = UDim2.new(0.5, 0, 0, 0)
            _Frame14.Size = UDim2.new(0.949999988, 0, 0.00499999989, 0)
            _UICorner10.CornerRadius = UDim.new(0.5, 0)
            _UICorner10.Parent = _Frame14
        end

        local u620 = #u511.Tabs + 1

        local function v622(p621)
            if p621 then
                _TweenService:Create(u584, TweenInfo.new(0.3), {
                    Position = UDim2.fromScale(0, 0.163),
                }):Play()
                _TweenService:Create(_TextLabel3, TweenInfo.new(0.1 + u620 / 10), {
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0.8,
                }):Play()
            else
                if u620 >= u511.TabSelect then
                    _TweenService:Create(u584, TweenInfo.new(0.3), {
                        Position = UDim2.fromScale(1, 0.163),
                    }):Play()
                else
                    _TweenService:Create(u584, TweenInfo.new(0.3), {
                        Position = UDim2.fromScale(-1, 0.163),
                    }):Play()
                end

                _TweenService:Create(_TextLabel3, TweenInfo.new(0.1), {
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0.25,
                }):Play()
            end
        end

        if u511.Tabs[1] then
            v622(false)
        else
            v622(true)
        end

        table.insert(u511.Tabs, {_Frame7, v622})

        u620 = #u511.Tabs

        _TextButton2.MouseButton1Click:Connect(function()
            u511.TabSelect = u620

            local v623, v624, v625 = u484(u511.Tabs)

            while true do
                local v626

                v625, v626 = v623(v624, v625)

                if v625 == nil then
                    break
                end
                if v626[1] ~= _Frame7 then
                    v626[2](false)
                else
                    u511.TabSelect = v625

                    v626[2](true)
                end
            end
        end)

        function u576.AddTab(_, p627, p628, p629)
            local v630 = {}
            local u631 = nil

            if u575:find('tab') then
                local _ScrollingFrame4 = Instance.new('ScrollingFrame')
                local _UIListLayout6 = Instance.new('UIListLayout')

                u502(_ScrollingFrame4)

                u631 = _ScrollingFrame4
                _ScrollingFrame4.Name = tostring(p627 or 'Main')
                _ScrollingFrame4.Name = 'MainScrolling'
                _ScrollingFrame4.Parent = u584:WaitForChild('Main')
                _ScrollingFrame4.Active = true
                _ScrollingFrame4.AnchorPoint = Vector2.new(0.5, 0.5)
                _ScrollingFrame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ScrollingFrame4.BackgroundTransparency = 1
                _ScrollingFrame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ScrollingFrame4.BorderSizePixel = 0
                _ScrollingFrame4.ClipsDescendants = false
                _ScrollingFrame4.Position = UDim2.new(0.1, 0, 0.1, 0)
                _ScrollingFrame4.Size = UDim2.new(0.99500001, 0, 1, 0)
                _ScrollingFrame4.ZIndex = 2
                _ScrollingFrame4.ScrollBarThickness = 0
                _UIListLayout6.Parent = _ScrollingFrame4
                _UIListLayout6.HorizontalAlignment = Enum.HorizontalAlignment.Center
                _UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
                _UIListLayout6.Padding = UDim.new(0, 1.5)

                local _Frame15 = Instance.new('Frame')
                local _UIAspectRatioConstraint2 = Instance.new('UIAspectRatioConstraint')
                local _UICorner11 = Instance.new('UICorner')
                local _UIStroke4 = Instance.new('UIStroke')
                local _UIGradient3 = Instance.new('UIGradient')
                local _ImageLabel8 = Instance.new('ImageLabel')
                local _TextLabel6 = Instance.new('TextLabel')
                local _TextLabel7 = Instance.new('TextLabel')
                local _TextButton3 = Instance.new('TextButton')

                _Frame15.Name = tostring(p627 or 'Main')
                _Frame15.Parent = u584:WaitForChild('Search'):WaitForChild('TabFrames')
                _Frame15.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                _Frame15.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame15.BorderSizePixel = 0
                _Frame15.Size = UDim2.new(1, 0, 1, 0)
                _Frame15.ZIndex = 5
                _UIAspectRatioConstraint2.Parent = _Frame15
                _UIAspectRatioConstraint2.AspectRatio = 4.25
                _UIAspectRatioConstraint2.AspectType = Enum.AspectType.ScaleWithParentSize
                _UICorner11.CornerRadius = UDim.new(0, 3)
                _UICorner11.Parent = _Frame15
                _UIStroke4.Transparency = 0.25
                _UIStroke4.Color = Color3.fromRGB(128, 0, 128)
                _UIStroke4.Parent = _Frame15
                _UIGradient3.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.5),
                    NumberSequenceKeypoint.new(0.2, 0),
                    NumberSequenceKeypoint.new(0.8, 0),
                    NumberSequenceKeypoint.new(1, 0.5),
                })
                _UIGradient3.Parent = _UIStroke4
                _ImageLabel8.Name = 'TabIcon'
                _ImageLabel8.Parent = _Frame15
                _ImageLabel8.AnchorPoint = Vector2.new(0.5, 0.5)
                _ImageLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel8.BackgroundTransparency = 1
                _ImageLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel8.BorderSizePixel = 0
                _ImageLabel8.Position = UDim2.new(0.135000005, 0, 0.5, 0)
                _ImageLabel8.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
                _ImageLabel8.SizeConstraint = Enum.SizeConstraint.RelativeYY
                _ImageLabel8.ZIndex = 6
                _ImageLabel8.Image = 'rbxassetid://' .. p628
                _TextLabel6.Name = 'Text'
                _TextLabel6.Parent = _Frame15
                _TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel6.BackgroundTransparency = 1
                _TextLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel6.BorderSizePixel = 0
                _TextLabel6.Position = UDim2.new(0.246999651, 0, 0.200000003, 0)
                _TextLabel6.Size = UDim2.new(0.753000021, 0, 0.400000006, 0)
                _TextLabel6.ZIndex = 7
                _TextLabel6.Font = Enum.Font.GothamBold
                _TextLabel6.Text = p627 or 'Main'
                _TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel6.TextScaled = true
                _TextLabel6.TextSize = 14
                _TextLabel6.TextWrapped = true
                _TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel7.Name = 'Description'
                _TextLabel7.Parent = _Frame15
                _TextLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel7.BackgroundTransparency = 1
                _TextLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel7.BorderSizePixel = 0
                _TextLabel7.Position = UDim2.new(0.246999651, 0, 0.600000024, 0)
                _TextLabel7.Size = UDim2.new(0.753000081, 0, 0.25, 0)
                _TextLabel7.ZIndex = 7
                _TextLabel7.Font = Enum.Font.GothamBold
                _TextLabel7.Text = p629 or 'loadstring()()'
                _TextLabel7.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel7.TextScaled = true
                _TextLabel7.TextSize = 14
                _TextLabel7.TextTransparency = 0.5
                _TextLabel7.TextWrapped = true
                _TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
                _TextButton3.Name = 'Button'
                _TextButton3.Parent = _Frame15
                _TextButton3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextButton3.BackgroundTransparency = 1
                _TextButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton3.BorderSizePixel = 0
                _TextButton3.Size = UDim2.new(1, 0, 1, 0)
                _TextButton3.ZIndex = 25
                _TextButton3.Font = Enum.Font.SourceSans
                _TextButton3.Text = ''
                _TextButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton3.TextSize = 14
                _TextButton3.TextTransparency = 1

                local function v644(p643)
                    UDim2.fromScale(0.9, 0.95)

                    if p643 then
                        _TextLabel6.TextColor3 = Color3.fromRGB(128, 0, 128)

                        _TweenService:Create(_ImageLabel8, TweenInfo.new(0.15), {ImageTransparency = 0}):Play()
                        _TweenService:Create(_TextLabel7, TweenInfo.new(0.15), {TextTransparency = 0.5}):Play()
                        _TweenService:Create(_TextLabel6, TweenInfo.new(0.15), {TextTransparency = 0}):Play()
                        _TweenService:Create(_UIStroke4, TweenInfo.new(0.15), {Transparency = 0.25}):Play()
                        _TweenService:Create(_ScrollingFrame4, TweenInfo.new(0.4), {
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                        }):Play()
                    else
                        _TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)

                        _TweenService:Create(_ImageLabel8, TweenInfo.new(0.15), {ImageTransparency = 0.55}):Play()
                        _TweenService:Create(_TextLabel7, TweenInfo.new(0.15), {TextTransparency = 0.85}):Play()
                        _TweenService:Create(_TextLabel6, TweenInfo.new(0.15), {TextTransparency = 0.55}):Play()
                        _TweenService:Create(_UIStroke4, TweenInfo.new(0.15), {Transparency = 0.65}):Play()
                        _TweenService:Create(_ScrollingFrame4, TweenInfo.new(0.4), {
                            Position = UDim2.fromScale(1.55, 0.5),
                        }):Play()
                    end
                end

                if u576[1] then
                    v644(false)
                else
                    v644(true)
                end

                table.insert(u576, {v644, _ImageLabel8})
                _TextButton3.MouseButton1Click:Connect(function()
                    local v645, v646, v647 = u484(u576)

                    while true do
                        local v648

                        v647, v648 = v645(v646, v647)

                        if v647 == nil then
                            break
                        end
                        if v648[2] ~= _ImageLabel8 then
                            v648[1](false)
                        else
                            v648[1](true)
                        end
                    end
                end)
            elseif u575:find('change') then
                u631 = u584:FindFirstChild('Main'):FindFirstChild('MainScrolling')
            end

            function v630.AddLabel(_, p649, p650)
                local _TextLabel8 = Instance.new('TextLabel')
                local _UIAspectRatioConstraint3 = Instance.new('UIAspectRatioConstraint')

                _TextLabel8.Name = 'SectionTitle'
                _TextLabel8.Parent = u631
                _TextLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel8.BackgroundTransparency = 1
                _TextLabel8.BorderSizePixel = 0
                _TextLabel8.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                _TextLabel8.ZIndex = 4
                _TextLabel8.Font = Enum.Font.GothamBold
                _TextLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel8.TextScaled = true
                _TextLabel8.TextSize = 14
                _TextLabel8.TextWrapped = true
                _TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel8.Text = p649 .. ': ' .. (p650 == 'positive' and '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}' or '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}')
                _UIAspectRatioConstraint3.Parent = _TextLabel8
                _UIAspectRatioConstraint3.AspectRatio = 23
                _UIAspectRatioConstraint3.AspectType = Enum.AspectType.ScaleWithParentSize

                return {
                    SetStatus = function(_, p653)
                        _TextLabel8.Text = p649 .. ': ' .. (p653 == 'positive' and '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}' or '\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}')
                    end,
                    Delete = function(_)
                        _TextLabel8:Destroy()
                    end,
                }
            end
            function v630.AddSection(_, p654, p655, p656, _)
                local _TextLabel9 = Instance.new('TextLabel')
                local _UIAspectRatioConstraint4 = Instance.new('UIAspectRatioConstraint')
                local u659 = {}

                _TextLabel9.Name = 'SectionTitle'
                _TextLabel9.Parent = u631
                _TextLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel9.BackgroundTransparency = 1
                _TextLabel9.Size = UDim2.new(0.98, 0, 0.5, 0)
                _TextLabel9.ZIndex = 4
                _TextLabel9.Font = Enum.Font.GothamBold
                _TextLabel9.Text = p654 or 'SECTION'
                _TextLabel9.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel9.TextScaled = true
                _TextLabel9.TextWrapped = true
                _TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
                _UIAspectRatioConstraint4.Parent = _TextLabel9
                _UIAspectRatioConstraint4.AspectRatio = 23
                _UIAspectRatioConstraint4.AspectType = Enum.AspectType.ScaleWithParentSize

                local _Frame16 = Instance.new('Frame')
                local _UICorner12 = Instance.new('UICorner')
                local _UIStroke5 = Instance.new('UIStroke')
                local _UIListLayout7 = Instance.new('UIListLayout')
                local _Frame17 = Instance.new('Frame')
                local _UIAspectRatioConstraint5 = Instance.new('UIAspectRatioConstraint')
                local _ImageLabel9 = Instance.new('ImageLabel')
                local _ImageLabel10 = Instance.new('ImageLabel')
                local _TextLabel10 = Instance.new('TextLabel')
                local _TextLabel11 = Instance.new('TextLabel')
                local _Frame18 = Instance.new('Frame')
                local _UICorner13 = Instance.new('UICorner')

                local function u673()
                    local _Y2 = _UIListLayout7.AbsoluteContentSize.Y

                    _Frame16.Size = UDim2.new(1, 0, 0, _Y2 + 10)
                    _UIStroke5.Thickness = 1
                end

                local v674 = _UIListLayout7

                _UIListLayout7.GetPropertyChangedSignal(v674, 'AbsoluteContentSize'):Connect(u673)
                _Frame16.ChildAdded:Connect(u673)
                _Frame16.ChildRemoved:Connect(u673)

                _Frame16.Name = 'SectionFrame'
                _Frame16.Parent = u631
                _Frame16.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                _Frame16.BackgroundTransparency = 0.6
                _Frame16.Size = UDim2.new(1, -10, 0, 65)
                _Frame16.ZIndex = 4
                _Frame16.ClipsDescendants = true

                u673()

                _UICorner12.Parent = _Frame16
                _UIStroke5.Color = Color3.fromRGB(128, 0, 128)
                _UIStroke5.Transparency = 0.9
                _UIStroke5.Parent = _Frame16
                _UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIListLayout7.Parent = _Frame16
                _UIListLayout7.HorizontalAlignment = Enum.HorizontalAlignment.Center
                _UIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
                _UIListLayout7.Padding = UDim.new(0, 5)
                _Frame17.Name = 'Header'
                _Frame17.Parent = _Frame16
                _Frame17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _Frame17.BackgroundTransparency = 1
                _Frame17.Size = UDim2.new(0.95, 0, 0.5, 0)
                _Frame17.ZIndex = 5
                _UIAspectRatioConstraint5.Parent = _Frame17
                _UIAspectRatioConstraint5.AspectRatio = 4
                _UIAspectRatioConstraint5.AspectType = Enum.AspectType.ScaleWithParentSize
                _ImageLabel9.Name = 'SectionIcon'
                _ImageLabel9.Parent = _Frame17
                _ImageLabel9.AnchorPoint = Vector2.new(0, 0.5)
                _ImageLabel9.BackgroundTransparency = 1
                _ImageLabel9.Position = UDim2.new(0.05, 0, 0.4, 0)
                _ImageLabel9.Size = UDim2.new(0.5, 0, 0.5, 0)
                _ImageLabel9.SizeConstraint = Enum.SizeConstraint.RelativeYY
                _ImageLabel9.ZIndex = 6
                _ImageLabel9.Image = 'rbxassetid://119522694447910'
                _ImageLabel10.Name = 'SectionIcon'
                _ImageLabel10.Parent = _Frame17
                _ImageLabel10.AnchorPoint = Vector2.new(0.5, 0.7)
                _ImageLabel10.BackgroundTransparency = 1
                _ImageLabel10.Position = UDim2.new(0.95, 0, 0.6, 0)
                _ImageLabel10.Size = UDim2.new(0.5, 0, 0.5, 0)
                _ImageLabel10.SizeConstraint = Enum.SizeConstraint.RelativeYY
                _ImageLabel10.ZIndex = 6
                _ImageLabel10.Image = 'rbxassetid://'
                _TextLabel10.Name = 'SectionHeadTest'
                _TextLabel10.Parent = _Frame17
                _TextLabel10.BackgroundTransparency = 1
                _TextLabel10.Position = UDim2.new(0.22, 0, 0.095, 0)
                _TextLabel10.Size = UDim2.new(0.7, 0, 0.195, 0)
                _TextLabel10.ZIndex = 5
                _TextLabel10.Font = Enum.Font.GothamBold
                _TextLabel10.Text = p655 or 'Data Settings'
                _TextLabel10.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel10.TextScaled = true
                _TextLabel10.TextWrapped = true
                _TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel11.Name = 'SectionDescription'
                _TextLabel11.Parent = _Frame17
                _TextLabel11.BackgroundTransparency = 1
                _TextLabel11.Position = UDim2.new(0.22, 0, 0.255, 0)
                _TextLabel11.Size = UDim2.new(0.7, 0, 0.495, 0)
                _TextLabel11.ZIndex = 5
                _TextLabel11.Font = Enum.Font.GothamBold
                _TextLabel11.Text = p656 or 'Save The Setting'
                _TextLabel11.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel11.TextSize = 11
                _TextLabel11.TextTransparency = 0.5
                _TextLabel11.TextWrapped = true
                _TextLabel11.TextXAlignment = Enum.TextXAlignment.Left
                _Frame18.Parent = _Frame17
                _Frame18.AnchorPoint = Vector2.new(0.5, 0.5)
                _Frame18.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                _Frame18.BackgroundTransparency = 0.6
                _Frame18.Position = UDim2.new(0.5, 0, 0.9, 0)
                _Frame18.Size = UDim2.new(0.95, 0, 0.02, 0)
                _Frame18.ZIndex = 5
                _UICorner13.CornerRadius = UDim.new(0.5, 0)
                _UICorner13.Parent = _Frame18

                function u659.Update(_)
                    u673()
                end
                function u659.AddLabel(_, p675)
                    local _TextLabel12 = Instance.new('TextLabel')
                    local _UIAspectRatioConstraint6 = Instance.new('UIAspectRatioConstraint')
                    local v678 = {}

                    _TextLabel12.Name = 'SectionTitle'
                    _TextLabel12.Parent = _Frame16
                    _TextLabel12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel12.BackgroundTransparency = 1
                    _TextLabel12.BorderSizePixel = 0
                    _TextLabel12.Size = UDim2.new(0.92, 0, 0.5, 0)
                    _TextLabel12.ZIndex = 4
                    _TextLabel12.Font = Enum.Font.GothamBold
                    _TextLabel12.Text = p675 or 'SECTION'
                    _TextLabel12.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel12.TextTransparency = 0.5
                    _TextLabel12.TextScaled = false
                    _TextLabel12.TextSize = 12
                    _TextLabel12.TextWrapped = true
                    _TextLabel12.TextXAlignment = Enum.TextXAlignment.Left
                    _UIAspectRatioConstraint6.Parent = _TextLabel12
                    _UIAspectRatioConstraint6.AspectRatio = 23
                    _UIAspectRatioConstraint6.AspectType = Enum.AspectType.ScaleWithParentSize

                    function v678.Set(_, p679)
                        _TextLabel12.Text = tostring(p679)
                    end
                    function v678.Delete(_)
                        _TextLabel12:Destroy()
                        u673()
                    end

                    u659:Update()

                    return v678
                end
                function u659.AddSeperator(_, p680)
                    local _Frame19 = Instance.new('Frame')
                    local _Frame20 = Instance.new('Frame')
                    local _TextLabel13 = Instance.new('TextLabel')
                    local _Frame21 = Instance.new('Frame')
                    local _TextLabel14 = Instance.new('TextLabel')
                    local _TextLabel15 = Instance.new('TextLabel')
                    local _UIStroke6 = Instance.new('UIStroke')
                    local _UICorner14 = Instance.new('UICorner')

                    _Frame19.Name = 'Seperator'
                    _Frame19.Parent = _Frame16
                    _Frame19.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    _Frame19.BorderSizePixel = 0
                    _Frame19.BackgroundTransparency = 1
                    _Frame19.ZIndex = 4
                    _Frame19.Size = UDim2.new(0.9, 0, 0, 30)
                    _UICorner14.CornerRadius = UDim.new(0.4, 0)
                    _UICorner14.Parent = _Frame19
                    _UIStroke6.Color = Color3.fromRGB(128, 0, 128)
                    _UIStroke6.Transparency = 0.5
                    _UIStroke6.Parent = _Frame19
                    _UIStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    _Frame20.Name = 'Sep1'
                    _Frame20.Parent = _Frame19
                    _Frame20.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    _Frame20.BackgroundTransparency = 0
                    _Frame20.ZIndex = 10
                    _Frame20.BorderSizePixel = 0
                    _Frame20.ZIndex = 6
                    _Frame20.Position = UDim2.new(0, 10, 0, 10)
                    _Frame20.Size = UDim2.new(0, 90, 0, 2)
                    _Frame20.Visible = false
                    _TextLabel13.Name = 'Sep2'
                    _TextLabel13.Parent = _Frame19
                    _TextLabel13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel13.BackgroundTransparency = 1
                    _TextLabel13.AnchorPoint = Vector2.new(0.5, 0.5)
                    _TextLabel13.Position = UDim2.new(0.5, 0, 0.5, 0)
                    _TextLabel13.Size = UDim2.new(0.95, 0, 0, 30)
                    _TextLabel13.Font = Enum.Font.SourceSansBold
                    _TextLabel13.Text = p680
                    _TextLabel13.RichText = true
                    _TextLabel13.ZIndex = 6
                    _TextLabel13.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel13.TextTransparency = 0.5
                    _TextLabel13.TextSize = 18
                    _TextLabel14.Name = 'Sep2'
                    _TextLabel14.Parent = _Frame19
                    _TextLabel14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel14.BackgroundTransparency = 1
                    _TextLabel14.Position = UDim2.new(0, 0, 0, 0)
                    _TextLabel14.Size = UDim2.new(0.3385, 0, 0, 30)
                    _TextLabel14.Font = Enum.Font.SourceSansBold
                    _TextLabel14.Text = '<<'
                    _TextLabel14.RichText = true
                    _TextLabel14.ZIndex = 6
                    _TextLabel14.TextColor3 = Color3.fromRGB(128, 0, 128)
                    _TextLabel14.TextSize = 20
                    _TextLabel15.Name = 'Sep2'
                    _TextLabel15.Parent = _Frame19
                    _TextLabel15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel15.BackgroundTransparency = 1
                    _TextLabel15.Position = UDim2.new(0, 0, 0, 0)
                    _TextLabel15.AnchorPoint = Vector2.new(1, 0.5)
                    _TextLabel15.Position = UDim2.new(0.8, 0, 0.5, 0)
                    _TextLabel15.Font = Enum.Font.SourceSansBold
                    _TextLabel15.Text = '>>'
                    _TextLabel15.RichText = true
                    _TextLabel15.ZIndex = 6
                    _TextLabel15.TextColor3 = Color3.fromRGB(128, 0, 128)
                    _TextLabel15.TextSize = 20
                    _Frame21.Name = 'Sep3'
                    _Frame21.Parent = _Frame19
                    _Frame21.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    _Frame21.BackgroundTransparency = 0.1
                    _Frame21.BorderSizePixel = 0
                    _Frame21.ZIndex = 6
                    _Frame21.Visible = false
                    _Frame21.Position = UDim2.new(0, 280, 0, 10)
                    _Frame21.Size = UDim2.new(0, 90, 0, 2)
                end
                function u659.addLabel(_, p689)
                    local _TextLabel16 = Instance.new('TextLabel')
                    local _UIPadding = Instance.new('UIPadding')
                    local v692 = {}

                    _TextLabel16.Name = 'Label'
                    _TextLabel16.Parent = _Frame16
                    _TextLabel16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel16.BackgroundTransparency = 1
                    _TextLabel16.Size = UDim2.new(0, 270, 0, 20)
                    _TextLabel16.Font = Enum.Font.GothamBold
                    _TextLabel16.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextLabel16.TextTransparency = 0.5
                    _TextLabel16.TextSize = 10
                    _TextLabel16.Text = p689
                    _TextLabel16.ZIndex = 5
                    _TextLabel16.TextXAlignment = Enum.TextXAlignment.Left
                    _UIPadding.PaddingLeft = UDim.new(0, 10)
                    _UIPadding.Parent = _TextLabel16
                    _UIPadding.Name = 'PaddingLabel'

                    function v692.Set(_, p693)
                        _TextLabel16.Text = p693
                    end

                    return v692
                end
                function u659.Textbox(_, p694, p695, p696)
                    local _Frame22 = Instance.new('Frame')

                    _Frame22.Name = 'Input'
                    _Frame22.Parent = _Frame16
                    _Frame22.BorderSizePixel = 0
                    _Frame22.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _Frame22.Size = UDim2.new(0.94, 0, 0, 30)
                    _Frame22.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame22.ZIndex = 6

                    local _UIStroke7 = Instance.new('UIStroke')

                    _UIStroke7.Color = Color3.fromRGB(255, 255, 255)
                    _UIStroke7.Thickness = 1
                    _UIStroke7.Transparency = 0.95
                    _UIStroke7.Name = 'UiToggle_UiStroke1'
                    _UIStroke7.Parent = _Frame22

                    local _UICorner15 = Instance.new('UICorner')

                    _UICorner15.Parent = _Frame22
                    _UICorner15.CornerRadius = UDim.new(0, 2)

                    local _TextLabel17 = Instance.new('TextLabel')

                    _TextLabel17.Name = 'Title'
                    _TextLabel17.Parent = _Frame22
                    _TextLabel17.BorderSizePixel = 0
                    _TextLabel17.TextXAlignment = Enum.TextXAlignment.Left
                    _TextLabel17.TextTransparency = 0.2
                    _TextLabel17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel17.TextSize = 12
                    _TextLabel17.Font = Enum.Font.GothamBold
                    _TextLabel17.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel17.BackgroundTransparency = 1
                    _TextLabel17.Size = UDim2.new(2, 0, 1, 0)
                    _TextLabel17.Position = UDim2.new(0.02, 0, 0, 0)
                    _TextLabel17.Text = p694
                    _TextLabel17.ZIndex = 6

                    local _TextBox2 = Instance.new('TextBox')

                    _TextBox2.Name = 'TextBox'
                    _TextBox2.Parent = _Frame22
                    _TextBox2.CursorPosition = -1
                    _TextBox2.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextBox2.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                    _TextBox2.BorderSizePixel = 0
                    _TextBox2.TextTransparency = 0.2
                    _TextBox2.TextSize = 10
                    _TextBox2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                    _TextBox2.Font = Enum.Font.GothamBold
                    _TextBox2.ClipsDescendants = true
                    _TextBox2.AnchorPoint = Vector2.new(1, 0)
                    _TextBox2.PlaceholderText = p695 .. '.....'
                    _TextBox2.Size = UDim2.new(0, 150, 0, 25)
                    _TextBox2.Position = UDim2.new(1, -8, 0, 2)
                    _TextBox2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextBox2.Text = ''
                    _TextBox2.ZIndex = 6

                    local _UICorner16 = Instance.new('UICorner')

                    _UICorner16.Parent = _TextBox2
                    _UICorner16.CornerRadius = UDim.new(0, 8)

                    _TextBox2.FocusLost:Connect(function(p703)
                        if p703 then
                            p696(_TextBox2.Text)
                        end
                    end)
                end
                function u659.Toggle1(_, p704, p705, p706)
                    local _Frame23 = Instance.new('Frame')
                    local _UIAspectRatioConstraint7 = Instance.new('UIAspectRatioConstraint')
                    local _Frame24 = Instance.new('Frame')
                    local _UICorner17 = Instance.new('UICorner')
                    local _TextLabel18 = Instance.new('TextLabel')
                    local _Frame25 = Instance.new('Frame')
                    local _UICorner18 = Instance.new('UICorner')
                    local _ImageLabel11 = Instance.new('ImageLabel')
                    local _Frame26 = Instance.new('Frame')
                    local _UIGradient4 = Instance.new('UIGradient')
                    local _UICorner19 = Instance.new('UICorner')

                    _Frame23.Name = 'Toggle'
                    _Frame23.Parent = _Frame16
                    _Frame23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame23.BackgroundTransparency = 1
                    _Frame23.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame23.BorderSizePixel = 0
                    _Frame23.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    _Frame23.ZIndex = 5
                    _UIAspectRatioConstraint7.Parent = _Frame23
                    _UIAspectRatioConstraint7.AspectRatio = 11.5
                    _UIAspectRatioConstraint7.AspectType = Enum.AspectType.ScaleWithParentSize
                    _Frame24.Name = 'MainFrame'
                    _Frame24.Parent = _Frame23
                    _Frame24.AnchorPoint = Vector2.new(0.5, 0)
                    _Frame24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame24.BackgroundTransparency = 1
                    _Frame24.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame24.BorderSizePixel = 0
                    _Frame24.Position = UDim2.new(0.5, 0, 0, 0)
                    _Frame24.Size = UDim2.new(0.949999988, 0, 1, 0)
                    _Frame24.ZIndex = 6
                    _UICorner17.CornerRadius = UDim.new(0, 3)
                    _UICorner17.Parent = _Frame24
                    _TextLabel18.Name = 'Text'
                    _TextLabel18.Parent = _Frame24
                    _TextLabel18.AnchorPoint = Vector2.new(0.5, 0.5)
                    _TextLabel18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel18.BackgroundTransparency = 1
                    _TextLabel18.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextLabel18.BorderSizePixel = 0
                    _TextLabel18.Position = UDim2.new(0.531999981, 0, 0.5, 0)
                    _TextLabel18.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
                    _TextLabel18.ZIndex = 6
                    _TextLabel18.Font = Enum.Font.GothamBold
                    _TextLabel18.Text = p704 or 'Auto Fuck'
                    _TextLabel18.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel18.TextScaled = true
                    _TextLabel18.TextSize = 14
                    _TextLabel18.TextWrapped = true
                    _TextLabel18.TextXAlignment = Enum.TextXAlignment.Left
                    _Frame25.Name = 'System'
                    _Frame25.Parent = _Frame24
                    _Frame25.AnchorPoint = Vector2.new(0.5, 0.5)
                    _Frame25.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    _Frame25.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame25.BorderSizePixel = 0
                    _Frame25.BackgroundTransparency = 1
                    _Frame25.Position = UDim2.new(10.0419999994, 0, 0.5, 0)
                    _Frame25.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
                    _Frame25.SizeConstraint = Enum.SizeConstraint.RelativeYY
                    _Frame25.ZIndex = 6
                    _UICorner18.CornerRadius = UDim.new(0, 3)
                    _UICorner18.Parent = _Frame25
                    _ImageLabel11.Name = 'TurnOn'
                    _ImageLabel11.Parent = _Frame25
                    _ImageLabel11.AnchorPoint = Vector2.new(0.5, 0.5)
                    _ImageLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _ImageLabel11.BackgroundTransparency = 1
                    _ImageLabel11.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _ImageLabel11.BorderSizePixel = 0
                    _ImageLabel11.Position = UDim2.new(0.5, 0, 0.5, 0)
                    _ImageLabel11.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
                    _ImageLabel11.ZIndex = 7
                    _ImageLabel11.Image = 'rbxassetid://3944680095'
                    _ImageLabel11.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    _ImageLabel11.ImageTransparency = 1
                    _Frame26.Name = 'Box'
                    _Frame26.Parent = _Frame25
                    _Frame26.AnchorPoint = Vector2.new(0.5, 0.5)
                    _Frame26.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame26.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame26.BorderSizePixel = 0
                    _Frame26.Position = UDim2.new(0.5, 0, 0.5, 0)
                    _Frame26.ZIndex = 6
                    _UIGradient4.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, u492.Config.MainColor),
                        ColorSequenceKeypoint.new(1, u492.Config.DropColor),
                    })
                    _UIGradient4.Rotation = 45
                    _UIGradient4.Parent = _Frame26
                    _UICorner19.CornerRadius = UDim.new(0, 4)
                    _UICorner19.Parent = _Frame26

                    local function u719(p718)
                        if p718 then
                            _TweenService:Create(_ImageLabel11, TweenInfo.new(0.4), {ImageTransparency = 0}):Play()
                            _TweenService:Create(_Frame26, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(1, 1),
                            }):Play()
                            _TweenService:Create(_ImageLabel11, TweenInfo.new(0.55), {
                                ImageColor3 = u492.Config.MainColor,
                            }):Play()
                        else
                            _TweenService:Create(_ImageLabel11, TweenInfo.new(0.4), {ImageTransparency = 1}):Play()
                            _TweenService:Create(_Frame26, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(0, 0),
                            }):Play()
                            _TweenService:Create(_ImageLabel11, TweenInfo.new(0.555), {
                                ImageColor3 = Color3.fromRGB(0, 0, 0),
                            }):Play()
                        end
                    end

                    u719(p705)
                    u496(_Frame24).MouseButton1Click:Connect(function()
                        p705 = not p705

                        u719(p705)

                        if p706 then
                            p706(p705)
                        end
                    end)
                    u659:Update()

                    return {
                        Text = function(_, ...)
                            _TextLabel18.Text = tostring(...)
                        end,
                        Value = function(_, p720)
                            p705 = p720

                            u719(p720)

                            if p706 then
                                p706(p705)
                            end
                        end,
                        Delete = function(_)
                            _Frame23:Destroy()
                            u673()
                        end,
                    }
                end
                function u659.AddToggle1(_, p721, p722, p723)
                    local _Frame27 = Instance.new('Frame')
                    local _UICorner20 = Instance.new('UICorner')
                    local _TextButton4 = Instance.new('TextButton')
                    local _TextLabel19 = Instance.new('TextLabel')
                    local _Frame28 = Instance.new('Frame')
                    local _UICorner21 = Instance.new('UICorner')
                    local _ImageLabel12 = Instance.new('ImageLabel')
                    local _UICorner22 = Instance.new('UICorner')
                    local _UIGradient5 = Instance.new('UIGradient')
                    local _UIAspectRatioConstraint8 = Instance.new('UIAspectRatioConstraint')

                    _Frame27.Name = 'Toggle'
                    _Frame27.Parent = _Frame16
                    _Frame27.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    _Frame27.BackgroundTransparency = 1
                    _Frame27.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame27.BorderSizePixel = 0
                    _Frame27.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    _Frame27.ZIndex = 5
                    _UIAspectRatioConstraint8.Parent = _Frame27
                    _UIAspectRatioConstraint8.AspectRatio = 11.5
                    _UIAspectRatioConstraint8.AspectType = Enum.AspectType.ScaleWithParentSize
                    _UICorner20.CornerRadius = UDim.new(0, 3)
                    _UICorner20.Name = 'UICorner_Toggle'
                    _UICorner20.Parent = _Frame27
                    _TextButton4.Name = 'Toggle_Click'
                    _TextButton4.Parent = _Frame27
                    _TextButton4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextButton4.BackgroundTransparency = 1
                    _TextButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextButton4.BorderSizePixel = 0
                    _TextButton4.Size = UDim2.new(1, 0, 1, 0)
                    _TextButton4.Font = Enum.Font.SourceSans
                    _TextButton4.Text = ''
                    _TextButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
                    _TextButton4.TextSize = 1
                    _TextButton4.ZIndex = 6
                    _TextLabel19.Name = 'Toggle_Text'
                    _TextLabel19.Parent = _Frame27
                    _TextLabel19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel19.BackgroundTransparency = 1
                    _TextLabel19.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextLabel19.BorderSizePixel = 0
                    _TextLabel19.Position = UDim2.new(0.14399981, 0, 0.32, 0)
                    _TextLabel19.Size = UDim2.new(1.13500003, 0, 0.424999976, 0)
                    _TextLabel19.Font = Enum.Font.GothamBold
                    _TextLabel19.Text = p721
                    _TextLabel19.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel19.TextSize = 14
                    _TextLabel19.TextXAlignment = Enum.TextXAlignment.Left
                    _TextLabel19.ZIndex = 6
                    _TextLabel19.TextScaled = true
                    _Frame28.Name = 'Toggle_Icon'
                    _Frame28.Parent = _Frame27
                    _Frame28.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                    _Frame28.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame28.BorderSizePixel = 0
                    _Frame28.Position = UDim2.new(0.035, 0, 0.181818187, 0)
                    _Frame28.Size = UDim2.new(0, 25, 0, 23)
                    _Frame28.ZIndex = 6
                    _UICorner21.CornerRadius = UDim.new(0, 3)
                    _UICorner21.Name = 'UICorner_Toggle2'
                    _UICorner21.Parent = _Frame28
                    _ImageLabel12.Parent = _Frame28
                    _ImageLabel12.AnchorPoint = Vector2.new(0.5, 0.5)
                    _ImageLabel12.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    _ImageLabel12.BackgroundTransparency = 1
                    _ImageLabel12.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _ImageLabel12.BorderSizePixel = 0
                    _ImageLabel12.Position = UDim2.new(0.519999981, 0, 0.550000012, 0)
                    _ImageLabel12.Size = UDim2.new(0, 30, 0, 30)
                    _ImageLabel12.Image = 'http://www.roblox.com/asset/?id=6031068421'
                    _ImageLabel12.ImageColor3 = Color3.fromRGB(128, 0, 128)
                    _ImageLabel12.Visible = false
                    _ImageLabel12.ZIndex = 6
                    _UICorner22.CornerRadius = UDim.new(0, 3)
                    _UICorner22.Name = 'UICorner_Toggle2'
                    _UICorner22.Parent = _ImageLabel12
                    _UIGradient5.Parent = _ImageLabel12

                    if p722 == true then
                        p722 = true
                        _ImageLabel12.Visible = true

                        pcall(p723, p722)
                    end

                    _TextButton4.MouseButton1Click:Connect(function()
                        if p722 then
                            p722 = false
                            _ImageLabel12.Visible = false
                        else
                            p722 = true
                            _ImageLabel12.Visible = true
                        end

                        pcall(p723, p722)
                    end)
                end
                function u659.AddToggle(_, p734, p735, p736)
                    local _Frame29 = Instance.new('Frame')
                    local _UIAspectRatioConstraint9 = Instance.new('UIAspectRatioConstraint')
                    local _Frame30 = Instance.new('Frame')
                    local _UICorner23 = Instance.new('UICorner')
                    local _TextLabel20 = Instance.new('TextLabel')
                    local _Frame31 = Instance.new('Frame')
                    local _UICorner24 = Instance.new('UICorner')
                    local _ImageLabel13 = Instance.new('ImageLabel')
                    local _Frame32 = Instance.new('Frame')
                    local _UIGradient6 = Instance.new('UIGradient')
                    local _UICorner25 = Instance.new('UICorner')

                    _Frame29.Name = 'Toggle'
                    _Frame29.Parent = _Frame16
                    _Frame29.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame29.BackgroundTransparency = 1
                    _Frame29.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame29.BorderSizePixel = 0
                    _Frame29.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    _Frame29.ZIndex = 4
                    _UIAspectRatioConstraint9.Parent = _Frame29
                    _UIAspectRatioConstraint9.AspectRatio = 11.5
                    _UIAspectRatioConstraint9.AspectType = Enum.AspectType.ScaleWithParentSize
                    _Frame30.Name = 'MainFrame'
                    _Frame30.Parent = _Frame29
                    _Frame30.AnchorPoint = Vector2.new(0.5, 0)
                    _Frame30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame30.BackgroundTransparency = 1
                    _Frame30.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame30.BorderSizePixel = 0
                    _Frame30.Position = UDim2.new(0.5, 0, 0, 0)
                    _Frame30.Size = UDim2.new(0.949999988, 0, 1, 0)
                    _Frame30.ZIndex = 5
                    _UICorner23.CornerRadius = UDim.new(0, 3)
                    _UICorner23.Parent = _Frame30
                    _TextLabel20.Name = 'Text'
                    _TextLabel20.Parent = _Frame30
                    _TextLabel20.AnchorPoint = Vector2.new(0.5, 0.5)
                    _TextLabel20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel20.BackgroundTransparency = 1
                    _TextLabel20.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextLabel20.BorderSizePixel = 0
                    _TextLabel20.Position = UDim2.new(0.681999981, 0, 0.5, 0)
                    _TextLabel20.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
                    _TextLabel20.ZIndex = 5
                    _TextLabel20.Font = Enum.Font.GothamBold
                    _TextLabel20.Text = p734 or 'Auto Fuck'
                    _TextLabel20.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel20.TextScaled = true
                    _TextLabel20.TextSize = 14
                    _TextLabel20.TextWrapped = true
                    _TextLabel20.TextXAlignment = Enum.TextXAlignment.Left
                    _Frame31.Name = 'System'
                    _Frame31.Parent = _Frame30
                    _Frame31.AnchorPoint = Vector2.new(0.5, 0.5)
                    _Frame31.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    _Frame31.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame31.BorderSizePixel = 0
                    _Frame31.Position = UDim2.new(0.0419999994, 0, 0.5, 0)
                    _Frame31.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
                    _Frame31.SizeConstraint = Enum.SizeConstraint.RelativeYY
                    _Frame31.ZIndex = 5
                    _UICorner24.CornerRadius = UDim.new(0, 3)
                    _UICorner24.Parent = _Frame31
                    _ImageLabel13.Name = 'TurnOn'
                    _ImageLabel13.Parent = _Frame31
                    _ImageLabel13.AnchorPoint = Vector2.new(0.5, 0.5)
                    _ImageLabel13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _ImageLabel13.BackgroundTransparency = 1
                    _ImageLabel13.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _ImageLabel13.BorderSizePixel = 0
                    _ImageLabel13.Position = UDim2.new(0.5, 0, 0.5, 0)
                    _ImageLabel13.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
                    _ImageLabel13.ZIndex = 6
                    _ImageLabel13.Image = 'rbxassetid://3944680095'
                    _ImageLabel13.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    _ImageLabel13.ImageTransparency = 1
                    _Frame32.Name = 'Box'
                    _Frame32.Parent = _Frame31
                    _Frame32.AnchorPoint = Vector2.new(0.5, 0.5)
                    _Frame32.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame32.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame32.BorderSizePixel = 0
                    _Frame32.Position = UDim2.new(0.5, 0, 0.5, 0)
                    _Frame32.ZIndex = 5
                    _UIGradient6.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, u492.Config.MainColor),
                        ColorSequenceKeypoint.new(1, u492.Config.DropColor),
                    })
                    _UIGradient6.Rotation = 45
                    _UIGradient6.Parent = _Frame32
                    _UICorner25.CornerRadius = UDim.new(0, 4)
                    _UICorner25.Parent = _Frame32

                    local function u749(p748)
                        if p748 then
                            _TweenService:Create(_ImageLabel13, TweenInfo.new(0.4), {ImageTransparency = 0}):Play()
                            _TweenService:Create(_Frame32, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(1, 1),
                            }):Play()
                            _TweenService:Create(_ImageLabel13, TweenInfo.new(0.55), {
                                ImageColor3 = u492.Config.MainColor,
                            }):Play()
                        else
                            _TweenService:Create(_ImageLabel13, TweenInfo.new(0.4), {ImageTransparency = 1}):Play()
                            _TweenService:Create(_Frame32, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(0, 0),
                            }):Play()
                            _TweenService:Create(_ImageLabel13, TweenInfo.new(0.555), {
                                ImageColor3 = Color3.fromRGB(0, 0, 0),
                            }):Play()
                        end
                    end

                    u749(p735)
                    u496(_Frame30).MouseButton1Click:Connect(function()
                        p735 = not p735

                        u749(p735)

                        if p736 then
                            p736(p735)
                        end
                    end)

                    if p735 == true then
                        p735 = true

                        u749(p735)
                        pcall(p736, p735)
                    end

                    u659:Update()

                    return {
                        Text = function(_, ...)
                            _TextLabel20.Text = tostring(...)
                        end,
                        Value = function(_, p750)
                            p735 = p750

                            u749(p750)

                            if p736 then
                                p736(p735)
                            end
                        end,
                        Delete = function(_)
                            _Frame29:Destroy()
                            u673()
                        end,
                    }
                end
                function u659.MultiDropdown(_, p751, p752, p753, p754)
                    local u755 = p753 or {}
                    local u756 = false
                    local _Frame33 = Instance.new('Frame')
                    local _UICorner26 = Instance.new('UICorner')
                    local _TextLabel21 = Instance.new('TextLabel')
                    local _TextLabel22 = Instance.new('TextLabel')
                    local _ScrollingFrame5 = Instance.new('ScrollingFrame')
                    local _UIListLayout8 = Instance.new('UIListLayout')
                    local _UIPadding2 = Instance.new('UIPadding')
                    local _TextButton5 = Instance.new('TextButton')
                    local _ImageLabel14 = Instance.new('ImageLabel')

                    _Frame33.Name = 'Dropdown'
                    _Frame33.Parent = _Frame16
                    _Frame33.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _Frame33.ClipsDescendants = true
                    _Frame33.Size = UDim2.new(0.94, 0, 0, 30)
                    _Frame33.ZIndex = 6
                    _UICorner26.CornerRadius = UDim.new(0, 3)
                    _UICorner26.Parent = _Frame33
                    _TextLabel22.Name = 'DropTitle1'
                    _TextLabel22.Parent = _Frame33
                    _TextLabel22.BackgroundTransparency = 1
                    _TextLabel22.Size = UDim2.new(0.9, 0, 0, 20)
                    _TextLabel22.Font = Enum.Font.GothamBold
                    _TextLabel22.Text = '  ' .. p751
                    _TextLabel22.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextLabel22.TextSize = 12
                    _TextLabel22.TextXAlignment = Enum.TextXAlignment.Left
                    _TextLabel22.ZIndex = 6
                    _TextLabel21.Name = 'DropTitle'
                    _TextLabel21.Parent = _Frame33
                    _TextLabel21.BackgroundTransparency = 1
                    _TextLabel21.Size = UDim2.new(0.9, 0, 0, 38)
                    _TextLabel21.Font = Enum.Font.GothamBold
                    _TextLabel21.TextColor3 = Color3.fromRGB(190, 190, 190)
                    _TextLabel21.TextSize = 9
                    _TextLabel21.TextXAlignment = Enum.TextXAlignment.Left
                    _TextLabel21.ZIndex = 6
                    _TextLabel21.TextScaled = false
                    _ScrollingFrame5.Name = 'DropScroll'
                    _ScrollingFrame5.Parent = _TextLabel21
                    _ScrollingFrame5.Active = true
                    _ScrollingFrame5.BackgroundTransparency = 1
                    _ScrollingFrame5.Position = UDim2.new(0, 0, 0, 31)
                    _ScrollingFrame5.Size = UDim2.new(0.99, 0, 0, 150)
                    _ScrollingFrame5.CanvasSize = UDim2.new(0, 0, 0, 0)
                    _ScrollingFrame5.ScrollBarThickness = 20
                    _ScrollingFrame5.ZIndex = 6
                    _UIListLayout8.Parent = _ScrollingFrame5
                    _UIListLayout8.SortOrder = Enum.SortOrder.LayoutOrder
                    _UIListLayout8.Padding = UDim.new(0, 5)
                    _UIPadding2.Parent = _ScrollingFrame5
                    _UIPadding2.PaddingLeft = UDim.new(0, 5)
                    _UIPadding2.PaddingTop = UDim.new(0, 5)
                    _ImageLabel14.Name = 'DropImage'
                    _ImageLabel14.Parent = _Frame33
                    _ImageLabel14.BackgroundTransparency = 1
                    _ImageLabel14.Position = UDim2.new(0.9, 0, 0, 6)
                    _ImageLabel14.Rotation = 180
                    _ImageLabel14.Size = UDim2.new(0, 20, 0, 20)
                    _ImageLabel14.Image = 'rbxassetid://10734963191'
                    _ImageLabel14.ZIndex = 6
                    _TextButton5.Name = 'DropButton'
                    _TextButton5.Parent = _Frame33
                    _TextButton5.BackgroundTransparency = 1
                    _TextButton5.Size = UDim2.new(0.95, 0, 0, 31)
                    _TextButton5.Font = Enum.Font.GothamBold
                    _TextButton5.Text = ''
                    _TextButton5.ZIndex = 6

                    local function u766()
                        if #u755 <= 0 then
                            return (not p753 or #p753 <= 0) and '   Select Multiple: ' or '   ' .. 'Select Multiple: ' .. table.concat(p753, ', ')
                        else
                            return '   ' .. 'Select Multiple: ' .. table.concat(u755, ', ')
                        end
                    end

                    local u767

                    if p753 then
                        u755 = p753
                        u767 = u755
                    else
                        u755 = {}
                        u767 = u755
                    end

                    _TextLabel21.Text = u766()

                    local v768, v769, v770 = u484(p752)

                    while true do
                        local u771

                        v770, u771 = v768(v769, v770)

                        if v770 == nil then
                            break
                        end

                        local _TextButton6 = Instance.new('TextButton')
                        local _UICorner27 = Instance.new('UICorner')

                        _TextButton6.Name = 'Item'
                        _TextButton6.Parent = _ScrollingFrame5
                        _TextButton6.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        _TextButton6.Size = UDim2.new(0.99, 0, 0, 20)
                        _TextButton6.Font = Enum.Font.GothamBold
                        _TextButton6.Text = tostring(u771)
                        _TextButton6.TextColor3 = Color3.fromRGB(225, 225, 225)
                        _TextButton6.TextSize = 13
                        _TextButton6.ZIndex = 6
                        _UICorner27.CornerRadius = UDim.new(0, 4)
                        _UICorner27.Parent = _TextButton6

                        if table.find(u767, u771) then
                            _TextButton6.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                        end

                        _TextButton6.MouseButton1Click:Connect(function()
                            if table.find(u767, u771) then
                                table.remove(u767, table.find(u767, u771))

                                _TextButton6.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                            else
                                table.insert(u767, u771)

                                _TextButton6.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
                            end

                            _TextLabel21.Text = u766()

                            p754(u767)
                        end)
                    end

                    _ScrollingFrame5.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout8.AbsoluteContentSize.Y + 5)

                    _TextButton5.MouseButton1Click:Connect(function()
                        if u756 then
                            u756 = false

                            _Frame33:TweenSize(UDim2.new(0.94, 0, 0, 30), 'Out', 'Quad', 0.3, true)

                            _ImageLabel14.Rotation = 180
                        else
                            u756 = true

                            _Frame33:TweenSize(UDim2.new(0.94, 0, 0, 181), 'Out', 'Quad', 0.3, true)

                            _ImageLabel14.Rotation = 0
                        end
                    end)

                    return {
                        Add = function(_, p774)
                            local _TextButton7 = Instance.new('TextButton')
                            local _UICorner28 = Instance.new('UICorner')

                            _TextButton7.Name = 'Item'
                            _TextButton7.Parent = _ScrollingFrame5
                            _TextButton7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                            _TextButton7.Size = UDim2.new(0.99, 0, 0, 20)
                            _TextButton7.Font = Enum.Font.GothamBold
                            _TextButton7.Text = tostring(p774)
                            _TextButton7.TextColor3 = Color3.fromRGB(225, 225, 225)
                            _TextButton7.TextSize = 13
                            _TextButton7.ZIndex = 6
                            _UICorner28.CornerRadius = UDim.new(0, 4)
                            _UICorner28.Parent = _TextButton7

                            _TextButton7.MouseButton1Click:Connect(function()
                                if table.find(u767, p774) then
                                    table.remove(u767, table.find(u767, p774))

                                    _TextButton7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                else
                                    table.insert(u767, p774)

                                    _TextButton7.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                                end

                                _TextLabel21.Text = u766()

                                p754(u767)
                            end)
                        end,
                        Clear = function()
                            u767 = {}
                            _TextLabel21.Text = '   Select Multiple : '

                            local v777, v778, v779 = u484(_ScrollingFrame5:GetChildren())

                            while true do
                                local v780

                                v779, v780 = v777(v778, v779)

                                if v779 == nil then
                                    break
                                end
                                if v780:IsA('TextButton') then
                                    v780.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                end
                            end

                            p754(u767)
                        end,
                    }
                end
                function u659.AddDropdown(_, p781, p782, p783, p784)
                    local _Frame34 = Instance.new('Frame')
                    local _UICorner29 = Instance.new('UICorner')
                    local _UICorner30 = Instance.new('UICorner')
                    local _TextLabel23 = Instance.new('TextLabel')
                    local _ScrollingFrame6 = Instance.new('ScrollingFrame')
                    local _UIListLayout9 = Instance.new('UIListLayout')
                    local _UIPadding3 = Instance.new('UIPadding')
                    local _TextButton8 = Instance.new('TextButton')
                    local _ImageLabel15 = Instance.new('ImageLabel')

                    Instance.new('UIStroke')
                    Instance.new('TextBox')

                    _Frame34.Name = 'Dropdown'
                    _Frame34.Parent = _Frame16
                    _Frame34.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _Frame34.BackgroundTransparency = 0
                    _Frame34.ClipsDescendants = true
                    _Frame34.Size = UDim2.new(0.94, 0, 0, 30)
                    _Frame34.ZIndex = 6

                    local _UIStroke8 = Instance.new('UIStroke')

                    _UIStroke8.Color = Color3.fromRGB(255, 255, 255)
                    _UIStroke8.Thickness = 1
                    _UIStroke8.Transparency = 0.95
                    _UIStroke8.Name = 'UiToggle_UiStroke1'
                    _UIStroke8.Parent = _Frame34
                    _UICorner29.CornerRadius = UDim.new(0, 3)
                    _UICorner29.Parent = _Frame34

                    function getpro()
                        if not p783 then
                            return '   ' .. p781 .. ' : '
                        end
                        if not table.find(p782, p783) then
                            return '   ' .. p781 .. ' : '
                        end

                        p784(p783)

                        return '   ' .. p781 .. ' : ' .. p783
                    end

                    _TextLabel23.Name = 'DropTitle'
                    _TextLabel23.Parent = _Frame34
                    _TextLabel23.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
                    _TextLabel23.BackgroundTransparency = 1
                    _TextLabel23.Size = UDim2.new(0.9, 0, 0, 31)
                    _TextLabel23.Font = Enum.Font.GothamBold
                    _TextLabel23.Text = getpro()
                    _TextLabel23.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextLabel23.TextSize = 12
                    _TextLabel23.TextXAlignment = Enum.TextXAlignment.Left
                    _TextLabel23.ZIndex = 6
                    _ScrollingFrame6.Name = 'DropScroll'
                    _ScrollingFrame6.Parent = _TextLabel23
                    _ScrollingFrame6.Active = true
                    _ScrollingFrame6.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
                    _ScrollingFrame6.BackgroundTransparency = 1
                    _ScrollingFrame6.BorderSizePixel = 0
                    _ScrollingFrame6.Position = UDim2.new(0, 0, 0, 31)
                    _ScrollingFrame6.Size = UDim2.new(0.99, 0, 0, 150)
                    _ScrollingFrame6.CanvasSize = UDim2.new(0, 0, 0, 0)
                    _ScrollingFrame6.ScrollBarThickness = 20
                    _ScrollingFrame6.ZIndex = 6
                    _UIListLayout9.Parent = _ScrollingFrame6
                    _UIListLayout9.SortOrder = Enum.SortOrder.LayoutOrder
                    _UIListLayout9.Padding = UDim.new(0, 5)
                    _UIPadding3.Parent = _ScrollingFrame6
                    _UIPadding3.PaddingLeft = UDim.new(0, 5)
                    _UIPadding3.PaddingTop = UDim.new(0, 5)
                    _ImageLabel15.Name = 'DropImage'
                    _ImageLabel15.Parent = _Frame34
                    _ImageLabel15.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
                    _ImageLabel15.BackgroundTransparency = 1
                    _ImageLabel15.Position = UDim2.new(0.9, 0, 0, 6)
                    _ImageLabel15.Rotation = 180
                    _ImageLabel15.Size = UDim2.new(0, 20, 0, 20)
                    _ImageLabel15.Image = 'rbxassetid://10734963191'
                    _ImageLabel15.ZIndex = 6
                    _TextButton8.Name = 'DropButton'
                    _TextButton8.Parent = _Frame34
                    _TextButton8.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
                    _TextButton8.BackgroundTransparency = 1
                    _TextButton8.Size = UDim2.new(0.95, 0, 0, 31)
                    _TextButton8.Font = Enum.Font.GothamBold
                    _TextButton8.Text = ''
                    _TextButton8.TextColor3 = Color3.fromRGB(0, 0, 0)
                    _TextButton8.TextSize = 14
                    _TextButton8.ZIndex = 6

                    local v795 = next
                    local v796 = nil
                    local u797 = false

                    while true do
                        local v798

                        v796, v798 = v795(p782, v796)

                        if v796 == nil then
                            break
                        end

                        local _TextButton9 = Instance.new('TextButton')

                        _TextButton9.Name = 'Item'
                        _TextButton9.Parent = _ScrollingFrame6
                        _TextButton9.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        _TextButton9.BackgroundTransparency = 0
                        _TextButton9.Size = UDim2.new(0.99, 0, 0, 20)
                        _TextButton9.BorderSizePixel = 0
                        _TextButton9.Font = Enum.Font.GothamBold
                        _TextButton9.Text = tostring(v798)
                        _TextButton9.TextColor3 = Color3.fromRGB(225, 225, 225)
                        _TextButton9.TextSize = 13
                        _TextButton9.TextTransparency = 0
                        _TextButton9.ZIndex = 6
                        _UICorner30.CornerRadius = UDim.new(0, 4)
                        _UICorner30.Parent = _TextButton9

                        _TextButton9.MouseEnter:Connect(function()
                            _TweenService:Create(_TextButton9, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
                        end)
                        _TextButton9.MouseLeave:Connect(function()
                            _TweenService:Create(_TextButton9, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.5}):Play()
                        end)
                        _TextButton9.MouseButton1Click:Connect(function()
                            u797 = false

                            _Frame34:TweenSize(UDim2.new(0.94, 0, 0, 30), 'Out', 'Quad', 0.3, true)
                            _TweenService:Create(_ImageLabel15, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play()
                            p784(_TextButton9.Text)

                            _TextLabel23.Text = '   ' .. p781 .. ' : ' .. _TextButton9.Text
                        end)
                    end

                    _ScrollingFrame6.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout9.AbsoluteContentSize.Y + 500)

                    _TextButton8.MouseButton1Click:Connect(function()
                        if u797 ~= false then
                            u797 = false

                            _Frame34:TweenSize(UDim2.new(0.94, 0, 0, 30), 'Out', 'Quad', 0.3, true)
                            _TweenService:Create(_ImageLabel15, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play()
                        else
                            u797 = true

                            _Frame34:TweenSize(UDim2.new(0.94, 0, 0, 131), 'Out', 'Quad', 0.3, true)
                            _TweenService:Create(_ImageLabel15, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                        end
                    end)

                    return {
                        Add = function(_, p800)
                            local _TextButton10 = Instance.new('TextButton')

                            _TextButton10.Name = 'Item'
                            _TextButton10.Parent = _ScrollingFrame6
                            _TextButton10.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                            _TextButton10.BackgroundTransparency = 0
                            _TextButton10.Size = UDim2.new(0.99, 0, 0, 18)
                            _TextButton10.BorderSizePixel = 0
                            _TextButton10.Font = Enum.Font.GothamBold
                            _TextButton10.Text = tostring(p800)
                            _TextButton10.TextColor3 = Color3.fromRGB(225, 225, 225)
                            _TextButton10.TextSize = 13
                            _TextButton10.TextTransparency = 0
                            _TextButton10.ZIndex = 6

                            local _UICorner31 = Instance.new('UICorner')

                            _UICorner31.CornerRadius = UDim.new(0, 4)
                            _UICorner31.Parent = _TextButton10

                            _TextButton10.MouseEnter:Connect(function()
                                _TweenService:Create(_TextButton10, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
                            end)
                            _TextButton10.MouseLeave:Connect(function()
                                _TweenService:Create(_TextButton10, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.5}):Play()
                            end)
                            _TextButton10.MouseButton1Click:Connect(function()
                                u797 = false

                                _Frame34:TweenSize(UDim2.new(0.94, 0, 0, 31), 'Out', 'Quad', 0.3, true)
                                _TweenService:Create(_ImageLabel15, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play()
                                p784(_TextButton10.Text)

                                _TextLabel23.Text = '   ' .. p781 .. ' : ' .. _TextButton10.Text
                            end)
                        end,
                        Clear = function(_)
                            _TextLabel23.Text = '   Refresh Successfully'
                            _TextLabel23.TextColor3 = Color3.fromRGB(0, 225, 0)

                            wait(0.5)

                            _TextLabel23.Text = tostring('   ' .. p781) .. ' : '
                            _TextLabel23.TextColor3 = Color3.fromRGB(225, 225, 255)
                            u797 = false

                            _Frame34:TweenSize(UDim2.new(0.94, 0, 0, 31), 'Out', 'Quad', 0.3, true)
                            _TweenService:Create(_ImageLabel15, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play()

                            local v803 = next
                            local v804, v805 = _ScrollingFrame6:GetChildren()

                            while true do
                                local v806

                                v805, v806 = v803(v804, v805)

                                if v805 == nil then
                                    break
                                end
                                if v806:IsA('TextButton') then
                                    v806:Destroy()
                                end
                            end
                        end,
                    }
                end
                function u659.Slider(_, p807, p808, p809, p810, p811)
                    local _Frame35 = Instance.new('Frame')
                    local _TextLabel24 = Instance.new('TextLabel')
                    local _Frame36 = Instance.new('Frame')
                    local _TextBox3 = Instance.new('TextBox')
                    local _UICorner32 = Instance.new('UICorner')
                    local _Frame37 = Instance.new('Frame')
                    local _UICorner33 = Instance.new('UICorner')
                    local _Frame38 = Instance.new('Frame')
                    local _UICorner34 = Instance.new('UICorner')
                    local _Frame39 = Instance.new('Frame')
                    local _UICorner35 = Instance.new('UICorner')
                    local v823 = {}

                    _Frame35.Name = 'SliderFrame'
                    _Frame35.Parent = _Frame16
                    _Frame35.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _Frame35.Position = UDim2.new(0.109489053, 0, 0.708609283, 0)
                    _Frame35.Size = UDim2.new(0.94, 0, 0, 40)
                    _Frame35.BackgroundTransparency = 0
                    _Frame35.ZIndex = 16

                    local _UIStroke9 = Instance.new('UIStroke')

                    _UIStroke9.Color = Color3.fromRGB(255, 255, 255)
                    _UIStroke9.Thickness = 1
                    _UIStroke9.Transparency = 0.95
                    _UIStroke9.Name = 'UiToggle_UiStroke1'
                    _UIStroke9.Parent = _Frame35

                    local _UICorner36 = Instance.new('UICorner')

                    _UICorner36.CornerRadius = UDim.new(0, 4)
                    _UICorner36.Parent = _Frame35
                    _TextLabel24.Name = 'LabelNameSlider'
                    _TextLabel24.Parent = _Frame35
                    _TextLabel24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel24.BackgroundTransparency = 1
                    _TextLabel24.Position = UDim2.new(0.0229926974, 0, 0.0396823473, 0)
                    _TextLabel24.Size = UDim2.new(0, 182, 0, 25)
                    _TextLabel24.Font = Enum.Font.GothamBold
                    _TextLabel24.Text = tostring(p807)
                    _TextLabel24.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel24.TextSize = 14
                    _TextLabel24.TextXAlignment = Enum.TextXAlignment.Left
                    _TextLabel24.ZIndex = 16
                    _Frame36.Name = 'ShowValueFrame'
                    _Frame36.Parent = _Frame35
                    _Frame36.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    _Frame36.BackgroundTransparency = 1
                    _Frame36.Position = UDim2.new(0.733576655, 0, 0.0656082779, 0)
                    _Frame36.Size = UDim2.new(0, 58, 0, 21)
                    _Frame36.ZIndex = 16
                    _TextBox3.Name = 'CustomValue'
                    _TextBox3.Parent = _Frame36
                    _TextBox3.AnchorPoint = Vector2.new(0.5, 0.5)
                    _TextBox3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    _TextBox3.Position = UDim2.new(0.7, 0, 0.5, 0)
                    _TextBox3.Size = UDim2.new(0, 55, 0, 21)
                    _TextBox3.Font = Enum.Font.GothamBold
                    _TextBox3.Text = '50'
                    _TextBox3.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextBox3.TextSize = 11
                    _TextBox3.ZIndex = 16
                    _UICorner32.CornerRadius = UDim.new(0, 4)
                    _UICorner32.Name = 'ShowValueFrameUICorner'
                    _UICorner32.Parent = _TextBox3
                    _Frame37.Name = 'ValueFrame'
                    _Frame37.Parent = _Frame35
                    _Frame37.AnchorPoint = Vector2.new(0.5, 0.5)
                    _Frame37.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    _Frame37.Position = UDim2.new(0.5, 0, 0.8, 0)
                    _Frame37.Size = UDim2.new(0.85, 0, 0, 5)
                    _Frame37.ZIndex = 16
                    _UICorner33.CornerRadius = UDim.new(0, 30)
                    _UICorner33.Name = 'ValueFrameUICorner'
                    _UICorner33.Parent = _Frame37
                    _Frame38.Name = 'PartValue'
                    _Frame38.Parent = _Frame37
                    _Frame38.AnchorPoint = Vector2.new(0.5, 0.5)
                    _Frame38.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    _Frame38.BackgroundTransparency = 1
                    _Frame38.Position = UDim2.new(0.5, 0, 0.8, 0)
                    _Frame38.Size = UDim2.new(0.85, 0, 0, 5)
                    _Frame38.ZIndex = 16
                    _UICorner34.CornerRadius = UDim.new(0, 30)
                    _UICorner34.Name = 'PartValueUICorner'
                    _UICorner34.Parent = _Frame38
                    _Frame39.Name = 'MainValue'
                    _Frame39.Parent = _Frame37
                    _Frame39.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    _Frame39.Size = UDim2.new((p810 or 0) / p809, 0, 0, 5)
                    _Frame39.BorderSizePixel = 0
                    _Frame39.ZIndex = 16
                    _UICorner35.CornerRadius = UDim.new(0, 30)
                    _UICorner35.Name = 'MainValueUICorner'
                    _UICorner35.Parent = _Frame39

                    local _Frame40 = Instance.new('Frame')

                    _Frame40.Name = 'ConneValue'
                    _Frame40.Parent = _Frame38
                    _Frame40.AnchorPoint = Vector2.new(0.7, 0.7)
                    _Frame40.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    _Frame40.Position = UDim2.new((p810 or 0) / p809, 0.5, 0.5, 0, 0)
                    _Frame40.Size = UDim2.new(0, 10, 0, 10)
                    _Frame40.BorderSizePixel = 0
                    _Frame40.ZIndex = 16

                    local _UICorner37 = Instance.new('UICorner')

                    _UICorner37.CornerRadius = UDim.new(0, 10)
                    _UICorner37.Parent = _Frame40
                    floor = true

                    if floor ~= true then
                        _TextBox3.Text = tostring(p810 and (math.floor(p810 / p809 * (p809 - p808) + p808) or 0) or 0)
                    else
                        _TextBox3.Text = tostring(p810 and (string.format(p810 / p809 * (p809 - p808) + p808) or 0) or 0)
                    end

                    local function u832(p828)
                        local v829 = UDim2.new(math.clamp((p828.Position.X - _Frame37.AbsolutePosition.X) / _Frame37.AbsoluteSize.X, 0, 1), 0, 0.5, 0)

                        _Frame39:TweenSize(UDim2.new(math.clamp((p828.Position.X - _Frame37.AbsolutePosition.X) / _Frame37.AbsoluteSize.X, 0, 1), 0, 0, 5), 'Out', 'Sine', 0.2, true)
                        _Frame40:TweenPosition(v829, 'Out', 'Sine', 0.2, true)

                        if floor ~= true then
                            local v830 = math.floor(v829.X.Scale * p809 / p809 * (p809 - p808) + p808)

                            _TextBox3.Text = tostring(v830)

                            p811(v830)
                        else
                            local __0f = string.format('%.0f', v829.X.Scale * p809 / p809 * (p809 - p808) + p808)

                            _TextBox3.Text = tostring(__0f)

                            p811(__0f)
                        end
                    end

                    local u833 = false

                    _Frame40.InputBegan:Connect(function(p834)
                        if p834.UserInputType == Enum.UserInputType.MouseButton1 then
                            u833 = true
                        end
                    end)
                    _Frame40.InputEnded:Connect(function(p835)
                        if p835.UserInputType == Enum.UserInputType.MouseButton1 then
                            u833 = false
                        end
                    end)
                    _Frame35.InputBegan:Connect(function(p836)
                        if p836.UserInputType == Enum.UserInputType.MouseButton1 then
                            u833 = true
                        end
                    end)
                    _Frame35.InputEnded:Connect(function(p837)
                        if p837.UserInputType == Enum.UserInputType.MouseButton1 then
                            u833 = false
                        end
                    end)
                    _Frame37.InputBegan:Connect(function(p838)
                        if p838.UserInputType == Enum.UserInputType.MouseButton1 then
                            u833 = true
                        end
                    end)
                    _Frame37.InputEnded:Connect(function(p839)
                        if p839.UserInputType == Enum.UserInputType.MouseButton1 then
                            u833 = false
                        end
                    end)
                    game:GetService('UserInputService').InputChanged:Connect(function(p840)
                        if u833 and p840.UserInputType == Enum.UserInputType.MouseMovement then
                            u832(p840)
                        end
                    end)
                    _TextBox3.FocusLost:Connect(function()
                        if _TextBox3.Text == '' then
                            _TextBox3.Text = p810
                        end
                        if p809 < tonumber(_TextBox3.Text) then
                            _TextBox3.Text = p809
                        end

                        _Frame39:TweenSize(UDim2.new((_TextBox3.Text or 0) / p809, 0, 0, 5), 'Out', 'Sine', 0.2, true)
                        _Frame40:TweenPosition(UDim2.new((_TextBox3.Text or 0) / p809, 0, 0.6, 0), 'Out', 'Sine', 0.2, true)

                        if floor ~= true then
                            local v841 = _TextBox3
                            local v842 = tostring
                            local _Text = _TextBox3.Text

                            if _Text then
                                _Text = math.floor(_TextBox3.Text / p809 * (p809 - p808) + p808)
                            end

                            v841.Text = v842(_Text)
                        else
                            local v844 = _TextBox3
                            local v845 = tostring
                            local _Text2 = _TextBox3.Text

                            if _Text2 then
                                _Text2 = string.format('%.0f', _TextBox3.Text / p809 * (p809 - p808) + p808)
                            end

                            v844.Text = v845(_Text2)
                        end

                        pcall(p811, _TextBox3.Text)
                    end)

                    function v823.Update(_, p847)
                        _Frame39:TweenSize(UDim2.new((p847 or 0) / p809, 0, 0, 5), 'Out', 'Sine', 0.2, true)
                        _Frame40:TweenPosition(UDim2.new((p847 or 0) / p809, 0.5, 0.5, 0, 0), 'Out', 'Sine', 0.2, true)

                        _TextBox3.Text = p847

                        pcall(function()
                            p811(p847)
                        end)
                    end

                    return v823
                end

                local _TweenService2 = game:GetService('TweenService')

                function u659.dROPDS(_, p849, p850, p851, p852)
                    local u853 = {}
                    local _Frame41 = Instance.new('Frame')
                    local _UICorner38 = Instance.new('UICorner')
                    local _Frame42 = Instance.new('Frame')
                    local _UICorner39 = Instance.new('UICorner')
                    local _TextLabel25 = Instance.new('TextLabel')
                    local _ImageButton3 = Instance.new('ImageButton')
                    local _ScrollingFrame7 = Instance.new('ScrollingFrame')
                    local _UIListLayout10 = Instance.new('UIListLayout')
                    local _UIPadding4 = Instance.new('UIPadding')
                    local _TextBox4 = Instance.new('TextBox')

                    _Frame41.Name = 'MainDropDown'
                    _Frame41.Parent = _Frame16
                    _Frame41.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _Frame41.BackgroundTransparency = 0.7
                    _Frame41.BorderSizePixel = 0
                    _Frame41.ClipsDescendants = true
                    _Frame41.Size = UDim2.new(0.94, 0, 0, 30)
                    _Frame41.ZIndex = 16

                    local _UIStroke10 = Instance.new('UIStroke')

                    _UIStroke10.Color = Color3.fromRGB(255, 255, 255)
                    _UIStroke10.Thickness = 1
                    _UIStroke10.Transparency = 0.95
                    _UIStroke10.Name = 'UiToggle_UiStroke1'
                    _UIStroke10.Parent = _Frame41
                    _UICorner38.CornerRadius = UDim.new(0, 4)
                    _UICorner38.Parent = _Frame41
                    _Frame42.Name = 'MainDropDown_2'
                    _Frame42.Parent = _Frame41
                    _Frame42.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _Frame42.BackgroundTransparency = 0.7
                    _Frame42.BorderSizePixel = 0
                    _Frame42.ClipsDescendants = true
                    _Frame42.Size = UDim2.new(1, 0, 0, 30)
                    _Frame42.ZIndex = 16
                    _UICorner39.CornerRadius = UDim.new(0, 4)
                    _UICorner39.Parent = _Frame42

                    function getpro()
                        if not p851 then
                            return p849 .. ' : '
                        end
                        if not table.find(p850, p851) then
                            return p849 .. ' : '
                        end

                        p852(p851)

                        return p849 .. ' : ' .. p851
                    end

                    _TextLabel25.Name = 'Text'
                    _TextLabel25.Parent = _Frame42
                    _TextLabel25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel25.BackgroundTransparency = 1
                    _TextLabel25.Position = UDim2.new(0, 10, 0, 10)
                    _TextLabel25.Size = UDim2.new(0, 62, 0, 12)
                    _TextLabel25.ZIndex = 16
                    _TextLabel25.Font = Enum.Font.GothamBold
                    _TextLabel25.Text = getpro()
                    _TextLabel25.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel25.TextSize = 12
                    _TextLabel25.TextXAlignment = Enum.TextXAlignment.Left
                    _ImageButton3.Parent = _Frame42
                    _ImageButton3.AnchorPoint = Vector2.new(0, 0.5)
                    _ImageButton3.BackgroundTransparency = 1
                    _ImageButton3.Position = UDim2.new(1, -25, 0.5, 0)
                    _ImageButton3.Size = UDim2.new(0, 12, 0, 12)
                    _ImageButton3.ZIndex = 16
                    _ImageButton3.Image = 'http://www.roblox.com/asset/?id=10734963191'
                    _TextBox4.Parent = _Frame41
                    _TextBox4.Size = UDim2.new(1, -20, 0, 30)
                    _TextBox4.PlaceholderText = '  Search...'
                    _TextBox4.TextColor3 = Color3.new(1, 1, 1)
                    _TextBox4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    _TextBox4.BorderSizePixel = 1
                    _TextBox4.Position = UDim2.new(0, 0.5, 0, 35)
                    _TextBox4.ZIndex = 20
                    _TextBox4.Visible = false
                    _TextBox4.Text = ''
                    _TextBox4.BorderSizePixel = 0
                    _TextBox4.ClearTextOnFocus = false
                    _TextBox4.Font = Enum.Font.GothamBold
                    _TextBox4.TextWrapped = true
                    _TextBox4.TextXAlignment = Enum.TextXAlignment.Left
                    _TextBox4.TextSize = 10

                    local _UICorner40 = Instance.new('UICorner')

                    _UICorner40.CornerRadius = UDim.new(0, 4)
                    _UICorner40.Parent = _TextBox4

                    local _UIStroke11 = Instance.new('UIStroke')

                    _UIStroke11.Color = Color3.fromRGB(255, 255, 255)
                    _UIStroke11.Thickness = 1
                    _UIStroke11.Transparency = 0.95
                    _UIStroke11.Name = 'UiToggle_UiStroke1'
                    _UIStroke11.Parent = _TextBox4
                    _ScrollingFrame7.Name = 'Scroll_Items'
                    _ScrollingFrame7.Parent = _Frame41
                    _ScrollingFrame7.Active = true
                    _ScrollingFrame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _ScrollingFrame7.BackgroundTransparency = 1
                    _ScrollingFrame7.BorderSizePixel = 0
                    _ScrollingFrame7.ZIndex = 20
                    _ScrollingFrame7.Position = UDim2.new(0, 0, 0, 70)
                    _ScrollingFrame7.Size = UDim2.new(1, 0, 1, 500)
                    _ScrollingFrame7.ScrollBarThickness = 20
                    _UIListLayout10.Parent = _ScrollingFrame7
                    _UIListLayout10.SortOrder = Enum.SortOrder.LayoutOrder
                    _UIListLayout10.Padding = UDim.new(0, 5)
                    _UIPadding4.Parent = _ScrollingFrame7
                    _UIPadding4.PaddingLeft = UDim.new(0, 10)
                    _UIPadding4.PaddingTop = UDim.new(0, 10)

                    local u867 = false

                    function u853.TogglePanel(_, p868)
                        _TweenService2:Create(_Frame41, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = p868 and UDim2.new(0.92, 0, 0, 300) or UDim2.new(0.92, 0, 0, 30),
                        }):Play()
                        _TweenService2:Create(_ImageButton3, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Rotation = p868 and 180 or 0,
                        }):Play()

                        _TextBox4.Visible = p868
                    end

                    _ImageButton3.MouseButton1Click:Connect(function()
                        u867 = not u867

                        u853:TogglePanel(u867)
                    end)

                    function u853.Add(_, p869)
                        local _TextButton11 = Instance.new('TextButton')
                        local _UICorner41 = Instance.new('UICorner')

                        _TextButton11.Name = p869
                        _TextButton11.Parent = _ScrollingFrame7
                        _TextButton11.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        _TextButton11.BorderSizePixel = 0
                        _TextButton11.ClipsDescendants = true
                        _TextButton11.Size = UDim2.new(1, -10, 0, 25)
                        _TextButton11.ZIndex = 17
                        _TextButton11.AutoButtonColor = false
                        _TextButton11.Font = Enum.Font.GothamBold
                        _TextButton11.Text = p869
                        _TextButton11.TextColor3 = Color3.fromRGB(255, 255, 255)
                        _TextButton11.TextSize = 12
                        _UICorner41.CornerRadius = UDim.new(0, 4)
                        _UICorner41.Parent = _TextButton11

                        function u853.Clear(_)
                            local v872, v873, v874 = u483(_ScrollingFrame7:GetChildren())

                            while true do
                                local v875

                                v874, v875 = v872(v873, v874)

                                if v874 == nil then
                                    break
                                end
                                if v875:IsA('TextButton') then
                                    v875:Destroy()

                                    _TextLabel25.TextColor3 = Color3.fromRGB(0, 255, 0)
                                    _TextLabel25.Text = p849 .. ' : Refresh Succesfully'

                                    wait(0.2)

                                    _TextLabel25.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    _TextLabel25.Text = p849 .. ' : ...'
                                end
                            end
                        end

                        _TextButton11.MouseButton1Click:Connect(function()
                            u867 = false

                            u853:TogglePanel(false)
                            p852(p869)

                            _TextLabel25.Text = p849 .. ' : ' .. p869
                        end)

                        _ScrollingFrame7.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout10.AbsoluteContentSize.Y + 20)
                    end

                    local v876 = _UIListLayout10

                    _UIListLayout10.GetPropertyChangedSignal(v876, 'AbsoluteContentSize'):Connect(function()
                        _ScrollingFrame7.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout10.AbsoluteContentSize.Y + 20)
                    end)

                    local v877, v878, v879 = u484(p850)
                    local u880 = _ScrollingFrame7
                    local u881 = _TextBox4
                    local v882 = u853

                    while true do
                        local v883

                        v879, v883 = v877(v878, v879)

                        if v879 == nil then
                            break
                        end

                        v882:Add(v883)
                    end

                    u881:GetPropertyChangedSignal('Text'):Connect(function()
                        local v884 = string.lower(u881.Text)
                        local v885, v886, v887 = u483(u880:GetChildren())

                        while true do
                            local v888

                            v887, v888 = v885(v886, v887)

                            if v887 == nil then
                                break
                            end
                            if v888:IsA('TextButton') then
                                v888.Visible = string.find(string.lower(v888.Name), v884) ~= nil
                            end
                        end
                    end)

                    return v882
                end
                function u659.Button(_, p889, p890)
                    local u891 = p890 or function() end
                    local _Frame43 = Instance.new('Frame')
                    local _UIAspectRatioConstraint10 = Instance.new('UIAspectRatioConstraint')
                    local _Frame44 = Instance.new('Frame')
                    local _UICorner42 = Instance.new('UICorner')
                    local _UIGradient7 = Instance.new('UIGradient')
                    local _TextLabel26 = Instance.new('TextLabel')

                    _Frame43.Name = 'Button'
                    _Frame43.Parent = _Frame16
                    _Frame43.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame43.BackgroundTransparency = 1
                    _Frame43.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame43.BorderSizePixel = 0
                    _Frame43.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    _Frame43.ZIndex = 5
                    _UIAspectRatioConstraint10.Parent = _Frame43
                    _UIAspectRatioConstraint10.AspectRatio = 11.5
                    _UIAspectRatioConstraint10.AspectType = Enum.AspectType.ScaleWithParentSize
                    _Frame44.Name = 'ButtonMainFrame'
                    _Frame44.Parent = _Frame43
                    _Frame44.AnchorPoint = Vector2.new(0.5, 0)
                    _Frame44.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame44.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame44.BorderSizePixel = 0
                    _Frame44.Position = UDim2.new(0.5, 0, 0, 0)
                    _Frame44.Size = UDim2.new(0.949999988, 0, 1, 0)
                    _Frame44.ZIndex = 6
                    _UICorner42.CornerRadius = UDim.new(0, 3)
                    _UICorner42.Parent = _Frame44
                    _UIGradient7.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, u492.Config.MainColor),
                        ColorSequenceKeypoint.new(1, u492.Config.DropColor),
                    })
                    _UIGradient7.Rotation = 90
                    _UIGradient7.Parent = _Frame44
                    _TextLabel26.Name = 'Text'
                    _TextLabel26.Parent = _Frame44
                    _TextLabel26.AnchorPoint = Vector2.new(0.5, 0.5)
                    _TextLabel26.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel26.BackgroundTransparency = 1
                    _TextLabel26.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextLabel26.BorderSizePixel = 0
                    _TextLabel26.Position = UDim2.new(0.5, 0, 0.5, 0)
                    _TextLabel26.Size = UDim2.new(1, 0, 0.600000024, 0)
                    _TextLabel26.ZIndex = 6
                    _TextLabel26.Font = Enum.Font.GothamBold
                    _TextLabel26.Text = p889 or 'Sea Event'
                    _TextLabel26.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel26.TextScaled = false
                    _TextLabel26.TextSize = 14
                    _TextLabel26.TextWrapped = true

                    local v898 = u496(_Frame44)

                    v898.MouseButton1Down:Connect(function()
                        _TweenService2:Create(_UIGradient7, TweenInfo.new(0.1), {
                            Offset = Vector2.new(0, 1),
                        }):Play()
                    end)
                    v898.MouseButton1Up:Connect(function()
                        _TweenService2:Create(_UIGradient7, TweenInfo.new(0.1), {
                            Offset = Vector2.new(0, 0),
                        }):Play()
                    end)
                    v898.MouseButton1Click:Connect(u891)

                    return {
                        Text = function(_, ...)
                            _TextLabel26.Text = tostring(...)
                        end,
                        Fire = function(_, ...)
                            u891(...)
                        end,
                        Delete = function(_)
                            _Frame43:Destroy()
                            u673()
                        end,
                    }
                end
                function u659.Slider1(_, p899, p900, p901, p902, p903)
                    local u904 = {
                        Min = p900 or 0,
                        Max = p901 or 100,
                    }

                    u904.Default = p902 or u904.Min

                    local u905 = p903 or function() end
                    local _Frame45 = Instance.new('Frame')
                    local _UIAspectRatioConstraint11 = Instance.new('UIAspectRatioConstraint')
                    local _Frame46 = Instance.new('Frame')
                    local _TextLabel27 = Instance.new('TextLabel')
                    local _Frame47 = Instance.new('Frame')
                    local _UICorner43 = Instance.new('UICorner')
                    local _Frame48 = Instance.new('Frame')
                    local _UICorner44 = Instance.new('UICorner')
                    local _Frame49 = Instance.new('Frame')
                    local _UICorner45 = Instance.new('UICorner')
                    local _TextLabel28 = Instance.new('TextLabel')

                    _Frame45.Name = 'Slider'
                    _Frame45.Parent = _Frame16
                    _Frame45.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame45.BackgroundTransparency = 1
                    _Frame45.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame45.BorderSizePixel = 0
                    _Frame45.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    _Frame45.ZIndex = 5
                    _UIAspectRatioConstraint11.Parent = _Frame45
                    _UIAspectRatioConstraint11.AspectRatio = 12
                    _UIAspectRatioConstraint11.AspectType = Enum.AspectType.ScaleWithParentSize
                    _Frame46.Name = 'MainFrame'
                    _Frame46.Parent = _Frame45
                    _Frame46.AnchorPoint = Vector2.new(0.5, 0)
                    _Frame46.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame46.BackgroundTransparency = 1
                    _Frame46.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame46.BorderSizePixel = 0
                    _Frame46.Position = UDim2.new(0.5, 0, 0, 0)
                    _Frame46.Size = UDim2.new(0.949999988, 0, 1, 0)
                    _Frame46.ZIndex = 6
                    _TextLabel27.Name = 'Text'
                    _TextLabel27.Parent = _Frame46
                    _TextLabel27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel27.BackgroundTransparency = 1
                    _TextLabel27.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextLabel27.BorderSizePixel = 0
                    _TextLabel27.Position = UDim2.new(0.00999999978, 0, 0, 0)
                    _TextLabel27.Size = UDim2.new(0.959999979, 0, 0.5, 0)
                    _TextLabel27.ZIndex = 6
                    _TextLabel27.Font = Enum.Font.GothamBold
                    _TextLabel27.Text = p899 or 'Slider'
                    _TextLabel27.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel27.TextScaled = true
                    _TextLabel27.TextSize = 14
                    _TextLabel27.TextWrapped = true
                    _TextLabel27.TextXAlignment = Enum.TextXAlignment.Left
                    _Frame47.Name = 'System'
                    _Frame47.Parent = _Frame46
                    _Frame47.AnchorPoint = Vector2.new(0.5, 0.5)
                    _Frame47.BackgroundColor3 = Color3.fromRGB(76, 81, 82)
                    _Frame47.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame47.BorderSizePixel = 0
                    _Frame47.Position = UDim2.new(0.5, 0, 0.699999988, 0)
                    _Frame47.Size = UDim2.new(0.970000029, 0, 0.194999993, 0)
                    _Frame47.ZIndex = 6
                    _UICorner43.CornerRadius = UDim.new(1, 0)
                    _UICorner43.Parent = _Frame47
                    _Frame48.Name = 'Slide'
                    _Frame48.Parent = _Frame47
                    _Frame48.BackgroundColor3 = u492.Config.MainColor
                    _Frame48.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame48.BorderSizePixel = 0
                    _Frame48.Size = UDim2.new(0.100000001, 0, 1, 0)
                    _Frame48.ZIndex = 8
                    _UICorner44.CornerRadius = UDim.new(1, 0)
                    _UICorner44.Parent = _Frame48
                    _Frame49.Name = 'Control'
                    _Frame49.Parent = _Frame48
                    _Frame49.AnchorPoint = Vector2.new(0.5, 0.5)
                    _Frame49.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame49.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame49.BorderSizePixel = 0
                    _Frame49.Position = UDim2.new(1, 0, 0.5, 0)
                    _Frame49.Size = UDim2.new(1.64999998, 0, 2.6500001, 0)
                    _Frame49.SizeConstraint = Enum.SizeConstraint.RelativeYY
                    _Frame49.ZIndex = 8
                    _UICorner45.CornerRadius = UDim.new(0.5, 0)
                    _UICorner45.Parent = _Frame49
                    _TextLabel28.Name = 'ValueText'
                    _TextLabel28.Parent = _Frame46
                    _TextLabel28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel28.BackgroundTransparency = 1
                    _TextLabel28.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextLabel28.BorderSizePixel = 0
                    _TextLabel28.Position = UDim2.new(0.6910429, 0, 0, 0)
                    _TextLabel28.Size = UDim2.new(0.27895698, 0, 0, 0)
                    _TextLabel28.ZIndex = 6
                    _TextLabel28.Font = Enum.Font.GothamBold
                    _TextLabel28.Text = tostring(u904.Default) .. tostring(u904.VALUE)
                    _TextLabel28.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel28.TextScaled = true
                    _TextLabel28.TextSize = 14
                    _TextLabel28.TextWrapped = true
                    _TextLabel28.TextXAlignment = Enum.TextXAlignment.Right
                    _TextLabel28.TextTransparency = 1

                    _TweenService2:Create(_Frame48, TweenInfo.new(0.1), {
                        Size = UDim2.fromScale(u904.Default / u904.Max, 1),
                    }):Play()

                    local u917 = false

                    local function u922(p918)
                        local v919 = math.clamp((p918.Position.X - _Frame47.AbsolutePosition.X) / _Frame47.AbsoluteSize.X, 0, 1)
                        local v920 = math.floor((u904.Max - u904.Min) * v919 + u904.Min)
                        local v921 = UDim2.fromScale(v919, 1)

                        _TextLabel28.Text = tostring(v920) .. tostring(u904.VALUE)

                        _TweenService2:Create(_Frame48, TweenInfo.new(0.1), {Size = v921}):Play()
                        u905(v920)
                    end

                    _Frame46.InputBegan:Connect(function(p923)
                        if p923.UserInputType == Enum.UserInputType.MouseButton1 or p923.UserInputType == Enum.UserInputType.Touch then
                            u917 = true

                            _TweenService2:Create(_TextLabel28, TweenInfo.new(0.1), {
                                Size = UDim2.new(0.27895698, 0, 0.5, 0),
                                TextTransparency = 0.1,
                            }):Play()
                            u922(p923)
                        end
                    end)
                    _Frame46.InputEnded:Connect(function(p924)
                        if p924.UserInputType == Enum.UserInputType.MouseButton1 or p924.UserInputType == Enum.UserInputType.Touch then
                            u917 = false
                        end
                    end)
                    _UserInputService2.InputChanged:Connect(function(p925)
                        if u917 and (p925.UserInputType == Enum.UserInputType.MouseMovement or p925.UserInputType == Enum.UserInputType.Touch) then
                            u922(p925)
                        end
                    end)

                    return {
                        Text = function(_, ...)
                            _TextLabel27.Text = tostring(...)
                        end,
                        Value = function(_, p926)
                            _TextLabel28.Text = tostring(p926) .. tostring(u904.VALUE)

                            u905(p926)
                        end,
                        Fire = function(_, ...)
                            u905(...)
                        end,
                        Delete = function(_)
                            _TextButton2:Destroy()
                            u673()
                        end,
                    }
                end
                function u659.Dropdown1(_, p927, _, p928, p929)
                    local _Frame50 = Instance.new('Frame')
                    local _UIAspectRatioConstraint12 = Instance.new('UIAspectRatioConstraint')
                    local _TextLabel29 = Instance.new('TextLabel')
                    local _UIAspectRatioConstraint13 = Instance.new('UIAspectRatioConstraint')
                    local _UIListLayout11 = Instance.new('UIListLayout')
                    local _Frame51 = Instance.new('Frame')
                    local _UIStroke12 = Instance.new('UIStroke')
                    local _UIGradient8 = Instance.new('UIGradient')
                    local _UICorner46 = Instance.new('UICorner')
                    local _Frame52 = Instance.new('Frame')
                    local _UIAspectRatioConstraint14 = Instance.new('UIAspectRatioConstraint')
                    local _ImageLabel16 = Instance.new('ImageLabel')
                    local _TextLabel30 = Instance.new('TextLabel')
                    local _UIGradient9 = Instance.new('UIGradient')
                    local _UIListLayout12 = Instance.new('UIListLayout')
                    local _ScrollingFrame8 = Instance.new('ScrollingFrame')
                    local _UIAspectRatioConstraint15 = Instance.new('UIAspectRatioConstraint')
                    local _UIListLayout13 = Instance.new('UIListLayout')
                    local u948 = p929 or function() end

                    u502(_ScrollingFrame8)

                    local function u955(p949)
                        if typeof(p949) ~= 'table' then
                            return tostring(Default or 'None')
                        end

                        local v950, v951, v952 = u484(p949)
                        local v953 = ''

                        while true do
                            local v954

                            v952, v954 = v950(v951, v952)

                            if v952 == nil then
                                break
                            end

                            v953 = v953 .. ' ' .. tostring(v954) .. ' ,'
                        end

                        return v953:sub(0, #v953 - 1)
                    end

                    _Frame50.Name = 'Dropdown'
                    _Frame50.Parent = _Frame16
                    _Frame50.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame50.BackgroundTransparency = 1
                    _Frame50.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame50.BorderSizePixel = 0
                    _Frame50.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    _Frame50.ZIndex = 5
                    _UIAspectRatioConstraint12.Parent = _Frame50
                    _UIAspectRatioConstraint12.AspectRatio = 6.5
                    _UIAspectRatioConstraint12.AspectType = Enum.AspectType.ScaleWithParentSize
                    _TextLabel29.Name = 'Text'
                    _TextLabel29.Parent = _Frame50
                    _TextLabel29.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel29.BackgroundTransparency = 1
                    _TextLabel29.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextLabel29.BorderSizePixel = 0
                    _TextLabel29.Size = UDim2.new(0.959999979, 0, 0.5, 0)
                    _TextLabel29.ZIndex = 6
                    _TextLabel29.Font = Enum.Font.GothamBold
                    _TextLabel29.Text = p927 or 'Select Gays'
                    _TextLabel29.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel29.TextScaled = true
                    _TextLabel29.TextSize = 14
                    _TextLabel29.TextWrapped = true
                    _TextLabel29.TextXAlignment = Enum.TextXAlignment.Left
                    _UIAspectRatioConstraint13.Parent = _TextLabel29
                    _UIAspectRatioConstraint13.AspectRatio = 22
                    _UIAspectRatioConstraint13.AspectType = Enum.AspectType.ScaleWithParentSize
                    _UIListLayout11.Parent = _Frame50
                    _UIListLayout11.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    _UIListLayout11.SortOrder = Enum.SortOrder.LayoutOrder
                    _UIListLayout11.Padding = UDim.new(0, 3)
                    _Frame51.Name = 'DropFrame'
                    _Frame51.Parent = _Frame50
                    _Frame51.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                    _Frame51.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame51.BorderSizePixel = 0
                    _Frame51.ClipsDescendants = true
                    _Frame51.Position = UDim2.new(0.0200000405, 0, 0.373297691, 0)
                    _Frame51.Size = UDim2.new(0.959999979, 0, 0.550000012, 0)
                    _Frame51.ZIndex = 6
                    _UIStroke12.Color = Color3.fromRGB(37, 37, 37)
                    _UIStroke12.Parent = _Frame51
                    _UIGradient8.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.68),
                        NumberSequenceKeypoint.new(0.2, 0),
                        NumberSequenceKeypoint.new(0.8, 0),
                        NumberSequenceKeypoint.new(1, 0.67),
                    })
                    _UIGradient8.Parent = _UIStroke12
                    _UICorner46.CornerRadius = UDim.new(0, 2)
                    _UICorner46.Parent = _Frame51
                    _Frame52.Name = 'Header'
                    _Frame52.Parent = _Frame51
                    _Frame52.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame52.BackgroundTransparency = 1
                    _Frame52.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame52.BorderSizePixel = 0
                    _Frame52.Size = UDim2.new(0.925000012, 0, 1, 0)
                    _Frame52.ZIndex = 7
                    _UIAspectRatioConstraint14.Parent = _Frame52
                    _UIAspectRatioConstraint14.AspectRatio = 12
                    _UIAspectRatioConstraint14.AspectType = Enum.AspectType.ScaleWithParentSize
                    _ImageLabel16.Name = 'Icon'
                    _ImageLabel16.Parent = _Frame52
                    _ImageLabel16.AnchorPoint = Vector2.new(0.5, 0.5)
                    _ImageLabel16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _ImageLabel16.BackgroundTransparency = 1
                    _ImageLabel16.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _ImageLabel16.BorderSizePixel = 0
                    _ImageLabel16.Position = UDim2.new(0.939999998, 0, 0.5, 0)
                    _ImageLabel16.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
                    _ImageLabel16.SizeConstraint = Enum.SizeConstraint.RelativeYY
                    _ImageLabel16.ZIndex = 7
                    _ImageLabel16.Image = 'rbxassetid://7733717447'
                    _TextLabel30.Name = 'SelectText'
                    _TextLabel30.Parent = _Frame52
                    _TextLabel30.AnchorPoint = Vector2.new(0.5, 0.5)
                    _TextLabel30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel30.BackgroundTransparency = 1
                    _TextLabel30.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _TextLabel30.BorderSizePixel = 0
                    _TextLabel30.Position = UDim2.new(0.437301666, 0, 0.499999493, 0)
                    _TextLabel30.Size = UDim2.new(0.864019156, 0, 0.550000012, 0)
                    _TextLabel30.ZIndex = 8
                    _TextLabel30.Font = Enum.Font.GothamBold
                    _TextLabel30.Text = u955(Default or 'None')
                    _TextLabel30.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel30.TextScaled = true
                    _TextLabel30.TextSize = 14
                    _TextLabel30.TextTransparency = 0.5
                    _TextLabel30.TextWrapped = true
                    _TextLabel30.TextXAlignment = Enum.TextXAlignment.Left
                    _UIGradient9.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.9, 0),
                        NumberSequenceKeypoint.new(1, 1),
                    })
                    _UIGradient9.Parent = _TextLabel30
                    _UIListLayout12.Parent = _Frame51
                    _UIListLayout12.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    _UIListLayout12.SortOrder = Enum.SortOrder.LayoutOrder
                    _UIListLayout12.Padding = UDim.new(0, 3)
                    _ScrollingFrame8.Parent = _Frame51
                    _ScrollingFrame8.Active = true
                    _ScrollingFrame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _ScrollingFrame8.BackgroundTransparency = 1
                    _ScrollingFrame8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _ScrollingFrame8.BorderSizePixel = 0
                    _ScrollingFrame8.Size = UDim2.new(1, 0, 5.6500001, 0)
                    _ScrollingFrame8.ZIndex = 6
                    _ScrollingFrame8.ScrollBarThickness = 0
                    _UIAspectRatioConstraint15.Parent = _ScrollingFrame8
                    _UIAspectRatioConstraint15.AspectRatio = 1.95
                    _UIAspectRatioConstraint15.AspectType = Enum.AspectType.ScaleWithParentSize
                    _UIListLayout13.Parent = _ScrollingFrame8
                    _UIListLayout13.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    _UIListLayout13.SortOrder = Enum.SortOrder.LayoutOrder
                    _UIListLayout13.Padding = UDim.new(0, 3)

                    _UIAspectRatioConstraint12:GetPropertyChangedSignal('AspectRatio'):Connect(u673)
                    _Frame51:GetPropertyChangedSignal('Size'):Connect(function()
                        if _Frame51.Size.Y.Scale < 0.85 then
                            _ScrollingFrame8.Visible = false
                        else
                            _ScrollingFrame8.Visible = true
                        end
                    end)

                    local function u957(p956)
                        if p956 then
                            _TweenService2:Create(_UIAspectRatioConstraint12, TweenInfo.new(0.3), {AspectRatio = 1.5}):Play()
                            _TweenService2:Create(_Frame51, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(0.96, 0.9),
                            }):Play()
                            _TweenService2:Create(_ImageLabel16, TweenInfo.new(0.3), {
                                ImageColor3 = u492.Config.MainColor,
                                Size = UDim2.new(0.959999976, 0, 0.959999976, 0),
                            }):Play()
                        else
                            _TweenService2:Create(_UIAspectRatioConstraint12, TweenInfo.new(0.3), {AspectRatio = 6.5}):Play()
                            _TweenService2:Create(_Frame51, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(0.96, 0.55),
                            }):Play()
                            _TweenService2:Create(_ImageLabel16, TweenInfo.new(0.3), {
                                ImageColor3 = Color3.fromRGB(255, 255, 255),
                                Size = UDim2.new(0.899999976, 0, 0.899999976, 0),
                            }):Play()
                        end
                    end

                    u957(false)

                    local v958 = {}
                    local u959 = false
                    local u960 = typeof(v958) ~= 'table' and {v958} or v958

                    local function u974(p961)
                        local _Frame53 = Instance.new('Frame')
                        local _UIAspectRatioConstraint16 = Instance.new('UIAspectRatioConstraint')
                        local _Frame54 = Instance.new('Frame')
                        local _UICorner47 = Instance.new('UICorner')
                        local _TextLabel31 = Instance.new('TextLabel')
                        local _Frame55 = Instance.new('Frame')
                        local _UICorner48 = Instance.new('UICorner')
                        local _ImageLabel17 = Instance.new('ImageLabel')
                        local _Frame56 = Instance.new('Frame')
                        local _UIGradient10 = Instance.new('UIGradient')
                        local _UICorner49 = Instance.new('UICorner')

                        _Frame53.Name = 'DropdownObject'
                        _Frame53.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        _Frame53.BackgroundTransparency = 1
                        _Frame53.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        _Frame53.BorderSizePixel = 0
                        _Frame53.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                        _Frame53.ZIndex = 5
                        _UIAspectRatioConstraint16.Parent = _Frame53
                        _UIAspectRatioConstraint16.AspectRatio = 11.5
                        _UIAspectRatioConstraint16.AspectType = Enum.AspectType.ScaleWithParentSize
                        _Frame54.Name = 'MainFrame'
                        _Frame54.Parent = _Frame53
                        _Frame54.AnchorPoint = Vector2.new(0.5, 0)
                        _Frame54.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        _Frame54.BackgroundTransparency = 1
                        _Frame54.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        _Frame54.BorderSizePixel = 0
                        _Frame54.Position = UDim2.new(0.409999996, 0, 0, 0)
                        _Frame54.Size = UDim2.new(0.800000012, 0, 1, 0)
                        _Frame54.ZIndex = 6
                        _UICorner47.CornerRadius = UDim.new(0, 3)
                        _UICorner47.Parent = _Frame54
                        _TextLabel31.Name = 'Text'
                        _TextLabel31.Parent = _Frame54
                        _TextLabel31.AnchorPoint = Vector2.new(0.5, 0.5)
                        _TextLabel31.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        _TextLabel31.BackgroundTransparency = 1
                        _TextLabel31.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        _TextLabel31.BorderSizePixel = 0
                        _TextLabel31.Position = UDim2.new(0.75, 0, 0.5, 0)
                        _TextLabel31.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
                        _TextLabel31.ZIndex = 6
                        _TextLabel31.Font = Enum.Font.GothamBold
                        _TextLabel31.Text = tostring(p961)
                        _TextLabel31.TextColor3 = Color3.fromRGB(255, 255, 255)
                        _TextLabel31.TextScaled = true
                        _TextLabel31.TextSize = 14
                        _TextLabel31.TextWrapped = true
                        _TextLabel31.TextXAlignment = Enum.TextXAlignment.Left
                        _Frame55.Name = 'System'
                        _Frame55.Parent = _Frame54
                        _Frame55.AnchorPoint = Vector2.new(0.5, 0.5)
                        _Frame55.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        _Frame55.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        _Frame55.BorderSizePixel = 0
                        _Frame55.Position = UDim2.new(0.109999999, 0, 0.5, 0)
                        _Frame55.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
                        _Frame55.SizeConstraint = Enum.SizeConstraint.RelativeYY
                        _Frame55.ZIndex = 6
                        _UICorner48.CornerRadius = UDim.new(0, 3)
                        _UICorner48.Parent = _Frame55
                        _ImageLabel17.Name = 'TurnOn'
                        _ImageLabel17.Parent = _Frame55
                        _ImageLabel17.AnchorPoint = Vector2.new(0.5, 0.5)
                        _ImageLabel17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        _ImageLabel17.BackgroundTransparency = 1
                        _ImageLabel17.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        _ImageLabel17.BorderSizePixel = 0
                        _ImageLabel17.Position = UDim2.new(0.5, 0, 0.5, 0)
                        _ImageLabel17.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
                        _ImageLabel17.ZIndex = 7
                        _ImageLabel17.Image = 'rbxassetid://3944680095'
                        _ImageLabel17.ImageColor3 = Color3.fromRGB(0, 0, 0)
                        _ImageLabel17.ImageTransparency = 1
                        _Frame56.Name = 'Box'
                        _Frame56.Parent = _Frame55
                        _Frame56.AnchorPoint = Vector2.new(0.5, 0.5)
                        _Frame56.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        _Frame56.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        _Frame56.BorderSizePixel = 0
                        _Frame56.Position = UDim2.new(0.5, 0, 0.5, 0)
                        _Frame56.ZIndex = 6
                        _UIGradient10.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, u492.Config.MainColor),
                            ColorSequenceKeypoint.new(1, u492.Config.DropColor),
                        })
                        _UIGradient10.Rotation = 45
                        _UIGradient10.Parent = _Frame56
                        _UICorner49.CornerRadius = UDim.new(0, 4)
                        _UICorner49.Parent = _Frame56

                        return _Frame53, function(p973)
                            if p973 then
                                _TweenService2:Create(_ImageLabel17, TweenInfo.new(0.4), {ImageTransparency = 0}):Play()
                                _TweenService2:Create(_Frame56, TweenInfo.new(0.3), {
                                    Size = UDim2.fromScale(1, 1),
                                }):Play()
                                _TweenService2:Create(_ImageLabel17, TweenInfo.new(0.55), {
                                    ImageColor3 = u492.Config.MainColor,
                                }):Play()
                            else
                                _TweenService2:Create(_ImageLabel17, TweenInfo.new(0.4), {ImageTransparency = 1}):Play()
                                _TweenService2:Create(_Frame56, TweenInfo.new(0.3), {
                                    Size = UDim2.fromScale(0, 0),
                                }):Play()
                                _TweenService2:Create(_ImageLabel17, TweenInfo.new(0.555), {
                                    ImageColor3 = Color3.fromRGB(0, 0, 0),
                                }):Play()
                            end
                        end
                    end
                    local function u991()
                        local v975, v976, v977 = u484(_ScrollingFrame8:GetChildren())

                        while true do
                            local v978

                            v977, v978 = v975(v976, v977)

                            if v977 == nil then
                                break
                            end
                            if v978:IsA('Frame') then
                                v978:Destroy()
                            end
                        end

                        _ScrollingFrame8:SetAttribute('Key', tostring(math.random(1, 1000)))

                        local v979, v980, v981 = u483(DropdownInfo)

                        while true do
                            local u982

                            v981, u982 = v979(v980, v981)

                            if v981 == nil then
                                break
                            end

                            local v983, u984 = u974(tostring(u982))
                            local u985 = false
                            local u986 = 0

                            v983.Parent = _ScrollingFrame8

                            if v981 == Default or u982 == Default then
                                u984(true)
                                table.insert(u960, u982)

                                u985 = true
                            else
                                u984(false)
                            end

                            u496(v983).MouseButton1Click:Connect(function()
                                u985 = not u985

                                if u985 then
                                    if p928 < #u960 + 1 then
                                        u985 = not u985

                                        return
                                    end
                                    if not table.find(u960, u982) then
                                        table.insert(u960, u982)

                                        u986 = #u960
                                    end
                                else
                                    local v987, v988, v989 = u484(u960)

                                    while true do
                                        local v990

                                        v989, v990 = v987(v988, v989)

                                        if v989 == nil then
                                            break
                                        end
                                        if v990 == u982 then
                                            table.remove(u960, v989)
                                        end
                                    end
                                end

                                u984(u985)

                                _TextLabel30.Text = u955(u960)

                                u948(u960, u982)
                            end)
                        end
                    end

                    u991()
                    u496(_Frame52).MouseButton1Click:Connect(function()
                        u959 = not u959

                        u957(u959)
                    end)

                    return {
                        Text = function(_, ...)
                            _TextLabel29.Text = tostring(...)
                        end,
                        Refresh = function(_, p992)
                            DropdownInfo = p992

                            u991()
                        end,
                        Fire = function(_, ...)
                            u948(...)
                        end,
                        Delete = function(_)
                            _TextButton2:Destroy()
                            u673()
                        end,
                    }
                end

                return u659
            end

            return v630
        end

        return u576
    end

    return u511
end

local v993 = identifyexecutor()
local v994 = v993 == 'Solara' and 'Solara - Some functions may not work like fast attack etc..' or v993

name = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name

loadstring(game:HttpGet('https://raw.githubusercontent.com/UnknownScri/Script/refs/heads/main/testing'))()

_G.Title = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name

local v995 = u492:NewWindow('', 'Executor : ' .. v994, 'rbxassetid://119522694447910'):AddMenu('', 'Game : ' .. name .. '   Version : PREMUIM', 'ticket', 'tab')
local _ConfigsFarm = v995:AddTab('Configs Farm', 10734950020, 'distance,bringmob')
local _MainFarm = v995:AddTab('Main Farm', 6035153656, 'farm,bossess,etc.')
local _HalloweenEvent = v995:AddTab('Halloween Event', 6034467796, 'farm,bossess,etc.')
local _WorldBosses = v995:AddTab('World Bosses', 15557776256, 'farm,bossess,etc.')
local _SeaEvent = v995:AddTab('Sea Event', 6034754442, 'farm,bossess,etc.')
local _LocalPlayer4 = v995:AddTab('Local Player', 14477563495, 'auto stats melee,sword,fruit')
local _TravelSeas = v995:AddTab('Travel Seas', 14477598542, 'teleport sea,hop')
local _Shops = v995:AddTab('Shops', 14477621526, 'auto buy sword,fruit')
local _Dungeon = v995:AddTab('Dungeon', 14477517268, 'auto raid,autoskill')
local _Misc = v995:AddTab('Misc', 14477663692, 'other,config')
local v1006 = _LocalPlayer4:AddSection('', 'Auto Stats', 'auto add melee,fruit,sword stats', 'rbxassetid://14477563495')
local v1007 = _LocalPlayer4:AddSection('', 'Player Combat', 'auto kill player,spectate etc..', 'rbxassetid://14477563495')
local v1008 = _TravelSeas:AddSection('', 'World', 'travel first, second, third sea', 'rbxassetid://14477598542')
local v1009 = _TravelSeas:AddSection('', 'Seas', 'travel island and npc in any sea', 'rbxassetid://14477598542')
local v1010 = _Shops:AddSection('', 'Fruit Shop', 'auto buy key, auto open,', 'rbxassetid://14477621526')
local v1011 = _Shops:AddSection('', 'Others', 'auto teleport to abilities shops', 'rbxassetid://14477621526')
local v1012 = _Dungeon:AddSection('', 'Auto Raid', 'auto farm raid, auto kill mob', 'rbxassetid://14477517268')
local v1013 = _Misc:AddSection('', 'Misc', 'Bost fps,hide ui,destroy', 'rbxassetid://14477663692')
local v1014 = _Misc:AddSection('', 'Esp', 'esp player, islands, ghostship,etc..', 'rbxassetid://14477663692')
local _Players2 = game:GetService('Players')
local _LocalPlayer5 = _Players2.LocalPlayer
local _ = script.Parent
local _, _ = _Players2:GetUserThumbnailAsync(_LocalPlayer5.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
local u1017 = nil

function Toggle(p1018, p1019, ...)
    local v1021, v1021 = ...
    local v1022

    if v1021 or type(v1021) ~= 'function' then
        v1022 = v1021
    else
        v1022 = nil
    end

    local u1023 = v1022 or ...

    return p1019:AddToggle(p1018, _G.Settings[u1023], v1021 or function(p1024)
        _G.Settings[u1023] = p1024

        SaveSettings()

        u1017 = task.spawn(u295[u1023])

        if not p1024 and u1017 then
            task.cancel(u1017)

            NeedNoClip = false
        end
    end)
end
function Dropdown(p1025, p1026, p1027, ...)
    local v1028, v1029 = ...

    if not v1029 and type(v1028) == 'function' then
        v1028 = nil
    end

    local u1030 = v1028 or ...

    return p1027:AddDropdown(p1025, p1026, _G.Settings[u1030], function(p1031)
        _G.Settings[u1030] = p1031

        SaveSettings()
    end)
end
function AddMultiDropdown(p1032, p1033, p1034, ...)
    local v1035, v1036 = ...

    if not v1036 and type(v1035) == 'function' then
        v1035 = nil
    end

    local u1037 = v1035 or ...

    return p1034:MultiDropdown(p1032, _G.Settings[u1037], p1033, function(p1038)
        _G.Settings[u1037] = p1038

        SaveSettings()
    end)
end
function Label(p1039, p1040, p1041)
    if p1041 then
        return p1040:AddLabel(p1039)
    else
        return p1040:AddLabel(Name)
    end
end

LoadSettings()

local v1042 = _MainFarm:AddSection('', 'Main Farming', 'auto farm leve, materials, auto 1/2 sea', 'rbxassetid://10734975692')
local _AutoFarmingInactive = v1042:AddLabel('Auto Farming: Inactive')
local _QuestNA = v1042:AddLabel('Quest: N/A')
local _HealthNA = v1042:AddLabel('Health: N/A')

local function u1046()
    if _AutoFarmingInactive then
        _AutoFarmingInactive:Set(_G.LabelAutoFarm or 'Auto Farming: Inactive')
    end
    if _QuestNA then
        _QuestNA:Set(_G.Questname)
    end
    if _HealthNA then
        _HealthNA:Set(_G.LabelHealth or 'Health: N/A')
    end
end

task.spawn(function()
    while task.wait(0.5) do
        u1046()
    end
end)

local function u1050(p1047)
    local _LocalPlayer6 = game.Players.LocalPlayer

    if _LocalPlayer6 and (_LocalPlayer6.Backpack and _LocalPlayer6.Character) and _LocalPlayer6.Character:FindFirstChild('Humanoid') then
        local v1049 = _LocalPlayer6.Backpack:FindFirstChild(p1047)

        if v1049 then
            _LocalPlayer6.Character.Humanoid:EquipTool(v1049)
        else
            warn('Tool not found in Backpack: ' .. p1047)
        end
    else
        warn('Player, Character, or Humanoid not available.')
    end
end

Toggle('Auto Farm Level', v1042, 'Auto_Farm_Level1')
Toggle('Auto Farm Near', v1042, 'Auto_Farm_Nearest_Mob')

if Sea1 then
    Toggle('Auto Second Sea [Lv. 2250]', v1042, 'Auto_Sea21')
elseif Sea2 then
    Toggle('Auto Third World [Lv. 4000]', v1042, 'Auto_Sea31')
    Toggle('Auto Haki V2', v1042, 'auto_hakiv2')
    Toggle('Auto Observation V2', v1042, 'AUTOOBSERVE2')
end

v1042:AddSeperator('Boss Farm')
v1042:AddDropdown('Select Boss', v451, '', function(p1051)
    selectedBoss = p1051
end)
Toggle('Auto Farm Boss', v1042, 'autofarmbosses')
v1042:AddSeperator('Material Farm')
v1042:AddDropdown('Select Material', v449, '', function(p1052)
    SelectMaterial = p1052

    MaterialMon()
end)
Toggle('Auto Farm Materials', v1042, 'AutoFarmMaterial')
v1042:AddSeperator('Accessories')

local v1053, v1054, v1055 = u484(game:GetService('Players').LocalPlayer:WaitForChild('Accessories'):GetChildren())
local v1056 = {}

while true do
    local v1057

    v1055, v1057 = v1053(v1054, v1055)

    if v1055 == nil then
        break
    end

    table.insert(v1056, v1057.Name)
end

v1042:AddDropdown('Select Accessory', v1056, '', function(p1058)
    _G.selectedAccessory = p1058
end)
v1042:AddToggle('Auto Equip Selected Accessory', _G.autoEquipAccessory, function(p1059)
    _G.autoEquipAccessory = p1059

    if p1059 then
        spawn(function()
            while _G.autoEquipAccessory do
                if _G.selectedAccessory then
                    local v1060 = {
                        _G.selectedAccessory,
                    }

                    game:GetService('ReplicatedStorage'):WaitForChild('Chest'):WaitForChild('Remotes'):WaitForChild('Functions'):WaitForChild('AccessoryEq'):InvokeServer(unpack(v1060))
                end

                wait(1)
            end
        end)
    end
end)
v1042:AddSeperator('Passive Tree')

local u1061 = v1042:AddLabel('Status : ' .. _G.redcircle)

task.spawn(function()
    while true do
        task.wait(1)

        local _NPC = game:GetService('ReplicatedStorage'):FindFirstChild('NPC')

        if _NPC then
            _NPC = game:GetService('ReplicatedStorage').NPC:FindFirstChild('PassiveTree')
        end
        if _NPC then
            u1061:Set('Check PassiveTree: ' .. _G.greencircle)
        else
            u1061:Set('Check PassiveTree: ' .. _G.redcircle)
        end
    end
end)
v1042:AddToggle('Teleport Passive', false, function(p1063)
    _G.autopassive = p1063
end)
spawn(function()
    while true do
        local v1064 = _G.autopassive and workspace:WaitForChild('AllNPC'):WaitForChild('PassiveTree')

        if v1064 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1064.CFrame
        end

        wait(1)
    end
end)
v1042:AddToggle('Auto Hop', false, function(_)
    Serverhop()
end)
v1042:AddSeperator('Codes')

local function u1066(p1065)
    game:GetService('ReplicatedStorage').Chest.Remotes.Functions.redeemcode:InvokeServer(unpack({p1065}))
end

v1042:AddDropdown('Select Code', {
    'IslandQuestRepeat',
    'X100KSuccess',
    'FruitAwakeningTime',
    'Halloween2024',
    'Update7.1',
    'DragonColorRefund',
    'PlayKingLegacyFor5Gems',
    'RainbowDragon',
    '<3LEEPUNGG',
    'Update7.0.4',
    'SKGames',
    'PassiveMaster',
    'InfernoKingAwaits',
    'Update7Release',
    'TelekinesisFruitPower',
    'EpicAdventure',
    'WELCOMETOKINGLEGACY',
    'FREESTATSRESET',
    'DinoxLive',
    '2MFAV',
    'Peodiz',
}, 'IslandQuestRepeat', function(p1067)
    _G.SelectedCode = p1067

    print('Selected Code:', _G.SelectedCode)
end)
v1042:AddToggle('Use Selected Code', false, function(p1068)
    _G.Settings.UseCode = p1068

    print('Use Selected Code:', _G.Settings.UseCode)

    if _G.Settings.UseCode and _G.SelectedCode then
        u1066(_G.SelectedCode)
    end
end)

local v1069 = _HalloweenEvent:AddSection('', 'Halloween Event', 'auto farm cady any sea auto spawn bosses', 'rbxassetid://6034684949')
local _TotalCandy = v1069:AddLabel('Total Candy : ')

spawn(function()
    while task.wait(0.1) do
        local v1071 = Client:FindFirstChild('PlayerStats') and (Client.PlayerStats:FindFirstChild('Material') and (Client.PlayerStats.Material:FindFirstChild('Candy') and Client.PlayerStats.Material.Candy.Value)) or getPlayerMaterial('Candy')

        if v1071 then
            _TotalCandy:Set('Total Candy : ' .. tostring(v1071))
        else
            _TotalCandy:Set('Total Candy : N/A')
        end
    end
end)

local u1072 = v1069:AddLabel('Status : ' .. _G.redcircle)

task.spawn(function()
    while task.wait(1) do
        u1072:Set(u459.find({
            'Skull King',
        }) and 'Check Skull King Mon: ' .. _G.greencircle or 'Check Skull King Mon: ' .. _G.redcircle)
    end
end)

local u1073 = v1069:AddLabel('Status : ' .. _G.redcircle)

task.spawn(function()
    while task.wait(1) do
        u1073:Set(u459.find({
            'Jack o lantern [Lv. 10000]',
        }) and 'Check Jack O Lantern Mon: ' .. _G.greencircle or 'Check Jack O Lantern Mon: ' .. _G.redcircle)
    end
end)
Toggle('Auto Farm Candy', v1069, 'auto_farm_candy')
Toggle('Auto Kill Jack O Lantern', v1069, 'auto_jacko')
Toggle('Auto Summon Jack O Lantern [50 Candy]', v1069, 'auto_jackoo')
Toggle('Auto Kill Skull King', v1069, 'auto_skull')

local v1074 = _WorldBosses:AddSection('', 'Main Bosses', 'auto farm cady any sea auto spawn bosses', 'rbxassetid://6034684949')

v1074:AddSeperator('Server Hop')
v1074:MultiDropdown('Select World Boss to Hop', {
    v457('Jack o lantern [Lv. 10000]'),
    v457('King Samurai [Lv. 3500]'),
    v457('Dragon [Lv. 5000]'),
    v457('Ms. Mother [Lv. 7500]'),
    v457('Lord of Saber [Lv. 8500]'),
    v457('Bushido Ape [Lv. 5000]'),
}, _G.Settings.selectbosss or {}, function(p1075)
    _G.Settings.selectbosss = p1075

    print('Selected entities: ', table.concat(selectbosss, ', '))
    SaveSettings()
end)
Toggle('Auto Hop Until Found World Boss', v1074, 'auto_hop_boss')
v1074:Slider('Hop Delay (seconds)', 0, 60, _G.Settings.HopDelay or 15, function(p1076)
    _G.Settings.HopDelay = p1076

    SaveSettings()
end)
v1074:AddSeperator('Minion')

local u1077 = v1074:AddLabel('Status : ' .. _G.redcircle)

task.spawn(function()
    while task.wait(1) do
        u1077:Set(u459.find({
            'Minion',
            'Boss',
        }) and 'Check Minion Mon: ' .. _G.greencircle or 'Check Minion Mon: ' .. _G.redcircle)
    end
end)
Toggle('Auto Kill Minion', v1074, 'Auto_Kill_Minion1')
v1074:AddToggle('Auto Hop Minion', false, function(_)
    HopServer()
end)

if Sea1 then
    v1074:AddSeperator('Saber')

    local u1078 = v1074:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1078:Set(u459.find({
                'Expert Swordman [Lv. 3000]',
            }) and 'Check Expert Swordman Mon: ' .. _G.greencircle or 'Check Expert Swordman Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill Expert Swordman', v1074, 'Auto_Expert_Swordman1')
end
if Sea2 then
    v1074:AddSeperator('Kaido Boss')

    local u1079 = v1074:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1079:Set(u459.find({
                'Dragon [Lv. 5000]',
            }) and 'Check Dragon Mon: ' .. _G.greencircle or 'Check Dragon Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Fully Kaido', v1074, 'Auto_Kill_Kaido1')
    Toggle('Auto Summon Kaido', v1074, 'Auto_Spawn_Kaido')
    v1074:AddToggle('Auto Hop Kaido', false, function(_)
        Serverhop()
    end)
    v1074:AddSeperator('Big Mom')

    local u1080 = v1074:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1080:Set(u459.find({
                'Ms. Mother [Lv. 7500]',
            }) and 'Check BigMom Mon: ' .. _G.greencircle or 'Check BigMom Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill BigMom', v1074, 'Auto_Kill_BigMom')
    v1074:AddToggle('Auto Big Mom Hop', false, function(_)
        Serverhop()
    end)
    v1074:AddSeperator('King Samurai')

    local u1081 = v1074:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1081:Set(u459.find({
                'King Samurai [Lv. 3500]',
            }) and 'Check King Samurai Mon: ' .. _G.greencircle or 'Check King Samurai Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill King Samurai', v1074, 'King_Samurai')
    v1074:AddToggle('Auto King Samurai Hop', false, function(_)
        Serverhop()
    end)
end
if Sea3 then
    v1074:AddSeperator('Lord Of Saber')

    local u1082 = v1074:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1082:Set(u459.find({
                'Lord of Saber [Lv. 8500]',
            }) and 'Check Lord Of Saber Mon: ' .. _G.greencircle or 'Check Lord Of Saber Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill Lord of Saber', v1074, 'auto_lordsaber')
    v1074:AddToggle('Auto Hop Lord of Saber', false, function(_)
        Serverhop()
    end)
    v1074:AddSeperator('Bushido Ape')

    local u1083 = v1074:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1083:Set(u459.find({
                'Bushido Ape [Lv. 5000]',
            }) and 'Check Bushido Ape Mon: ' .. _G.greencircle or 'Check Bushido Ape Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill Bushido Ape', v1074, 'auto_bushido')
    v1074:AddToggle('Auto Hop Bushido Ape', false, function(_)
        Serverhop()
    end)
end
if Sea1 then
    _G.sesas = 'First Sea'
elseif Sea2 then
    _G.sesas = 'Second Sea'
elseif Sea3 then
    _G.sesas = 'Third Sea'
end

local v1084 = _SeaEvent:AddSection('', _G.sesas .. ' Event', 'auto kill sea event bosses in any sea!', 'http://www.roblox.com/asset/?id=6035078898')

if Sea1 then
    v1084:AddLabel('No Sea Event on First Sea!!')
end

v1084:AddSeperator('Server Hop')
v1084:MultiDropdown('Select Sea Monster to Hop', {
    v458('SeaDragon'),
    v458('FuryTentacle'),
    v458('ThirdSeaEldritch Crab'),
    v458('ThirdSeaDragon'),
    v458('Skull King'),
    v458('SeaKing'),
    v458('HydraSeaKing'),
    v458('Ghost Ship'),
}, _G.Settings.SelectedEntities or {}, function(p1085)
    _G.Settings.SelectedEntities = p1085

    print('Selected entities: ', table.concat(p1085, ', '))
    SaveSettings()
end)
Toggle('Auto Hop Until Found Sea Monster', v1084, 'auto_hop')
v1084:Slider('Hop Delay (seconds)', 0, 60, _G.Settings.HopDelay or 15, function(p1086)
    _G.Settings.HopDelay = p1086

    SaveSettings()
end)

if Sea2 then
    local function u1090(p1087, p1088, p1089)
        return string.format('%02dh %02dm %02ds', tonumber(p1087), tonumber(p1088), tonumber(p1089))
    end
    local function u1094()
        local _SeaKing = game:GetService('Workspace').SeaMonster:FindFirstChild('SeaKing')

        if not (_SeaKing and _SeaKing:FindFirstChild('Humanoid')) then
            return '\u{274c} 0 / 0 HP (0%)'
        end

        local _Humanoid5 = _SeaKing.Humanoid
        local v1093 = _Humanoid5.Health / _Humanoid5.MaxHealth * 100

        return string.format('\u{2705} %d / %d HP (%.0f%%)', math.floor(_Humanoid5.Health), math.floor(_Humanoid5.MaxHealth), v1093)
    end
    local function u1103()
        local _GhostMonster = game.Workspace:FindFirstChild('GhostMonster')
        local v1096 = '\u{274c} 0 / 0 HP (0%)'

        if _GhostMonster then
            local v1097, v1098, v1099 = u483(_GhostMonster:GetChildren())

            while true do
                local v1100

                v1099, v1100 = v1097(v1098, v1099)

                if v1099 == nil then
                    break
                end
                if v1100:IsA('Model') and v1100:FindFirstChild('Humanoid') then
                    local _Humanoid6 = v1100.Humanoid
                    local v1102 = _Humanoid6.Health / _Humanoid6.MaxHealth * 100

                    v1096 = string.format('\u{2705} %d / %d HP (%.0f%%)', math.floor(_Humanoid6.Health), math.floor(_Humanoid6.MaxHealth), v1102)
                end
            end
        end

        return v1096
    end

    v1084:AddSeperator('Sea King')

    local u1104 = v1084:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1104:Set(u459.find({
                'SeaKing',
            }) and 'Check Sea king Mon: ' .. _G.greencircle or 'Check Sea King Mon: ' .. _G.redcircle)
        end
    end)

    local _HPNA = v1084:AddLabel('HP : N/A')
    local _NextSpawnNA = v1084:AddLabel('Next Spawn : N/A')

    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                _HPNA:Set('HP : ' .. u1094())

                local _SeaMonsterSpawnText = game:GetService('ReplicatedStorage'):GetAttribute('SeaMonsterSpawnText')

                if _SeaMonsterSpawnText and _SeaMonsterSpawnText:match('^(%d+):(%d+):(%d+)$') then
                    local _ddd, v1109, v1110 = _SeaMonsterSpawnText:match('(%d+):(%d+):(%d+)')

                    _NextSpawnNA:Set('Next Spawn : ' .. u1090(_ddd, v1109, v1110))
                else
                    _NextSpawnNA:Set('Next Spawn : ' .. Formatted_SeaKingTime)
                end
            end)
        end
    end)
    Toggle('Auto Kill Sea King', v1084, 'Auto_Kill_Sea_King1')
    v1084:AddSeperator('Hydra Boss')

    local u1111 = v1084:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1111:Set(u459.find({
                'HydraSeaKing',
            }) and 'Check Hydra Sea King Mon: ' .. _G.greencircle or 'Check Hydra Sea King Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill Hydra Boss', v1084, 'Auto_Kill_Hydar_Sea_King1')
    v1084:AddSeperator('Ghost Ship')

    local u1112 = v1084:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1112:Set(u459.find({
                'Ghost Ship',
            }) and 'Check Ghost Ship Mon: ' .. _G.greencircle or 'Check Ghost Ship Mon: ' .. _G.redcircle)
        end
    end)

    local _HPNA2 = v1084:AddLabel('HP : N/A')
    local _NextSpawnNA2 = v1084:AddLabel('Next Spawn : N/A')

    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                _HPNA2:Set('HP : ' .. u1103())

                local _GhostShipSpawnText = game:GetService('ReplicatedStorage'):GetAttribute('GhostShipSpawnText')

                if _GhostShipSpawnText and _GhostShipSpawnText:match('^(%d+):(%d+):(%d+)$') then
                    local _ddd2, v1117, v1118 = _GhostShipSpawnText:match('(%d+):(%d+):(%d+)')

                    _NextSpawnNA2:Set('Next Spawn : ' .. u1090(_ddd2, v1117, v1118))
                else
                    _NextSpawnNA2:Set('Next Spawn : N/A')
                end
            end)
        end
    end)
    Toggle('Auto Attack Ghost Ship', v1084, 'Auto_Kill_GhostMonster1')
end
if Sea3 then
    local _BloodMoonStatus = v1084:AddLabel('\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} Blood Moon Status: ')
    local u1120 = 3
    local u1121 = 6

    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local _ddd3, v1123, v1124 = game:GetService('Lighting').TimeOfDay:match('^(%d+):(%d+):(%d+)$')
                local v1125 = tonumber(_ddd3)
                local v1126 = tonumber(v1123)
                local v1127 = tonumber(v1124)
                local v1128 = game:GetService('Lighting'):GetAttribute('Day') or 1

                if v1128 == u1120 and u1121 <= v1125 then
                    local v1129 = v1125 - u1121

                    _BloodMoonStatus:Set(string.format('\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} Blood Moon Starting In: %02dH:%02dM:%02dS', v1129, v1126, v1127))
                else
                    local v1130 = u1120 - v1128

                    if v1130 < 0 then
                        v1130 = v1130 + 7
                    end

                    local v1131 = v1130 * 24 + (u1121 - v1125 - 1)

                    if v1131 < 0 then
                        v1131 = v1131 + 24
                    end

                    local v1132 = 59 - v1126

                    if 59 - v1127 == 59 then
                        v1132 = v1132 + 1
                    end

                    _BloodMoonStatus:Set(string.format('\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} Blood Moon Active: %02dH:%02dM:%02dS', math.floor(v1131 / 24), v1131 % 24, v1132))
                end
            end)
        end
    end)

    local _NextSpawnNA3 = v1084:AddLabel('Next Spawn: N/A')

    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local _ThirdSeaMonsterSpawnText = game:GetService('ReplicatedStorage'):GetAttribute('ThirdSeaMonsterSpawnText')

                if _ThirdSeaMonsterSpawnText then
                    if _ThirdSeaMonsterSpawnText:match('^(%d+):(%d+):(%d+)$') then
                        local _ddd4, v1136, v1137 = _ThirdSeaMonsterSpawnText:match('(%d+):(%d+):(%d+)')

                        _NextSpawnNA3:Set(string.format('\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} SeaEventTime Spawn in: %02dH:%02dM:%02dS', tonumber(_ddd4), tonumber(v1136), tonumber(v1137)))
                    else
                        _NextSpawnNA3:Set('\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} SeaEventTime Next Spawn: ' .. _ThirdSeaMonsterSpawnText)
                    end
                else
                    _NextSpawnNA3:Set('\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd} SeaEventTime Next Spawn: ' .. _ThirdSeaMonsterSpawnText)
                end
            end)
        end
    end)
    v1084:AddSeperator('Abyssal Tyrant')

    local u1138 = v1084:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1138:Set(u459.find({
                'SeaDragon',
            }) and 'Check Abyssal TyrantMon: ' .. _G.greencircle or 'Check Abyssal TyrantMon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill Abyssal Tyrant', v1084, 'Abyssal_Tyrant')
    v1084:AddSeperator('Chaos Kraken Boss')

    local u1139 = v1084:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1139:Set(u459.find({
                'FuryTentacle',
            }) and 'Check Chaos Kraken Mon: ' .. _G.greencircle or 'Check Chaos Kraken Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill Chaos Kraken Boss', v1084, 'Chaos_Kraken')
    v1084:AddSeperator('Deepsea Crusher')

    local u1140 = v1084:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1140:Set(u459.find({
                'ThirdSeaEldritch Crab',
            }) and 'Check Deepsea Crusher Mon: ' .. _G.greencircle or 'Check Deepsea Crusher Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill Deepsea Crusher Boss', v1084, 'Deepsea_Crusher')
    v1084:AddSeperator('Drakenfyr')

    local u1141 = v1084:AddLabel('Status : ' .. _G.redcircle)

    task.spawn(function()
        while task.wait(1) do
            u1141:Set(u459.find({
                'ThirdSeaDragon',
            }) and 'Check Drakenfyr Mon: ' .. _G.greencircle or 'Check Drakenfyr Mon: ' .. _G.redcircle)
        end
    end)
    Toggle('Auto Kill Drakenfyr the Inferno King', v1084, 'auto_draken')
end

local _Settings = _ConfigsFarm:AddSection('Settings', 'Script Made By jay#0050', 'Join Tsuo Hub Discord For Updates! \nuse at your own risk.', 'http://www.roblox.com/asset/?id=6031233840')

Dropdown('Select Weapon ', {
    'Melee',
    'Sword',
    'Fruit Power',
    'all In One',
}, _Settings, 'Select_Weapon')
_Settings:AddDropdown('Position Farm', {
    'Above',
    'Beside',
    'Lower',
}, _G.Settings.PositionFarm, function(p1143)
    _G.Settings.PositionFarm = p1143

    SaveSettings()
end)
_Settings:Slider('DisFarm', 0, 100, _G.Disfarm or 7.5, function(p1144)
    _G.Disfarm = p1144
end)
Toggle('Bring Mob (Work 80%)', _Settings, 'Bring_Nearest_Mobs_Together')

function EnableBuso()
    local v1145 = Client

    if v1145 then
        v1145 = Client.Character
    end

    repeat
        wait()
    until v1145 or not v1145 and tick() - RecentlySpawn > RespawnTime

    if v1145:WaitForChild('Services'):FindFirstChild('Haki') and v1145:WaitForChild('Services'):FindFirstChild('Haki').Value == 0 then
        Client.PlayerStats.BusoShopValue.Value = 'BusoHaki'

        game:GetService('ReplicatedStorage').Chest.Remotes.Events.Armament:FireServer()

        repeat
            wait(1)
        until v1145:WaitForChild('Services'):FindFirstChild('Haki').Value == 1
    end
end

_Settings:AddToggle('Enable Buso', true, function(p1146)
    _G.Settings.EnableBuso = p1146

    print('Toggle Enable Buso is:', _G.Settings.EnableBuso)
    spawn(function()
        while _G.Settings.EnableBuso do
            EnableBuso()
            wait(0.4)
        end
    end)
    SaveSettings()
end)
_Settings:AddToggle('Auto Active Observation Haki', _G.Settings.ObservationHak, function(p1147)
    _G.Settings.ObservationHak = p1147

    SaveSettings()
end)
Toggle('White screen ', _Settings, function(p1148)
    game:GetService('RunService'):Set3dRenderingEnabled(not p1148)
end)
_Settings:AddToggle('Auto Hide Level Up Text', _G.AutoHideLevelText, function(p1149)
    _G.AutoHideLevelText = p1149
end)
spawn(function()
    while true do
        if _G.AutoHideLevelText then
            local _LevelUp = game:GetService('ReplicatedStorage'):WaitForChild('Chest'):WaitForChild('Gui'):WaitForChild('LevelUp')

            if _LevelUp then
                _LevelUp.Visible = false
            end

            local _ItemDrop = game:GetService('ReplicatedStorage'):WaitForChild('Chest'):WaitForChild('Gui'):WaitForChild('ItemDrop')

            if _ItemDrop then
                _ItemDrop.Visible = false
            end
        end

        wait(1)
    end
end)

_G.autohidehealth = _G.autohidehealth or false

local u1152 = {
    workspace.Monster.Boss,
    workspace.Monster.Mon,
    game:GetService('ReplicatedStorage').MOB,
}

local function u1164(p1153)
    local v1154, v1155, v1156 = u484(u1152)

    while true do
        local v1157

        v1156, v1157 = v1154(v1155, v1156)

        if v1156 == nil then
            break
        end

        local v1158, v1159, v1160 = u484(v1157:GetChildren())

        while true do
            local v1161

            v1160, v1161 = v1158(v1159, v1160)

            if v1160 == nil then
                break
            end

            local _BillboardGui = v1161:FindFirstChild('BillboardGui')

            if _BillboardGui then
                _BillboardGui.Enabled = not p1153
            end

            local _Humanoid7 = v1161:FindFirstChild('Humanoid')

            if _Humanoid7 then
                _Humanoid7.DisplayDistanceType = p1153 and Enum.HumanoidDisplayDistanceType.None or Enum.HumanoidDisplayDistanceType.Viewer
            end
        end
    end
end
local function u1165()
    spawn(function()
        while _G.autohidehealth do
            u1164(true)
            task.wait(1)
        end

        u1164(false)
    end)
end

_Settings:AddToggle('Auto Hide Mob Health', _G.autohidehealth, function(p1166)
    _G.autohidehealth = p1166

    if _G.autohidehealth then
        u1165()
    else
        u1164(false)
    end

    SaveSettings()
end)
_Settings:AddToggle('Delete Damage Text', _G.DeleteDamage, function(p1167)
    _G.Delete = p1167
end)
_Settings:AddToggle('Delete Heavy Effect', _G.DeleteEffext, function(p1168)
    _G.DeleteEffext = p1168
end)
spawn(function()
    while wait() do
        if _G.DeleteDamage then
            pcall(function()
                if game:GetService('Workspace'):FindFirstChild('DamageShow') then
                    game:GetService('Workspace'):FindFirstChild('DamageShow').Parent = game:GetService('Workspace').Camera
                end
            end)
        else
            pcall(function()
                if game:GetService('Workspace').Camera:FindFirstChild('DamageShow') then
                    game:GetService('Workspace').Camera:FindFirstChild('DamageShow').Parent = game:GetService('Workspace')
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.DeleteEffext then
            pcall(function()
                if game:GetService('Workspace'):FindFirstChild('Effects') then
                    game:GetService('Workspace'):FindFirstChild('Effects').Parent = game:GetService('Workspace').Camera
                end
            end)
        else
            pcall(function()
                if game:GetService('Workspace').Camera:FindFirstChild('Effects') then
                    game:GetService('Workspace').Camera:FindFirstChild('Effects').Parent = game:GetService('Workspace')
                end
            end)
        end
    end
end)

function KenHaki()
    local _ = game.Players.LocalPlayer.Character

    if workspace.PlayerCharacters.justachilllguy.Services.KenHaki == false then
        game:service('VirtualInputManager'):SendKeyEvent(true, 'Y', false, game)
        game:service('VirtualInputManager'):SendKeyEvent(true, 'Y', false, game)
    end
end

spawn(function()
    while task.wait() do
        if _G.Settings.ObservationHak then
            pcall(function()
                KenHaki()
            end)
        end
    end
end)
_Settings:AddSeperator('Auto Use Skill')
_Settings:AddToggle('Use Skill Z', _G.Settings.SkillZ, function(p1169)
    _G.Settings.SkillZ = p1169

    SaveSettings()
end)
_Settings:AddToggle('Use Skill X', _G.Settings.SkillX, function(p1170)
    _G.Settings.SkillX = p1170

    SaveSettings()
end)
_Settings:AddToggle('Use Skill C', _G.Settings.SkillC, function(p1171)
    _G.Settings.SkillC = p1171

    SaveSettings()
end)
_Settings:AddToggle('Use Skill V', _G.Settings.SkillV, function(p1172)
    _G.Settings.SkillV = p1172

    SaveSettings()
end)
_Settings:AddToggle('Use Skill B', _G.Settings.SkillB, function(p1173)
    _G.Settings.SkillB = p1173

    SaveSettings()
end)
_Settings:AddToggle('Use Skill E', _G.Settings.SkillE, function(p1174)
    _G.Settings.SkillE = p1174

    SaveSettings()
end)
_Settings:AddSeperator('Hold Skill')
_Settings:Slider('Hold Z', 0, 100, u456.Z, function(p1175)
    u456.Z = p1175

    SaveSettings()
end)
_Settings:Slider('Hold X', 0, 100, u456.X, function(p1176)
    u456.X = p1176

    SaveSettings()
end)
_Settings:Slider('Hold C', 0, 100, u456.C, function(p1177)
    u456.C = p1177

    SaveSettings()
end)
_Settings:Slider('Hold V', 0, 100, u456.V, function(p1178)
    u456.V = p1178

    SaveSettings()
end)
_Settings:Slider('Hold B', 0, 100, u456.B, function(p1179)
    u456.B = p1179

    SaveSettings()
end)
_Settings:Slider('Hold E', 0, 100, u456.E, function(p1180)
    u456.E = p1180

    SaveSettings()
end)

local u1181 = 1
local u1182 = false
local u1183 = false
local u1184 = false
local u1185 = false
local u1186 = true
local u1187 = v1006:AddLabel('')

spawn(function()
    while task.wait() do
        u1187:Set('Your Points: ' .. tostring(game:GetService('Players').LocalPlayer.PlayerStats.Points.Value))
    end
end)
spawn(function()
    while task.wait() do
        if u1186 then
            local v1188, v1189, v1190 = u484({
                'Melee',
                'Defense',
                'Sword',
                'Fruit',
            })

            while true do
                local v1191

                v1190, v1191 = v1188(v1189, v1190)

                if v1190 == nil then
                    break
                end
                if v1191 == 'Melee' and u1182 or (v1191 == 'Defense' and u1183 or (v1191 == 'Sword' and u1184 or v1191 == 'Fruit' and u1185)) then
                    local v1192 = {v1191, u1181}

                    Client.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer(unpack(v1192))
                end
            end
        end
    end
end)

local u1193 = v1006:AddLabel('')
local u1194 = v1006:AddLabel('')
local u1195 = v1006:AddLabel('')
local u1196 = v1006:AddLabel('')
local u1197 = v1006:AddLabel('')

spawn(function()
    while task.wait(0.1) do
        u1193:Set('Level : ' .. tostring(game:GetService('Players').LocalPlayer.PlayerStats.lvl.Value))
        u1194:Set('Melee : ' .. tostring(game:GetService('Players').LocalPlayer.PlayerStats.Melee.Value))
        u1195:Set('Defense : ' .. tostring(game:GetService('Players').LocalPlayer.PlayerStats.Defense.Value))
        u1196:Set('Sword : ' .. tostring(game:GetService('Players').LocalPlayer.PlayerStats.sword.Value))
        u1197:Set('Devil Fruit : ' .. tostring(game:GetService('Players').LocalPlayer.PlayerStats.DF.Value))
    end
end)
v1006:AddToggle('Melee', u1182, function(p1198)
    u1182 = p1198
end)
v1006:AddToggle('Defense', u1183, function(p1199)
    u1183 = p1199
end)
v1006:AddToggle('Sword', u1184, function(p1200)
    u1184 = p1200
end)
v1006:AddToggle('Devil Fruit', u1185, function(p1201)
    u1185 = p1201
end)

PlayerName = {}

local v1202, v1203, v1204 = u483(game.Players:GetChildren())

while true do
    local v1205, v1206 = v1202(v1203, v1204)

    if v1205 == nil then
        break
    end

    v1204 = v1205

    if v1206.Name ~= game.Players.LocalPlayer.Name then
        table.insert(PlayerName, v1206.Name)
    end
end

local _SelectPlayers = v1007:AddDropdown('Select Players', PlayerName, '', function(p1207)
    _G.SelectPly = p1207
end)

v1007:Button('Refresh Player', function()
    newPlayerName = {}

    local v1209, v1210, v1211 = u483(game.Players:GetChildren())

    while true do
        local v1212

        v1211, v1212 = v1209(v1210, v1211)

        if v1211 == nil then
            break
        end
        if v1212.Name ~= game.Players.LocalPlayer.Name then
            table.insert(newPlayerName, v1212.Name)
        end
    end

    _SelectPlayers:Refresh(newPlayerName)
end)
v1007:AddToggle('Spectate Player', Spectate, function(p1213)
    Spectate = p1213

    local _Humanoid8 = game.Players.LocalPlayer.Character.Humanoid
    local v1215 = game.Players:FindFirstChild(_G.SelectPly)

    repeat
        task.wait()

        game.Workspace.Camera.CameraSubject = v1215.Character.Humanoid
    until Spectate == false

    game.Workspace.Camera.CameraSubject = _Humanoid8
end)
v1007:Button('Teleport', function()
    Tp(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
end)
v1007:AddToggle('Auto Kill Player', _G.AutoKillply, function(p1216)
    _G.AutoKillply = p1216

    CancelTween(_G.AutoKillply)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKillply and (game.Players:FindFirstChild(_G.SelectPly) and game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0) then
                repeat
                    task.wait()
                    Attack()
                    Tp(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * Farm_Mode)
                until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not _G.AutoKillply or not game.Players:FindFirstChild(_G.SelectPly)
            end
        end)
    end
end)
v1008:AddSeperator('Server')
v1008:Button('Rejoin Server', function()
    game:GetService('TeleportService'):Teleport(game.PlaceId, game:GetService('Players').LocalPlayer)
end)
v1008:Button('Server Hop', function()
    Hop()
end)

function Hop()
    local _PlaceId3 = game.PlaceId
    local u1218 = {}
    local u1219 = ''
    local _hour = os.date('!*t').hour

    function TPReturner()
        local v1221

        if u1219 ~= '' then
            v1221 = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. _PlaceId3 .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. u1219))
        else
            v1221 = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. _PlaceId3 .. '/servers/Public?sortOrder=Asc&limit=100'))
        end
        if v1221.nextPageCursor and (v1221.nextPageCursor ~= 'null' and v1221.nextPageCursor ~= nil) then
            u1219 = v1221.nextPageCursor
        end

        local v1222, v1223, v1224 = u483(v1221.data)
        local v1225 = 0

        while true do
            local v1226

            v1224, v1226 = v1222(v1223, v1224)

            if v1224 == nil then
                break
            end

            local v1227 = true
            local u1228 = tostring(v1226.id)

            if tonumber(v1226.maxPlayers) > tonumber(v1226.playing) then
                local v1229, v1230, v1231 = u483(u1218)

                while true do
                    local v1232

                    v1231, v1232 = v1229(v1230, v1231)

                    if v1231 == nil then
                        break
                    end
                    if v1225 == 0 then
                        if tonumber(_hour) ~= tonumber(v1232) then
                            pcall(function()
                                u1218 = {}

                                table.insert(u1218, _hour)
                            end)
                        end
                    elseif u1228 == tostring(v1232) then
                        v1227 = false
                    end

                    v1225 = v1225 + 1
                end

                if v1227 == true then
                    table.insert(u1218, u1228)
                    wait(0.1)
                    pcall(function()
                        wait()
                        game:GetService('TeleportService'):TeleportToPlaceInstance(_PlaceId3, u1228, game.Players.LocalPlayer)
                    end)
                    wait(0.1)
                end
            end
        end
    end
    function Teleport()
        while wait(0.1) do
            pcall(function()
                TPReturner()

                if u1219 ~= '' then
                    TPReturner()
                end
            end)
        end
    end

    Teleport()
end

v1008:Button('Teleport To Lower Server', function()
    local _huge2 = math.huge
    local u1234 = 'https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'
    local u1235 = nil
    local u1236 = nil

    if not _G.FailedServerID then
        _G.FailedServerID = {}
    end

    local function u1241()
        u1236 = game:GetService('HttpService'):JSONDecode(game:HttpGetAsync(u1234))

        local v1237, v1238, v1239 = u483(u1236.data)

        while true do
            local u1240

            v1239, u1240 = v1237(v1238, v1239)

            if v1239 == nil then
                break
            end

            pcall(function()
                if type(u1240) == 'table' and (u1240.id and (u1240.playing and (tonumber(_huge2) > tonumber(u1240.playing) and not table.find(_G.FailedServerID, u1240.id)))) then
                    _huge2 = u1240.playing
                    u1235 = u1240.id
                end
            end)
        end
    end

    function getservers()
        pcall(u1241)

        local v1242, v1243, v1244 = u483(u1236)

        while true do
            local v1245

            v1244, v1245 = v1242(v1243, v1244)

            if v1244 == nil then
                break
            end
            if v1244 == 'nextPageCursor' then
                if u1234:find('&cursor=') then
                    u1234 = u1234:gsub(u1234:sub((u1234:find('&cursor='))), '')
                end

                u1234 = u1234 .. '&cursor=' .. v1245

                pcall(getservers)
            end
        end
    end

    pcall(getservers)
    wait(0.1)

    if u1235 ~= game.JobId then
        local _ = _huge2 ~= #game:GetService('Players'):GetChildren() - 1
    end

    table.insert(_G.FailedServerID, u1235)
    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, u1235)

    while wait(0.1) do
        pcall(function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end

            game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
                local _ErrorPrompt = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild('ErrorPrompt')

                if _ErrorPrompt and _ErrorPrompt.TitleFrame.ErrorTitle.Text == 'Disconnected' then
                    if #game.Players:GetPlayers() > 1 then
                        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    else
                        game.Players.LocalPlayer:Kick('\nRejoining...')
                        wait(0.1)
                        game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
                    end
                end
            end)
        end)
    end
end)
v1008:Textbox('Join Server(Join Discord!)', 'Enter Job ID', function(p1247)
    if p1247:sub(1, 7) ~= 'ZenHub_' then
        warn("Invalid join code format. The code must start with 'ZenHub_'.")
    else
        local u1248 = p1247:sub(8)

        if u1248 and u1248 ~= '' then
            local v1249, v1250 = pcall(function()
                _TeleportService:TeleportToPlaceInstance(_PlaceId2, u1248, _Players2.LocalPlayer)
            end)

            if v1249 then
                print('Successfully teleported!')
            else
                warn('Teleport failed:', v1250)
            end
        else
            warn('Invalid Job ID format.')
        end
    end
end)
v1008:AddToggle('Teleport First Sea', false, function()
    toQuest(workspace.AllNPC:FindFirstChild('Elite Pirate').CFrame, 'Elite Pirate')
end)
v1008:AddToggle('Teleport Second Sea', false, function()
    toQuest(workspace.AllNPC:FindFirstChild('Elite Pirate').CFrame, 'Elite Pirate')
end)
v1008:AddToggle('Teleport Third Sea', false, function()
    toQuest(workspace.AllNPC:FindFirstChild('The Squid').CFrame, 'The Squid')
end)
v1008:AddSeperator('Teleport Island')

local v1251, v1252, v1253 = u483(game:GetService('Workspace').Areas:GetChildren())
local v1254 = {}

while true do
    local v1255, v1256 = v1251(v1252, v1253)

    if v1255 == nil then
        break
    end

    v1253 = v1255

    if v1256.Name ~= 'Sea of dust' then
        table.insert(v1254, v1256.Name)
    end
end

local u1257 = 'None'

v1008:AddDropdown('Island Select', v1254, '', function(p1258)
    u1257 = p1258
end)
v1008:Button('Teleport To Island', function()
    if u1257 == 'None' then
        warn('Please select an island.')
    else
        local v1259, v1260, v1261 = u483(game:GetService('Workspace').Areas:GetChildren())

        while true do
            local v1262

            v1261, v1262 = v1259(v1260, v1261)

            if v1261 == nil then
                break
            end
            if v1262.Name == u1257 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1262.CFrame * CFrame.new(0, 300, 0)

                break
            end
        end
    end
end)
v1009:AddLabel('Npc Teleport')

local v1263, v1264, v1265 = u483(game:GetService('Workspace').AllNPC:GetChildren())
local v1266 = {}

while true do
    local v1267

    v1265, v1267 = v1263(v1264, v1265)

    if v1265 == nil then
        break
    end

    table.insert(v1266, v1267.Name)
end

local _SelectNPC = v1009:AddDropdown('Select NPC', Colossuem and {
    '',
} or v1266, '', function(p1268)
    SelectedNpc = p1268
end)

v1009:Button('Teleport To NPC', function()
    local v1270, v1271, v1272 = u483(game:GetService('Workspace').AllNPC:GetChildren())

    while true do
        local v1273

        v1272, v1273 = v1270(v1271, v1272)

        if v1272 == nil then
            break
        end
        if SelectedNpc == v1273.Name then
            tp1(v1273.CFrame)
        end
    end
end)
v1009:Button('Refresh Npc', function()
    local v1274, v1275, v1276 = u483(game:GetService('Workspace').AllNPC:GetChildren())
    local v1277 = {}

    while true do
        local v1278

        v1276, v1278 = v1274(v1275, v1276)

        if v1276 == nil then
            break
        end

        table.insert(v1277, v1278.Name)
    end

    _SelectNPC:Add(v1277)
end)
v1010:AddSeperator('Keys')

_G.selectedBuyKey = _G.selectedBuyKey or 'Copper Key'
_G.buyAmount = 1
_G.buykey = _G.buykey or false

v1010:AddDropdown('Select key to buy', {
    'Iron Key',
    'Copper Key',
    'Gold Key',
}, _G.selectedBuyKey, function(p1279)
    _G.selectedBuyKey = p1279
end)
v1010:AddToggle('Auto-buy selected key', _G.buykey, function(p1280)
    _G.buykey = p1280

    if _G.buykey then
        spawn(function()
            while _G.buykey do
                BuyKey(_G.selectedBuyKey, _G.buyAmount)
                wait(1)
            end
        end)
    end
end)

function BuyKey(p1281, p1282)
    local u1283 = {p1281, p1282}
    local v1284, v1285 = pcall(function()
        return game:GetService('ReplicatedStorage').Chest.Remotes.Functions.BuyKey:InvokeServer(unpack(u1283))
    end)

    if not (v1284 and v1285) then
        warn('Failed to purchase key:', p1281, 'Amount:', p1282, 'Error:', v1285)
    end
end

v1010:AddToggle('Auto open Key', _G.openkey, function(p1286)
    _G.openkey = p1286

    if _G.openkey then
        if not _G.autoOpening then
            _G.autoOpening = true

            task.spawn(function()
                local v1287 = {
                    'Iron Key',
                    'Copper Key',
                    'Gold Key',
                }

                while _G.openkey do
                    local v1288, v1289, v1290 = u484(v1287)

                    while true do
                        local v1291

                        v1290, v1291 = v1288(v1289, v1290)

                        if v1290 == nil then
                            break
                        end

                        OpenKey(v1291)
                    end
                end

                _G.autoOpening = false
            end)
        end
    else
        _G.autoOpening = false
    end
end)

function OpenKey(p1292)
    if p1292 then
        local u1293 = {
            p1292,
            'Open1',
        }
        local v1294, v1295 = pcall(function()
            return game:GetService('ReplicatedStorage'):WaitForChild('Chest'):WaitForChild('Remotes'):WaitForChild('Functions'):WaitForChild('UseKey'):InvokeServer(unpack(u1293))
        end)

        if not (v1294 and v1295) then
            warn('Failed to open key:', p1292, 'Error:', v1295)
        end
    else
        warn('No key selected')
    end
end

local u1296 = {
    'SpinFruit',
    'BombFruit',
    'BarrierFruit',
    'HumanFruit',
    'SmokeFruit',
    'SpikeFruit',
    'PawFruit',
    'ShadowFruit',
    'LoveFruit',
    'StringFruit',
    'IceFruit',
    'SandFruit',
    'PhoenixFruit',
    'GumFruit',
    'MagmaFruit',
    'LightFruit',
    'FlameFruit',
    'QuakeFruit',
    'RumbleFruit',
    'GravityFruit',
    'SnowFruit',
    'DoughFruit',
    'ToyFruit',
    'DragonFruit',
    'SpinoFruit',
    'LeopardFruit',
    'BuddhaFruit',
    'OpFruit',
}

_G.autocollectfruit = false

task.spawn(function()
    while true do
        if _G.autocollectfruit then
            pcall(function()
                local v1297, v1298, v1299 = u483(u1296)

                while true do
                    local v1300

                    v1299, v1300 = v1297(v1298, v1299)

                    if v1299 == nil then
                        break
                    end

                    local _LocalPlayer7 = game.Players.LocalPlayer
                    local _Character = _LocalPlayer7.Character
                    local _PlayerGui = _LocalPlayer7.PlayerGui

                    if _Character:FindFirstChild(v1300) and not _PlayerGui:FindFirstChild('EatFruitBecky') then
                        print(v1300 .. ' is equipped but no EatFruitBecky UI found.')
                    elseif _PlayerGui:FindFirstChild('EatFruitBecky') then
                        u106(_PlayerGui:FindFirstChild('EatFruitBecky').Dialogue.Collect)
                        wait(1)
                    elseif _LocalPlayer7.Backpack:FindFirstChild(v1300) then
                        u1050(v1300)
                        wait(1)
                        Click()
                        click()
                    else
                        warn('Fruit not found: ' .. v1300)
                    end
                end
            end)
        end

        task.wait(1)
    end
end)
v1010:AddToggle('Auto Store Fruit', _G.autocollectfruit, function(p1304)
    _G.autocollectfruit = p1304

    if _G.autocollectfruit then
        print('Auto Collect Fruit: Enabled')
    else
        print('Auto Collect Fruit: Disabled')
    end
end)
v1010:AddSeperator('Gacha Fruit')

DevilFruitList = {
    'SpinFruit',
    'BombFruit',
    'BarrierFruit',
    'HumanFruit',
    'SmokeFruit',
    'SpikeFruit',
    'PawFruit',
    'ShadowFruit',
    'LoveFruit',
    'StringFruit',
    'IceFruit',
    'SandFruit',
    'PhoenixFruit',
    'GumFruit',
    'MagmaFruit',
    'LightFruit',
    'FlameFruit',
    'QuakeFruit',
    'RumbleFruit',
    'GravityFruit',
    'SnowFruit',
    'DoughFruit',
    'ToyFruit',
    'DragonFruit',
    'SpinoFruit',
    'LeopardFruit',
    'BuddhaFruit',
    'OpFruit',
}

v1010:AddDropdown('Select Devil Fruit', DevilFruitList, '', function(p1305)
    DevilFruitSelected = p1305
end)
v1010:AddToggle('Auto Buy Devil Fruit', BuyDevilFruit, function(p1306)
    BuyDevilFruit = p1306
end)
task.spawn(function()
    while task.wait() do
        if BuyDevilFruit then
            pcall(function()
                if game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(DevilFruitSelected) and game:GetService('Players').LocalPlayer.Character:FindFirstChild(DevilFruitSelected) == nil then
                    local v1307 = {DevilFruitSelected, true}

                    game:GetService('ReplicatedStorage').Chest.Remotes.Functions.BuyFruitStock:InvokeServer(unpack(v1307))
                end
            end)
        end
    end
end)
v1010:AddToggle('Bring All Devil Fruit', BringDevilFruit, function(p1308)
    BringDevilFruit = p1308
end)
spawn(function()
    while task.wait() do
        if BringDevilFruit then
            pcall(function()
                local _HumanoidRootPart5 = game.Players.LocalPlayer.Character.HumanoidRootPart
                local v1310, v1311, v1312 = u483(game.Workspace:GetChildren())

                while true do
                    local v1313

                    v1312, v1313 = v1310(v1311, v1312)

                    if v1312 == nil then
                        break
                    end
                    if string.find(v1313.Name, 'Fruit') and v1313:IsA('Tool') then
                        v1313.Handle.CanCollide = false
                        v1313.Handle.CFrame = _HumanoidRootPart5.CFrame

                        wait(0.2)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1313.Handle, 0)
                    end
                end
            end)
        end
    end
end)
v1010:Button('Teleport To Random Devil Fruit Shop', function()
    toQuest(workspace.AllNPC:FindFirstChild('DFruitShop').CFrame)
end)
v1010:Button('Teleport To Devil Fruit Shop', function()
    toQuest(workspace.AllNPC:FindFirstChild('DFruitShop').CFrame)
end)

if Sea1 then
    v1011:Button('Soru Shop', function()
        tp1(CFrame.new(-2519, 75, -2649))
    end)
    v1011:Button('Buso Shop', function()
        tp1(CFrame.new(1953, 44, 914))
    end)
    v1011:Button('Ken Shop', function()
        tp1(CFrame.new(-4960, 462, 1175))
    end)
    v1011:Button('Katana', function()
        tp1(CFrame.new(-2064, 49, -4258))
    end)
    v1011:Button('Pipe Sword', function()
        tp1(CFrame.new(1519, 18, 1008))
    end)
    v1011:Button('Mini Race', function()
        tp1(CFrame.new(2505, 282, -1609))
    end)
elseif Sea2 then
    v1011:Button('Water Style Shop', function()
        tp1(CFrame.new(-4831.19971, 57.822052, 153.415283, -0.414802402, -5.48522792e-8, -0.909911513, -5.58345725e-8, 1, -3.48297213e-8, 0.909911513, 3.63570685e-8, -0.414802402))
    end)
    v1011:Button('Dragon Claw Shop', function()
        tp1(CFrame.new(-4603.89355, 337.312164, 599.383667, -0.962977529, -4.1851969e-8, -0.269581646, -5.81633124e-8, 1, 5.25183914e-8, 0.269581646, 6.625379e-8, -0.962977529))
    end)
end

v1011:Button('Sky Jump', function()
    if Sea1 then
        tp1(CFrame.new(-2192.19214, 48.7368965, -4475.83301, -0.543718636, -7.0270708399999995e-8, -0.839267552, -9.75050725e-8, 1, -2.05600514e-8, 0.839267552, 7.06539609e-8, -0.543718636))
    elseif Sea2 then
        tp1(CFrame.new(-3730.19189, 57.8862038, 204.094666, 0.984767377, -1.1842487e-8, 0.173876956, 7.558662139999999e-9, 1, 2.5299288e-8, -0.173876956, -2.3599636e-8, 0.984767377))
    end
end)
v1011:Button('Reroll Race', function()
    if Sea1 then
        tp1(CFrame.new(-2074.55688, 76.3055191, -4497.41357, 0.6812042, -1.16788412e-9, -0.732093453, 3.87939153e-10, 1, -1.23429367e-9, 0.732093453, 5.5679833e-10, 0.6812042))
    elseif Sea2 then
        tp1(CFrame.new(-4949.18311, 57.822052, 191.524734, -0.833928227, 3.89729315e-8, 0.551872909, -1.38614071e-8, 1, -9.15651981e-8, -0.551872909, -8.40085335e-8, -0.833928227))
    end
end)
v1011:Button('Reset Stat', function()
    if Sea1 then
        tp1(CFrame.new(-2072.95557, 48.7796097, -4405.29053, 0.461064994, -2.14056026e-8, 0.887366354, -5.51042501e-9, 1, 2.69857718e-8, -0.887366354, -1.73319599e-8, 0.461064994))
    elseif Sea2 then
        tp1(CFrame.new(-4843.9707, 58.0297661, 70.0297165, 0.288221925, 5.95155969e-9, 0.957563639, 9.68969527e-9, 1, -9.13186593e-9, -0.957563639, 1.1910503700000001e-8, 0.288221925))
    end
end)
v1011:Button('Black Leg Shop', function()
    if Sea1 then
        tp1(CFrame.new(-4206.44971, 109.067413, -2932.71362, 0.979351342, 6.7444752e-9, -0.202165633, -1.24095703e-8, 1, -2.67545666e-8, 0.202165633, 2.87109092e-8, 0.979351342))
    elseif Sea2 then
        tp1(CFrame.new(-4918.97363, 60.340538, 55.1117287, 0.950969398, 1.6071847899999998e-8, 0.309284925, -1.4967390900000002e-8, 1, -5.9437637e-9, -0.309284925, 1.02314912e-9, 0.950969398))
    end
end)
v1011:Button('Cybrog Shop', function()
    if Sea1 then
        tp1(CFrame.new(-264.232269, 124.836227, -1400.2168, -0.385267437, 7.39628803e-9, -0.922804952, 1.14298544e-8, 1, 3.24308713e-9, 0.922804952, -9.29807076e-9, -0.385267437))
    elseif Sea2 then
        tp1(CFrame.new(-4969.50391, 57.772007, 165.519562, 0.456807017, 2.94110976e-8, 0.889565825, -7.4581024000000005e-8, 1, 5.23630428e-9, -0.889565825, -6.87367105e-8, 0.456807017))
    end
end)

if not Colossuem then
    v1012:AddLabel('In Dungeon Only!')
end

function UseSkill(p1314)
    Tool = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool')

    game:GetService('VirtualInputManager'):SendKeyEvent(true, p1314, false, game)
    task.wait()
    game:GetService('VirtualInputManager'):SendKeyEvent(false, p1314, false, game)
end

v1012:Button('Teleport To Raid Entrance', function()
    tp1(CFrame.new(-4567, 223, -80))
end)

if Colossuem then
    v1012:AddToggle('Auto Farm Dungeon', _G.AutoFarmDungeon, function(p1315)
        _G.AutoFarmDungeon = p1315
    end)
    v1012:Slider('Safe Raid Health', 1, 100, 50, function(p1316)
        _G.SaveAt = p1316
    end)
    v1012:Slider('Distance', 1, 100, 30, function(p1317)
        DistanceDungeon = p1317
    end)
    spawn(function()
        while wait() do
            if _G.AutoFarmDungeon and not _G.NotEquip then
                pcall(function()
                    local v1318, v1319, v1320 = u484(game:GetService('Players').LocalPlayer.Backpack:GetChildren())

                    while true do
                        local v1321

                        v1320, v1321 = v1318(v1319, v1320)

                        if v1320 == nil then
                            break
                        end
                        if v1321:IsA('Tool') then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1321)
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoFarmDungeon then
                    if game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                        AutoFarmMobDungeon = false
                        AutoSaveModeDungeon = true
                    else
                        AutoFarmMobDungeon = true
                        AutoSaveModeDungeon = false
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            if _G.AutoFarmDungeon and AutoFarmMobDungeon then
                pcall(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                        local v1322, v1323, v1324 = u483(game:GetService('Workspace').MOB:GetChildren())

                        while true do
                            local v1325

                            v1324, v1325 = v1322(v1323, v1324)

                            if v1324 == nil then
                                break
                            end
                            if v1325:FindFirstChild('HumanoidRootPart') then
                                repeat
                                    task.wait()

                                    _G.NotEquip = false

                                    tp1(v1325.HumanoidRootPart.CFrame * CFrame.new(0, 15, DistanceDungeon))
                                    wait(0.5)
                                    UseSkill('B')
                                    wait(0.5)
                                    UseSkill('Z')
                                    wait(0.5)
                                    UseSkill('X')
                                    wait(0.5)
                                    UseSkill('C')
                                    wait(0.5)
                                    UseSkill('V')
                                    wait(0.5)
                                until v1325.Humanoid.Health <= 0 or (not _G.AutoFarmDungeon or (not AutoFarmMobDungeon or game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt))
                            end
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.AutoFarmDungeon and AutoSaveModeDungeon then
                pcall(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                        return
                    else
                        while true do
                            if true then
                                task.wait()

                                _G.NotEquip = true

                                if game:GetService('Workspace').Island:FindFirstChild('Arena1') then
                                    tp1(CFrame.new(-9.393295288085938, 201.8232879638672, 16.94792366027832))
                                else
                                    tp1(CFrame.new(-19.639192581176758, 182.88330078125, 6.57674503326416))
                                end
                            end

                            local v1326, v1327, v1328 = u483(game.Players.LocalPlayer.Backpack:GetChildren())

                            while true do
                                local v1329

                                v1328, v1329 = v1326(v1327, v1328)

                                if v1328 == nil then
                                    break
                                end
                                if v1329:IsA('Tool') and v1329.ToolTip == 'Fruit Power' then
                                    EquipWeapon(v1329.Name)
                                end
                            end

                            local v1330, v1331, v1332 = u483(game.Players.LocalPlayer.Character:GetChildren())

                            while true do
                                local v1333

                                v1332, v1333 = v1330(v1331, v1332)

                                if v1332 == nil then
                                    break
                                end
                                if v1333:IsA('Tool') and v1333.ToolTip == 'Fruit Power' then
                                    EquipWeapon(v1333.Name)
                                end
                            end

                            game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game.Players.LocalPlayer.Character.HumanoidRootPart)

                            if game.Players.LocalPlayer.Character.Humanoid.Health == game.Players.LocalPlayer.Character.Humanoid.MaxHealth or not (AutoSaveModeDungeon and _G.AutoFarmDungeon) then
                                _G.NotEquip = false

                                game:GetService('VirtualInputManager'):SendKeyEvent(false, 'E', false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            end
                        end
                    end
                end)
            end
        end
    end)
end

v1013:AddToggle('Inf Geppo', InfGeppo, function(p1334)
    InfGeppo = p1334
end)
v1013:AddToggle('Fly', Flys, function(p1335)
    Flys = p1335
end)
spawn(function()
    while wait() do
        pcall(function()
            if Flys then
                fly()
            end
        end)
    end
end)

function fly()
    local v1336 = game.Players.LocalPlayer:GetMouse('')

    localplayer = game.Players.LocalPlayer

    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart')

    local _HumanoidRootPart6 = game.Players.LocalPlayer.Character.HumanoidRootPart
    local u1338 = 25
    local u1339 = {
        a = false,
        d = false,
        w = false,
        s = false,
    }
    local u1340 = nil
    local u1341 = nil

    local function v1345()
        local _BodyPosition = Instance.new('BodyPosition', _HumanoidRootPart6)
        local _BodyGyro = Instance.new('BodyGyro', _HumanoidRootPart6)

        _BodyPosition.Name = 'EPIXPOS'
        _BodyPosition.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        _BodyPosition.position = _HumanoidRootPart6.Position
        _BodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        _BodyGyro.CFrame = _HumanoidRootPart6.CFrame

        while true do
            wait()

            localplayer.Character.Humanoid.PlatformStand = true

            local v1344 = _BodyGyro.CFrame - _BodyGyro.CFrame.p + _BodyPosition.position

            if not (u1339.w or (u1339.s or (u1339.a or u1339.d))) then
                speed = 1
            end
            if u1339.w then
                v1344 = v1344 + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + u1338
            end
            if u1339.s then
                v1344 = v1344 - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + u1338
            end
            if u1339.d then
                v1344 = v1344 * CFrame.new(speed, 0, 0)
                speed = speed + u1338
            end
            if u1339.a then
                v1344 = v1344 * CFrame.new(-speed, 0, 0)
                speed = speed + u1338
            end
            if u1338 < speed then
                speed = u1338
            end

            _BodyPosition.position = v1344.p

            if u1339.w then
                _BodyGyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 15), 0, 0)
            elseif u1339.s then
                _BodyGyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15), 0, 0)
            else
                _BodyGyro.CFrame = workspace.CurrentCamera.CoordinateFrame
            end
            if not Fly then
                if _BodyGyro then
                    _BodyGyro:Destroy()
                end
                if _BodyPosition then
                    _BodyPosition:Destroy()
                end

                flying = false
                localplayer.Character.Humanoid.PlatformStand = false
                speed = 0

                return
            end
        end
    end

    u1340 = v1336.KeyDown:connect(function(p1346)
        if _HumanoidRootPart6 and _HumanoidRootPart6.Parent then
            if p1346 == 'w' then
                u1339.w = true
            elseif p1346 == 's' then
                u1339.s = true
            elseif p1346 == 'a' then
                u1339.a = true
            elseif p1346 == 'd' then
                u1339.d = true
            end
        else
            flying = false

            u1340:disconnect()
            u1341:disconnect()
        end
    end)
    u1341 = v1336.KeyUp:connect(function(p1347)
        if p1347 == 'w' then
            u1339.w = false
        elseif p1347 == 's' then
            u1339.s = false
        elseif p1347 == 'a' then
            u1339.a = false
        elseif p1347 == 'd' then
            u1339.d = false
        end
    end)

    v1345()
end

v1013:AddToggle('No Clip', _G.NoClip, function(p1348)
    _G.NoClip = p1348
end)
v1014:AddToggle('Esp Player', PlayerESP, function(p1349)
    PlayerESP = p1349

    while PlayerESP do
        wait()
        FindPlayer()
    end
end)
v1014:AddToggle('Esp Devil Fruit', DevilFruitESP, function(p1350)
    DevilFruitESP = p1350

    while DevilFruitESP do
        wait()
        FindDevilFruit()
    end
end)
v1014:AddToggle('Esp Legacy Island', LegacyIslandESP, function(p1351)
    LegacyIslandESP = p1351

    while LegacyIslandESP do
        wait()
        FindLegacyIsland()
    end
end)
v1014:AddToggle('Esp Hydra Island', HydraIslandESP, function(p1352)
    HydraIslandESP = p1352

    while HydraIslandESP do
        wait()
        FindHydraIsland()
    end
end)
v1014:AddToggle('Esp Ghost Ship', GhostShipESP, function(p1353)
    GhostShipESP = p1353

    while GhostShipESP do
        wait()
        FindGhostShip()
    end
end)

Number = math.random(1, 1000000)

function FindPlayer()
    local v1354, v1355, v1356 = u483(game:GetService('Players'):GetChildren())

    while true do
        local u1357

        v1356, u1357 = v1354(v1355, v1356)

        if v1356 == nil then
            break
        end

        pcall(function()
            if u1357.Character then
                if PlayerESP then
                    if u1357.Character.Head and not u1357.Character.Head:FindFirstChild('PlayerESP' .. Number) then
                        local _BillboardGui2 = Instance.new('BillboardGui', u1357.Character.Head)

                        _BillboardGui2.Name = 'PlayerESP' .. Number
                        _BillboardGui2.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui2.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui2.Adornee = u1357.Character.Head
                        _BillboardGui2.AlwaysOnTop = true

                        local _TextLabel32 = Instance.new('TextLabel', _BillboardGui2)

                        _TextLabel32.Font = 'GothamBold'
                        _TextLabel32.FontSize = 'Size14'
                        _TextLabel32.Text = u1357.Name .. '\n' .. math.round((u1357.Character.Head.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                        _TextLabel32.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel32.BackgroundTransparency = 1
                        _TextLabel32.TextStrokeTransparency = 0.5

                        if u1357.Team ~= game:GetService('Players').LocalPlayer.Team then
                            _TextLabel32.TextColor3 = Color3.new(255, 0, 0)
                        else
                            _TextLabel32.TextColor3 = Color3.new(0, 255, 0)
                        end
                    else
                        u1357.Character.Head['PlayerESP' .. Number].TextLabel.Text = u1357.Name .. '\n' .. math.round((u1357.Character.Head.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                    end
                elseif u1357.Character.Head:FindFirstChild('PlayerESP' .. Number) then
                    u1357.Character.Head:FindFirstChild('PlayerESP' .. Number):Destroy()
                end
            end
        end)
    end
end
function FindDevilFruit()
    local v1360, v1361, v1362 = u483(game:GetService('Workspace'):GetChildren())

    while true do
        local u1363

        v1362, u1363 = v1360(v1361, v1362)

        if v1362 == nil then
            break
        end

        pcall(function()
            if string.find(u1363.Name, 'Fruit') then
                if DevilFruitESP then
                    if string.find(u1363.Name, 'Fruit') then
                        if u1363.Handle:FindFirstChild('DevilESP' .. Number) then
                            u1363.Handle['DevilESP' .. Number].TextLabel.Text = u1363.Name .. '\n' .. math.round((u1363.Handle.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                        else
                            local _BillboardGui3 = Instance.new('BillboardGui', u1363.Handle)

                            _BillboardGui3.Name = 'DevilESP' .. Number
                            _BillboardGui3.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui3.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui3.Adornee = u1363.Handle
                            _BillboardGui3.AlwaysOnTop = true

                            local _TextLabel33 = Instance.new('TextLabel', _BillboardGui3)

                            _TextLabel33.Font = 'GothamBold'
                            _TextLabel33.FontSize = 'Size14'
                            _TextLabel33.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel33.BackgroundTransparency = 1
                            _TextLabel33.TextStrokeTransparency = 0.5
                            _TextLabel33.Text = u1363.Name .. '\n' .. math.round((u1363.Handle.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                            _TextLabel33.TextColor3 = Color3.new(255, 255, 0)
                        end
                    end
                elseif u1363.Handle:FindFirstChild('DevilESP' .. Number) then
                    u1363.Handle:FindFirstChild('DevilESP' .. Number):Destroy()
                end
            end
        end)
    end
end
function FindGhostShip()
    local v1366, v1367, v1368 = u483(game:GetService('Workspace').GhostMonster:GetChildren())

    while true do
        local u1369

        v1368, u1369 = v1366(v1367, v1368)

        if v1368 == nil then
            break
        end

        pcall(function()
            if u1369.Name == 'Ghost Ship' then
                if GhostShipESP then
                    if u1369.Name == 'Ghost Ship' then
                        if u1369.HumanoidRootPart:FindFirstChild('GhostESP' .. Number) then
                            u1369.HumanoidRootPart['GhostESP' .. Number].TextLabel.Text = 'Ghost Ship' .. '\n' .. math.round((u1369.HumanoidRootPart.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                        else
                            local _BillboardGui4 = Instance.new('BillboardGui', u1369.HumanoidRootPart)

                            _BillboardGui4.Name = 'GhostESP' .. Number
                            _BillboardGui4.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui4.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui4.Adornee = u1369.HumanoidRootPart
                            _BillboardGui4.AlwaysOnTop = true

                            local _TextLabel34 = Instance.new('TextLabel', _BillboardGui4)

                            _TextLabel34.Font = 'GothamBold'
                            _TextLabel34.FontSize = 'Size14'
                            _TextLabel34.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel34.BackgroundTransparency = 1
                            _TextLabel34.TextStrokeTransparency = 0.5
                            _TextLabel34.Text = 'Ghost Ship' .. '\n' .. math.round((u1369.HumanoidRootPart.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                            _TextLabel34.TextColor3 = Color3.new(204, 159, 40)
                        end
                    end
                elseif u1369.HumanoidRootPart:FindFirstChild('GhostESP' .. Number) then
                    u1369.HumanoidRootPart:FindFirstChild('GhostESP' .. Number):Destroy()
                end
            end
        end)
    end
end
function FindLegacyIsland()
    local v1372, v1373, v1374 = u483(game:GetService('Workspace').Island:GetChildren())

    while true do
        local u1375

        v1374, u1375 = v1372(v1373, v1374)

        if v1374 == nil then
            break
        end

        pcall(function()
            if string.find(u1375.Name, 'Legacy Island') then
                if LegacyIslandESP then
                    if string.find(u1375.Name, 'Legacy Island') then
                        if u1375.Main:FindFirstChild('GayESP' .. Number) then
                            u1375.Main['GhostESP' .. Number].TextLabel.Text = 'Legacy Island' .. '\n' .. math.round((u1375.Main.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                        else
                            local _BillboardGui5 = Instance.new('BillboardGui', u1375.Main)

                            _BillboardGui5.Name = 'GayESP' .. Number
                            _BillboardGui5.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui5.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui5.Adornee = u1375.Main
                            _BillboardGui5.AlwaysOnTop = true

                            local _TextLabel35 = Instance.new('TextLabel', _BillboardGui5)

                            _TextLabel35.Font = 'GothamBold'
                            _TextLabel35.FontSize = 'Size14'
                            _TextLabel35.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel35.BackgroundTransparency = 1
                            _TextLabel35.TextStrokeTransparency = 0.5
                            _TextLabel35.Text = 'Legacy Island' .. '\n' .. math.round((u1375.Main.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                            _TextLabel35.TextColor3 = Color3.new(255, 255, 255)
                        end
                    end
                elseif u1375.Main:FindFirstChild('GayESP' .. Number) then
                    u1375.Main:FindFirstChild('GayESP' .. Number):Destroy()
                end
            end
        end)
    end
end
function FindHydraIsland()
    local v1378, v1379, v1380 = u483(game:GetService('Workspace').Island:GetChildren())

    while true do
        local u1381

        v1380, u1381 = v1378(v1379, v1380)

        if v1380 == nil then
            break
        end

        pcall(function()
            if string.find(u1381.Name, 'Sea King') then
                if HydraIslandESP then
                    if string.find(u1381.Name, 'Sea King') then
                        if u1381.Main:FindFirstChild('HydraESP' .. Number) then
                            u1381.Main['GhostESP' .. Number].TextLabel.Text = 'Hydra Island' .. '\n' .. math.round((u1381.Main.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                        else
                            local _BillboardGui6 = Instance.new('BillboardGui', u1381.Main)

                            _BillboardGui6.Name = 'HydraESP' .. Number
                            _BillboardGui6.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui6.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui6.Adornee = u1381.Main
                            _BillboardGui6.AlwaysOnTop = true

                            local _TextLabel36 = Instance.new('TextLabel', _BillboardGui6)

                            _TextLabel36.Font = 'GothamBold'
                            _TextLabel36.FontSize = 'Size14'
                            _TextLabel36.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel36.BackgroundTransparency = 1
                            _TextLabel36.TextStrokeTransparency = 0.5
                            _TextLabel36.Text = 'Hydra Island' .. '\n' .. math.round((u1381.Main.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. ' m.'
                            _TextLabel36.TextColor3 = Color3.new(0, 255, 255)
                        end
                    end
                elseif u1381.Main:FindFirstChild('HydraESP' .. Number) then
                    u1381.Main:FindFirstChild('HydraESP' .. Number):Destroy()
                end
            end
        end)
    end
end

loadstring(game:HttpGet('https://raw.githubusercontent.com/ZenHubbScript/Main/refs/heads/main/log'))()
getSpawn()

local v1384 = getrawmetatable(game)
local ___namecall = v1384.__namecall

setreadonly(v1384, false)

function v1384.__namecall(...)
    local v1386 = {...}

    if getnamecallmethod() == 'InvokeServer' and (tostring(v1386[1]) == 'SkillAction' and getgenv().PosMonSkill) then
        if not v1386[3] then
            return ___namecall(...)
        end
        if v1386[3].Type == 'Up' or v1386[3].Type == 'Down' then
            v1386[3].MouseHit = getgenv().PosMonSkill

            return ___namecall(unpack(v1386))
        end
    end

    return ___namecall(...)
end
