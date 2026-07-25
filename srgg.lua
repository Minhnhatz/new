getgenv().Team = "Pirates" -- Marines
getgenv().EnabledCamFarm = false
getgenv().LockCam = false
getgenv().HideGui = false
getgenv().PlayerSetting = {
    PcMode = false,
    ShowcaseMode = true,
    HideMap = false,
    SafeHealth = {30, 40},
    FindTargetIfPlayerLowHealth = true,
    Inorge = {
        Fruit = {Enabled = true,
            InorgeFruit = {
                "Portal-Portal", 
                "Kitsune-Kitsune"
            }
        },
        InorgeV4 = true,
        InorgeFriends  = true
    },
    GunMethod = false,
    UseMovePredict = true,
    HitAndRun = true,
    Chat = {
        Enabled = false,
        ListChat = {"ah do i i i","con cho 36"},
    },
}
getgenv().Attack = {
    ForceMelee = true,
    ForceMeleeTime = 3.5,
    StopAttack =true, --When Meet Below Condition
    StopAttackAtHealth = 40,--%
    FastAttack=true, -- Toggle Fast Attack
}
getgenv().UseSkillSetting = {
    -- Three Methods: "Normal", "Fast", "Spam", "SpamAll"
    MethodIfTargetOnV4 = "SpamAll",
    MethodIfPlayerOnV4 = "SpamAll",
    MethodIfTargetUseFruit = {Fruits={},Method="SpamAll"},
    NormalMethod = "SpamAll",
    LowHealthPlayerCondition = { --Player Can Attack Us, No Need For Slow Attack
        Enable = true,
        Health = 70,--%Health That Are Low
        Method = "SpamAll",
    },
    LowHealthTargetCondition = {
        Enable = true,
        Health = 40,--%Health That Are Low
        DelayFirstTime = {true,2}, --1 Is Enable, 2 Is Second To Delay Before Attack Again
        Method = "SpamAll",
        WaitTime = 1.2,-- If Normal Method, Wait Every Skill If It Hits Target
    }
}
getgenv().WeaponsSetting = {
    ["Melee"] = {
        ["Enable"] = true,
        ["Delay"] = 2, 
        ["SwitchNextWeaponIfCooldown"] = true,
        ["Skills"] = {
            ["Z"] = {
                ["Enable"] = true,
                ["NoPredict"] = false, -- For Dragon Tailon, Disable it 
                ["HoldTime"] = 1.75,
                ["TimeToNextSkill"] = 0.6,
            },
        [ "X"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0.6,
            },

            ["C"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0.6,
            },
        },
    },
    ["Blox Fruit"] = {
        ["Enable"] = false,
        ["Delay"] = 1,
        ["SwitchNextWeaponIfCooldown"] = true,
        ["Skills"] = {
            ["Z"] = {
                ["Enable"] = true,
                ["HoldTime"] = 3,
                ["TimeToNextSkill"] = 0,
            },
            ["X"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },

            ["C"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
            ["V"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
            ["F"] = {
                ["Enable"] = false,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
        },
    },
    ["Sword"] = {
        ["Enable"] = true,
        ["Delay"] = 1,
        ["SwitchNextWeaponIfCooldown"] = true,
        ["Skills"] = {
            ["Z"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0.5,
                ["TimeToNextSkill"] = 0.6,
            },
            ["X"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0.5,
                ["TimeToNextSkill"] = 0.6,
            },
        },
    },
    ["Gun"] = {
        ["Enable"] = false,
        ["Delay"] = 0.5,
        ["SwitchNextWeaponIfCooldown"] = true,
        ["Skills"] = {
            ["Z"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
            ["X"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
        },
    },
}
getgenv().Counter = {["Enabled"] = true,
    ["Webhook"] = {["Enabled"] = false,
        ["Url"] = ""
    },
    ["Theme"] = {
        ["Enabled"] = true,
        ["Theme Character"] = "Yae",
        ["Custom"] = {
            ["Enabled"] = false,
            ["File Config"] = {
                ["Background"] = "background.png",
                ["Character"] = "character.png",
                ["Icon"] = "icon.png",
                ["Button Image"] = "button.png",
                ["Color"] = {["Text"] = Color3.fromRGB(255, 255, 255), ["Stroke"] = Color3.fromRGB(255, 255, 255)}
            }
        }
    }
}
--// nill
Tasks = {}
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local v3 = lp.PlayerGui
local rs = game.ReplicatedStorage
local player = game.Players.LocalPlayer
local chim, lon
ThongBaoNek = function(content, duration)
    print("[Rua Hub] " .. tostring(content))
end

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") then
    repeat
        wait()
        local l_Remotes_0 = game.ReplicatedStorage:WaitForChild("Remotes")
        l_Remotes_0.CommF_:InvokeServer("SetTeam", getgenv().Team)
        task.wait(0.1)
    until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)")
end
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main")

CameraShakerR = require(game["ReplicatedStorage"]["Util"]["CameraShaker"])
CameraShakerR:Stop()
local WS = getgenv().WeaponsSetting or {}
WS["Melee"] = WS["Melee"] or {}
WS["Sword"] = WS["Sword"] or {}
WS["Blox Fruit"] = WS["Blox Fruit"] or {}
WS["Gun"] = WS["Gun"] or {}
WS.Use = WS.Use or nil

local vu77 = "Rua Hub"
local vu78 = vu77 .. "/Auto Bounty"
local vu79 = vu78 .. "/Main"
local vu80 = vu78 .. "/Theme"
function readdata(name, isTheme, default)
    if not isfolder(vu77) then makefolder(vu77) end
    if not isfolder(vu78) then makefolder(vu78) end
    if not isfolder(vu80) then makefolder(vu80) end
    if not isfolder(vu79) then makefolder(vu79) end

    if not isTheme then
        local file = vu79 .. "/" .. lp.Name .. "_" .. name .. ".json"
        if isfile(file) then
            return game:GetService("HttpService"):JSONDecode(readfile(file))
        end
        return default
    end
    local file2 = vu80 .. "/" .. name
    if isfile(file2) then
        return getcustomasset(file2)
    end

    return default
end
function save(p86, p87)
    local v88 = vu79 .. "/" .. lp.Name .. "_" .. p86 .. ".json"
    local v89 = game:GetService("HttpService"):JSONEncode(p87)
    writefile(v88, v89)
    return v89
end
--// Lock Bounty
-- if Setup["Auto Team"]["Enable Lock Bounty"] and not (lp.leaderstats["Bounty/Honor"].Value > tonumber(Setup["Auto Team"]["Lock Bounty"][1])) or not (lp.leaderstats["Bounty/Honor"].Value < tonumber(Setup["Auto Team"]["Lock Bounty"][2])) then 
--     lp:Kick("Lock Bounty")
-- end
--// Cam Farm
CamFarm = getgenv().EnabledCamFarm
if CamFarm == false then
    game.Players.LocalPlayer.CameraMinZoomDistance = 127
    game.Players.LocalPlayer.CameraMaxZoomDistance = 127
    game.Players.LocalPlayer.CameraMaxZoomDistance = 127
    game.Players.LocalPlayer.CameraMinZoomDistance = 0
else
    CamFarm = true
    game.Players.LocalPlayer.CameraMinZoomDistance = 0
    game.Players.LocalPlayer.CameraMaxZoomDistance = 0
    game.Players.LocalPlayer.CameraMaxZoomDistance = 127
    game.Players.LocalPlayer.CameraMinZoomDistance = 0
end
--// Showcase Mode
-- if getgenv().PlayerSetting.ShowcaseMode then
--     local playerGui = game:GetService("Players").LocalPlayer.PlayerGui.Main
--     playerGui.Beli.Visible = false
--     playerGui.Energy.Visible = false
--     playerGui.StatsButton.Visible = false
--     playerGui.ShopButton.Visible = false
--     playerGui.Skills.Visible = false
--     playerGui.Level.Visible = false
--     playerGui.MenuButton.Visible = false
--     playerGui.Code.Visible = false
--     playerGui.Settings.Visible = false
--     playerGui.Mute.Visible = false
--     playerGui.CrewButton.Visible = false
-- else
--     playerGui.Beli.Visible = true
--     playerGui.Energy.Visible = true
--     playerGui.StatsButton.Visible = true
--     playerGui.ShopButton.Visible = true
--     playerGui.Skills.Visible = true
--     playerGui.Level.Visible = true
--     playerGui.MenuButton.Visible = true
--     playerGui.Code.Visible = true
--     playerGui.Settings.Visible = true
--     playerGui.Mute.Visible = true
--     playerGui.CrewButton.Visible = true
-- end
--// Hide Map
if getgenv().PlayerSetting.HideMap then
    local LocalChar = game.Players.LocalPlayer.Character
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalChar) then
            obj.Transparency = 1
            obj.CanTouch = false
            obj.CanQuery = false
        end
    end
    if workspace:FindFirstChild("Terrain") then
        workspace.Terrain.WaterTransparency = 1
    end
end
--// kbt nua
-- local Lighting = game:GetService("Lighting")
-- local Blur = Instance.new("BlurEffect")                 
-- Blur.Size = 15
-- Blur.Parent = Lighting       
game:GetService("Players").LocalPlayer.Character:SetAttribute("UnbreakableAll", true)                       
--// Hop
function Hop()
    function bQ(v)
        if v.Name == "ErrorPrompt" then
            if v.Visible then
                if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                    v.Visible = false
                end
            end
            v:GetPropertyChangedSignal("Visible"):Connect(function()
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        v.Visible = false
                    end
                end
            end)
        end
    end
    for i, v in game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren() do
        bQ(v) 
    end
    game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
    while wt() do
        randomy = math.random(9000, 10000)
        to(CFrame.new(-12463.8740234375 , randomy, -7523.77392578125)) 
        if not CheckInComBat() then
            ThongBaoNek("Hopping To Server: "..game.JobId, 5)
            for r = 1, math.huge do
                to(CFrame.new(-12463.8740234375, randomy, -7523.77392578125)) 
                lp.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = "Singapore"
                for k, v in inv(rs.__ServerBrowser, {r}) do
                    if k ~= game.JobId and v["Count"] <= 10 then
                        inv(rs.__ServerBrowser, {"teleport", k})
                    end
                end
                wt()
            end
        end
    end
end


function CheckInComBat()
    return game.Players.LocalPlayer.PlayerGui.Main.BottomHUDList.InCombat.Visible and game.Players.LocalPlayer.PlayerGui.Main.BottomHUDList.InCombat.Text and (string.find(string.lower(game.Players.LocalPlayer.PlayerGui.Main.BottomHUDList.InCombat.Text),"risk"))
end 

-- local bocchitherock = {
--     "rbxassetid://125436134952933",
--     "rbxassetid://100165252123599",
--     "rbxassetid://114287022295860",
--     "rbxassetid://84665398850981",
--     "rbxassetid://102643471448378",
--     "rbxassetid://138421897748221",
--     "rbxassetid://73823066506751"
-- }
-- local randomIndex = math.random(1, #bocchitherock)

getgenv().Bounty = {
    Targ = nil,
    Checked = {},
    Hop = false,
    CanUseWeapon = false,
    CanUseSkill = false,
    UsingSkill = false,
    WeaponUsing = "",
    ToolTipUsing = "Melee",
    CFrameTarget = CFrame.new(Vector3.new(0,0,0)),
    Digit = CFrame.new(Vector3.new(0,0,0)),
}
local _pid = game.PlaceId
local Sea1 = (_pid == 2753915549 or _pid == 85211729168715)
local Sea2 = (_pid == 4442272183 or _pid == 79091703265657)
local Sea3 = (_pid == 7449423635 or _pid == 100117331123089)
if Sea1 then distbyp = 1500
elseif Sea2 then distbyp = 3500
elseif Sea3 then distbyp = 6000
else distbyp = 1500 end
local _PORTALS = {
    Sea1 = {
        Vector3.new(-7894.6201171875,  5545.49169921875, -380.246346191406),
        Vector3.new(-4607.82275390625,  872.5422973632812, -1667.556884765625),
        Vector3.new(61163.8515625,       11.759522438049316, 1819.7841796875),
        Vector3.new(3876.280517578125,   35.10614013671875, -1939.3201904296875),
    },
    Sea2 = {
        Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
        Vector3.new(2284.912109375,       15.152046203613281, 905.48291015625),
        Vector3.new(923.21252441406,     126.9760055542,    32852.83203125),
        Vector3.new(-6508.5581054688,     89.034996032715,  -132.83953857422),
    },
    Sea3 = {
        Vector3.new(-5058.77490234375,  314.5155029296875, -3155.88330078125),
        Vector3.new(5756.83740234375,   610.4240112304688,  -253.9253692626953),
        Vector3.new(-12463.8740234375,  374.9144592285156, -7523.77392578125),
        Vector3.new(28282.5703125,    14896.8505859375,    105.1042709350586),
        Vector3.new(-11993.580078125,   334.7812805175781, -8844.1826171875),
        Vector3.new(5314.58203125,       25.419387817382812, -125.94227600097656),
        Vector3.new(5658.55,           1013.08,             -336.22),
    },
}
function getPortal(check2)
    local targetPos = typeof(check2) == "CFrame" and check2.Position or check2
    local seaKey = Sea1 and "Sea1" or Sea2 and "Sea2" or Sea3 and "Sea3"
    local list = seaKey and _PORTALS[seaKey] or {}
    local best, bestDist = Vector3.new(0,0,0), math.huge
    for _, pos in pairs(list) do
        local d = (pos - targetPos).Magnitude
        if d < bestDist then
            best, bestDist = pos, d
        end
    end
    return best
end
function getSpawn(wtf)
    local pos = typeof(wtf) == "CFrame" and wtf.Position or wtf
    local a, b = nil, math.huge
    for _, v in pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(lp.Team)):GetChildren()) do
        if tostring(v) ~= "Leviathan" then
            local d = (v:GetModelCFrame().Position - pos).Magnitude
            if d < b then a = v:GetModelCFrame(); b = d end
        end
    end
    return a
end

function request(pos)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", pos)
EspEventIsland
function calcpos(I, II)
    if not II then II = lp.Character.PrimaryPart.CFrame end
    local p1 = typeof(I)  == "CFrame" and I.Position  or I
    local p2 = typeof(II) == "CFrame" and II.Position or II
    return (Vector3.new(p1.X, 0, p1.Z) - Vector3.new(p2.X, 0, p2.Z)).Magnitude
end
local _tween       = nil
local _tweenBusy   = false
local _tweeningV2  = false
local _cancelNext  = false
local _RunS        = game:GetService("RunService")
local _TweenSvc    = game:GetService("TweenService")
local function _pickSpeed(dist)
    if dist <= 300 then return 400
    elseif dist <= 700 then return 350
    else return 300 end
end
local function _setFloating(enable)
    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if enable then
        if not hrp:FindFirstChild("VelocityBody") then
            local bv = Instance.new("BodyVelocity")
            bv.Name      = "VelocityBody"
            bv.Parent    = hrp
            bv.MaxForce  = Vector3.new(100000, 100000, 100000)
            bv.Velocity  = Vector3.new(0, 0, 0)
        end
    else
        local bv = hrp:FindFirstChild("VelocityBody")
        if bv then bv:Destroy() end
    end
end
local _noclipConn = nil
local function _startNoclip()
    if _noclipConn then return end
    _noclipConn = _RunS.Stepped:Connect(function()
        if lp.Character then
            for _, p in pairs(lp.Character:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide and p.Name ~= "VelocityBody" then
                    p.CanCollide = false
                end
            end
        end
    end)
end
local function _stopNoclip()
    if _noclipConn then
        _noclipConn:Disconnect()
        _noclipConn = nil
    end
end
local function _cancelTween()
    _cancelNext = true
    _tweeningV2 = false
    if _tween then
        _tween:Cancel()
        _tween = nil
    end
    _stopNoclip()
    _setFloating(false)
    task.wait()
    _cancelNext = false
end
local function _tryPortalRoute(targetVec3)
    local myPos = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not myPos then return end
    myPos = myPos.Position
    local myDist = (myPos - targetVec3).Magnitude

    if Sea1 then
        local portalChecks = {
            {gate = Vector3.new(61163.8515625,   11.6796875,  1819.7841796875),   radius = 2000, enterDist = 1000},
            {gate = Vector3.new(-7894.61767578125, 5547.14160156, -380.29119873), radius = 3000, enterDist = 3000},
            {gate = Vector3.new(-4607.82275390625,  874.390502929, -1667.55688476), radius = 3000, enterDist = 3000},
        }
        for _, p in ipairs(portalChecks) do
            if (myPos - p.gate).Magnitude > p.radius
            and (targetVec3 - p.gate).Magnitude < p.enterDist then
                repeat task.wait()
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", p.gate)
                until (lp.Character.HumanoidRootPart.Position - p.gate).Magnitude < p.radius
                return
            end
        end
    elseif Sea2 then
        local skyGate = Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)
        if (myPos - skyGate).Magnitude > 3000 and (targetVec3 - skyGate).Magnitude < 1000 then
            repeat task.wait()
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", skyGate)
            until (lp.Character.HumanoidRootPart.Position - skyGate).Magnitude < 2000
        end
    elseif Sea3 then
        local SubmergedPos = Vector3.new(11256, -2138.0, 9888)
        local TikiPos      = Vector3.new(-16269.0, 23, 1371)
        if (SubmergedPos - targetVec3).Magnitude < (myPos - targetVec3).Magnitude - 700 then
            if (myPos - TikiPos).Magnitude > 60 then
                to(CFrame.new(TikiPos))
                return
            end
            local Net = require(game.ReplicatedStorage.Modules.Net)
            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("AskKilledTikiBoss")
            wait(0.5)
            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
            return
        end
    end
end
local function DoTween2(targetVec3Getter, condition)
    -- targetVec3Getter can be a Vector3 (static) or a function() returning Vector3 (dynamic)
    if not targetVec3Getter then return end
    if not condition then condition = function() return true end end
    local function getTarget()
        if type(targetVec3Getter) == "function" then
            return targetVec3Getter()
        end
        return targetVec3Getter
    end

    while not (lp.Character
    and lp.Character:FindFirstChild("Humanoid")
    and lp.Character.Humanoid.Health > 0) do
        task.wait(1)
    end

    local TeleportSpeed = 350
    local HRP = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return end

    local initialTarget = getTarget()
    if not initialTarget then return end

    if math.abs(HRP.Position.Y - initialTarget.Y) > 50 then
        HRP.CFrame = CFrame.new(HRP.Position.X, initialTarget.Y, HRP.Position.Z)
        task.wait()
    end
    pcall(_tryPortalRoute, initialTarget)

    _tweeningV2 = true
    _startNoclip()
    _setFloating(true)

    local currentTween = nil
    local lastTarget   = Vector3.new(math.huge, math.huge, math.huge)

    local heartbeatConn
    heartbeatConn = _RunS.Heartbeat:Connect(function()
        if not _tweeningV2 then
            heartbeatConn:Disconnect()
            return
        end
        if not (lp.Character
            and lp.Character:FindFirstChild("Humanoid")
            and lp.Character.Humanoid.Health > 0
            and condition()) then
            _tweeningV2 = false
            heartbeatConn:Disconnect()
            return
        end

        -- Anti-sit
        lp.Character.Humanoid.Sit = false

        local targetVec3 = getTarget()
        if not targetVec3 then return end

        local dist = (HRP.Position - targetVec3).Magnitude
        if dist <= TeleportSpeed / 2 then
            -- Close enough, snap to target
            HRP.CFrame = CFrame.new(targetVec3)
            if currentTween then currentTween:Cancel(); currentTween = nil end
            _tweeningV2 = false
            heartbeatConn:Disconnect()
            return
        end

        -- Only re-create tween if target moved significantly (avoids spam)
        if (targetVec3 - lastTarget).Magnitude > 1 then
            lastTarget = targetVec3
            if currentTween then currentTween:Cancel(); currentTween = nil end

            local duration = dist / TeleportSpeed
            currentTween = _TweenSvc:Create(
                HRP,
                TweenInfo.new(duration, Enum.EasingStyle.Linear),
                {CFrame = CFrame.new(targetVec3)}
            )
            currentTween:Play()
        end

        -- Bypass noise to avoid server anti-cheat
        pcall(function()
            HRP.Velocity = HRP.Velocity + Vector3.new(
                math.random(-10, 10),
                math.random(-100, 12),
                math.random(-10, 10)
            )
            lp.Character.Humanoid.MoveDirection = lp.Character.Humanoid.MoveDirection
                + Vector3.new(math.random(-10,10), math.random(-100,12), math.random(-10,10))
        end)
    end)

    -- Wait until tween loop finishes
    while _tweeningV2 do task.wait(0.05) end
    if currentTween then currentTween:Cancel(); currentTween = nil end

    _stopNoclip()
    _setFloating(false)
    _tweeningV2 = false
end

local function DoTween(targetCF, forceNoWait)
    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    local HRP  = lp.Character.HumanoidRootPart
    local dist = (HRP.Position - targetCF.Position).Magnitude
    if targetCF.Position.X ~= targetCF.Position.X then return end
    if math.abs(HRP.Position.Y - targetCF.Y) > 70 then
        HRP.CFrame = CFrame.new(HRP.Position.X, targetCF.Y, HRP.Position.Z)
        task.wait()
    end

    local speed = _pickSpeed(dist)

    if _tween then _tween:Cancel(); _tween = nil end
    if dist <= 350 then
        HRP.CFrame = targetCF
        return
    end

    _tween = _TweenSvc:Create(
        HRP,
        TweenInfo.new(dist / speed, Enum.EasingStyle.Linear),
        {CFrame = targetCF}
    )

    _setFloating(true)
    _startNoclip()

    lp.Character.Humanoid.Died:Connect(function()
        if _tween then _tween:Cancel() end
    end)

    if not forceNoWait then
        _tween:Play()
        _tween.Completed:Wait()
    else
        _tween:Play()
    end

    _stopNoclip()
    _setFloating(false)
    if _tween then _tween:Cancel(); _tween = nil end
end
function to(Pos)
    if not Pos then return end
    pcall(function()
        if not lp.Character then return end
        local HRP = lp.Character:FindFirstChild("HumanoidRootPart")
        if not HRP then return end

        local targetCF  = typeof(Pos) == "CFrame" and Pos or CFrame.new(Pos)
        local targetV3  = targetCF.Position
        local dist      = (HRP.Position - targetV3).Magnitude

        -- Condition: keep moving while the target is still alive
        local function aliveCondition()
            if not (lp.Character
            and lp.Character:FindFirstChild("Humanoid")
            and lp.Character.Humanoid.Health > 0) then
                return false
            end
            if not Bounty.Targ then return true end
            local ok, hrp = pcall(function()
                return Bounty.Targ.Character and Bounty.Targ.Character:FindFirstChild("HumanoidRootPart")
            end)
            return ok and hrp ~= nil
        end
        -- Dynamic getter: if Pos is a static CFrame/Vector3, return fixed target.
        -- If Bounty.Targ is alive, continuously track their HRP position.
        local function dynamicTarget()
            if Bounty.Targ and Bounty.Targ.Character then
                local hrp = Bounty.Targ.Character:FindFirstChild("HumanoidRootPart")
                if hrp then return hrp.Position end
            end
            return targetV3
        end

        if dist <= 350 then
            DoTween(targetCF)
        elseif dist > 2000 then
            local ok, portalPos = pcall(getPortal, targetV3)
            if ok and portalPos then
                local myPos    = HRP.Position
                local portalD  = (portalPos - targetV3).Magnitude
                local directD  = (myPos - targetV3).Magnitude
                if portalD < directD - 300 then
                    request(portalPos)
                    task.wait(0.5)
                end
            end
            DoTween2(dynamicTarget, aliveCondition)
        else
            DoTween2(dynamicTarget, aliveCondition)
        end
    end)
end
function StopTween()
    _cancelTween()
end
--// Equip
function equip(tool)
    for _, v in lp.Backpack:GetChildren() do 
        if v:IsA("Tool") and v.ToolTip == tool then
            wfh(lp):EquipTool(v)
            return v.Name
        end 
    end 
    return false
end
--//Weapon List
function GetWeaponList()
    local result = {}
    local order = getgenv().WeaponPriority 
                or (WS.Use or {"Melee","Sword","Blox Fruit","Gun"})

    for _, weaponType in ipairs(order) do
        local cfg = WS[weaponType]
        if cfg and cfg.Enable == true then
            if cfg.Skills then
                table.insert(result, weaponType)
            end
        end
    end

    return result
end
--// Use Skill
function down(key, hold)
    pcall(function()
        if not ffc(lp.Character, Bounty.WeaponUsing) then
            equip(Bounty.ToolTipUsing)
        end
        local vim = game:GetService("VirtualInputManager")
        pcall(function() vim:SendKeyEvent(true, key, false, game) end)
        local t0 = tick()
        repeat
            wt(0.01)
            if not ffc(lp.Character, Bounty.WeaponUsing) then
                equip(Bounty.ToolTipUsing)
            end
            pcall(function() vim:SendKeyEvent(true, key, false, game) end)
        until (tick() - t0) >= (hold or 0) or not Bounty.CanUseSkill or not Bounty.CanUseWeapon
        pcall(function() vim:SendKeyEvent(false, key, false, game) end)
    end)
end
--// Skill
function cd(I, II) 
    if not II then II = lp.Character.PrimaryPart.CFrame end
    return (Vector3.new(I.X, 0, I.Z) - Vector3.new(II.X, 0, II.Z)).Magnitude 
end 
function int(num)
    if not num then return end
    return tonumber(num)
end
function str(string)
    if not string then return end
    return tostring(string)
end
function wt(num)
    if not num then return task.wait() end
    return task.wait(int(num))
end
function ffc(obj, child)
    if not obj or not child then return end
    return obj:FindFirstChild(str(child))
end
function wfc(obj, child)
    if not obj or not child then return end
    return obj:WaitForChild(str(child), 9)
end
function wfh(mob)
    if not mob then return end
    return wfc(mob.Character, "Humanoid")
end
function wfhrp(mob)
    if not mob then return end
    return wfc(mob.Character, "HumanoidRootPart")
end
function checkmon(mob)
    if not mob then return end
    if mob and ffc(mob.Character, "Humanoid") and mob.Character.Humanoid.Health > 0 and ffc(mob.Character, "HumanoidRootPart") then
        return true
    end
    return
end
function inv(obj, child)
    if not obj or not child then return end
    return obj:InvokeServer(unpack(child))
end

function checkfruit(targcheck)
    local pdf = targcheck and ffc(targcheck, "Data") and ffc(targcheck.Data, 'DevilFruit') and targcheck.Data.DevilFruit.Value
    for _, v in getgenv().PlayerSetting.Inorge.Fruit.InorgeFruit do 
        if str(v) == str(pdf) then 
            return true
        end
    end
    return false
end
-- findtarget = function()
--     table.insert(Bounty.Checked, Bounty.Targ)
--     Bounty.CanUseWeapon = false
--     Bounty.CanUseSkill = false
--     if getgenv().PlayerSetting.Chat.Enabled then
--         local chat = game:GetService("TextChatService")
--         local ch = chat:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    
--         local msg = getgenv().PlayerSetting.Chat.ListChat[
--             math.random(1, #getgenv().PlayerSetting.Chat.ListChat)
--         ]
    
--         ch:SendAsync(msg)
--     end
--     if not Bounty.Hop then
--         local bestTarget, shortestDist = nil, math.huge

--         for _, v in plrs:GetChildren() do
--             if v ~= lp
--                 and v.Team
--                 and string.find(str(v.Team.Name), "es")
--                 and not table.find(Bounty.Checked, v)
--                 and (str(lp.Team.Name) == "Pirates" or str(v.Team.Name) == "Pirates")
--                 and math.abs(lp.Data.Level.Value - v.Data.Level.Value) < 600
--                 and (not getgenv().PlayerSetting.Inorge.Fruit.Enabled or not checkfruit(v))
--                 and (not getgenv().PlayerSetting.Inorge.InorgeV4 or not (ffc(v.Backpack, "Awakening") or ffc(v.Character, "Awakening")))
--                 -- and cd(getSpawn(wfhrp(v).CFrame), wfhrp(v).CFrame) <= 3000 -- 627
--                 and (function()
--                     local hrp = wfhrp(v)
--                     if not hrp then return false end
--                     local sp = pcall(getSpawn, hrp.CFrame)
--                     if not sp then return true end -- bỏ qua check nếu lỗi
--                     return cd(getSpawn(hrp.CFrame), hrp.CFrame) <= 3000
--                 end)()
--                 and not ffc(v.Character, "TempSafeZone")
--                 and checkmon(v)
--             then
--                 local dist = cd(wfhrp(v).CFrame, wfhrp(lp).CFrame)
--                 if dist < shortestDist then
--                     bestTarget = v
--                     shortestDist = dist
--                 end
--             end
--         end
--         if bestTarget then
--             Bounty.Targ = bestTarget
--             local hrp = ffc(bestTarget.Character, "HumanoidRootPart")
--             if hrp then
--                 Bounty.CFrameTarget = hrp.CFrame
--                 Bounty.Digit = hrp.CFrame
--                 task.spawn(function()
--                     to(RandomCFrame(hrp.CFrame + Vector3.new(0, 5, 0)))
--                 end)
--             end
--             ThongBaoNek(" Start Killing : " .. Bounty.Targ.Name, 3)
--             for _, v in pairs(game.Workspace.Characters:GetChildren()) do
--                 if v.Name ~= lp.Name and ffc(v, "HumanoidRootPart") then
--                     v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
--                     v.HumanoidRootPart.CanCollide = true
--                 end
--             end
--             local hrp = ffc(Bounty.Targ.Character, "HumanoidRootPart")
--             if hrp then
--                 hrp.Size = Vector3.new(100, 100, 100)
--                 hrp.Transparency = 1
--                 hrp.CanCollide = false
--             end
--             return true
--         end
--     end
--     Bounty.Hop = true
--     Hop()
--     return false
-- end

findtarget = function()
    table.insert(Bounty.Checked, Bounty.Targ)
    Bounty.CanUseWeapon = false
    Bounty.CanUseSkill = false
    Bounty.Targ = nil

    if getgenv().PlayerSetting.Chat.Enabled then
        local chat = game:GetService("TextChatService")
        local ch = chat:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
        local msg = getgenv().PlayerSetting.Chat.ListChat[
            math.random(1, #getgenv().PlayerSetting.Chat.ListChat)
        ]
        ch:SendAsync(msg)
    end

    if not Bounty.Hop then
        local bestTarget, shortestDist = nil, math.huge

        for _, v in plrs:GetChildren() do
            if v ~= lp
                and v.Team
                and string.find(str(v.Team.Name), "es")
                and not table.find(Bounty.Checked, v)
                and (str(lp.Team.Name) == "Pirates" or str(v.Team.Name) == "Pirates")
                and math.abs(lp.Data.Level.Value - v.Data.Level.Value) < 600
                and (not getgenv().PlayerSetting.Inorge.Fruit.Enabled or not checkfruit(v))
                and (not getgenv().PlayerSetting.Inorge.InorgeV4 or not (ffc(v.Backpack, "Awakening") or ffc(v.Character, "Awakening")))
                and (not getgenv().PlayerSetting.Inorge.InorgeFriends or not (v.UserId and lp:IsFriendsWith(v.UserId)))
                and not isAtSubmergedIsland(v) -- Bỏ qua target đang ở Submerged Island
                and (function()
                    local hrp = wfhrp(v)
                    if not hrp then return false end
                    -- Lọc safe zone ngay từ đây, không chọn target đang ở safe zone
                    if checksafezone(hrp.CFrame) then return false end
                    if ffc(v.Character, "TempSafeZone") then return false end
                    local ok, sp = pcall(getSpawn, hrp.CFrame)
                    if not ok then return true end
                    return cd(sp, hrp.CFrame) <= 3000
                end)()
                and checkmon(v)
            then
                local dist = cd(wfhrp(v).CFrame, wfhrp(lp).CFrame)
                if dist < shortestDist then
                    bestTarget = v
                    shortestDist = dist
                end
            end
        end

        if bestTarget then
            Bounty.Targ = bestTarget
            local hrp = ffc(bestTarget.Character, "HumanoidRootPart")
            if hrp then
                Bounty.CFrameTarget = hrp.CFrame
                Bounty.Digit = hrp.CFrame
                -- Tween trực tiếp, không dùng task.spawn
                to(RandomCFrame(hrp.CFrame + Vector3.new(0, 5, 0)))
            end
            ThongBaoNek("Start Killing: " .. Bounty.Targ.Name, 3)

            for _, v in pairs(game.Workspace.Characters:GetChildren()) do
                if v.Name ~= lp.Name and ffc(v, "HumanoidRootPart") then
                    v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                    v.HumanoidRootPart.CanCollide = true
                end
            end

            local targHrp = ffc(Bounty.Targ.Character, "HumanoidRootPart")
            if targHrp then
                targHrp.Size = Vector3.new(100, 100, 100)
                targHrp.Transparency = 1
                targHrp.CanCollide = false
            end
            -- QUAN TRỌNG: return true để vòng lặp chính biết đã có target mới và tiếp tục tween
            return true
        end
    end

    Bounty.Hop = true
    Hop()
    return false
end

function LockCamera(Target)
    local cam = workspace.CurrentCamera
    local lp = game.Players.LocalPlayer
    if not getgenv().LockCam then return end
    if not Target or not Target.Character then return end

    local hrp = Target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    cam.CFrame = CFrame.new(cam.CFrame.Position, hrp.Position)
end
spawn(function()
    while task.wait() do
        if getgenv().Bounty.Targ then
            LockCamera(getgenv().Bounty.Targ)
        end
    end
end)
function cnoti(p188)
    for _, v in pairs(lp.PlayerGui.Notifications:GetChildren()) do
        if v:IsA("TextLabel") and v.Text then
            local t = string.lower(v.Text)

            if string.find(t, string.lower(p188)) 
            or string.find(t, string.lower(lp.Name)) then

                if not string.find(t, " =))") then
                    v.Text = v.Text .. " =))"
                end

                if string.find(t, "earn") then
                    return "earned"
                end
                if string.find(t, "sus") then
                    return "sus"
                end
            end
        end
    end
    return "not find"
end
function checkraid(target)
    if ffc(workspace["_WorldOrigin"].Locations, "Island 1") then
        if cd(wfhrp(target).CFrame, workspace["_WorldOrigin"].Locations["Island 1"].CFrame) < 3000 then 
            return true 
        end 
    end 
    return false
end
function checksafezone(pos)
    for _, v in workspace._WorldOrigin.SafeZones:GetChildren() do
        if cd(v.CFrame, pos) < (v.Mesh.Scale.Magnitude / 2) then
            return true
        end
    end
    return false
end  
-- Pure check (no side effects): true if `target` is currently at/near
-- the Submerged Island. Used both to pre-filter target selection in
-- findtarget() and by checkdao() below for the reactive re-check.
local SubmergedIslandPos = Vector3.new(11256, -2138.0, 9888)
function isAtSubmergedIsland(target)
    local hrp = ffc(target and target.Character, "HumanoidRootPart")
    if not hrp then return false end

    -- Prefer the actual map part if it's loaded (Sea 3 only)...
    if workspace:FindFirstChild("Map") then
        local island = workspace.Map:FindFirstChild("Submerged Island")
        if island then
            local part = island.PrimaryPart or island:FindFirstChildWhichIsA("BasePart")
            if part and cd(hrp.Position, part.Position) < 5000 then
                return true
            end
        end
    end

    -- ...fall back to the known Submerged Island world position
    -- (covers the case where the "Submerged Island" model isn't
    -- streamed in yet, e.g. we're not physically inside it).
    if (hrp.Position - SubmergedIslandPos).Magnitude < 2000 then
        return true
    end

    return false
end

function checkdao(target)
    if isAtSubmergedIsland(target) then
        ThongBaoNek(" Target is in Submerged Island...", 3)
        return findtarget()
    end
    return false
end
function checkfriend(target)
    if target and target.UserId then
        local plr = game.Players.LocalPlayer
        if plr:IsFriendsWith(target.UserId) then
            ThongBaoNek(" Target is your friend -> Skipped...", 3)
            return true
        end
    end
    return false
end
-- local oldtarg = Bounty.Targ
-- local oldtime = tick() 
-- local startuse = false
-- function checktarg()
--     if Bounty.Targ and Bounty.Targ.Name then
--         -- check kill noti
--         local result = cnoti(Bounty.Targ.Name)
--         if result == "earned" then
--             ThongBaoNek("Killed: " .. Bounty.Targ.Name, 3)
--             return findtarget()
--         end
--     end
--     if not checkmon(Bounty.Targ) then
--         return findtarget()
--     end
--     if checkfriend(Bounty.Targ) then
--         return findtarget()
--     end
--     local hrp = ffc(Bounty.Targ.Character, "HumanoidRootPart")
--     if not hrp then return true end

--     local dist = (wfhrp(lp).Position - hrp.Position).Magnitude
--     if dist > 80 then
--         local targCF = wfhrp(Bounty.Targ)
--         if targCF then
--             Bounty.CFrameTarget = targCF.CFrame
--             Bounty.Digit = targCF.CFrame
--             to(RandomCFrame(targCF.CFrame + Vector3.new(0, 5, 0)))
--         end
--         return true
--     end
--     if checksafezone(wfhrp(Bounty.Targ).CFrame) then
--         ThongBaoNek(" Target is in a safe zone...", 3)
--         return findtarget()
--     end
--     if checkraid(Bounty.Targ) then
--         ThongBaoNek(" Target is in a raid...", 3)
--         return findtarget()
--     end
--     if checkdao(Bounty.Targ) then
--         return
--     end
--     if getgenv().PlayerSetting.FindTargetIfPlayerLowHealth then
--         local hp = lp.Character and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health
--         local max = lp.Character and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.MaxHealth
--         if hp and max then
--             local percentage = (hp / max) * 100

--             local low = getgenv().PlayerSetting.SafeHealth[1] or 30
--             local critical = getgenv().PlayerSetting.SafeHealth[2] or 40
--             if percentage <= low then
--                 ThongBaoNek("Health low ("..math.floor(percentage).."%) → Finding safer target...", 3)
--                 return findtarget()
--             end
--             if percentage <= critical and Bounty.Targ 
--             and Bounty.Targ.Character 
--             and Bounty.Targ.Character:FindFirstChild("Humanoid") 
--             and Bounty.Targ.Character.Humanoid.WalkSpeed > 20 then
--                 ThongBaoNek("HP critical, avoiding aggressive player...", 3)
--                 return findtarget()
--             end
--         end
--     end

--     if Bounty.Targ == oldtarg then
--         if Bounty.UsingSkill and not startuse then
--             oldspamskill = tick()
--             startuse = true
--         end
--         if startuse and (tick() - oldspamskill) >= 3 and not (Bounty.Targ.Character:GetAttribute("InCombat") == 0 or Bounty.Targ.Character:GetAttribute("InCombat") == 1) then
--             ThongBaoNek(" Target is not in combat...", 3)
--             return findtarget()
--         end
--     else
--         startuse = false
--         oldtarg = Bounty.Targ
--     end
--     return true
-- end
local oldtarg = Bounty.Targ
local oldtime = tick()
local startuse = false

function checktarg()
    -- Chưa có target → tìm ngay, return kết quả của findtarget
    if not Bounty.Targ then
        return findtarget()
    end

    -- Kiểm tra kill notification
    if Bounty.Targ.Name then
        local result = cnoti(Bounty.Targ.Name)
        if result == "earned" then
            ThongBaoNek("Killed: " .. Bounty.Targ.Name, 3)
            -- findtarget() tìm target mới và return true/false
            return findtarget()
        end
    end

    -- Target chết / không hợp lệ
    if not checkmon(Bounty.Targ) then
        return findtarget()
    end

    -- Target là bạn bè
    if checkfriend(Bounty.Targ) then
        ThongBaoNek("Target is your friend -> Skipped...", 3)
        return findtarget()
    end

    local hrp = ffc(Bounty.Targ.Character, "HumanoidRootPart")
    if not hrp then
        return findtarget()
    end

    -- Kiểm tra safe zone TRƯỚC khi check distance
    -- Nếu target vào safe zone → bỏ qua, tìm target mới
    -- findtarget() sẽ return true nếu có target mới → vòng lặp chính tween đến target mới luôn
    if checksafezone(hrp.CFrame) or ffc(Bounty.Targ.Character, "TempSafeZone") then
        ThongBaoNek("Target in safe zone -> Finding new target...", 3)
        return findtarget()
    end

    -- Còn xa → tween đến
    local dist = (wfhrp(lp).Position - hrp.Position).Magnitude
    if dist > 80 then
        local targCF = wfhrp(Bounty.Targ)
        if targCF then
            Bounty.CFrameTarget = targCF.CFrame
            Bounty.Digit = targCF.CFrame
            to(RandomCFrame(targCF.CFrame + Vector3.new(0, 5, 0)))
        end
        return true
    end

    -- Target trong raid
    if checkraid(Bounty.Targ) then
        ThongBaoNek("Target is in a raid -> Finding new target...", 3)
        return findtarget()
    end

    -- Target ở Submerged Island
    if checkdao(Bounty.Targ) then
        return false
    end

    -- HP bản thân thấp
    if getgenv().PlayerSetting.FindTargetIfPlayerLowHealth then
        local hum = lp.Character and lp.Character:FindFirstChild("Humanoid")
        if hum then
            local percentage = (hum.Health / hum.MaxHealth) * 100
            local low = getgenv().PlayerSetting.SafeHealth[1] or 30
            local critical = getgenv().PlayerSetting.SafeHealth[2] or 40

            if percentage <= low then
                ThongBaoNek("Health low (" .. math.floor(percentage) .. "%) -> Finding safer target...", 3)
                return findtarget()
            end

            if percentage <= critical
            and Bounty.Targ.Character
            and Bounty.Targ.Character:FindFirstChild("Humanoid")
            and Bounty.Targ.Character.Humanoid.WalkSpeed > 20 then
                ThongBaoNek("HP critical, avoiding aggressive player...", 3)
                return findtarget()
            end
        end
    end

    -- Target không vào combat sau 3 giây
    if Bounty.Targ == oldtarg then
        if Bounty.UsingSkill and not startuse then
            oldspamskill = tick()
            startuse = true
        end
        if startuse and (tick() - oldspamskill) >= 3
        and not (Bounty.Targ.Character:GetAttribute("InCombat") == 0
              or Bounty.Targ.Character:GetAttribute("InCombat") == 1) then
            ThongBaoNek("Target is not in combat -> Finding new target...", 3)
            return findtarget()
        end
    else
        startuse = false
        oldtarg = Bounty.Targ
    end

    return true
end
local Mouse = game.Players.LocalPlayer:GetMouse()
Cac = hookmetamethod(game, "__index", newcclosure(function(self, Index)
    if self == Mouse then
        if Index == "Hit" or Index == "hit" then
            return Bounty.CFrameTarget
        end
    end
    return Cac(self, Index)
end))
spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    args[2] = Bounty.Digit.Position
                    return old(unpack(args))
                end
            end
        end
        return old(...)
    end)
end)
if not getgenv().PlayerSetting.PcMode then
    local vu245 = nil
    vu245 = hookmetamethod(game, "__index", newcclosure(function(p246, p247)
        if p246 ~= vu63 or p247 ~= "Hit" and p247 ~= "hit" then
            return vu245(p246, p247)
        else
            return Bounty.CFrameTarget
        end
    end))
    spawn(function()
        local v248 = getrawmetatable(game)
        local vu249 = v248.__namecall
        setreadonly(v248, false)
        v248.__namecall = newcclosure(function(...)
            local v250 = getnamecallmethod()
            local v251 = {
                ...
            }
            if tostring(v250) ~= "FireServer" or (tostring(v251[1]) ~= "RemoteEvent" or (tostring(v251[2]) == "true" or tostring(v251[2]) == "false")) then
                return vu249(...)
            end
            v251[2] = Bounty.Digit
            return vu249(unpack(v251))
        end)
    end)
end
if getgenv().PlayerSetting.PcMode or getgenv().PlayerSetting.GunMethod then
    function click()
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1))
    end
end
local notiCooldown = {
    Force = 1.5,
    Equip = 1.5,
    Start = 1.0,
    Skill = 0.35
}
local lastNoti = {
    Force = 0,
    Equip = 0,
    Start = 0,
    Skill = {}
}
local notiActive = {}
local function pushNotify(id, text, duration)
    if notiActive[id] then return end
    notiActive[id] = true

    ThongBaoNek(text, duration or 1.2)

    task.delay(duration or 1.2, function()
        notiActive[id] = nil
    end)
end
NotifyForceWeapon = function(weaponType)
    local now = tick()
    if now - lastNoti.Force < notiCooldown.Force then return end
    lastNoti.Force = now

    pushNotify("FORCE_"..weaponType, "Force "..weaponType, 1.2)
end
NotifyEquipped = function(toolName)
    local now = tick()
    if now - lastNoti.Equip < notiCooldown.Equip then return end
    lastNoti.Equip = now

    pushNotify("EQUIP_"..toolName, "Equipped : "..toolName, 1.2)
end
NotifyStartSkill = function()
    local now = tick()
    if now - lastNoti.Start < notiCooldown.Start then return end
    lastNoti.Start = now

    pushNotify("START", "Starting Skill Controller", 1.0)
end
NotifyCastSkill = function(key)
    local now = tick()
    lastNoti.Skill[key] = lastNoti.Skill[key] or 0
    if now - lastNoti.Skill[key] < notiCooldown.Skill then return end
    lastNoti.Skill[key] = now
    pushNotify("PRESS_"..key, "Pressing "..key, 0.45)
    task.delay(0.1, function()
        pushNotify("PRESSED_"..key, "Pressed "..key, 0.45)
    end)
end

local alreadyDelayLowHP = false
local SkillUIcache = {}
local LastCastTimes = {}
local LastSwitch = 0
local CAST_DEBOUNCE = 0.03
function cacheSkillUI(toolName)
    if not toolName then return nil end
    local gui = SkillUIcache[toolName]
    if gui and gui.Parent then return gui end
    local ok, res = pcall(function() return lp.PlayerGui and lp.PlayerGui.Main and lp.PlayerGui.Main.Skills and lp.PlayerGui.Main.Skills:FindFirstChild(toolName) end)
    gui = ok and res or nil
    SkillUIcache[toolName] = gui
    return gui
end
local function recordCast(toolName, key)
    if not toolName or not key then return end
    LastCastTimes[toolName..":"..key] = tick()
end
local function canCastNow(toolName, key)
    local id = toolName..":"..key
    local last = LastCastTimes[id] or 0
    return (tick() - last) >= CAST_DEBOUNCE
end
PredictTargetPosition = function(target, leadFactor)
    if not target or not target.Character then return nil end
    local hrp = safe(function() return wfhrp(target) end)
    if not hrp then return nil end
    leadFactor = leadFactor or 0.12
    local vel = hrp.Velocity or Vector3.new()
    local base = (Bounty.CFrameTarget and (type(Bounty.CFrameTarget)=="CFrame" and Bounty.CFrameTarget.Position) or hrp.Position) or hrp.Position
    return base + vel * leadFactor
end
SortSkills = function(weaponType)
    local cfg = WS[weaponType]
    if not cfg or not cfg.Skills then return {} end
    local skills = {}
    for key, data in pairs(cfg.Skills) do
        if data.Enable then
            table.insert(skills, {
                Key = key,
                Hold = data.HoldTime or 0,
                Delay = data.TimeToNextSkill or 0,
                NoPredict = data.NoPredict or false
            })
        end
    end
    table.sort(skills, function(a,b)
        return a.Delay < b.Delay
    end)

    return skills
end
GetReadySkillsForTool = function(toolName, weaponType)
    local res = {}
    if not toolName then return res end
    local ui = cacheSkillUI(toolName)
    if not ui then return res end
    local cfg = WS[weaponType]
    if not cfg or not cfg.Skills then return res end
    local skills = SortSkills(weaponType)
    for _, sk in ipairs(skills) do
        local key = sk.Key
        local data = cfg.Skills[key]
        if data and data.Enable then
            local frame = ui:FindFirstChild(key)
            if frame then
                local cd = frame:FindFirstChild("Cooldown")
                if cd and cd.Size and cd.Size.X and cd.Size.X.Scale <= 0 then
                    if canCastNow(toolName, key) then
                        table.insert(res, {Key = key, Hold = data.HoldTime or 0, TimeToNext = data.TimeToNextSkill or 0})
                    end
                end
            end
        end
    end
    return res
end
GetWeaponPriority = function()
    if getgenv().WeaponPriority and type(getgenv().WeaponPriority) == "table" then
        return getgenv().WeaponPriority
    end
    if WS.Use and type(WS.Use) == "table" then
        return WS.Use
    end
    return {"Melee","Sword","Blox Fruit","Gun"} 
end
SwitchNextWeaponIfCooldown = function(currentWeaponType)
    if tick() - LastSwitch < 0.12 then return false end 
    LastSwitch = tick()

    local priority = GetWeaponPriority() or GetWeaponList() or {}
    if #priority == 0 then return false end

    local startIndex = 1
    for i,v in ipairs(priority) do if v == currentWeaponType then startIndex = i; break end end
    for step = 1, #priority - 1 do
        local idx = ((startIndex + step - 1) % #priority) + 1
        local candidateType = priority[idx]
        local candCfg = WS[candidateType]
        if candCfg and candCfg.Enable and candCfg.Skills then
            local toolName = equip(candidateType)
            if toolName then
                local ready = GetReadySkillsForTool(toolName, candidateType)
                if #ready > 0 then
                    local sk = ready[1]
                    Bounty.ToolTipUsing = candidateType
                    Bounty.WeaponUsing = toolName
                    Bounty.UsingSkill = true
                    down(sk.Key, sk.Hold)
                    recordCast(toolName, sk.Key)
                    Bounty.UsingSkill = false
                    return true
                end
            end
        end
    end

    return false
end
TrySkillCast = function(weaponType)
    local cfg = WS[weaponType]
    if not cfg or not cfg.Enable then return false end

    local toolName = equip(weaponType)
    if not toolName then return false end

    NotifyForceWeapon(weaponType)
    NotifyEquipped(toolName)
    NotifyStartSkill()

    Bounty.UsingSkill = true
    Bounty.ToolTipUsing = weaponType
    Bounty.WeaponUsing = toolName
    wt(0)
    local skillUI = lp.PlayerGui.Main.Skills:FindFirstChild(toolName)
    if not skillUI then return false end

    local skillList = SortSkills(weaponType)
    local used = false

    for _, sk in ipairs(skillList) do
        if not Bounty.CanUseSkill then break end

        local frame = skillUI:FindFirstChild(sk.Key)
        if frame and frame.Cooldown.Size.X.Scale <= 0 then

            NotifyCastSkill(sk.Key)

            down(sk.Key, sk.Hold)

            if not sk.NoPredict then
                Bounty.Digit = Bounty.CFrameTarget + wfhrp(Bounty.Targ).Velocity / 2
            end

            wt(0.01)
            used = true
        end
    end
    if not used and cfg.SwitchNextWeaponIfCooldown then
        return SwitchNextWeaponIfCooldown(weaponType)
    end
    Bounty.UsingSkill = false
    return used
end
function safe(f, ...)
    local ok, result = pcall(f, ...)
    if ok then return result end
    return nil
end
function CheckV4(player)
    if not player or not player.Character then
        return false
    end

    local char = player.Character
    local aura = safe(function() return char:FindFirstChild("Awakening") end)
    local race = safe(function() return char:GetAttribute("RaceTransformation") end)

    if aura then return true end
    if race == "V4" then return true end

    return false
end
function getskillmethod(target)
    local cfg = getgenv().UseSkillSetting
    if not cfg then return "Normal" end
    local method = cfg.NormalMethod or "Normal"
    if target and CheckV4(target) then
        method = cfg.MethodIfTargetOnV4 or method
    end
    if cfg.MethodIfTargetUseFruit and cfg.MethodIfTargetUseFruit.Fruits then
        local fruitTable = cfg.MethodIfTargetUseFruit.Fruits
        local tarTool = safe(function() return target.Character:FindFirstChildOfClass("Tool") end)
        if tarTool and tarTool:FindFirstChild("Fruit") then
            method = cfg.MethodIfTargetUseFruit.Method or method
        end
    end
    local me = game.Players.LocalPlayer
    if CheckV4(me) then
        method = cfg.MethodIfPlayerOnV4 or method
    end
    if cfg.LowHealthPlayerCondition and cfg.LowHealthPlayerCondition.Enable then
        local hp = me.Character and me.Character:FindFirstChild("Humanoid")
        if hp then
            local percent = (hp.Health / hp.MaxHealth) * 100
            if percent <= cfg.LowHealthPlayerCondition.Health then
                method = cfg.LowHealthPlayerCondition.Method or method
            end
        end
    end
    if target and cfg.LowHealthTargetCondition and cfg.LowHealthTargetCondition.Enable then
        local hum = safe(function() return target.Character.Humanoid end)
        if hum then
            local percent = (hum.Health / hum.MaxHealth) * 100
            if percent <= cfg.LowHealthTargetCondition.Health then
                local delaySetting = cfg.LowHealthTargetCondition.DelayFirstTime
                if delaySetting and delaySetting[1] == true and not alreadyDelayLowHP then
                    alreadyDelayLowHP = true
                    wt(delaySetting[2] or 1)
                end
    
                method = cfg.LowHealthTargetCondition.Method or method
            end
        end
    end
    return method
end
function getmethoddelay(mode)
    if mode == "Normal" then
        return 0.15  
    elseif mode == "Fast" then
        return 0.05
    elseif mode == "Spam" then
        return 0.03
    elseif mode == "SpamAll" then
        return 0.001
    end
    return 0.01
end
function castskillmethod()
    if not Bounty.Targ then return end
    if not Bounty.CanUseSkill then return end

    local weapon = lp.Character and lp.Character:FindFirstChildOfClass("Tool")
    if not weapon then return end

    local toolName = weapon.Name
    local ui = cacheSkillUI(toolName)
    if not ui then return end
    local cfg = WS[weapon.ToolTip]
    if not cfg or not cfg.Skills then return end

    for key, data in pairs(cfg.Skills) do
        if type(data) == "table" and data.Enable then
            local frame = ui:FindFirstChild(key)
            if frame then
                local cd = frame:FindFirstChild("Cooldown")
                if cd and cd.Size and cd.Size.X and cd.Size.X.Scale <= 0 and canCastNow(toolName, key) then
                    Bounty.UsingSkill = true
                    Bounty.ToolTipUsing = weapon.ToolTip
                    Bounty.WeaponUsing = toolName
                    local ppos = PredictTargetPosition(Bounty.Targ, 0.12)
                    if ppos then Bounty.Digit = CFrame.new(ppos) end

                    down(key, data.HoldTime or 0)
                    recordCast(toolName, key)
                    wt(0.005)
                    Bounty.UsingSkill = false
                end
            end
        end
    end
end
function spamskill()
    if not Bounty.Targ then return end
    if not Bounty.CanUseSkill then return end
    if Bounty.UsingSkill then return end
    local mode = getskillmethod(Bounty.Targ) or "Normal"
    local methodDelay = getmethoddelay(mode) or 0.05
    local weaponList = GetWeaponList()
    if not weaponList or #weaponList == 0 then return end
    local leadFactor = (mode == "SpamAll") and 0.06 or 0.12
    local predictPos = PredictTargetPosition(Bounty.Targ, leadFactor)
    if predictPos then Bounty.Digit = CFrame.new(predictPos) end

    for i = 1, #weaponList do
        if not Bounty.CanUseSkill then break end
        local weaponType = weaponList[i]
        local toolName = equip(weaponType)
        if toolName then

            NotifyForceWeapon(weaponType)
            NotifyEquipped(toolName)
            NotifyStartSkill()

            local readySkills = GetReadySkillsForTool(toolName, weaponType)
            if #readySkills > 0 then
                for _, sk in ipairs(readySkills) do
                    if not Bounty.CanUseSkill then break end
                    Bounty.UsingSkill = true
                    Bounty.ToolTipUsing = weaponType
                    Bounty.WeaponUsing = toolName
                    local pf = (mode == "SpamAll") and 0.06 or 0.12
                    local ppos = PredictTargetPosition(Bounty.Targ, pf)
                    if ppos then Bounty.Digit = CFrame.new(ppos) end

                    NotifyCastSkill(sk.Key)
                    down(sk.Key, sk.Hold)
                    recordCast(toolName, sk.Key)
                    Bounty.UsingSkill = false
                    if mode == "Normal" then
                        wt(sk.TimeToNext > 0 and sk.TimeToNext or methodDelay)
                    elseif mode == "Fast" then
                        wt(math.max(0.02, methodDelay))
                    elseif mode == "Spam" then
                        wt(math.max(0.01, methodDelay))
                    elseif mode == "SpamAll" then
                        wt(0) 
                    else
                        wt(methodDelay)
                    end
                end
            else
                local cfg = WS[weaponType]
                if cfg and cfg.SwitchNextWeaponIfCooldown then
                    SwitchNextWeaponIfCooldown(weaponType)
                end
            end
        end
        wt(0) 
    end
end
local GunDebounce = 0
function GetGunTargetPart(target)
    if not target.Character then return nil end
    local limbs = {
        "Head","UpperTorso","LowerTorso",
        "LeftUpperArm","RightUpperArm",
        "LeftLowerArm","RightLowerArm"
    }
    local best, dist = nil, 9999
    local myPos = lp.Character.HumanoidRootPart.Position

    for _, limb in ipairs(limbs) do
        local part = target.Character:FindFirstChild(limb)
        if part then
            local d = (part.Position - myPos).Magnitude
            if d < dist then
                dist = d
                best = part
            end
        end
    end
    return best
end
function PredictGunPosition(limb)
    if not limb then return end
    local vel = limb.Velocity or Vector3.new()
    return limb.Position + vel * 0.08
end
-- function GunShootM1(pos)
--     local tool = lp.Character:FindFirstChildOfClass("Tool")
--     if not tool or tool.ToolTip ~= "Gun" then return end

--     if tool:FindFirstChild("RemoteFunction") then
--         tool.RemoteFunction:InvokeServer(pos)
--     elseif tool:FindFirstChild("RemoteEvent") then
--         tool.RemoteEvent:FireServer("TAP", pos)
--     end
-- end
function targetfly(targ)
    if not targ.Character then return false end

    local hum = targ.Character:FindFirstChild("Humanoid")
    local root = targ.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return false end

    local speed = hum.MoveDirection.Magnitude
    local isRunning = speed > 18

    local isFlying = (root.Position.Y - workspace.FallenPartsDestroyHeight) > 6

    return isRunning or isFlying
end
function skillgun(tool, key)
    local ui = lp.PlayerGui.Main.Skills:FindFirstChild(tool.Name)
    if not ui then return false end

    local frame = ui:FindFirstChild(key)
    if not frame then return false end

    return frame.Cooldown.Size.X.Scale <= 0
end
bantinh = function(aimPos)
    local char = lp.Character
    local tool = char and char:FindFirstChildOfClass("Tool")
    if not tool or tool.ToolTip ~= "Gun" then return end

    if tool:FindFirstChild("RemoteEvent") then
        tool.RemoteEvent:FireServer("TAP", aimPos)

    elseif ShootGunEvent then
        ShootGunEvent:FireServer(aimPos)

    else
        vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait()
        vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
end
GunMethod = function()
    if not getgenv().PlayerSetting.GunMethod then return end
    if not Bounty.Targ or not Bounty.CanUseSkill then return end
    if not targetfly(Bounty.Targ) then return end 
    local char = lp.Character
    if not char then return end
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool or tool.ToolTip ~= "Gun" then return end
    if char:FindFirstChild("Stun") and char.Stun.Value > 0 then return end
    if char:FindFirstChild("Busy") and char.Busy.Value then return end
    local cooldown = tool:FindFirstChild("Cooldown") and tool.Cooldown.Value or 0.4
    if tick() - GunDebounce < cooldown then return end

    local limb = GetGunTargetPart(Bounty.Targ)
    if not limb then return end

    local aimPos = PredictGunPosition(limb)
    if not aimPos then return end

    local dist = (wfhrp(lp).Position - limb.Position).Magnitude
    if skillgun(tool, "Z") then
        GunDebounce = tick()
        Bounty.UsingSkill = true
        down("Z", 0.08)
        Bounty.UsingSkill = false
        return
    end
    if skillgun(tool, "X") and dist <= 35 then
        GunDebounce = tick()
        Bounty.UsingSkill = true
        down("X", 0.08)
        Bounty.UsingSkill = false
        if equip("Melee") then return end
        equip("Sword")
        return
    end
    GunDebounce = tick()
    bantinh(aimPos)
end
_G.circleTarget = true
local vu195 = 20
function circletween(p196)
    vu195 = vu195 + 20
    return p196 + Vector3.new(math.cos(math.rad(vu195)) * 30, 0, math.sin(math.rad(vu195)) * 30)
end
function RandomCFrame(cf)
    if _G.circleTarget then
        return circletween(cf)
    end
    return cf
end
local oldtw = tick()
spawn(function()
    while wt() do
        if checktarg() then
            if (not (game.Players.LocalPlayer.Character:FindFirstChild("HasBuso"))) then
                local rel = game.ReplicatedStorage
                rel.Remotes.CommF_:InvokeServer("Buso")
            end
            if ffc(lp, "PlayerGui") and ffc(lp.PlayerGui, "ScreenGui") and ffc(lp.PlayerGui.ScreenGui, "ImageLabel") then
            else
                game:service("VirtualUser"):CaptureController()
                game:service("VirtualUser"):SetKeyDown("0x65")
                game:service("VirtualUser"):SetKeyUp("0x65")
            end
            if ffc(workspace._WorldOrigin.Locations, "Dimensional Rift") and (workspace._WorldOrigin.Locations["Dimensional Rift"].Position - wfhrp(lp).Position).Magnitude <= 1000 and (wfhrp(Bounty.Targ).Position - workspace._WorldOrigin.Locations["Dimensional Rift"].Position).Magnitude <= 1000 then
                Bounty.CanUseWeapon = false
                Bounty.CanUseSkill = false
                to(CFrame.new(workspace._WorldOrigin.Locations["Dimensional Rift"].Position + Vector3.new(0, 190, 0)))
            else
                local hum = lp.Character.Humanoid
                local hp = hum.Health
                local maxhp = hum.MaxHealth
                local percent = (hp / maxhp) * 100
                if hp > 0 and (percent < getgenv().PlayerSetting.SafeHealth[1] or (hide and percent < getgenv().PlayerSetting.SafeHealth[2])) then
                    Bounty.CanUseWeapon = false
                    Bounty.CanUseSkill = false
                    hide = true
                    randomy = math.random(30000, 70000)
                    to(CFrame.new(wfhrp(Bounty.Targ).Position + Vector3.new(0, randomy, 0)))
                else 
                    hide = false
                    Bounty.CFrameTarget = wfhrp(Bounty.Targ).CFrame 
                    if tick() - oldtw >= 0.05 then
                        Bounty.Digit = Bounty.CFrameTarget + wfhrp(Bounty.Targ).Velocity / 2
                    end
                    if Bounty.Digit.Y < 3 then 
                        Bounty.Digit = CFrame.new(Bounty.Digit.X, 3, Bounty.Digit.Z) 
                    end 
                    if (wfhrp(lp).Position - Bounty.CFrameTarget.Position).Magnitude <= 80 then
                        if not ffc(Bounty.Targ.Character, "Busy") or not Bounty.Targ.Character.Busy.Value then
                            Bounty.CanUseWeapon = true
                            Bounty.CanUseSkill = true
                        else
                            Bounty.CanUseWeapon = true
                            Bounty.CanUseSkill = false
                        end
                        if getgenv().PlayerSetting.UseMovePredict then
                            if getgenv().PlayerSetting.HitAndRun then
                                if Bounty.UsingSkill then
                                    to(RandomCFrame(Bounty.Digit + Vector3.new(0, 15, 3)))
                                else
                                    to(RandomCFrame(Bounty.Digit + Vector3.new(0, 10, 0)))
                                end
                            else
                                to(RandomCFrame(Bounty.Digit + Vector3.new(0, 0, 3)))
                            end
                            else 
                            if getgenv().PlayerSetting.HitAndRun then
                                if Bounty.UsingSkill then
                                    to(RandomCFrame(Bounty.Digit + Vector3.new(0, 15, 3)))
                                else
                                    to(RandomCFrame(Bounty.Digit + Vector3.new(0, 30, 0)))
                                end
                            else
                                to(RandomCFrame(Bounty.Digit + Vector3.new(0, 0, 3)))
                            end
                        end
                       else
                        to(RandomCFrame(Bounty.Digit + Vector3.new(0, 0, 3)))
                           Bounty.CanUseSkill = false
                    end
                end
            end
        end
    end
end)
local races = { 
    ["Human"] = "Last Resort", 
    ["Mink"] = "Agility", 
    ["Fishman"] = "Water Body", 
    ["Skypea"] = "Heavenly Blood", 
    ["Ghoul"] = "Heightened Senses",
    ["Cyborg"] = "Energy Core",
    ["Draco"] = "Primordial Reign"
} 
local killcount = 0
local attackbool = false
spawn(function()
    while wt() do
        local char = lp.Character
        local race = lp.Data.Race.Value
        local weaponList = GetWeaponList()
        if ffc(char, "RaceTransformed") and ffc(char, "RaceEnergy") and char.RaceEnergy.Value >= 1 and not char.RaceTransformed.Value then
            down("Y", 0)
        end
        if lp.PlayerGui.Main.PvpDisabled.Visible == true then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
        end
        if ffc(char, "RaceTransformed") and char.RaceTransformed.Value then
            if race == "Mink" or race == "Ghoul" then
                down("Q", 0)
                wt()
            end
        end
        if Bounty.CanUseWeapon then
            local dist = math.huge
            if Bounty.Targ and Bounty.Targ.Character and Bounty.Targ.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChild("HumanoidRootPart") then
                dist = (lp.Character.HumanoidRootPart.Position - Bounty.Targ.Character.HumanoidRootPart.Position).Magnitude
            end
            if dist <= 30 and not ffc(char, races[race]) and inv(game.ReplicatedStorage.Remotes.CommF_, {"Wenlocktoad", "1"}) == -2 then
                down("T", 0)
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end
            for _, v in ipairs(weaponList) do
                local cfg = WS[v]
                if Bounty.CanUseSkill and cfg and cfg.Enable then
                    EqWeapon = equip(v)
                    Bounty.WeaponUsing = EqWeapon
                    Bounty.ToolTipUsing = v

                    Bounty.UsingSkill = true
                    if EqWeapon then
                        wt((WS[v] and WS[v].Delay) or 0)
                        local skillUI = lp.PlayerGui.Main.Skills[EqWeapon]
                        for k, data in pairs(WS[v].Skills) do
                            if k ~= "Enabled" and data[1] then
                                if Bounty.CanUseSkill and ffc(skillUI, k) then
                                    local cd = skillUI[k].Cooldown.Size.X.Scale
                                    if ((race == "Ghoul" and ffc(char, "Heightened Senses") and cd <= 0.4) or cd <= 0) then
                                        down(k, data[2])
                                        repeat wt() until ffc(char, "Busy") and not char.Busy.Value
                                        killcount = killcount + 1
                                    end
                                end
                            end
                        end
                    end
                    if Bounty.Targ and Bounty.Targ:FindFirstChild("Humanoid") then
                        local hum = Bounty.Targ.Humanoid
                        local hpPercent = (hum.Health / hum.MaxHealth) * 100
                        if hpPercent <= (getgenv().Attack.StopAttackAtHealth or 0) then
                            attackbool = false
                            Bounty.CanUseSkill = true 
                        else
                            attackbool = true
                        end
                    else
                        attackbool = true
                    end
                    wt(0.25)
                    Bounty.UsingSkill = false
                    attackbool = false
                end
            end
        end
    end
end)
spawn(function()
    while wt() do
        if Bounty.CanUseWeapon and Bounty.CanUseSkill then
            local lpPos = wfhrp(lp).Position
            local tarPos = Bounty.CFrameTarget.Position
            local dist = (lpPos - tarPos).Magnitude
            local canCast = true
            if dist > 65 then
                canCast = false
            end
            if canCast then
                spamskill()
            end

        end
    end
end)
spawn(function()
    while wt() do
        pcall(function()
            GunMethod()
        end)
    end
end)
spawn(function()
    while wt(0.08) do
        if Bounty.CanUseWeapon and Bounty.CanUseSkill and Bounty.Targ then
            local mode = getskillmethod(Bounty.Targ)
            local lpPos = wfhrp(lp).Position
            local tarPos = Bounty.CFrameTarget.Position
            local dist = (lpPos - tarPos).Magnitude
            local canCast = true
            if dist > 65 then
                canCast = false
            end
            if canCast and (mode == "Spam" or mode == "SpamAll") then
                pcall(castskillmethod)
            end
        end
    end
end)
function CheckStun()
    if game:GetService('Players').LocalPlayer.Character:FindFirstChild("Stun") then
        return game:GetService('Players').LocalPlayer.Character.Stun.Value ~= 0
    end
    return false
end
CheckStun()
spawn(function()
    while wt() do
        local char = lp.Character
        if CheckStun() then
            Bounty.CanUseSkill  = false
            Bounty.CanUseWeapon = false
            to(CFrame.new(wfhrp(lp).Position + Vector3.new(0, 2000, 0)))
        else
            Bounty.CanUseSkill  = true
            Bounty.CanUseWeapon = true
            if not ffc(char, "HasBuso") then
                inv(rs.Remotes.CommF_, {"Buso"})
            end
            if lp.PlayerGui.Main.PvpDisabled.Visible then
                inv(rs.Remotes.CommF_, {"EnablePvp"})
            end
            if ffc(char, "RaceTransformed")
            and ffc(char, "RaceEnergy")
            and char.RaceEnergy.Value >= 1
            and not char.RaceTransformed.Value
            then
                down("Y", 0)
            end
        end
    end
end)
        local u5 = require(rs:WaitForChild("Notification"))
        spawn(function()
            while wt() do
                u5.new("<Color=Yellow>Report Bugs Or Suggest Dms<Color=/>"):Display()
                u5.new("<Color=Yellow>Discord : mlamm_.<Color=/>"):Display() 
                u5.new("<Color=Yellow>ID Discord : 763681373898276874<Color=/>"):Display() 
                u5.new("<Color=Yellow>Server Discord : discord.gg/gknQKpKYrk<Color=/>"):Display() 
                u5.new("<Color=Yellow>Join Server Check Update<Color=/>"):Display() 
                wt(20)
            end
        end)

        do
            ply = game["Players"]
            plr = ply["LocalPlayer"]
            Root = plr["Character"]["HumanoidRootPart"]
            replicated = game:GetService("ReplicatedStorage")
            Lv = game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"]
            TeleportService = game:GetService("TeleportService")
            TW = game:GetService("TweenService")
            Lighting = game:GetService("Lighting")
            Enemies = workspace["Enemies"]
            vim1 = game:GetService("VirtualInputManager")
            vim2 = game:GetService("VirtualUser")
            TeamSelf = plr["Team"]
            RunSer = game:GetService("RunService")
            Stats = game:GetService("Stats")
            Energy = plr["Character"]["Energy"]["Value"]
            Boss = {}
            BringConnections = {}
            MaterialList = {}
            NPCList = {}
            shouldTween = false
            SoulGuitar = false
            KenTest = true
            debug = false
            Brazier1 = false
            Brazier2 = false
            Brazier3 = false
            Sec = .1
            ClickState = 0
            Num_self = 25
        end
        walkwater = true
        spawn(function()
            while task["wait"]() do
                if walkwater then
                    pcall(function()
                        if plr["Character"] and plr["Character"]:FindFirstChild("LeftFoot") then
                            local x = replicated["Assets"]["Models"]["IceSpikes4"]:Clone()
                            x["Parent"] = workspace
                            x["Size"] = Vector3["new"](3 + math["random"](10, 12), 1.7, 3 + math["random"](10, 12))
                            x["Color"] = Color3["fromRGB"](128, 187, 219)
                            x["CFrame"] = CFrame["new"](plr["Character"]["Head"]["Position"]["X"], -3.8, plr["Character"]["Head"]["Position"]["Z"]) * CFrame["Angles"]((math["random"]() - .5) * .06, math["random"]() * 7, (math["random"]() - .5) * .07)
                            local L = {}
                            L["Size"] = Vector3["new"](0, .3, 0)
                            local a = TW:Create(x, TweenInfo["new"](2, Enum["EasingStyle"]["Quad"], Enum["EasingDirection"]["In"]), L)
                            a["Completed"]:Connect(function()
                                x:Destroy()
                            end)
                            a:Play()
                        end
                    end)
                end
            end
        end)
        local H = game:GetService("ReplicatedStorage")
	local r = H:FindFirstChild("Modules")
	if not r then
		return
	end
	workspace["Camera"]["CameraSubject"] = plr["Character"]["Humanoid"]
	local R = ((H:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RE/RegisterAttack")
	local y = ((H:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RE/RegisterHit")
    Enemies = workspace["Enemies"]
    local ShootGunEvent = replicated:WaitForChild("Modules"):WaitForChild("Net"):FindFirstChild("RE/ShootGunEvent")
    local Validator2 = replicated:WaitForChild("Remotes"):WaitForChild("Validator2")

    local Config = {
        AttackDistance = 250,
        AttackMobs = false,
        AttackPlayers = true,
        AttackCooldown = 0.2,
        ComboResetTime = 0.3,
        MaxCombo = 4,
        HitboxLimbs = {
            "RightLowerArm",
            "RightUpperArm",
            "LeftLowerArm",
            "LeftUpperArm",
            "RightHand",
            "LeftHand"
        },
        AutoClickEnabled = true
    }
    
    local FastAttack = {}
    FastAttack.__index = FastAttack
    
    function FastAttack.new()
        local self = setmetatable({
            Debounce = 0,
            ComboDebounce = 0,
            ShootDebounce = 0,
            M1Combo = 0,
            EnemyRootPart = nil,
            Connections = {},
            Overheat = {
                Dragonstorm = {
                    MaxOverheat = 3,
                    Cooldown = 0,
                    TotalOverheat = 0,
                    Distance = 350,
                    Shooting = false
                }
            },
            ShootsPerTarget = {
                ["Dual Flintlock"] = 2
            },
            SpecialShoots = {
                ["Skull Guitar"] = "TAP",
                ["Bazooka"] = "Position",
                ["Cannon"] = "Position",
                ["Dragonstorm"] = "Overheat"
            }
        }, FastAttack)
        pcall(function()
            self.CombatFlags = require(r.Flags).COMBAT_REMOTE_THREAD
            self.ShootFunction = getupvalue(require(replicated.Controllers.CombatController).Attack, 9)
            local LocalScript = plr:WaitForChild("PlayerScripts"):FindFirstChildOfClass("LocalScript")
            if LocalScript and getsenv then
                self.HitFunction = getsenv(LocalScript)._G.SendHitsToServer
            end
        end)
        return self
    end
    
    function FastAttack:IsEntityAlive(entity)
        local humanoid = entity and entity:FindFirstChild("Humanoid")
        return humanoid and humanoid.Health > 0
    end
    
    function FastAttack:CheckStun(Character, Humanoid, ToolTip)
        local Stun = Character:FindFirstChild("Stun")
        local Busy = Character:FindFirstChild("Busy")
        if Humanoid.Sit and (ToolTip == "Sword" or ToolTip == "Melee" or ToolTip == "Blox Fruit") then
            return false
        elseif Stun and Stun.Value > 0 or Busy and Busy.Value then
            return false
        end
        return true
    end
    
    function FastAttack:GetBladeHits(Character, Distance)
        local Position = Character:GetPivot().Position
        local BladeHits = {}
        Distance = Distance or Config.AttackDistance
        local function ProcessTargets(Folder, CanAttack)
            for _, Enemy in ipairs(Folder:GetChildren()) do
                if Enemy ~= Character and self:IsEntityAlive(Enemy) then
                    local BasePart = Enemy:FindFirstChild(Config.HitboxLimbs[math.random(#Config.HitboxLimbs)]) or Enemy:FindFirstChild("HumanoidRootPart")
                    if BasePart and (Position - BasePart.Position).Magnitude <= Distance then
                        if not self.EnemyRootPart then
                            self.EnemyRootPart = BasePart
                        else
                            table.insert(BladeHits, {
                                Enemy,
                                BasePart
                            })
                        end
                    end
                end
            end
        end
        if Config.AttackMobs then
            ProcessTargets(workspace["Enemies"])
        end
        if Config.AttackPlayers then
            ProcessTargets(workspace["Characters"], true)
        end
        return BladeHits
    end
    
    function FastAttack:GetClosestEnemy(Character, Distance)
        local BladeHits = self:GetBladeHits(Character, Distance)
        local Closest, MinDistance = nil, math.huge
        for _, Hit in ipairs(BladeHits) do
            local Magnitude = (Character:GetPivot().Position - Hit[2].Position).Magnitude
            if Magnitude < MinDistance then
                MinDistance = Magnitude
                Closest = Hit[2]
            end
        end
        return Closest
    end
    
    function FastAttack:GetCombo()
        local Combo = (tick() - self.ComboDebounce) <= Config.ComboResetTime and self.M1Combo or 0
        Combo = Combo >= Config.MaxCombo and 1 or Combo + 1
        self.ComboDebounce = tick()
        self.M1Combo = Combo
        return Combo
    end
    
    function FastAttack:ShootInTarget(TargetPosition)
        local Character = plr.Character
        if not self:IsEntityAlive(Character) then
            return
        end
        local Equipped = Character:FindFirstChildOfClass("Tool")
        if not Equipped or Equipped.ToolTip ~= "Gun" then
            return
        end
        local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or 0.3
        if (tick() - self.ShootDebounce) < Cooldown then
            return
        end
        local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
        if ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
            Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
            Validator2:FireServer(self:GetValidator2())
            if ShootType == "TAP" then
                Equipped.RemoteEvent:FireServer("TAP", TargetPosition)
            else
                ShootGunEvent:FireServer(TargetPosition)
            end
            self.ShootDebounce = tick()
        else
            vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait(0.05)
            vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            self.ShootDebounce = tick()
        end
    end
    
    function FastAttack:GetValidator2()
        local v1 = getupvalue(self.ShootFunction, 15)
        local v2 = getupvalue(self.ShootFunction, 13)
        local v3 = getupvalue(self.ShootFunction, 16)
        local v4 = getupvalue(self.ShootFunction, 17)
        local v5 = getupvalue(self.ShootFunction, 14)
        local v6 = getupvalue(self.ShootFunction, 12)
        local v7 = getupvalue(self.ShootFunction, 18)
        local v8 = v6 * v2
        local v9 = (v5 * v2 + v6 * v1) % v3
        v9 = (v9 * v3 + v8) % v4
        v5 = math.floor(v9 / v3)
        v6 = v9 - v5 * v3
        v7 = v7 + 1
        setupvalue(self.ShootFunction, 15, v1)
        setupvalue(self.ShootFunction, 13, v2)
        setupvalue(self.ShootFunction, 16, v3)
        setupvalue(self.ShootFunction, 17, v4)
        setupvalue(self.ShootFunction, 14, v5)
        setupvalue(self.ShootFunction, 12, v6)
        setupvalue(self.ShootFunction, 18, v7)
        return math.floor(v9 / v4 * 16777215), v7
    end
    
    function FastAttack:UseNormalClick(Character, Humanoid, Cooldown)
        self.EnemyRootPart = nil
        local BladeHits = self:GetBladeHits(Character)
        if self.EnemyRootPart then
            R:FireServer(Cooldown)
            if self.CombatFlags and self.HitFunction then
                self.HitFunction(self.EnemyRootPart, BladeHits)
            else
                y:FireServer(self.EnemyRootPart, BladeHits)
            end
        end
    end
    
    function FastAttack:UseFruitM1(Character, Equipped, Combo)
        local Targets = self:GetBladeHits(Character)
        if not Targets[1] then
            return
        end
        local Direction = (Targets[1][2].Position - Character:GetPivot().Position).Unit
        Equipped.LeftClickRemote:FireServer(Direction, Combo)
    end

    local ClickDelay = 1

    function UseSkillOnce()
        local Char = plr.Character
        if not Char then return end
        local Tool = Char:FindFirstChildOfClass("Tool")
        if not Tool then return end
    
        if Tool.ToolTip == "Melee" or Tool.ToolTip == "Sword" then
            local skill = Tool:FindFirstChild("RemoteEvent") or Tool:FindFirstChild("RemoteFunction")
            if skill then
                pcall(function()
                    skill:FireServer("Z")
                end)
            end
        end
    end
    
    function FastAttack:Attack()
        if not Config.AutoClickEnabled or (tick() - self.Debounce) < ClickDelay then
            return
        end
        local Character = plr.Character
        if not Character or not self:IsEntityAlive(Character) then
            return
        end
        local Humanoid = Character.Humanoid
        local Equipped = Character:FindFirstChildOfClass("Tool")
        if not Equipped then
            return
        end
        local ToolTip = Equipped.ToolTip
        if not table.find({
            "Melee",
            "Blox Fruit",
            "Sword",
            "Gun"
        }, ToolTip) then
            return
        end
        local Target = self:GetClosestEnemy(Character, 120)
        if Target and Target.Parent:FindFirstChild("Humanoid") then
        local TargetHum = Target.Parent.Humanoid
            if TargetHum.Health / TargetHum.MaxHealth > 0.85 then
                UseSkillOnce()
            end
        end
        local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or ClickDelay
        if not self:CheckStun(Character, Humanoid, ToolTip) then
            return
        end
        local Combo = self:GetCombo()
        Cooldown = Cooldown + (Combo >= Config.MaxCombo and 0.05 or 0)
        self.Debounce = Combo >= Config.MaxCombo and ToolTip ~= "Gun" and (tick() + 0.05) or tick()
        if ToolTip == "Blox Fruit" and Equipped:FindFirstChild("LeftClickRemote") then
            self:UseFruitM1(Character, Equipped, Combo)
        elseif ToolTip == "Gun" then
            local Target = self:GetClosestEnemy(Character, 120)
            if Target then
                self:ShootInTarget(Target.Position)
            end
        else
            self:UseNormalClick(Character, Humanoid, Cooldown)
        end
    end
    
    local AttackInstance = FastAttack.new()
    -- table.insert(AttackInstance.Connections, RunSer.Stepped:Connect(function()
    --     AttackInstance:Attack()
    -- end))
    --[[
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and iscclosure(v) then
            local name = debug.getinfo(v).name
            if name == "Attack" or name == "attack" or name == "RegisterHit" then
                hookfunction(v, function(...)
                    AttackInstance:Attack()
                    return v(...)
                end)
            end
        end
    end
]]
    function Attack()
        AttackInstance:Attack()
    end

    local lastAttackState = false
    local lastHealthShown = 0
    
    spawn(function()
        while wt() do
            
            local hum = nil
            if Bounty.Targ 
            and Bounty.Targ.Character
            and Bounty.Targ.Character:FindFirstChild("Humanoid") then
                hum = Bounty.Targ.Character.Humanoid
            end
    
            if hum and hum.Health > 0 then
    
                local hpPercent = (hum.Health / hum.MaxHealth) * 100
                local stopAt = getgenv().Attack.StopAttackAtHealth or 0
    
                local shouldAttack = hpPercent > stopAt
                if shouldAttack == false and lastAttackState == true then
                    if math.floor(hum.Health) ~= lastHealthShown then
                        lastHealthShown = math.floor(hum.Health)
                        ThongBaoNek("Disabled Fast Attack | Health: " .. lastHealthShown, 2)
                    end
                end
    
                attackbool = shouldAttack
                lastAttackState = shouldAttack
    
            else
                if lastAttackState == true then
                    ThongBaoNek("Disabled Fast Attack | Target Lost", 2)
                end
                
                lastAttackState = false
                attackbool = false
            end
    
            if attackbool then
                Attack()
            end
    
        end
    end)
    -- spawn(function()
    --     while wt() do
    --         if Bounty.Targ and Bounty.Targ:FindFirstChild("Humanoid") then
    --             local hum = Bounty.Targ.Humanoid
    --             local hpPercent = (hum.Health / hum.MaxHealth) * 100
    --             if hpPercent <= (getgenv().Attack.StopAttackAtHealth or 0) then
    --                 attackbool = false
    --             else
    --                 attackbool = true
    --             end
    --         else
    --             attackbool = false
    --         end
    --         if attackbool then
    --             Attack()
    --         end
    --     end
    -- end)
    --[[
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and iscclosure(v) then
            local name = debug.getinfo(v).name
            if name == "Attack" or name == "attack" or name == "RegisterHit" then
                hookfunction(v, function(...)
                    AttackInstance:Attack()
                    return v(...)
                end)
            end
        end
    end
]]
    lp.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wt(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
if Counter.Enabled then
    function embed(p270)
        return "```" .. tostring(p270) .. "```"
    end
    function sendwebhook(p271, p272, p273, p274)
        local v275 = http_request or request or (HttpPost or syn.request)
        local v276 = {
            Url = Counter.Webhook.Url,
            Body = game:GetService("HttpService"):JSONEncode({
                content = "",
                embeds = {
                    {
                        title = "**Rua Hup**",
                        color = 8631807,
                        fields = {
                            {
                                name = "Username",
                                value = embed(lp.Name),
                                inline = true
                            },
                            {
                                name = "Killed",
                                value = embed(p271),
                                inline = true
                            },
                            {
                                name = "Earned",
                                value = embed(tostring(p272):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")),
                                inline = false
                            },
                            {
                                name = "Total Earned",
                                value = embed(tostring(p273):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")),
                                inline = false
                            },
                            {
                                name = "Time Elapsed",
                                value = embed(tostring(p274)),
                                inline = false
                            }
                        },
                        thumbnail = {
                            url = "https://cdn.discordapp.com/attachments/1328714576673374271/1447140953772003368/IMG_0021.png?ex=69368a89&is=69353909&hm=d73118a03cd5b46e748788bb505fcfdf566b3533548418cfda63800d3c578b96&"
                        },
                        footer = {
                            text = "Rua Hup - discord.gg/gknQKpKYrk"
                        },
                        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
                    }
                }
            }),
            Method = "POST",
            Headers = {
                ["content-type"] = "application/json"
            }
        }
        v275(v276)
    end
end

local oldcolor = {
    ["Border Color"] = Color3.fromRGB(131, 181, 255),
    ["Click Effect Color"] = Color3.fromRGB(230, 230, 230),
    ["Setting Icon Color"] = Color3.fromRGB(230, 230, 230),
    ["Logo Image"] = "rbxassetid://6248942117",
    ["Search Icon Color"] = Color3.fromRGB(255, 255, 255),
    ["Search Icon Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["GUI Text Color"] = Color3.fromRGB(255, 255, 255),
    ["Text Color"] = Color3.fromRGB(255, 255, 255),
    ["Placeholder Text Color"] = Color3.fromRGB(178, 178, 178),
    ["Title Text Color"] = Color3.fromRGB(131, 181, 255),
    ["Background 1 Color"] = Color3.fromRGB(43, 43, 43),
    ["Background 1 Transparency"] = 0,
    ["Background 2 Color"] = Color3.fromRGB(90, 90, 90),
    ["Background 3 Color"] = Color3.fromRGB(53, 53, 53),
    ["Background Image"] = "",
    ["Page Selected Color"] = Color3.fromRGB(131, 181, 255),
    ["Section Text Color"] = Color3.fromRGB(131, 181, 255),
    ["Section Underline Color"] = Color3.fromRGB(131, 181, 255),
    ["Toggle Border Color"] = Color3.fromRGB(131, 181, 255),
    ["Toggle Checked Color"] = Color3.fromRGB(230, 230, 230),
    ["Toggle Desc Color"] = Color3.fromRGB(185, 185, 185),
    ["Button Color"] = Color3.fromRGB(131, 181, 255),
    ["Label Color"] = Color3.fromRGB(101, 152, 220),
    ["Dropdown Icon Color"] = Color3.fromRGB(230, 230, 230),
    ["Dropdown Selected Color"] = Color3.fromRGB(131, 181, 255),
    ["Textbox Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["Box Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["Slider Line Color"] = Color3.fromRGB(75, 75, 75),
    ["Slider Highlight Color"] = Color3.fromRGB(59, 82, 115),
    ["Tween Animation 1 Speed"] = 0.25,
    ["Tween Animation 2 Speed"] = 0.5,
    ["Tween Animation 3 Speed"] = 0.1
}

getgenv().UIColor = oldcolor   
local handler = {}
local callbacks = {}
local notify = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
function handler.ButtonEffect()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local circle = Drawing.new("Circle")

    circle.Visible = true
    circle.Radius = 10
    circle.Filled = true
    circle.Color = getgenv().UIColor["Click Effect Color"]
    circle.Position = Vector2.new(mouse.X, mouse.Y + 35)

    local f = Instance.new("Folder", handler.Gui)
    f.Name = "ClickFX"

    local size = Instance.new("NumberValue", f)
    size.Value = 10

    local trans = Instance.new("NumberValue", f)
    trans.Value = 1

    TweenService:Create(size, TweenInfo.new(.25), {Value = 25}):Play()
    TweenService:Create(trans, TweenInfo.new(.25), {Value = 0}):Play()

    size:GetPropertyChangedSignal("Value"):Connect(function()
        circle.Radius = size.Value
    end)

    trans:GetPropertyChangedSignal("Value"):Connect(function()
        circle.Transparency = trans.Value
    end)

    task.wait(.5)
    f:Destroy()
end
function handler.GetIMG(url)
    local synName = "SynAsset ["
    local result = ""

    if string.find(url, "rbxassetid://") then
        return url
    end

    pcall(function()
        if url and type(url) == "string" and tostring(game:HttpGet(url)):find("PNG") then
            for i = 1, 5 do
                synName = synName .. string.char(math.random(65, 122))
            end
            synName = synName .. "].png"

            writefile(synName, game:HttpGet(url))
            task.delay(5, function()
                delfile(synName)
            end)

            result = getsynasset(synName)
        end
    end)

    return result
end
handler.Gui = Instance.new("ScreenGui")
handler.Gui.Name = "Rua Hub GUI"
handler.Gui.Parent = game.CoreGui
handler.Gui.Enabled = true

handler.NotiGui = Instance.new("ScreenGui")
handler.NotiGui.Name = "Rua Hub Notification"
handler.NotiGui.Parent = game.CoreGui

local Container = Instance.new("Frame", handler.NotiGui)
Container.Name = "NotiContainer"
Container.BackgroundTransparency = 1
Container.AnchorPoint = Vector2.new(1, 1)
Container.Position = UDim2.new(1, -5, 1, -5)
Container.Size = UDim2.new(0, 350, 1, -10)

local List = Instance.new("UIListLayout", Container)
List.SortOrder = Enum.SortOrder.LayoutOrder
List.Padding = UDim.new(0, 5)
List.VerticalAlignment = Enum.VerticalAlignment.Bottom
function handler.GetColorRGB(c3)
    return {
        math.floor(c3.r * 255),
        math.floor(c3.g * 255),
        math.floor(c3.b * 255)
    }
end

function notify.CreateNoti(info)
    local title = info.Title or ""
    local desc = info.Desc
    local duration = info.ShowTime or 5
    getgenv().TitleNameNoti = title
    local Frame = Instance.new("Frame", Container)
    Frame.BackgroundTransparency = 1
    Frame.AutomaticSize = Enum.AutomaticSize.Y
    Frame.Size = UDim2.new(1, 0, 0, 0)
    local Back = Instance.new("Frame", Frame)
    Back.Size = UDim2.new(1, 0, 1, 6)
    Back.AutomaticSize = Enum.AutomaticSize.Y
    Back.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
    Instance.new("UICorner", Back).CornerRadius = UDim.new(0, 4)
    local Top = Instance.new("Frame", Back)
    Top.BackgroundTransparency = 1
    Top.Size = UDim2.new(1, 0, 0, 25)
    Top.Position = UDim2.new(0, 0, 0, 5)
    local Img = Instance.new("ImageLabel", Top)
    Img.BackgroundTransparency = 1
    Img.Size = UDim2.new(0, 25, 0, 25)
    Img.Position = UDim2.new(0, 10, 0, 0)
    Img.Image = handler.GetIMG(getgenv().UIColor["Logo Image"])
    Instance.new("UICorner", Img).CornerRadius = UDim.new(1, 0)
    local rgb = handler.GetColorRGB(getgenv().UIColor["Title Text Color"])
    local colorStr = table.concat(rgb, ",")
    local TitleText = Instance.new("TextLabel", Top)
    TitleText.BackgroundTransparency = 1
    TitleText.Position = UDim2.new(0, 40, 0, 0)
    TitleText.Size = UDim2.new(1, -40, 1, 0)
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextSize = 14
    TitleText.RichText = true
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Text = '<font color="rgb(' .. colorStr .. ')">Rua Hub</font> ' .. title
    local CloseFrame = Instance.new("Frame", Top)
    CloseFrame.AnchorPoint = Vector2.new(1, 0.5)
    CloseFrame.Position = UDim2.new(1, -4, 0.5, 0)
    CloseFrame.BackgroundTransparency = 1
    CloseFrame.Size = UDim2.new(0, 22, 0, 22)
    local CloseImg = Instance.new("ImageLabel", CloseFrame)
    CloseImg.Size = UDim2.new(1, 0, 1, 0)
    CloseImg.BackgroundTransparency = 1
    CloseImg.Image = "rbxassetid://17596666700"
    CloseImg.ImageRectOffset = Vector2.new(284, 4)
    CloseImg.ImageRectSize = Vector2.new(24, 24)
    CloseImg.ImageColor3 = getgenv().UIColor["Search Icon Color"]
    local CloseBtn = Instance.new("TextButton", CloseFrame)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Size = UDim2.new(1, 0, 1, 0)
    CloseBtn.Text = ""
    local DescLabel = nil
    if desc then
        DescLabel = Instance.new("TextLabel", Back)
        DescLabel.BackgroundTransparency = 1
        DescLabel.Position = UDim2.new(0, 10, 0, 35)
        DescLabel.Size = UDim2.new(1, -15, 0, 0)
        DescLabel.Font = Enum.Font.GothamBold
        DescLabel.TextWrapped = true
        DescLabel.AutomaticSize = Enum.AutomaticSize.Y
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.TextSize = 14
        DescLabel.TextColor3 = getgenv().UIColor["Text Color"]
        DescLabel.Text = desc
    end
    Back.Position = UDim2.new(1, 0, 0, 0)
    TweenService:Create(
        Back,
        TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
        {Position = UDim2.new(0, 0, 0, 0)}
    ):Play()
    local function CloseNoti()
        TweenService:Create(
            Back,
            TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
            {Position = UDim2.new(1, 0, 0, 0)}
        ):Play()

        task.wait(.25)
        Frame:Destroy()
    end
    CloseBtn.MouseEnter:Connect(function()
        TweenService:Create(
            CloseImg,
            TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
            {ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"]}
        ):Play()
    end)
    CloseBtn.MouseLeave:Connect(function()
        TweenService:Create(
            CloseImg,
            TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
            {ImageColor3 = getgenv().UIColor["Search Icon Color"]}
        ):Play()
    end)
    CloseBtn.MouseButton1Click:Connect(function()
        task.spawn(function()
            handler.ButtonEffect()
        end)
        task.wait(.25)
        CloseNoti()
    end)
    task.spawn(function()
        task.wait(duration)
        CloseNoti()
    end)
end

getgenv().CreateNoti = notify.CreateNoti

ThongBaoNek = function(content, duration)
    CreateNoti({
        Title = "Rua Hub Auto Bounty",
        Desc = content or "",
        ShowTime = duration or 5
    })
end

--[[
    upgrade [
        [+] new gui auto size
        [+] rewrite function 
            getgenv.Attack [
                ForceMelee = true,
               ForceMeleeTime = 3.5,
        StopAttack = true,
                StopAttackAtHealth = 35,--%
            ]
        improve aimbot, gun method
        [+] update bypass
    ]
    fix [
        find target
    ]
]]getgenv().Team = "Pirates" -- Marines
getgenv().EnabledCamFarm = false
getgenv().LockCam = false
getgenv().HideGui = false
getgenv().PlayerSetting = {
    PcMode = false,
    ShowcaseMode = true,
    HideMap = false,
    SafeHealth = {30, 40},
    FindTargetIfPlayerLowHealth = true,
    Inorge = {
        Fruit = {Enabled = true,
            InorgeFruit = {
                "Portal-Portal", 
                "Kitsune-Kitsune"
            }
        },
        InorgeV4 = true,
        InorgeFriends  = true
    },
    GunMethod = false,
    UseMovePredict = true,
    HitAndRun = true,
    Chat = {
        Enabled = false,
        ListChat = {"ah do i i i","con cho 36"},
    },
}
getgenv().Attack = {
    ForceMelee = true,
    ForceMeleeTime = 3.5,
    StopAttack =true, --When Meet Below Condition
    StopAttackAtHealth = 40,--%
    FastAttack=true, -- Toggle Fast Attack
}
getgenv().UseSkillSetting = {
    -- Three Methods: "Normal", "Fast", "Spam", "SpamAll"
    MethodIfTargetOnV4 = "SpamAll",
    MethodIfPlayerOnV4 = "SpamAll",
    MethodIfTargetUseFruit = {Fruits={},Method="SpamAll"},
    NormalMethod = "SpamAll",
    LowHealthPlayerCondition = { --Player Can Attack Us, No Need For Slow Attack
        Enable = true,
        Health = 70,--%Health That Are Low
        Method = "SpamAll",
    },
    LowHealthTargetCondition = {
        Enable = true,
        Health = 40,--%Health That Are Low
        DelayFirstTime = {true,2}, --1 Is Enable, 2 Is Second To Delay Before Attack Again
        Method = "SpamAll",
        WaitTime = 1.2,-- If Normal Method, Wait Every Skill If It Hits Target
    }
}
getgenv().WeaponsSetting = {
    ["Melee"] = {
        ["Enable"] = true,
        ["Delay"] = 2, 
        ["SwitchNextWeaponIfCooldown"] = true,
        ["Skills"] = {
            ["Z"] = {
                ["Enable"] = true,
                ["NoPredict"] = false, -- For Dragon Tailon, Disable it 
                ["HoldTime"] = 1.75,
                ["TimeToNextSkill"] = 0.6,
            },
        [ "X"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0.6,
            },

            ["C"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0.6,
            },
        },
    },
    ["Blox Fruit"] = {
        ["Enable"] = false,
        ["Delay"] = 1,
        ["SwitchNextWeaponIfCooldown"] = true,
        ["Skills"] = {
            ["Z"] = {
                ["Enable"] = true,
                ["HoldTime"] = 3,
                ["TimeToNextSkill"] = 0,
            },
            ["X"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },

            ["C"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
            ["V"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
            ["F"] = {
                ["Enable"] = false,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
        },
    },
    ["Sword"] = {
        ["Enable"] = true,
        ["Delay"] = 1,
        ["SwitchNextWeaponIfCooldown"] = true,
        ["Skills"] = {
            ["Z"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0.5,
                ["TimeToNextSkill"] = 0.6,
            },
            ["X"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0.5,
                ["TimeToNextSkill"] = 0.6,
            },
        },
    },
    ["Gun"] = {
        ["Enable"] = false,
        ["Delay"] = 0.5,
        ["SwitchNextWeaponIfCooldown"] = true,
        ["Skills"] = {
            ["Z"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
            ["X"] = {
                ["Enable"] = true,
                ["HoldTime"] = 0,
                ["TimeToNextSkill"] = 0,
            },
        },
    },
}
getgenv().Counter = {["Enabled"] = true,
    ["Webhook"] = {["Enabled"] = false,
        ["Url"] = ""
    },
    ["Theme"] = {
        ["Enabled"] = true,
        ["Theme Character"] = "Yae",
        ["Custom"] = {
            ["Enabled"] = false,
            ["File Config"] = {
                ["Background"] = "background.png",
                ["Character"] = "character.png",
                ["Icon"] = "icon.png",
                ["Button Image"] = "button.png",
                ["Color"] = {["Text"] = Color3.fromRGB(255, 255, 255), ["Stroke"] = Color3.fromRGB(255, 255, 255)}
            }
        }
    }
}
--// nill
Tasks = {}
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local v3 = lp.PlayerGui
local rs = game.ReplicatedStorage
local player = game.Players.LocalPlayer
local chim, lon
ThongBaoNek = function(content, duration)
    print("[Rua Hub] " .. tostring(content))
end

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") then
    repeat
        wait()
        local l_Remotes_0 = game.ReplicatedStorage:WaitForChild("Remotes")
        l_Remotes_0.CommF_:InvokeServer("SetTeam", getgenv().Team)
        task.wait(0.1)
    until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)")
end
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main")

CameraShakerR = require(game["ReplicatedStorage"]["Util"]["CameraShaker"])
CameraShakerR:Stop()
local WS = getgenv().WeaponsSetting or {}
WS["Melee"] = WS["Melee"] or {}
WS["Sword"] = WS["Sword"] or {}
WS["Blox Fruit"] = WS["Blox Fruit"] or {}
WS["Gun"] = WS["Gun"] or {}
WS.Use = WS.Use or nil

local vu77 = "Rua Hub"
local vu78 = vu77 .. "/Auto Bounty"
local vu79 = vu78 .. "/Main"
local vu80 = vu78 .. "/Theme"
function readdata(name, isTheme, default)
    if not isfolder(vu77) then makefolder(vu77) end
    if not isfolder(vu78) then makefolder(vu78) end
    if not isfolder(vu80) then makefolder(vu80) end
    if not isfolder(vu79) then makefolder(vu79) end

    if not isTheme then
        local file = vu79 .. "/" .. lp.Name .. "_" .. name .. ".json"
        if isfile(file) then
            return game:GetService("HttpService"):JSONDecode(readfile(file))
        end
        return default
    end
    local file2 = vu80 .. "/" .. name
    if isfile(file2) then
        return getcustomasset(file2)
    end

    return default
end
function save(p86, p87)
    local v88 = vu79 .. "/" .. lp.Name .. "_" .. p86 .. ".json"
    local v89 = game:GetService("HttpService"):JSONEncode(p87)
    writefile(v88, v89)
    return v89
end
--// Lock Bounty
-- if Setup["Auto Team"]["Enable Lock Bounty"] and not (lp.leaderstats["Bounty/Honor"].Value > tonumber(Setup["Auto Team"]["Lock Bounty"][1])) or not (lp.leaderstats["Bounty/Honor"].Value < tonumber(Setup["Auto Team"]["Lock Bounty"][2])) then 
--     lp:Kick("Lock Bounty")
-- end
--// Cam Farm
CamFarm = getgenv().EnabledCamFarm
if CamFarm == false then
    game.Players.LocalPlayer.CameraMinZoomDistance = 127
    game.Players.LocalPlayer.CameraMaxZoomDistance = 127
    game.Players.LocalPlayer.CameraMaxZoomDistance = 127
    game.Players.LocalPlayer.CameraMinZoomDistance = 0
else
    CamFarm = true
    game.Players.LocalPlayer.CameraMinZoomDistance = 0
    game.Players.LocalPlayer.CameraMaxZoomDistance = 0
    game.Players.LocalPlayer.CameraMaxZoomDistance = 127
    game.Players.LocalPlayer.CameraMinZoomDistance = 0
end
--// Showcase Mode
-- if getgenv().PlayerSetting.ShowcaseMode then
--     local playerGui = game:GetService("Players").LocalPlayer.PlayerGui.Main
--     playerGui.Beli.Visible = false
--     playerGui.Energy.Visible = false
--     playerGui.StatsButton.Visible = false
--     playerGui.ShopButton.Visible = false
--     playerGui.Skills.Visible = false
--     playerGui.Level.Visible = false
--     playerGui.MenuButton.Visible = false
--     playerGui.Code.Visible = false
--     playerGui.Settings.Visible = false
--     playerGui.Mute.Visible = false
--     playerGui.CrewButton.Visible = false
-- else
--     playerGui.Beli.Visible = true
--     playerGui.Energy.Visible = true
--     playerGui.StatsButton.Visible = true
--     playerGui.ShopButton.Visible = true
--     playerGui.Skills.Visible = true
--     playerGui.Level.Visible = true
--     playerGui.MenuButton.Visible = true
--     playerGui.Code.Visible = true
--     playerGui.Settings.Visible = true
--     playerGui.Mute.Visible = true
--     playerGui.CrewButton.Visible = true
-- end
--// Hide Map
if getgenv().PlayerSetting.HideMap then
    local LocalChar = game.Players.LocalPlayer.Character
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalChar) then
            obj.Transparency = 1
            obj.CanTouch = false
            obj.CanQuery = false
        end
    end
    if workspace:FindFirstChild("Terrain") then
        workspace.Terrain.WaterTransparency = 1
    end
end
--// kbt nua
-- local Lighting = game:GetService("Lighting")
-- local Blur = Instance.new("BlurEffect")                 
-- Blur.Size = 15
-- Blur.Parent = Lighting       
game:GetService("Players").LocalPlayer.Character:SetAttribute("UnbreakableAll", true)                       
--// Hop
function Hop()
    function bQ(v)
        if v.Name == "ErrorPrompt" then
            if v.Visible then
                if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                    v.Visible = false
                end
            end
            v:GetPropertyChangedSignal("Visible"):Connect(function()
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        v.Visible = false
                    end
                end
            end)
        end
    end
    for i, v in game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren() do
        bQ(v) 
    end
    game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
    while wt() do
        randomy = math.random(9000, 10000)
        to(CFrame.new(-12463.8740234375 , randomy, -7523.77392578125)) 
        if not CheckInComBat() then
            ThongBaoNek("Hopping To Server: "..game.JobId, 5)
            for r = 1, math.huge do
                to(CFrame.new(-12463.8740234375, randomy, -7523.77392578125)) 
                lp.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = "Singapore"
                for k, v in inv(rs.__ServerBrowser, {r}) do
                    if k ~= game.JobId and v["Count"] <= 10 then
                        inv(rs.__ServerBrowser, {"teleport", k})
                    end
                end
                wt()
            end
        end
    end
end


function CheckInComBat()
    return game.Players.LocalPlayer.PlayerGui.Main.BottomHUDList.InCombat.Visible and game.Players.LocalPlayer.PlayerGui.Main.BottomHUDList.InCombat.Text and (string.find(string.lower(game.Players.LocalPlayer.PlayerGui.Main.BottomHUDList.InCombat.Text),"risk"))
end 

-- local bocchitherock = {
--     "rbxassetid://125436134952933",
--     "rbxassetid://100165252123599",
--     "rbxassetid://114287022295860",
--     "rbxassetid://84665398850981",
--     "rbxassetid://102643471448378",
--     "rbxassetid://138421897748221",
--     "rbxassetid://73823066506751"
-- }
-- local randomIndex = math.random(1, #bocchitherock)

getgenv().Bounty = {
    Targ = nil,
    Checked = {},
    Hop = false,
    CanUseWeapon = false,
    CanUseSkill = false,
    UsingSkill = false,
    WeaponUsing = "",
    ToolTipUsing = "Melee",
    CFrameTarget = CFrame.new(Vector3.new(0,0,0)),
    Digit = CFrame.new(Vector3.new(0,0,0)),
}
local _pid = game.PlaceId
local Sea1 = (_pid == 2753915549 or _pid == 85211729168715)
local Sea2 = (_pid == 4442272183 or _pid == 79091703265657)
local Sea3 = (_pid == 7449423635 or _pid == 100117331123089)
if Sea1 then distbyp = 1500
elseif Sea2 then distbyp = 3500
elseif Sea3 then distbyp = 6000
else distbyp = 1500 end
local _PORTALS = {
    Sea1 = {
        Vector3.new(-7894.6201171875,  5545.49169921875, -380.246346191406),
        Vector3.new(-4607.82275390625,  872.5422973632812, -1667.556884765625),
        Vector3.new(61163.8515625,       11.759522438049316, 1819.7841796875),
        Vector3.new(3876.280517578125,   35.10614013671875, -1939.3201904296875),
    },
    Sea2 = {
        Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
        Vector3.new(2284.912109375,       15.152046203613281, 905.48291015625),
        Vector3.new(923.21252441406,     126.9760055542,    32852.83203125),
        Vector3.new(-6508.5581054688,     89.034996032715,  -132.83953857422),
    },
    Sea3 = {
        Vector3.new(-5058.77490234375,  314.5155029296875, -3155.88330078125),
        Vector3.new(5756.83740234375,   610.4240112304688,  -253.9253692626953),
        Vector3.new(-12463.8740234375,  374.9144592285156, -7523.77392578125),
        Vector3.new(28282.5703125,    14896.8505859375,    105.1042709350586),
        Vector3.new(-11993.580078125,   334.7812805175781, -8844.1826171875),
        Vector3.new(5314.58203125,       25.419387817382812, -125.94227600097656),
        Vector3.new(5658.55,           1013.08,             -336.22),
    },
}
function getPortal(check2)
    local targetPos = typeof(check2) == "CFrame" and check2.Position or check2
    local seaKey = Sea1 and "Sea1" or Sea2 and "Sea2" or Sea3 and "Sea3"
    local list = seaKey and _PORTALS[seaKey] or {}
    local best, bestDist = Vector3.new(0,0,0), math.huge
    for _, pos in pairs(list) do
        local d = (pos - targetPos).Magnitude
        if d < bestDist then
            best, bestDist = pos, d
        end
    end
    return best
end
function getSpawn(wtf)
    local pos = typeof(wtf) == "CFrame" and wtf.Position or wtf
    local a, b = nil, math.huge
    for _, v in pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(lp.Team)):GetChildren()) do
        if tostring(v) ~= "Leviathan" then
            local d = (v:GetModelCFrame().Position - pos).Magnitude
            if d < b then a = v:GetModelCFrame(); b = d end
        end
    end
    return a
end

function request(pos)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", pos)
EspEventIsland
function calcpos(I, II)
    if not II then II = lp.Character.PrimaryPart.CFrame end
    local p1 = typeof(I)  == "CFrame" and I.Position  or I
    local p2 = typeof(II) == "CFrame" and II.Position or II
    return (Vector3.new(p1.X, 0, p1.Z) - Vector3.new(p2.X, 0, p2.Z)).Magnitude
end
local _tween       = nil
local _tweenBusy   = false
local _tweeningV2  = false
local _cancelNext  = false
local _RunS        = game:GetService("RunService")
local _TweenSvc    = game:GetService("TweenService")
local function _pickSpeed(dist)
    if dist <= 300 then return 400
    elseif dist <= 700 then return 350
    else return 300 end
end
local function _setFloating(enable)
    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if enable then
        if not hrp:FindFirstChild("VelocityBody") then
            local bv = Instance.new("BodyVelocity")
            bv.Name      = "VelocityBody"
            bv.Parent    = hrp
            bv.MaxForce  = Vector3.new(100000, 100000, 100000)
            bv.Velocity  = Vector3.new(0, 0, 0)
        end
    else
        local bv = hrp:FindFirstChild("VelocityBody")
        if bv then bv:Destroy() end
    end
end
local _noclipConn = nil
local function _startNoclip()
    if _noclipConn then return end
    _noclipConn = _RunS.Stepped:Connect(function()
        if lp.Character then
            for _, p in pairs(lp.Character:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide and p.Name ~= "VelocityBody" then
                    p.CanCollide = false
                end
            end
        end
    end)
end
local function _stopNoclip()
    if _noclipConn then
        _noclipConn:Disconnect()
        _noclipConn = nil
    end
end
local function _cancelTween()
    _cancelNext = true
    _tweeningV2 = false
    if _tween then
        _tween:Cancel()
        _tween = nil
    end
    _stopNoclip()
    _setFloating(false)
    task.wait()
    _cancelNext = false
end
local function _tryPortalRoute(targetVec3)
    local myPos = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not myPos then return end
    myPos = myPos.Position
    local myDist = (myPos - targetVec3).Magnitude

    if Sea1 then
        local portalChecks = {
            {gate = Vector3.new(61163.8515625,   11.6796875,  1819.7841796875),   radius = 2000, enterDist = 1000},
            {gate = Vector3.new(-7894.61767578125, 5547.14160156, -380.29119873), radius = 3000, enterDist = 3000},
            {gate = Vector3.new(-4607.82275390625,  874.390502929, -1667.55688476), radius = 3000, enterDist = 3000},
        }
        for _, p in ipairs(portalChecks) do
            if (myPos - p.gate).Magnitude > p.radius
            and (targetVec3 - p.gate).Magnitude < p.enterDist then
                repeat task.wait()
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", p.gate)
                until (lp.Character.HumanoidRootPart.Position - p.gate).Magnitude < p.radius
                return
            end
        end
    elseif Sea2 then
        local skyGate = Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)
        if (myPos - skyGate).Magnitude > 3000 and (targetVec3 - skyGate).Magnitude < 1000 then
            repeat task.wait()
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", skyGate)
            until (lp.Character.HumanoidRootPart.Position - skyGate).Magnitude < 2000
        end
    elseif Sea3 then
        local SubmergedPos = Vector3.new(11256, -2138.0, 9888)
        local TikiPos      = Vector3.new(-16269.0, 23, 1371)
        if (SubmergedPos - targetVec3).Magnitude < (myPos - targetVec3).Magnitude - 700 then
            if (myPos - TikiPos).Magnitude > 60 then
                to(CFrame.new(TikiPos))
                return
            end
            local Net = require(game.ReplicatedStorage.Modules.Net)
            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("AskKilledTikiBoss")
            wait(0.5)
            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
            return
        end
    end
end
local function DoTween2(targetVec3Getter, condition)
    -- targetVec3Getter can be a Vector3 (static) or a function() returning Vector3 (dynamic)
    if not targetVec3Getter then return end
    if not condition then condition = function() return true end end
    local function getTarget()
        if type(targetVec3Getter) == "function" then
            return targetVec3Getter()
        end
        return targetVec3Getter
    end

    while not (lp.Character
    and lp.Character:FindFirstChild("Humanoid")
    and lp.Character.Humanoid.Health > 0) do
        task.wait(1)
    end

    local TeleportSpeed = 350
    local HRP = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return end

    local initialTarget = getTarget()
    if not initialTarget then return end

    if math.abs(HRP.Position.Y - initialTarget.Y) > 50 then
        HRP.CFrame = CFrame.new(HRP.Position.X, initialTarget.Y, HRP.Position.Z)
        task.wait()
    end
    pcall(_tryPortalRoute, initialTarget)

    _tweeningV2 = true
    _startNoclip()
    _setFloating(true)

    local currentTween = nil
    local lastTarget   = Vector3.new(math.huge, math.huge, math.huge)

    local heartbeatConn
    heartbeatConn = _RunS.Heartbeat:Connect(function()
        if not _tweeningV2 then
            heartbeatConn:Disconnect()
            return
        end
        if not (lp.Character
            and lp.Character:FindFirstChild("Humanoid")
            and lp.Character.Humanoid.Health > 0
            and condition()) then
            _tweeningV2 = false
            heartbeatConn:Disconnect()
            return
        end

        -- Anti-sit
        lp.Character.Humanoid.Sit = false

        local targetVec3 = getTarget()
        if not targetVec3 then return end

        local dist = (HRP.Position - targetVec3).Magnitude
        if dist <= TeleportSpeed / 2 then
            -- Close enough, snap to target
            HRP.CFrame = CFrame.new(targetVec3)
            if currentTween then currentTween:Cancel(); currentTween = nil end
            _tweeningV2 = false
            heartbeatConn:Disconnect()
            return
        end

        -- Only re-create tween if target moved significantly (avoids spam)
        if (targetVec3 - lastTarget).Magnitude > 1 then
            lastTarget = targetVec3
            if currentTween then currentTween:Cancel(); currentTween = nil end

            local duration = dist / TeleportSpeed
            currentTween = _TweenSvc:Create(
                HRP,
                TweenInfo.new(duration, Enum.EasingStyle.Linear),
                {CFrame = CFrame.new(targetVec3)}
            )
            currentTween:Play()
        end

        -- Bypass noise to avoid server anti-cheat
        pcall(function()
            HRP.Velocity = HRP.Velocity + Vector3.new(
                math.random(-10, 10),
                math.random(-100, 12),
                math.random(-10, 10)
            )
            lp.Character.Humanoid.MoveDirection = lp.Character.Humanoid.MoveDirection
                + Vector3.new(math.random(-10,10), math.random(-100,12), math.random(-10,10))
        end)
    end)

    -- Wait until tween loop finishes
    while _tweeningV2 do task.wait(0.05) end
    if currentTween then currentTween:Cancel(); currentTween = nil end

    _stopNoclip()
    _setFloating(false)
    _tweeningV2 = false
end

local function DoTween(targetCF, forceNoWait)
    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
    local HRP  = lp.Character.HumanoidRootPart
    local dist = (HRP.Position - targetCF.Position).Magnitude
    if targetCF.Position.X ~= targetCF.Position.X then return end
    if math.abs(HRP.Position.Y - targetCF.Y) > 70 then
        HRP.CFrame = CFrame.new(HRP.Position.X, targetCF.Y, HRP.Position.Z)
        task.wait()
    end

    local speed = _pickSpeed(dist)

    if _tween then _tween:Cancel(); _tween = nil end
    if dist <= 350 then
        HRP.CFrame = targetCF
        return
    end

    _tween = _TweenSvc:Create(
        HRP,
        TweenInfo.new(dist / speed, Enum.EasingStyle.Linear),
        {CFrame = targetCF}
    )

    _setFloating(true)
    _startNoclip()

    lp.Character.Humanoid.Died:Connect(function()
        if _tween then _tween:Cancel() end
    end)

    if not forceNoWait then
        _tween:Play()
        _tween.Completed:Wait()
    else
        _tween:Play()
    end

    _stopNoclip()
    _setFloating(false)
    if _tween then _tween:Cancel(); _tween = nil end
end
function to(Pos)
    if not Pos then return end
    pcall(function()
        if not lp.Character then return end
        local HRP = lp.Character:FindFirstChild("HumanoidRootPart")
        if not HRP then return end

        local targetCF  = typeof(Pos) == "CFrame" and Pos or CFrame.new(Pos)
        local targetV3  = targetCF.Position
        local dist      = (HRP.Position - targetV3).Magnitude

        -- Condition: keep moving while the target is still alive
        local function aliveCondition()
            if not (lp.Character
            and lp.Character:FindFirstChild("Humanoid")
            and lp.Character.Humanoid.Health > 0) then
                return false
            end
            if not Bounty.Targ then return true end
            local ok, hrp = pcall(function()
                return Bounty.Targ.Character and Bounty.Targ.Character:FindFirstChild("HumanoidRootPart")
            end)
            return ok and hrp ~= nil
        end
        -- Dynamic getter: if Pos is a static CFrame/Vector3, return fixed target.
        -- If Bounty.Targ is alive, continuously track their HRP position.
        local function dynamicTarget()
            if Bounty.Targ and Bounty.Targ.Character then
                local hrp = Bounty.Targ.Character:FindFirstChild("HumanoidRootPart")
                if hrp then return hrp.Position end
            end
            return targetV3
        end

        if dist <= 350 then
            DoTween(targetCF)
        elseif dist > 2000 then
            local ok, portalPos = pcall(getPortal, targetV3)
            if ok and portalPos then
                local myPos    = HRP.Position
                local portalD  = (portalPos - targetV3).Magnitude
                local directD  = (myPos - targetV3).Magnitude
                if portalD < directD - 300 then
                    request(portalPos)
                    task.wait(0.5)
                end
            end
            DoTween2(dynamicTarget, aliveCondition)
        else
            DoTween2(dynamicTarget, aliveCondition)
        end
    end)
end
function StopTween()
    _cancelTween()
end
--// Equip
function equip(tool)
    for _, v in lp.Backpack:GetChildren() do 
        if v:IsA("Tool") and v.ToolTip == tool then
            wfh(lp):EquipTool(v)
            return v.Name
        end 
    end 
    return false
end
--//Weapon List
function GetWeaponList()
    local result = {}
    local order = getgenv().WeaponPriority 
                or (WS.Use or {"Melee","Sword","Blox Fruit","Gun"})

    for _, weaponType in ipairs(order) do
        local cfg = WS[weaponType]
        if cfg and cfg.Enable == true then
            if cfg.Skills then
                table.insert(result, weaponType)
            end
        end
    end

    return result
end
--// Use Skill
function down(key, hold)
    pcall(function()
        if not ffc(lp.Character, Bounty.WeaponUsing) then
            equip(Bounty.ToolTipUsing)
        end
        local vim = game:GetService("VirtualInputManager")
        pcall(function() vim:SendKeyEvent(true, key, false, game) end)
        local t0 = tick()
        repeat
            wt(0.01)
            if not ffc(lp.Character, Bounty.WeaponUsing) then
                equip(Bounty.ToolTipUsing)
            end
            pcall(function() vim:SendKeyEvent(true, key, false, game) end)
        until (tick() - t0) >= (hold or 0) or not Bounty.CanUseSkill or not Bounty.CanUseWeapon
        pcall(function() vim:SendKeyEvent(false, key, false, game) end)
    end)
end
--// Skill
function cd(I, II) 
    if not II then II = lp.Character.PrimaryPart.CFrame end
    return (Vector3.new(I.X, 0, I.Z) - Vector3.new(II.X, 0, II.Z)).Magnitude 
end 
function int(num)
    if not num then return end
    return tonumber(num)
end
function str(string)
    if not string then return end
    return tostring(string)
end
function wt(num)
    if not num then return task.wait() end
    return task.wait(int(num))
end
function ffc(obj, child)
    if not obj or not child then return end
    return obj:FindFirstChild(str(child))
end
function wfc(obj, child)
    if not obj or not child then return end
    return obj:WaitForChild(str(child), 9)
end
function wfh(mob)
    if not mob then return end
    return wfc(mob.Character, "Humanoid")
end
function wfhrp(mob)
    if not mob then return end
    return wfc(mob.Character, "HumanoidRootPart")
end
function checkmon(mob)
    if not mob then return end
    if mob and ffc(mob.Character, "Humanoid") and mob.Character.Humanoid.Health > 0 and ffc(mob.Character, "HumanoidRootPart") then
        return true
    end
    return
end
function inv(obj, child)
    if not obj or not child then return end
    return obj:InvokeServer(unpack(child))
end

function checkfruit(targcheck)
    local pdf = targcheck and ffc(targcheck, "Data") and ffc(targcheck.Data, 'DevilFruit') and targcheck.Data.DevilFruit.Value
    for _, v in getgenv().PlayerSetting.Inorge.Fruit.InorgeFruit do 
        if str(v) == str(pdf) then 
            return true
        end
    end
    return false
end
-- findtarget = function()
--     table.insert(Bounty.Checked, Bounty.Targ)
--     Bounty.CanUseWeapon = false
--     Bounty.CanUseSkill = false
--     if getgenv().PlayerSetting.Chat.Enabled then
--         local chat = game:GetService("TextChatService")
--         local ch = chat:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    
--         local msg = getgenv().PlayerSetting.Chat.ListChat[
--             math.random(1, #getgenv().PlayerSetting.Chat.ListChat)
--         ]
    
--         ch:SendAsync(msg)
--     end
--     if not Bounty.Hop then
--         local bestTarget, shortestDist = nil, math.huge

--         for _, v in plrs:GetChildren() do
--             if v ~= lp
--                 and v.Team
--                 and string.find(str(v.Team.Name), "es")
--                 and not table.find(Bounty.Checked, v)
--                 and (str(lp.Team.Name) == "Pirates" or str(v.Team.Name) == "Pirates")
--                 and math.abs(lp.Data.Level.Value - v.Data.Level.Value) < 600
--                 and (not getgenv().PlayerSetting.Inorge.Fruit.Enabled or not checkfruit(v))
--                 and (not getgenv().PlayerSetting.Inorge.InorgeV4 or not (ffc(v.Backpack, "Awakening") or ffc(v.Character, "Awakening")))
--                 -- and cd(getSpawn(wfhrp(v).CFrame), wfhrp(v).CFrame) <= 3000 -- 627
--                 and (function()
--                     local hrp = wfhrp(v)
--                     if not hrp then return false end
--                     local sp = pcall(getSpawn, hrp.CFrame)
--                     if not sp then return true end -- bỏ qua check nếu lỗi
--                     return cd(getSpawn(hrp.CFrame), hrp.CFrame) <= 3000
--                 end)()
--                 and not ffc(v.Character, "TempSafeZone")
--                 and checkmon(v)
--             then
--                 local dist = cd(wfhrp(v).CFrame, wfhrp(lp).CFrame)
--                 if dist < shortestDist then
--                     bestTarget = v
--                     shortestDist = dist
--                 end
--             end
--         end
--         if bestTarget then
--             Bounty.Targ = bestTarget
--             local hrp = ffc(bestTarget.Character, "HumanoidRootPart")
--             if hrp then
--                 Bounty.CFrameTarget = hrp.CFrame
--                 Bounty.Digit = hrp.CFrame
--                 task.spawn(function()
--                     to(RandomCFrame(hrp.CFrame + Vector3.new(0, 5, 0)))
--                 end)
--             end
--             ThongBaoNek(" Start Killing : " .. Bounty.Targ.Name, 3)
--             for _, v in pairs(game.Workspace.Characters:GetChildren()) do
--                 if v.Name ~= lp.Name and ffc(v, "HumanoidRootPart") then
--                     v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
--                     v.HumanoidRootPart.CanCollide = true
--                 end
--             end
--             local hrp = ffc(Bounty.Targ.Character, "HumanoidRootPart")
--             if hrp then
--                 hrp.Size = Vector3.new(100, 100, 100)
--                 hrp.Transparency = 1
--                 hrp.CanCollide = false
--             end
--             return true
--         end
--     end
--     Bounty.Hop = true
--     Hop()
--     return false
-- end

findtarget = function()
    table.insert(Bounty.Checked, Bounty.Targ)
    Bounty.CanUseWeapon = false
    Bounty.CanUseSkill = false
    Bounty.Targ = nil

    if getgenv().PlayerSetting.Chat.Enabled then
        local chat = game:GetService("TextChatService")
        local ch = chat:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
        local msg = getgenv().PlayerSetting.Chat.ListChat[
            math.random(1, #getgenv().PlayerSetting.Chat.ListChat)
        ]
        ch:SendAsync(msg)
    end

    if not Bounty.Hop then
        local bestTarget, shortestDist = nil, math.huge

        for _, v in plrs:GetChildren() do
            if v ~= lp
                and v.Team
                and string.find(str(v.Team.Name), "es")
                and not table.find(Bounty.Checked, v)
                and (str(lp.Team.Name) == "Pirates" or str(v.Team.Name) == "Pirates")
                and math.abs(lp.Data.Level.Value - v.Data.Level.Value) < 600
                and (not getgenv().PlayerSetting.Inorge.Fruit.Enabled or not checkfruit(v))
                and (not getgenv().PlayerSetting.Inorge.InorgeV4 or not (ffc(v.Backpack, "Awakening") or ffc(v.Character, "Awakening")))
                and (not getgenv().PlayerSetting.Inorge.InorgeFriends or not (v.UserId and lp:IsFriendsWith(v.UserId)))
                and not isAtSubmergedIsland(v) -- Bỏ qua target đang ở Submerged Island
                and (function()
                    local hrp = wfhrp(v)
                    if not hrp then return false end
                    -- Lọc safe zone ngay từ đây, không chọn target đang ở safe zone
                    if checksafezone(hrp.CFrame) then return false end
                    if ffc(v.Character, "TempSafeZone") then return false end
                    local ok, sp = pcall(getSpawn, hrp.CFrame)
                    if not ok then return true end
                    return cd(sp, hrp.CFrame) <= 3000
                end)()
                and checkmon(v)
            then
                local dist = cd(wfhrp(v).CFrame, wfhrp(lp).CFrame)
                if dist < shortestDist then
                    bestTarget = v
                    shortestDist = dist
                end
            end
        end

        if bestTarget then
            Bounty.Targ = bestTarget
            local hrp = ffc(bestTarget.Character, "HumanoidRootPart")
            if hrp then
                Bounty.CFrameTarget = hrp.CFrame
                Bounty.Digit = hrp.CFrame
                -- Tween trực tiếp, không dùng task.spawn
                to(RandomCFrame(hrp.CFrame + Vector3.new(0, 5, 0)))
            end
            ThongBaoNek("Start Killing: " .. Bounty.Targ.Name, 3)

            for _, v in pairs(game.Workspace.Characters:GetChildren()) do
                if v.Name ~= lp.Name and ffc(v, "HumanoidRootPart") then
                    v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                    v.HumanoidRootPart.CanCollide = true
                end
            end

            local targHrp = ffc(Bounty.Targ.Character, "HumanoidRootPart")
            if targHrp then
                targHrp.Size = Vector3.new(100, 100, 100)
                targHrp.Transparency = 1
                targHrp.CanCollide = false
            end
            -- QUAN TRỌNG: return true để vòng lặp chính biết đã có target mới và tiếp tục tween
            return true
        end
    end

    Bounty.Hop = true
    Hop()
    return false
end

function LockCamera(Target)
    local cam = workspace.CurrentCamera
    local lp = game.Players.LocalPlayer
    if not getgenv().LockCam then return end
    if not Target or not Target.Character then return end

    local hrp = Target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    cam.CFrame = CFrame.new(cam.CFrame.Position, hrp.Position)
end
spawn(function()
    while task.wait() do
        if getgenv().Bounty.Targ then
            LockCamera(getgenv().Bounty.Targ)
        end
    end
end)
function cnoti(p188)
    for _, v in pairs(lp.PlayerGui.Notifications:GetChildren()) do
        if v:IsA("TextLabel") and v.Text then
            local t = string.lower(v.Text)

            if string.find(t, string.lower(p188)) 
            or string.find(t, string.lower(lp.Name)) then

                if not string.find(t, " =))") then
                    v.Text = v.Text .. " =))"
                end

                if string.find(t, "earn") then
                    return "earned"
                end
                if string.find(t, "sus") then
                    return "sus"
                end
            end
        end
    end
    return "not find"
end
function checkraid(target)
    if ffc(workspace["_WorldOrigin"].Locations, "Island 1") then
        if cd(wfhrp(target).CFrame, workspace["_WorldOrigin"].Locations["Island 1"].CFrame) < 3000 then 
            return true 
        end 
    end 
    return false
end
function checksafezone(pos)
    for _, v in workspace._WorldOrigin.SafeZones:GetChildren() do
        if cd(v.CFrame, pos) < (v.Mesh.Scale.Magnitude / 2) then
            return true
        end
    end
    return false
end  
-- Pure check (no side effects): true if `target` is currently at/near
-- the Submerged Island. Used both to pre-filter target selection in
-- findtarget() and by checkdao() below for the reactive re-check.
local SubmergedIslandPos = Vector3.new(11256, -2138.0, 9888)
function isAtSubmergedIsland(target)
    local hrp = ffc(target and target.Character, "HumanoidRootPart")
    if not hrp then return false end

    -- Prefer the actual map part if it's loaded (Sea 3 only)...
    if workspace:FindFirstChild("Map") then
        local island = workspace.Map:FindFirstChild("Submerged Island")
        if island then
            local part = island.PrimaryPart or island:FindFirstChildWhichIsA("BasePart")
            if part and cd(hrp.Position, part.Position) < 5000 then
                return true
            end
        end
    end

    -- ...fall back to the known Submerged Island world position
    -- (covers the case where the "Submerged Island" model isn't
    -- streamed in yet, e.g. we're not physically inside it).
    if (hrp.Position - SubmergedIslandPos).Magnitude < 2000 then
        return true
    end

    return false
end

function checkdao(target)
    if isAtSubmergedIsland(target) then
        ThongBaoNek(" Target is in Submerged Island...", 3)
        return findtarget()
    end
    return false
end
function checkfriend(target)
    if target and target.UserId then
        local plr = game.Players.LocalPlayer
        if plr:IsFriendsWith(target.UserId) then
            ThongBaoNek(" Target is your friend -> Skipped...", 3)
            return true
        end
    end
    return false
end
-- local oldtarg = Bounty.Targ
-- local oldtime = tick() 
-- local startuse = false
-- function checktarg()
--     if Bounty.Targ and Bounty.Targ.Name then
--         -- check kill noti
--         local result = cnoti(Bounty.Targ.Name)
--         if result == "earned" then
--             ThongBaoNek("Killed: " .. Bounty.Targ.Name, 3)
--             return findtarget()
--         end
--     end
--     if not checkmon(Bounty.Targ) then
--         return findtarget()
--     end
--     if checkfriend(Bounty.Targ) then
--         return findtarget()
--     end
--     local hrp = ffc(Bounty.Targ.Character, "HumanoidRootPart")
--     if not hrp then return true end

--     local dist = (wfhrp(lp).Position - hrp.Position).Magnitude
--     if dist > 80 then
--         local targCF = wfhrp(Bounty.Targ)
--         if targCF then
--             Bounty.CFrameTarget = targCF.CFrame
--             Bounty.Digit = targCF.CFrame
--             to(RandomCFrame(targCF.CFrame + Vector3.new(0, 5, 0)))
--         end
--         return true
--     end
--     if checksafezone(wfhrp(Bounty.Targ).CFrame) then
--         ThongBaoNek(" Target is in a safe zone...", 3)
--         return findtarget()
--     end
--     if checkraid(Bounty.Targ) then
--         ThongBaoNek(" Target is in a raid...", 3)
--         return findtarget()
--     end
--     if checkdao(Bounty.Targ) then
--         return
--     end
--     if getgenv().PlayerSetting.FindTargetIfPlayerLowHealth then
--         local hp = lp.Character and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health
--         local max = lp.Character and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.MaxHealth
--         if hp and max then
--             local percentage = (hp / max) * 100

--             local low = getgenv().PlayerSetting.SafeHealth[1] or 30
--             local critical = getgenv().PlayerSetting.SafeHealth[2] or 40
--             if percentage <= low then
--                 ThongBaoNek("Health low ("..math.floor(percentage).."%) → Finding safer target...", 3)
--                 return findtarget()
--             end
--             if percentage <= critical and Bounty.Targ 
--             and Bounty.Targ.Character 
--             and Bounty.Targ.Character:FindFirstChild("Humanoid") 
--             and Bounty.Targ.Character.Humanoid.WalkSpeed > 20 then
--                 ThongBaoNek("HP critical, avoiding aggressive player...", 3)
--                 return findtarget()
--             end
--         end
--     end

--     if Bounty.Targ == oldtarg then
--         if Bounty.UsingSkill and not startuse then
--             oldspamskill = tick()
--             startuse = true
--         end
--         if startuse and (tick() - oldspamskill) >= 3 and not (Bounty.Targ.Character:GetAttribute("InCombat") == 0 or Bounty.Targ.Character:GetAttribute("InCombat") == 1) then
--             ThongBaoNek(" Target is not in combat...", 3)
--             return findtarget()
--         end
--     else
--         startuse = false
--         oldtarg = Bounty.Targ
--     end
--     return true
-- end
local oldtarg = Bounty.Targ
local oldtime = tick()
local startuse = false

function checktarg()
    -- Chưa có target → tìm ngay, return kết quả của findtarget
    if not Bounty.Targ then
        return findtarget()
    end

    -- Kiểm tra kill notification
    if Bounty.Targ.Name then
        local result = cnoti(Bounty.Targ.Name)
        if result == "earned" then
            ThongBaoNek("Killed: " .. Bounty.Targ.Name, 3)
            -- findtarget() tìm target mới và return true/false
            return findtarget()
        end
    end

    -- Target chết / không hợp lệ
    if not checkmon(Bounty.Targ) then
        return findtarget()
    end

    -- Target là bạn bè
    if checkfriend(Bounty.Targ) then
        ThongBaoNek("Target is your friend -> Skipped...", 3)
        return findtarget()
    end

    local hrp = ffc(Bounty.Targ.Character, "HumanoidRootPart")
    if not hrp then
        return findtarget()
    end

    -- Kiểm tra safe zone TRƯỚC khi check distance
    -- Nếu target vào safe zone → bỏ qua, tìm target mới
    -- findtarget() sẽ return true nếu có target mới → vòng lặp chính tween đến target mới luôn
    if checksafezone(hrp.CFrame) or ffc(Bounty.Targ.Character, "TempSafeZone") then
        ThongBaoNek("Target in safe zone -> Finding new target...", 3)
        return findtarget()
    end

    -- Còn xa → tween đến
    local dist = (wfhrp(lp).Position - hrp.Position).Magnitude
    if dist > 80 then
        local targCF = wfhrp(Bounty.Targ)
        if targCF then
            Bounty.CFrameTarget = targCF.CFrame
            Bounty.Digit = targCF.CFrame
            to(RandomCFrame(targCF.CFrame + Vector3.new(0, 5, 0)))
        end
        return true
    end

    -- Target trong raid
    if checkraid(Bounty.Targ) then
        ThongBaoNek("Target is in a raid -> Finding new target...", 3)
        return findtarget()
    end

    -- Target ở Submerged Island
    if checkdao(Bounty.Targ) then
        return false
    end

    -- HP bản thân thấp
    if getgenv().PlayerSetting.FindTargetIfPlayerLowHealth then
        local hum = lp.Character and lp.Character:FindFirstChild("Humanoid")
        if hum then
            local percentage = (hum.Health / hum.MaxHealth) * 100
            local low = getgenv().PlayerSetting.SafeHealth[1] or 30
            local critical = getgenv().PlayerSetting.SafeHealth[2] or 40

            if percentage <= low then
                ThongBaoNek("Health low (" .. math.floor(percentage) .. "%) -> Finding safer target...", 3)
                return findtarget()
            end

            if percentage <= critical
            and Bounty.Targ.Character
            and Bounty.Targ.Character:FindFirstChild("Humanoid")
            and Bounty.Targ.Character.Humanoid.WalkSpeed > 20 then
                ThongBaoNek("HP critical, avoiding aggressive player...", 3)
                return findtarget()
            end
        end
    end

    -- Target không vào combat sau 3 giây
    if Bounty.Targ == oldtarg then
        if Bounty.UsingSkill and not startuse then
            oldspamskill = tick()
            startuse = true
        end
        if startuse and (tick() - oldspamskill) >= 3
        and not (Bounty.Targ.Character:GetAttribute("InCombat") == 0
              or Bounty.Targ.Character:GetAttribute("InCombat") == 1) then
            ThongBaoNek("Target is not in combat -> Finding new target...", 3)
            return findtarget()
        end
    else
        startuse = false
        oldtarg = Bounty.Targ
    end

    return true
end
local Mouse = game.Players.LocalPlayer:GetMouse()
Cac = hookmetamethod(game, "__index", newcclosure(function(self, Index)
    if self == Mouse then
        if Index == "Hit" or Index == "hit" then
            return Bounty.CFrameTarget
        end
    end
    return Cac(self, Index)
end))
spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    args[2] = Bounty.Digit.Position
                    return old(unpack(args))
                end
            end
        end
        return old(...)
    end)
end)
if not getgenv().PlayerSetting.PcMode then
    local vu245 = nil
    vu245 = hookmetamethod(game, "__index", newcclosure(function(p246, p247)
        if p246 ~= vu63 or p247 ~= "Hit" and p247 ~= "hit" then
            return vu245(p246, p247)
        else
            return Bounty.CFrameTarget
        end
    end))
    spawn(function()
        local v248 = getrawmetatable(game)
        local vu249 = v248.__namecall
        setreadonly(v248, false)
        v248.__namecall = newcclosure(function(...)
            local v250 = getnamecallmethod()
            local v251 = {
                ...
            }
            if tostring(v250) ~= "FireServer" or (tostring(v251[1]) ~= "RemoteEvent" or (tostring(v251[2]) == "true" or tostring(v251[2]) == "false")) then
                return vu249(...)
            end
            v251[2] = Bounty.Digit
            return vu249(unpack(v251))
        end)
    end)
end
if getgenv().PlayerSetting.PcMode or getgenv().PlayerSetting.GunMethod then
    function click()
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1))
    end
end
local notiCooldown = {
    Force = 1.5,
    Equip = 1.5,
    Start = 1.0,
    Skill = 0.35
}
local lastNoti = {
    Force = 0,
    Equip = 0,
    Start = 0,
    Skill = {}
}
local notiActive = {}
local function pushNotify(id, text, duration)
    if notiActive[id] then return end
    notiActive[id] = true

    ThongBaoNek(text, duration or 1.2)

    task.delay(duration or 1.2, function()
        notiActive[id] = nil
    end)
end
NotifyForceWeapon = function(weaponType)
    local now = tick()
    if now - lastNoti.Force < notiCooldown.Force then return end
    lastNoti.Force = now

    pushNotify("FORCE_"..weaponType, "Force "..weaponType, 1.2)
end
NotifyEquipped = function(toolName)
    local now = tick()
    if now - lastNoti.Equip < notiCooldown.Equip then return end
    lastNoti.Equip = now

    pushNotify("EQUIP_"..toolName, "Equipped : "..toolName, 1.2)
end
NotifyStartSkill = function()
    local now = tick()
    if now - lastNoti.Start < notiCooldown.Start then return end
    lastNoti.Start = now

    pushNotify("START", "Starting Skill Controller", 1.0)
end
NotifyCastSkill = function(key)
    local now = tick()
    lastNoti.Skill[key] = lastNoti.Skill[key] or 0
    if now - lastNoti.Skill[key] < notiCooldown.Skill then return end
    lastNoti.Skill[key] = now
    pushNotify("PRESS_"..key, "Pressing "..key, 0.45)
    task.delay(0.1, function()
        pushNotify("PRESSED_"..key, "Pressed "..key, 0.45)
    end)
end

local alreadyDelayLowHP = false
local SkillUIcache = {}
local LastCastTimes = {}
local LastSwitch = 0
local CAST_DEBOUNCE = 0.03
function cacheSkillUI(toolName)
    if not toolName then return nil end
    local gui = SkillUIcache[toolName]
    if gui and gui.Parent then return gui end
    local ok, res = pcall(function() return lp.PlayerGui and lp.PlayerGui.Main and lp.PlayerGui.Main.Skills and lp.PlayerGui.Main.Skills:FindFirstChild(toolName) end)
    gui = ok and res or nil
    SkillUIcache[toolName] = gui
    return gui
end
local function recordCast(toolName, key)
    if not toolName or not key then return end
    LastCastTimes[toolName..":"..key] = tick()
end
local function canCastNow(toolName, key)
    local id = toolName..":"..key
    local last = LastCastTimes[id] or 0
    return (tick() - last) >= CAST_DEBOUNCE
end
PredictTargetPosition = function(target, leadFactor)
    if not target or not target.Character then return nil end
    local hrp = safe(function() return wfhrp(target) end)
    if not hrp then return nil end
    leadFactor = leadFactor or 0.12
    local vel = hrp.Velocity or Vector3.new()
    local base = (Bounty.CFrameTarget and (type(Bounty.CFrameTarget)=="CFrame" and Bounty.CFrameTarget.Position) or hrp.Position) or hrp.Position
    return base + vel * leadFactor
end
SortSkills = function(weaponType)
    local cfg = WS[weaponType]
    if not cfg or not cfg.Skills then return {} end
    local skills = {}
    for key, data in pairs(cfg.Skills) do
        if data.Enable then
            table.insert(skills, {
                Key = key,
                Hold = data.HoldTime or 0,
                Delay = data.TimeToNextSkill or 0,
                NoPredict = data.NoPredict or false
            })
        end
    end
    table.sort(skills, function(a,b)
        return a.Delay < b.Delay
    end)

    return skills
end
GetReadySkillsForTool = function(toolName, weaponType)
    local res = {}
    if not toolName then return res end
    local ui = cacheSkillUI(toolName)
    if not ui then return res end
    local cfg = WS[weaponType]
    if not cfg or not cfg.Skills then return res end
    local skills = SortSkills(weaponType)
    for _, sk in ipairs(skills) do
        local key = sk.Key
        local data = cfg.Skills[key]
        if data and data.Enable then
            local frame = ui:FindFirstChild(key)
            if frame then
                local cd = frame:FindFirstChild("Cooldown")
                if cd and cd.Size and cd.Size.X and cd.Size.X.Scale <= 0 then
                    if canCastNow(toolName, key) then
                        table.insert(res, {Key = key, Hold = data.HoldTime or 0, TimeToNext = data.TimeToNextSkill or 0})
                    end
                end
            end
        end
    end
    return res
end
GetWeaponPriority = function()
    if getgenv().WeaponPriority and type(getgenv().WeaponPriority) == "table" then
        return getgenv().WeaponPriority
    end
    if WS.Use and type(WS.Use) == "table" then
        return WS.Use
    end
    return {"Melee","Sword","Blox Fruit","Gun"} 
end
SwitchNextWeaponIfCooldown = function(currentWeaponType)
    if tick() - LastSwitch < 0.12 then return false end 
    LastSwitch = tick()

    local priority = GetWeaponPriority() or GetWeaponList() or {}
    if #priority == 0 then return false end

    local startIndex = 1
    for i,v in ipairs(priority) do if v == currentWeaponType then startIndex = i; break end end
    for step = 1, #priority - 1 do
        local idx = ((startIndex + step - 1) % #priority) + 1
        local candidateType = priority[idx]
        local candCfg = WS[candidateType]
        if candCfg and candCfg.Enable and candCfg.Skills then
            local toolName = equip(candidateType)
            if toolName then
                local ready = GetReadySkillsForTool(toolName, candidateType)
                if #ready > 0 then
                    local sk = ready[1]
                    Bounty.ToolTipUsing = candidateType
                    Bounty.WeaponUsing = toolName
                    Bounty.UsingSkill = true
                    down(sk.Key, sk.Hold)
                    recordCast(toolName, sk.Key)
                    Bounty.UsingSkill = false
                    return true
                end
            end
        end
    end

    return false
end
TrySkillCast = function(weaponType)
    local cfg = WS[weaponType]
    if not cfg or not cfg.Enable then return false end

    local toolName = equip(weaponType)
    if not toolName then return false end

    NotifyForceWeapon(weaponType)
    NotifyEquipped(toolName)
    NotifyStartSkill()

    Bounty.UsingSkill = true
    Bounty.ToolTipUsing = weaponType
    Bounty.WeaponUsing = toolName
    wt(0)
    local skillUI = lp.PlayerGui.Main.Skills:FindFirstChild(toolName)
    if not skillUI then return false end

    local skillList = SortSkills(weaponType)
    local used = false

    for _, sk in ipairs(skillList) do
        if not Bounty.CanUseSkill then break end

        local frame = skillUI:FindFirstChild(sk.Key)
        if frame and frame.Cooldown.Size.X.Scale <= 0 then

            NotifyCastSkill(sk.Key)

            down(sk.Key, sk.Hold)

            if not sk.NoPredict then
                Bounty.Digit = Bounty.CFrameTarget + wfhrp(Bounty.Targ).Velocity / 2
            end

            wt(0.01)
            used = true
        end
    end
    if not used and cfg.SwitchNextWeaponIfCooldown then
        return SwitchNextWeaponIfCooldown(weaponType)
    end
    Bounty.UsingSkill = false
    return used
end
function safe(f, ...)
    local ok, result = pcall(f, ...)
    if ok then return result end
    return nil
end
function CheckV4(player)
    if not player or not player.Character then
        return false
    end

    local char = player.Character
    local aura = safe(function() return char:FindFirstChild("Awakening") end)
    local race = safe(function() return char:GetAttribute("RaceTransformation") end)

    if aura then return true end
    if race == "V4" then return true end

    return false
end
function getskillmethod(target)
    local cfg = getgenv().UseSkillSetting
    if not cfg then return "Normal" end
    local method = cfg.NormalMethod or "Normal"
    if target and CheckV4(target) then
        method = cfg.MethodIfTargetOnV4 or method
    end
    if cfg.MethodIfTargetUseFruit and cfg.MethodIfTargetUseFruit.Fruits then
        local fruitTable = cfg.MethodIfTargetUseFruit.Fruits
        local tarTool = safe(function() return target.Character:FindFirstChildOfClass("Tool") end)
        if tarTool and tarTool:FindFirstChild("Fruit") then
            method = cfg.MethodIfTargetUseFruit.Method or method
        end
    end
    local me = game.Players.LocalPlayer
    if CheckV4(me) then
        method = cfg.MethodIfPlayerOnV4 or method
    end
    if cfg.LowHealthPlayerCondition and cfg.LowHealthPlayerCondition.Enable then
        local hp = me.Character and me.Character:FindFirstChild("Humanoid")
        if hp then
            local percent = (hp.Health / hp.MaxHealth) * 100
            if percent <= cfg.LowHealthPlayerCondition.Health then
                method = cfg.LowHealthPlayerCondition.Method or method
            end
        end
    end
    if target and cfg.LowHealthTargetCondition and cfg.LowHealthTargetCondition.Enable then
        local hum = safe(function() return target.Character.Humanoid end)
        if hum then
            local percent = (hum.Health / hum.MaxHealth) * 100
            if percent <= cfg.LowHealthTargetCondition.Health then
                local delaySetting = cfg.LowHealthTargetCondition.DelayFirstTime
                if delaySetting and delaySetting[1] == true and not alreadyDelayLowHP then
                    alreadyDelayLowHP = true
                    wt(delaySetting[2] or 1)
                end
    
                method = cfg.LowHealthTargetCondition.Method or method
            end
        end
    end
    return method
end
function getmethoddelay(mode)
    if mode == "Normal" then
        return 0.15  
    elseif mode == "Fast" then
        return 0.05
    elseif mode == "Spam" then
        return 0.03
    elseif mode == "SpamAll" then
        return 0.001
    end
    return 0.01
end
function castskillmethod()
    if not Bounty.Targ then return end
    if not Bounty.CanUseSkill then return end

    local weapon = lp.Character and lp.Character:FindFirstChildOfClass("Tool")
    if not weapon then return end

    local toolName = weapon.Name
    local ui = cacheSkillUI(toolName)
    if not ui then return end
    local cfg = WS[weapon.ToolTip]
    if not cfg or not cfg.Skills then return end

    for key, data in pairs(cfg.Skills) do
        if type(data) == "table" and data.Enable then
            local frame = ui:FindFirstChild(key)
            if frame then
                local cd = frame:FindFirstChild("Cooldown")
                if cd and cd.Size and cd.Size.X and cd.Size.X.Scale <= 0 and canCastNow(toolName, key) then
                    Bounty.UsingSkill = true
                    Bounty.ToolTipUsing = weapon.ToolTip
                    Bounty.WeaponUsing = toolName
                    local ppos = PredictTargetPosition(Bounty.Targ, 0.12)
                    if ppos then Bounty.Digit = CFrame.new(ppos) end

                    down(key, data.HoldTime or 0)
                    recordCast(toolName, key)
                    wt(0.005)
                    Bounty.UsingSkill = false
                end
            end
        end
    end
end
function spamskill()
    if not Bounty.Targ then return end
    if not Bounty.CanUseSkill then return end
    if Bounty.UsingSkill then return end
    local mode = getskillmethod(Bounty.Targ) or "Normal"
    local methodDelay = getmethoddelay(mode) or 0.05
    local weaponList = GetWeaponList()
    if not weaponList or #weaponList == 0 then return end
    local leadFactor = (mode == "SpamAll") and 0.06 or 0.12
    local predictPos = PredictTargetPosition(Bounty.Targ, leadFactor)
    if predictPos then Bounty.Digit = CFrame.new(predictPos) end

    for i = 1, #weaponList do
        if not Bounty.CanUseSkill then break end
        local weaponType = weaponList[i]
        local toolName = equip(weaponType)
        if toolName then

            NotifyForceWeapon(weaponType)
            NotifyEquipped(toolName)
            NotifyStartSkill()

            local readySkills = GetReadySkillsForTool(toolName, weaponType)
            if #readySkills > 0 then
                for _, sk in ipairs(readySkills) do
                    if not Bounty.CanUseSkill then break end
                    Bounty.UsingSkill = true
                    Bounty.ToolTipUsing = weaponType
                    Bounty.WeaponUsing = toolName
                    local pf = (mode == "SpamAll") and 0.06 or 0.12
                    local ppos = PredictTargetPosition(Bounty.Targ, pf)
                    if ppos then Bounty.Digit = CFrame.new(ppos) end

                    NotifyCastSkill(sk.Key)
                    down(sk.Key, sk.Hold)
                    recordCast(toolName, sk.Key)
                    Bounty.UsingSkill = false
                    if mode == "Normal" then
                        wt(sk.TimeToNext > 0 and sk.TimeToNext or methodDelay)
                    elseif mode == "Fast" then
                        wt(math.max(0.02, methodDelay))
                    elseif mode == "Spam" then
                        wt(math.max(0.01, methodDelay))
                    elseif mode == "SpamAll" then
                        wt(0) 
                    else
                        wt(methodDelay)
                    end
                end
            else
                local cfg = WS[weaponType]
                if cfg and cfg.SwitchNextWeaponIfCooldown then
                    SwitchNextWeaponIfCooldown(weaponType)
                end
            end
        end
        wt(0) 
    end
end
local GunDebounce = 0
function GetGunTargetPart(target)
    if not target.Character then return nil end
    local limbs = {
        "Head","UpperTorso","LowerTorso",
        "LeftUpperArm","RightUpperArm",
        "LeftLowerArm","RightLowerArm"
    }
    local best, dist = nil, 9999
    local myPos = lp.Character.HumanoidRootPart.Position

    for _, limb in ipairs(limbs) do
        local part = target.Character:FindFirstChild(limb)
        if part then
            local d = (part.Position - myPos).Magnitude
            if d < dist then
                dist = d
                best = part
            end
        end
    end
    return best
end
function PredictGunPosition(limb)
    if not limb then return end
    local vel = limb.Velocity or Vector3.new()
    return limb.Position + vel * 0.08
end
-- function GunShootM1(pos)
--     local tool = lp.Character:FindFirstChildOfClass("Tool")
--     if not tool or tool.ToolTip ~= "Gun" then return end

--     if tool:FindFirstChild("RemoteFunction") then
--         tool.RemoteFunction:InvokeServer(pos)
--     elseif tool:FindFirstChild("RemoteEvent") then
--         tool.RemoteEvent:FireServer("TAP", pos)
--     end
-- end
function targetfly(targ)
    if not targ.Character then return false end

    local hum = targ.Character:FindFirstChild("Humanoid")
    local root = targ.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return false end

    local speed = hum.MoveDirection.Magnitude
    local isRunning = speed > 18

    local isFlying = (root.Position.Y - workspace.FallenPartsDestroyHeight) > 6

    return isRunning or isFlying
end
function skillgun(tool, key)
    local ui = lp.PlayerGui.Main.Skills:FindFirstChild(tool.Name)
    if not ui then return false end

    local frame = ui:FindFirstChild(key)
    if not frame then return false end

    return frame.Cooldown.Size.X.Scale <= 0
end
bantinh = function(aimPos)
    local char = lp.Character
    local tool = char and char:FindFirstChildOfClass("Tool")
    if not tool or tool.ToolTip ~= "Gun" then return end

    if tool:FindFirstChild("RemoteEvent") then
        tool.RemoteEvent:FireServer("TAP", aimPos)

    elseif ShootGunEvent then
        ShootGunEvent:FireServer(aimPos)

    else
        vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait()
        vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
end
GunMethod = function()
    if not getgenv().PlayerSetting.GunMethod then return end
    if not Bounty.Targ or not Bounty.CanUseSkill then return end
    if not targetfly(Bounty.Targ) then return end 
    local char = lp.Character
    if not char then return end
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool or tool.ToolTip ~= "Gun" then return end
    if char:FindFirstChild("Stun") and char.Stun.Value > 0 then return end
    if char:FindFirstChild("Busy") and char.Busy.Value then return end
    local cooldown = tool:FindFirstChild("Cooldown") and tool.Cooldown.Value or 0.4
    if tick() - GunDebounce < cooldown then return end

    local limb = GetGunTargetPart(Bounty.Targ)
    if not limb then return end

    local aimPos = PredictGunPosition(limb)
    if not aimPos then return end

    local dist = (wfhrp(lp).Position - limb.Position).Magnitude
    if skillgun(tool, "Z") then
        GunDebounce = tick()
        Bounty.UsingSkill = true
        down("Z", 0.08)
        Bounty.UsingSkill = false
        return
    end
    if skillgun(tool, "X") and dist <= 35 then
        GunDebounce = tick()
        Bounty.UsingSkill = true
        down("X", 0.08)
        Bounty.UsingSkill = false
        if equip("Melee") then return end
        equip("Sword")
        return
    end
    GunDebounce = tick()
    bantinh(aimPos)
end
_G.circleTarget = true
local vu195 = 20
function circletween(p196)
    vu195 = vu195 + 20
    return p196 + Vector3.new(math.cos(math.rad(vu195)) * 30, 0, math.sin(math.rad(vu195)) * 30)
end
function RandomCFrame(cf)
    if _G.circleTarget then
        return circletween(cf)
    end
    return cf
end
local oldtw = tick()
spawn(function()
    while wt() do
        if checktarg() then
            if (not (game.Players.LocalPlayer.Character:FindFirstChild("HasBuso"))) then
                local rel = game.ReplicatedStorage
                rel.Remotes.CommF_:InvokeServer("Buso")
            end
            if ffc(lp, "PlayerGui") and ffc(lp.PlayerGui, "ScreenGui") and ffc(lp.PlayerGui.ScreenGui, "ImageLabel") then
            else
                game:service("VirtualUser"):CaptureController()
                game:service("VirtualUser"):SetKeyDown("0x65")
                game:service("VirtualUser"):SetKeyUp("0x65")
            end
            if ffc(workspace._WorldOrigin.Locations, "Dimensional Rift") and (workspace._WorldOrigin.Locations["Dimensional Rift"].Position - wfhrp(lp).Position).Magnitude <= 1000 and (wfhrp(Bounty.Targ).Position - workspace._WorldOrigin.Locations["Dimensional Rift"].Position).Magnitude <= 1000 then
                Bounty.CanUseWeapon = false
                Bounty.CanUseSkill = false
                to(CFrame.new(workspace._WorldOrigin.Locations["Dimensional Rift"].Position + Vector3.new(0, 190, 0)))
            else
                local hum = lp.Character.Humanoid
                local hp = hum.Health
                local maxhp = hum.MaxHealth
                local percent = (hp / maxhp) * 100
                if hp > 0 and (percent < getgenv().PlayerSetting.SafeHealth[1] or (hide and percent < getgenv().PlayerSetting.SafeHealth[2])) then
                    Bounty.CanUseWeapon = false
                    Bounty.CanUseSkill = false
                    hide = true
                    randomy = math.random(30000, 70000)
                    to(CFrame.new(wfhrp(Bounty.Targ).Position + Vector3.new(0, randomy, 0)))
                else 
                    hide = false
                    Bounty.CFrameTarget = wfhrp(Bounty.Targ).CFrame 
                    if tick() - oldtw >= 0.05 then
                        Bounty.Digit = Bounty.CFrameTarget + wfhrp(Bounty.Targ).Velocity / 2
                    end
                    if Bounty.Digit.Y < 3 then 
                        Bounty.Digit = CFrame.new(Bounty.Digit.X, 3, Bounty.Digit.Z) 
                    end 
                    if (wfhrp(lp).Position - Bounty.CFrameTarget.Position).Magnitude <= 80 then
                        if not ffc(Bounty.Targ.Character, "Busy") or not Bounty.Targ.Character.Busy.Value then
                            Bounty.CanUseWeapon = true
                            Bounty.CanUseSkill = true
                        else
                            Bounty.CanUseWeapon = true
                            Bounty.CanUseSkill = false
                        end
                        if getgenv().PlayerSetting.UseMovePredict then
                            if getgenv().PlayerSetting.HitAndRun then
                                if Bounty.UsingSkill then
                                    to(RandomCFrame(Bounty.Digit + Vector3.new(0, 15, 3)))
                                else
                                    to(RandomCFrame(Bounty.Digit + Vector3.new(0, 10, 0)))
                                end
                            else
                                to(RandomCFrame(Bounty.Digit + Vector3.new(0, 0, 3)))
                            end
                            else 
                            if getgenv().PlayerSetting.HitAndRun then
                                if Bounty.UsingSkill then
                                    to(RandomCFrame(Bounty.Digit + Vector3.new(0, 15, 3)))
                                else
                                    to(RandomCFrame(Bounty.Digit + Vector3.new(0, 30, 0)))
                                end
                            else
                                to(RandomCFrame(Bounty.Digit + Vector3.new(0, 0, 3)))
                            end
                        end
                       else
                        to(RandomCFrame(Bounty.Digit + Vector3.new(0, 0, 3)))
                           Bounty.CanUseSkill = false
                    end
                end
            end
        end
    end
end)
local races = { 
    ["Human"] = "Last Resort", 
    ["Mink"] = "Agility", 
    ["Fishman"] = "Water Body", 
    ["Skypea"] = "Heavenly Blood", 
    ["Ghoul"] = "Heightened Senses",
    ["Cyborg"] = "Energy Core",
    ["Draco"] = "Primordial Reign"
} 
local killcount = 0
local attackbool = false
spawn(function()
    while wt() do
        local char = lp.Character
        local race = lp.Data.Race.Value
        local weaponList = GetWeaponList()
        if ffc(char, "RaceTransformed") and ffc(char, "RaceEnergy") and char.RaceEnergy.Value >= 1 and not char.RaceTransformed.Value then
            down("Y", 0)
        end
        if lp.PlayerGui.Main.PvpDisabled.Visible == true then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
        end
        if ffc(char, "RaceTransformed") and char.RaceTransformed.Value then
            if race == "Mink" or race == "Ghoul" then
                down("Q", 0)
                wt()
            end
        end
        if Bounty.CanUseWeapon then
            local dist = math.huge
            if Bounty.Targ and Bounty.Targ.Character and Bounty.Targ.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChild("HumanoidRootPart") then
                dist = (lp.Character.HumanoidRootPart.Position - Bounty.Targ.Character.HumanoidRootPart.Position).Magnitude
            end
            if dist <= 30 and not ffc(char, races[race]) and inv(game.ReplicatedStorage.Remotes.CommF_, {"Wenlocktoad", "1"}) == -2 then
                down("T", 0)
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end
            for _, v in ipairs(weaponList) do
                local cfg = WS[v]
                if Bounty.CanUseSkill and cfg and cfg.Enable then
                    EqWeapon = equip(v)
                    Bounty.WeaponUsing = EqWeapon
                    Bounty.ToolTipUsing = v

                    Bounty.UsingSkill = true
                    if EqWeapon then
                        wt((WS[v] and WS[v].Delay) or 0)
                        local skillUI = lp.PlayerGui.Main.Skills[EqWeapon]
                        for k, data in pairs(WS[v].Skills) do
                            if k ~= "Enabled" and data[1] then
                                if Bounty.CanUseSkill and ffc(skillUI, k) then
                                    local cd = skillUI[k].Cooldown.Size.X.Scale
                                    if ((race == "Ghoul" and ffc(char, "Heightened Senses") and cd <= 0.4) or cd <= 0) then
                                        down(k, data[2])
                                        repeat wt() until ffc(char, "Busy") and not char.Busy.Value
                                        killcount = killcount + 1
                                    end
                                end
                            end
                        end
                    end
                    if Bounty.Targ and Bounty.Targ:FindFirstChild("Humanoid") then
                        local hum = Bounty.Targ.Humanoid
                        local hpPercent = (hum.Health / hum.MaxHealth) * 100
                        if hpPercent <= (getgenv().Attack.StopAttackAtHealth or 0) then
                            attackbool = false
                            Bounty.CanUseSkill = true 
                        else
                            attackbool = true
                        end
                    else
                        attackbool = true
                    end
                    wt(0.25)
                    Bounty.UsingSkill = false
                    attackbool = false
                end
            end
        end
    end
end)
spawn(function()
    while wt() do
        if Bounty.CanUseWeapon and Bounty.CanUseSkill then
            local lpPos = wfhrp(lp).Position
            local tarPos = Bounty.CFrameTarget.Position
            local dist = (lpPos - tarPos).Magnitude
            local canCast = true
            if dist > 65 then
                canCast = false
            end
            if canCast then
                spamskill()
            end

        end
    end
end)
spawn(function()
    while wt() do
        pcall(function()
            GunMethod()
        end)
    end
end)
spawn(function()
    while wt(0.08) do
        if Bounty.CanUseWeapon and Bounty.CanUseSkill and Bounty.Targ then
            local mode = getskillmethod(Bounty.Targ)
            local lpPos = wfhrp(lp).Position
            local tarPos = Bounty.CFrameTarget.Position
            local dist = (lpPos - tarPos).Magnitude
            local canCast = true
            if dist > 65 then
                canCast = false
            end
            if canCast and (mode == "Spam" or mode == "SpamAll") then
                pcall(castskillmethod)
            end
        end
    end
end)
function CheckStun()
    if game:GetService('Players').LocalPlayer.Character:FindFirstChild("Stun") then
        return game:GetService('Players').LocalPlayer.Character.Stun.Value ~= 0
    end
    return false
end
CheckStun()
spawn(function()
    while wt() do
        local char = lp.Character
        if CheckStun() then
            Bounty.CanUseSkill  = false
            Bounty.CanUseWeapon = false
            to(CFrame.new(wfhrp(lp).Position + Vector3.new(0, 2000, 0)))
        else
            Bounty.CanUseSkill  = true
            Bounty.CanUseWeapon = true
            if not ffc(char, "HasBuso") then
                inv(rs.Remotes.CommF_, {"Buso"})
            end
            if lp.PlayerGui.Main.PvpDisabled.Visible then
                inv(rs.Remotes.CommF_, {"EnablePvp"})
            end
            if ffc(char, "RaceTransformed")
            and ffc(char, "RaceEnergy")
            and char.RaceEnergy.Value >= 1
            and not char.RaceTransformed.Value
            then
                down("Y", 0)
            end
        end
    end
end)
        local u5 = require(rs:WaitForChild("Notification"))
        spawn(function()
            while wt() do
                u5.new("<Color=Yellow>Report Bugs Or Suggest Dms<Color=/>"):Display()
                u5.new("<Color=Yellow>Discord : mlamm_.<Color=/>"):Display() 
                u5.new("<Color=Yellow>ID Discord : 763681373898276874<Color=/>"):Display() 
                u5.new("<Color=Yellow>Server Discord : discord.gg/gknQKpKYrk<Color=/>"):Display() 
                u5.new("<Color=Yellow>Join Server Check Update<Color=/>"):Display() 
                wt(20)
            end
        end)

        do
            ply = game["Players"]
            plr = ply["LocalPlayer"]
            Root = plr["Character"]["HumanoidRootPart"]
            replicated = game:GetService("ReplicatedStorage")
            Lv = game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"]
            TeleportService = game:GetService("TeleportService")
            TW = game:GetService("TweenService")
            Lighting = game:GetService("Lighting")
            Enemies = workspace["Enemies"]
            vim1 = game:GetService("VirtualInputManager")
            vim2 = game:GetService("VirtualUser")
            TeamSelf = plr["Team"]
            RunSer = game:GetService("RunService")
            Stats = game:GetService("Stats")
            Energy = plr["Character"]["Energy"]["Value"]
            Boss = {}
            BringConnections = {}
            MaterialList = {}
            NPCList = {}
            shouldTween = false
            SoulGuitar = false
            KenTest = true
            debug = false
            Brazier1 = false
            Brazier2 = false
            Brazier3 = false
            Sec = .1
            ClickState = 0
            Num_self = 25
        end
        walkwater = true
        spawn(function()
            while task["wait"]() do
                if walkwater then
                    pcall(function()
                        if plr["Character"] and plr["Character"]:FindFirstChild("LeftFoot") then
                            local x = replicated["Assets"]["Models"]["IceSpikes4"]:Clone()
                            x["Parent"] = workspace
                            x["Size"] = Vector3["new"](3 + math["random"](10, 12), 1.7, 3 + math["random"](10, 12))
                            x["Color"] = Color3["fromRGB"](128, 187, 219)
                            x["CFrame"] = CFrame["new"](plr["Character"]["Head"]["Position"]["X"], -3.8, plr["Character"]["Head"]["Position"]["Z"]) * CFrame["Angles"]((math["random"]() - .5) * .06, math["random"]() * 7, (math["random"]() - .5) * .07)
                            local L = {}
                            L["Size"] = Vector3["new"](0, .3, 0)
                            local a = TW:Create(x, TweenInfo["new"](2, Enum["EasingStyle"]["Quad"], Enum["EasingDirection"]["In"]), L)
                            a["Completed"]:Connect(function()
                                x:Destroy()
                            end)
                            a:Play()
                        end
                    end)
                end
            end
        end)
        local H = game:GetService("ReplicatedStorage")
	local r = H:FindFirstChild("Modules")
	if not r then
		return
	end
	workspace["Camera"]["CameraSubject"] = plr["Character"]["Humanoid"]
	local R = ((H:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RE/RegisterAttack")
	local y = ((H:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RE/RegisterHit")
    Enemies = workspace["Enemies"]
    local ShootGunEvent = replicated:WaitForChild("Modules"):WaitForChild("Net"):FindFirstChild("RE/ShootGunEvent")
    local Validator2 = replicated:WaitForChild("Remotes"):WaitForChild("Validator2")

    local Config = {
        AttackDistance = 250,
        AttackMobs = false,
        AttackPlayers = true,
        AttackCooldown = 0.2,
        ComboResetTime = 0.3,
        MaxCombo = 4,
        HitboxLimbs = {
            "RightLowerArm",
            "RightUpperArm",
            "LeftLowerArm",
            "LeftUpperArm",
            "RightHand",
            "LeftHand"
        },
        AutoClickEnabled = true
    }
    
    local FastAttack = {}
    FastAttack.__index = FastAttack
    
    function FastAttack.new()
        local self = setmetatable({
            Debounce = 0,
            ComboDebounce = 0,
            ShootDebounce = 0,
            M1Combo = 0,
            EnemyRootPart = nil,
            Connections = {},
            Overheat = {
                Dragonstorm = {
                    MaxOverheat = 3,
                    Cooldown = 0,
                    TotalOverheat = 0,
                    Distance = 350,
                    Shooting = false
                }
            },
            ShootsPerTarget = {
                ["Dual Flintlock"] = 2
            },
            SpecialShoots = {
                ["Skull Guitar"] = "TAP",
                ["Bazooka"] = "Position",
                ["Cannon"] = "Position",
                ["Dragonstorm"] = "Overheat"
            }
        }, FastAttack)
        pcall(function()
            self.CombatFlags = require(r.Flags).COMBAT_REMOTE_THREAD
            self.ShootFunction = getupvalue(require(replicated.Controllers.CombatController).Attack, 9)
            local LocalScript = plr:WaitForChild("PlayerScripts"):FindFirstChildOfClass("LocalScript")
            if LocalScript and getsenv then
                self.HitFunction = getsenv(LocalScript)._G.SendHitsToServer
            end
        end)
        return self
    end
    
    function FastAttack:IsEntityAlive(entity)
        local humanoid = entity and entity:FindFirstChild("Humanoid")
        return humanoid and humanoid.Health > 0
    end
    
    function FastAttack:CheckStun(Character, Humanoid, ToolTip)
        local Stun = Character:FindFirstChild("Stun")
        local Busy = Character:FindFirstChild("Busy")
        if Humanoid.Sit and (ToolTip == "Sword" or ToolTip == "Melee" or ToolTip == "Blox Fruit") then
            return false
        elseif Stun and Stun.Value > 0 or Busy and Busy.Value then
            return false
        end
        return true
    end
    
    function FastAttack:GetBladeHits(Character, Distance)
        local Position = Character:GetPivot().Position
        local BladeHits = {}
        Distance = Distance or Config.AttackDistance
        local function ProcessTargets(Folder, CanAttack)
            for _, Enemy in ipairs(Folder:GetChildren()) do
                if Enemy ~= Character and self:IsEntityAlive(Enemy) then
                    local BasePart = Enemy:FindFirstChild(Config.HitboxLimbs[math.random(#Config.HitboxLimbs)]) or Enemy:FindFirstChild("HumanoidRootPart")
                    if BasePart and (Position - BasePart.Position).Magnitude <= Distance then
                        if not self.EnemyRootPart then
                            self.EnemyRootPart = BasePart
                        else
                            table.insert(BladeHits, {
                                Enemy,
                                BasePart
                            })
                        end
                    end
                end
            end
        end
        if Config.AttackMobs then
            ProcessTargets(workspace["Enemies"])
        end
        if Config.AttackPlayers then
            ProcessTargets(workspace["Characters"], true)
        end
        return BladeHits
    end
    
    function FastAttack:GetClosestEnemy(Character, Distance)
        local BladeHits = self:GetBladeHits(Character, Distance)
        local Closest, MinDistance = nil, math.huge
        for _, Hit in ipairs(BladeHits) do
            local Magnitude = (Character:GetPivot().Position - Hit[2].Position).Magnitude
            if Magnitude < MinDistance then
                MinDistance = Magnitude
                Closest = Hit[2]
            end
        end
        return Closest
    end
    
    function FastAttack:GetCombo()
        local Combo = (tick() - self.ComboDebounce) <= Config.ComboResetTime and self.M1Combo or 0
        Combo = Combo >= Config.MaxCombo and 1 or Combo + 1
        self.ComboDebounce = tick()
        self.M1Combo = Combo
        return Combo
    end
    
    function FastAttack:ShootInTarget(TargetPosition)
        local Character = plr.Character
        if not self:IsEntityAlive(Character) then
            return
        end
        local Equipped = Character:FindFirstChildOfClass("Tool")
        if not Equipped or Equipped.ToolTip ~= "Gun" then
            return
        end
        local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or 0.3
        if (tick() - self.ShootDebounce) < Cooldown then
            return
        end
        local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
        if ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
            Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
            Validator2:FireServer(self:GetValidator2())
            if ShootType == "TAP" then
                Equipped.RemoteEvent:FireServer("TAP", TargetPosition)
            else
                ShootGunEvent:FireServer(TargetPosition)
            end
            self.ShootDebounce = tick()
        else
            vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait(0.05)
            vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            self.ShootDebounce = tick()
        end
    end
    
    function FastAttack:GetValidator2()
        local v1 = getupvalue(self.ShootFunction, 15)
        local v2 = getupvalue(self.ShootFunction, 13)
        local v3 = getupvalue(self.ShootFunction, 16)
        local v4 = getupvalue(self.ShootFunction, 17)
        local v5 = getupvalue(self.ShootFunction, 14)
        local v6 = getupvalue(self.ShootFunction, 12)
        local v7 = getupvalue(self.ShootFunction, 18)
        local v8 = v6 * v2
        local v9 = (v5 * v2 + v6 * v1) % v3
        v9 = (v9 * v3 + v8) % v4
        v5 = math.floor(v9 / v3)
        v6 = v9 - v5 * v3
        v7 = v7 + 1
        setupvalue(self.ShootFunction, 15, v1)
        setupvalue(self.ShootFunction, 13, v2)
        setupvalue(self.ShootFunction, 16, v3)
        setupvalue(self.ShootFunction, 17, v4)
        setupvalue(self.ShootFunction, 14, v5)
        setupvalue(self.ShootFunction, 12, v6)
        setupvalue(self.ShootFunction, 18, v7)
        return math.floor(v9 / v4 * 16777215), v7
    end
    
    function FastAttack:UseNormalClick(Character, Humanoid, Cooldown)
        self.EnemyRootPart = nil
        local BladeHits = self:GetBladeHits(Character)
        if self.EnemyRootPart then
            R:FireServer(Cooldown)
            if self.CombatFlags and self.HitFunction then
                self.HitFunction(self.EnemyRootPart, BladeHits)
            else
                y:FireServer(self.EnemyRootPart, BladeHits)
            end
        end
    end
    
    function FastAttack:UseFruitM1(Character, Equipped, Combo)
        local Targets = self:GetBladeHits(Character)
        if not Targets[1] then
            return
        end
        local Direction = (Targets[1][2].Position - Character:GetPivot().Position).Unit
        Equipped.LeftClickRemote:FireServer(Direction, Combo)
    end

    local ClickDelay = 1

    function UseSkillOnce()
        local Char = plr.Character
        if not Char then return end
        local Tool = Char:FindFirstChildOfClass("Tool")
        if not Tool then return end
    
        if Tool.ToolTip == "Melee" or Tool.ToolTip == "Sword" then
            local skill = Tool:FindFirstChild("RemoteEvent") or Tool:FindFirstChild("RemoteFunction")
            if skill then
                pcall(function()
                    skill:FireServer("Z")
                end)
            end
        end
    end
    
    function FastAttack:Attack()
        if not Config.AutoClickEnabled or (tick() - self.Debounce) < ClickDelay then
            return
        end
        local Character = plr.Character
        if not Character or not self:IsEntityAlive(Character) then
            return
        end
        local Humanoid = Character.Humanoid
        local Equipped = Character:FindFirstChildOfClass("Tool")
        if not Equipped then
            return
        end
        local ToolTip = Equipped.ToolTip
        if not table.find({
            "Melee",
            "Blox Fruit",
            "Sword",
            "Gun"
        }, ToolTip) then
            return
        end
        local Target = self:GetClosestEnemy(Character, 120)
        if Target and Target.Parent:FindFirstChild("Humanoid") then
        local TargetHum = Target.Parent.Humanoid
            if TargetHum.Health / TargetHum.MaxHealth > 0.85 then
                UseSkillOnce()
            end
        end
        local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or ClickDelay
        if not self:CheckStun(Character, Humanoid, ToolTip) then
            return
        end
        local Combo = self:GetCombo()
        Cooldown = Cooldown + (Combo >= Config.MaxCombo and 0.05 or 0)
        self.Debounce = Combo >= Config.MaxCombo and ToolTip ~= "Gun" and (tick() + 0.05) or tick()
        if ToolTip == "Blox Fruit" and Equipped:FindFirstChild("LeftClickRemote") then
            self:UseFruitM1(Character, Equipped, Combo)
        elseif ToolTip == "Gun" then
            local Target = self:GetClosestEnemy(Character, 120)
            if Target then
                self:ShootInTarget(Target.Position)
            end
        else
            self:UseNormalClick(Character, Humanoid, Cooldown)
        end
    end
    
    local AttackInstance = FastAttack.new()
    -- table.insert(AttackInstance.Connections, RunSer.Stepped:Connect(function()
    --     AttackInstance:Attack()
    -- end))
    --[[
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and iscclosure(v) then
            local name = debug.getinfo(v).name
            if name == "Attack" or name == "attack" or name == "RegisterHit" then
                hookfunction(v, function(...)
                    AttackInstance:Attack()
                    return v(...)
                end)
            end
        end
    end
]]
    function Attack()
        AttackInstance:Attack()
    end

    local lastAttackState = false
    local lastHealthShown = 0
    
    spawn(function()
        while wt() do
            
            local hum = nil
            if Bounty.Targ 
            and Bounty.Targ.Character
            and Bounty.Targ.Character:FindFirstChild("Humanoid") then
                hum = Bounty.Targ.Character.Humanoid
            end
    
            if hum and hum.Health > 0 then
    
                local hpPercent = (hum.Health / hum.MaxHealth) * 100
                local stopAt = getgenv().Attack.StopAttackAtHealth or 0
    
                local shouldAttack = hpPercent > stopAt
                if shouldAttack == false and lastAttackState == true then
                    if math.floor(hum.Health) ~= lastHealthShown then
                        lastHealthShown = math.floor(hum.Health)
                        ThongBaoNek("Disabled Fast Attack | Health: " .. lastHealthShown, 2)
                    end
                end
    
                attackbool = shouldAttack
                lastAttackState = shouldAttack
    
            else
                if lastAttackState == true then
                    ThongBaoNek("Disabled Fast Attack | Target Lost", 2)
                end
                
                lastAttackState = false
                attackbool = false
            end
    
            if attackbool then
                Attack()
            end
    
        end
    end)
    -- spawn(function()
    --     while wt() do
    --         if Bounty.Targ and Bounty.Targ:FindFirstChild("Humanoid") then
    --             local hum = Bounty.Targ.Humanoid
    --             local hpPercent = (hum.Health / hum.MaxHealth) * 100
    --             if hpPercent <= (getgenv().Attack.StopAttackAtHealth or 0) then
    --                 attackbool = false
    --             else
    --                 attackbool = true
    --             end
    --         else
    --             attackbool = false
    --         end
    --         if attackbool then
    --             Attack()
    --         end
    --     end
    -- end)
    --[[
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and iscclosure(v) then
            local name = debug.getinfo(v).name
            if name == "Attack" or name == "attack" or name == "RegisterHit" then
                hookfunction(v, function(...)
                    AttackInstance:Attack()
                    return v(...)
                end)
            end
        end
    end
]]
    lp.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wt(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
if Counter.Enabled then
    function embed(p270)
        return "```" .. tostring(p270) .. "```"
    end
    function sendwebhook(p271, p272, p273, p274)
        local v275 = http_request or request or (HttpPost or syn.request)
        local v276 = {
            Url = Counter.Webhook.Url,
            Body = game:GetService("HttpService"):JSONEncode({
                content = "",
                embeds = {
                    {
                        title = "**Rua Hup**",
                        color = 8631807,
                        fields = {
                            {
                                name = "Username",
                                value = embed(lp.Name),
                                inline = true
                            },
                            {
                                name = "Killed",
                                value = embed(p271),
                                inline = true
                            },
                            {
                                name = "Earned",
                                value = embed(tostring(p272):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")),
                                inline = false
                            },
                            {
                                name = "Total Earned",
                                value = embed(tostring(p273):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")),
                                inline = false
                            },
                            {
                                name = "Time Elapsed",
                                value = embed(tostring(p274)),
                                inline = false
                            }
                        },
                        thumbnail = {
                            url = "https://cdn.discordapp.com/attachments/1328714576673374271/1447140953772003368/IMG_0021.png?ex=69368a89&is=69353909&hm=d73118a03cd5b46e748788bb505fcfdf566b3533548418cfda63800d3c578b96&"
                        },
                        footer = {
                            text = "Rua Hup - discord.gg/gknQKpKYrk"
                        },
                        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
                    }
                }
            }),
            Method = "POST",
            Headers = {
                ["content-type"] = "application/json"
            }
        }
        v275(v276)
    end
end

local oldcolor = {
    ["Border Color"] = Color3.fromRGB(131, 181, 255),
    ["Click Effect Color"] = Color3.fromRGB(230, 230, 230),
    ["Setting Icon Color"] = Color3.fromRGB(230, 230, 230),
    ["Logo Image"] = "rbxassetid://6248942117",
    ["Search Icon Color"] = Color3.fromRGB(255, 255, 255),
    ["Search Icon Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["GUI Text Color"] = Color3.fromRGB(255, 255, 255),
    ["Text Color"] = Color3.fromRGB(255, 255, 255),
    ["Placeholder Text Color"] = Color3.fromRGB(178, 178, 178),
    ["Title Text Color"] = Color3.fromRGB(131, 181, 255),
    ["Background 1 Color"] = Color3.fromRGB(43, 43, 43),
    ["Background 1 Transparency"] = 0,
    ["Background 2 Color"] = Color3.fromRGB(90, 90, 90),
    ["Background 3 Color"] = Color3.fromRGB(53, 53, 53),
    ["Background Image"] = "",
    ["Page Selected Color"] = Color3.fromRGB(131, 181, 255),
    ["Section Text Color"] = Color3.fromRGB(131, 181, 255),
    ["Section Underline Color"] = Color3.fromRGB(131, 181, 255),
    ["Toggle Border Color"] = Color3.fromRGB(131, 181, 255),
    ["Toggle Checked Color"] = Color3.fromRGB(230, 230, 230),
    ["Toggle Desc Color"] = Color3.fromRGB(185, 185, 185),
    ["Button Color"] = Color3.fromRGB(131, 181, 255),
    ["Label Color"] = Color3.fromRGB(101, 152, 220),
    ["Dropdown Icon Color"] = Color3.fromRGB(230, 230, 230),
    ["Dropdown Selected Color"] = Color3.fromRGB(131, 181, 255),
    ["Textbox Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["Box Highlight Color"] = Color3.fromRGB(131, 181, 255),
    ["Slider Line Color"] = Color3.fromRGB(75, 75, 75),
    ["Slider Highlight Color"] = Color3.fromRGB(59, 82, 115),
    ["Tween Animation 1 Speed"] = 0.25,
    ["Tween Animation 2 Speed"] = 0.5,
    ["Tween Animation 3 Speed"] = 0.1
}

getgenv().UIColor = oldcolor   
local handler = {}
local callbacks = {}
local notify = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
function handler.ButtonEffect()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local circle = Drawing.new("Circle")

    circle.Visible = true
    circle.Radius = 10
    circle.Filled = true
    circle.Color = getgenv().UIColor["Click Effect Color"]
    circle.Position = Vector2.new(mouse.X, mouse.Y + 35)

    local f = Instance.new("Folder", handler.Gui)
    f.Name = "ClickFX"

    local size = Instance.new("NumberValue", f)
    size.Value = 10

    local trans = Instance.new("NumberValue", f)
    trans.Value = 1

    TweenService:Create(size, TweenInfo.new(.25), {Value = 25}):Play()
    TweenService:Create(trans, TweenInfo.new(.25), {Value = 0}):Play()

    size:GetPropertyChangedSignal("Value"):Connect(function()
        circle.Radius = size.Value
    end)

    trans:GetPropertyChangedSignal("Value"):Connect(function()
        circle.Transparency = trans.Value
    end)

    task.wait(.5)
    f:Destroy()
end
function handler.GetIMG(url)
    local synName = "SynAsset ["
    local result = ""

    if string.find(url, "rbxassetid://") then
        return url
    end

    pcall(function()
        if url and type(url) == "string" and tostring(game:HttpGet(url)):find("PNG") then
            for i = 1, 5 do
                synName = synName .. string.char(math.random(65, 122))
            end
            synName = synName .. "].png"

            writefile(synName, game:HttpGet(url))
            task.delay(5, function()
                delfile(synName)
            end)

            result = getsynasset(synName)
        end
    end)

    return result
end
handler.Gui = Instance.new("ScreenGui")
handler.Gui.Name = "Rua Hub GUI"
handler.Gui.Parent = game.CoreGui
handler.Gui.Enabled = true

handler.NotiGui = Instance.new("ScreenGui")
handler.NotiGui.Name = "Rua Hub Notification"
handler.NotiGui.Parent = game.CoreGui

local Container = Instance.new("Frame", handler.NotiGui)
Container.Name = "NotiContainer"
Container.BackgroundTransparency = 1
Container.AnchorPoint = Vector2.new(1, 1)
Container.Position = UDim2.new(1, -5, 1, -5)
Container.Size = UDim2.new(0, 350, 1, -10)

local List = Instance.new("UIListLayout", Container)
List.SortOrder = Enum.SortOrder.LayoutOrder
List.Padding = UDim.new(0, 5)
List.VerticalAlignment = Enum.VerticalAlignment.Bottom
function handler.GetColorRGB(c3)
    return {
        math.floor(c3.r * 255),
        math.floor(c3.g * 255),
        math.floor(c3.b * 255)
    }
end

function notify.CreateNoti(info)
    local title = info.Title or ""
    local desc = info.Desc
    local duration = info.ShowTime or 5
    getgenv().TitleNameNoti = title
    local Frame = Instance.new("Frame", Container)
    Frame.BackgroundTransparency = 1
    Frame.AutomaticSize = Enum.AutomaticSize.Y
    Frame.Size = UDim2.new(1, 0, 0, 0)
    local Back = Instance.new("Frame", Frame)
    Back.Size = UDim2.new(1, 0, 1, 6)
    Back.AutomaticSize = Enum.AutomaticSize.Y
    Back.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
    Instance.new("UICorner", Back).CornerRadius = UDim.new(0, 4)
    local Top = Instance.new("Frame", Back)
    Top.BackgroundTransparency = 1
    Top.Size = UDim2.new(1, 0, 0, 25)
    Top.Position = UDim2.new(0, 0, 0, 5)
    local Img = Instance.new("ImageLabel", Top)
    Img.BackgroundTransparency = 1
    Img.Size = UDim2.new(0, 25, 0, 25)
    Img.Position = UDim2.new(0, 10, 0, 0)
    Img.Image = handler.GetIMG(getgenv().UIColor["Logo Image"])
    Instance.new("UICorner", Img).CornerRadius = UDim.new(1, 0)
    local rgb = handler.GetColorRGB(getgenv().UIColor["Title Text Color"])
    local colorStr = table.concat(rgb, ",")
    local TitleText = Instance.new("TextLabel", Top)
    TitleText.BackgroundTransparency = 1
    TitleText.Position = UDim2.new(0, 40, 0, 0)
    TitleText.Size = UDim2.new(1, -40, 1, 0)
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextSize = 14
    TitleText.RichText = true
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Text = '<font color="rgb(' .. colorStr .. ')">Rua Hub</font> ' .. title
    local CloseFrame = Instance.new("Frame", Top)
    CloseFrame.AnchorPoint = Vector2.new(1, 0.5)
    CloseFrame.Position = UDim2.new(1, -4, 0.5, 0)
    CloseFrame.BackgroundTransparency = 1
    CloseFrame.Size = UDim2.new(0, 22, 0, 22)
    local CloseImg = Instance.new("ImageLabel", CloseFrame)
    CloseImg.Size = UDim2.new(1, 0, 1, 0)
    CloseImg.BackgroundTransparency = 1
    CloseImg.Image = "rbxassetid://17596666700"
    CloseImg.ImageRectOffset = Vector2.new(284, 4)
    CloseImg.ImageRectSize = Vector2.new(24, 24)
    CloseImg.ImageColor3 = getgenv().UIColor["Search Icon Color"]
    local CloseBtn = Instance.new("TextButton", CloseFrame)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Size = UDim2.new(1, 0, 1, 0)
    CloseBtn.Text = ""
    local DescLabel = nil
    if desc then
        DescLabel = Instance.new("TextLabel", Back)
        DescLabel.BackgroundTransparency = 1
        DescLabel.Position = UDim2.new(0, 10, 0, 35)
        DescLabel.Size = UDim2.new(1, -15, 0, 0)
        DescLabel.Font = Enum.Font.GothamBold
        DescLabel.TextWrapped = true
        DescLabel.AutomaticSize = Enum.AutomaticSize.Y
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.TextSize = 14
        DescLabel.TextColor3 = getgenv().UIColor["Text Color"]
        DescLabel.Text = desc
    end
    Back.Position = UDim2.new(1, 0, 0, 0)
    TweenService:Create(
        Back,
        TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
        {Position = UDim2.new(0, 0, 0, 0)}
    ):Play()
    local function CloseNoti()
        TweenService:Create(
            Back,
            TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
            {Position = UDim2.new(1, 0, 0, 0)}
        ):Play()

        task.wait(.25)
        Frame:Destroy()
    end
    CloseBtn.MouseEnter:Connect(function()
        TweenService:Create(
            CloseImg,
            TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
            {ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"]}
        ):Play()
    end)
    CloseBtn.MouseLeave:Connect(function()
        TweenService:Create(
            CloseImg,
            TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),
            {ImageColor3 = getgenv().UIColor["Search Icon Color"]}
        ):Play()
    end)
    CloseBtn.MouseButton1Click:Connect(function()
        task.spawn(function()
            handler.ButtonEffect()
        end)
        task.wait(.25)
        CloseNoti()
    end)
    task.spawn(function()
        task.wait(duration)
        CloseNoti()
    end)
end

getgenv().CreateNoti = notify.CreateNoti

ThongBaoNek = function(content, duration)
    CreateNoti({
        Title = "Rua Hub Auto Bounty",
        Desc = content or "",
        ShowTime = duration or 5
    })
end

--[[
    upgrade [
        [+] new gui auto size
        [+] rewrite function 
            getgenv.Attack [
                ForceMelee = true,
               ForceMeleeTime = 3.5,
        StopAttack = true,
                StopAttackAtHealth = 35,--%
            ]
        improve aimbot, gun method
        [+] update bypass
    ]
    fix [
        find target
    ]
]]
