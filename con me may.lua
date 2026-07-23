if getgenv().Loaded then 
   return
end

if getgenv().Debugging then 
    print("Debug Is On")
end
if not LPH_OBFUSCATED then
    LPH_NO_VIRTUALIZE = function(...) return (...) end;
    LPH_JIT_MAX = function(...) return (...) end;
end
--[[
    Protect Ui is Stupid
    Delta: Request Is Retarded LOL, Delta Hook Request 
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId, game.Players.LocalPlayer)
workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt

workspace.Map.PrehistoricIsland.Core.InteriorLava:Destroy()
]]

--[[
    pcall(game.HttpGet, game, setmetatable({}, {
    __tostring = function()
        print("Kick Player")
        return "
    end,
}))

]]
settings().Physics.AreOwnersShown = false

getgenv().IgnoreUi =getgenv().IgnoreUi or  false

ListSettingableOneClick = {"Shark Anchor"}
LockedFruits = {"Kitsune-Kitsune","Dough-Dough","Dragon-Dragon","Leopard-Leopard"}
if not LPH_OBFUSCATED and false then
    getgenv().FpsBoost1 = false
    getgenv().WhiteScreen = false
    getgenv().OneClickUi = true -- Only Open Necessacry Ui For One Click
    getgenv().UiCheckItems = false
    getgenv().OneClickSetting = {
        Enable=true,
        UnlimitGetQuest=true,
        TripleQuest=true,
        AutoAddStats=true,
        RedeemCode=true,
        Sea2KeyHop=true,
        FruitEat = { --Priority, Name, 
            [1] = {"Ice-Ice","Magma-Magma","Flame-Flame",},
            [2] = {}
        },
        EatFruitFromStorage = false,
        SnipeFruit = true,
        SnipeFruitMirage = true,
        HopIfFoundNearExploiter = true,
        HopHakiColor =false,
        HopTushita = false,
        HopValkyriehelm = false,
        HopMirrorFractal=false,
        FarmPole = false, -- Turn off If Want Focus Level
        FarmItems = true, --Turn off If Want Focus Level And CDK, THis Only get After You Get God Human
        DisableSoulGuitar = true,
        DisableRaceEvolve = false,
        DisableCDK = false,
        Mastery = false,
        SwanFruitHop=false
    }
    getgenv().OneClickFarms = {
        ["Shark Anchor"] = false,
    }
end
--[[

getgenv().FpsBoost1 = true
    getgenv().WhiteScreen = false
    getgenv().UiCheckItems = false
    getgenv().OneClickSetting = {
        Enable=true,
        UnlimitGetQuest=true,
        TripleQuest=true,
        AutoAddStats=true,
        RedeemCode=true,
        Sea2KeyHop=true,
        FruitEat = { --Priority, Name, 
            [1] = {"Magma-Magma"},
            [2] = {"Magma-Magma"}
        },
        EatFruitFromStorage = false,
        SnipeFruit = false,
        SnipeFruitMirage = false,
        HopIfFoundNearExploiter = false,
        HopHakiColor =false,
        HopTushita = false,
        HopValkyriehelm = true,
        HopMirrorFractal=true,
        FarmPole = false, -- Turn off If Want Focus Level
        FarmItems = false, --Turn off If Want Focus Level And CDK, THis Only get After You Get God Human
        DisableSoulGuitar = false,
        DisableCDK = false,
        Mastery = true,

    }]]
--[[
local args = {
	"CraftItem",
	"Craft",
	"Volcanic Magnet"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
]]
--[[
local replacemetamethod = function(obj, method, func)
    local metatable = getrawmetatable(obj);
    metatable = table.clone(metatable);
    local old = rawget(metatable, method);
    setreadonly(metatable, false);
    rawset(metatable, method, func);
    table.freeze(metatable);
    setrawmetatable(obj, metatable)
    return old;
end;
local old; old = replacemetamethod(workspace, '__namecall', function(...)
    print(..., getnamecallmethod())
    return old(...)
end)]]

print("Wait For Blox Fruit UI")
repeat task.wait()
until game:IsLoaded() and game:GetService("Players") and game:GetService("Players").LocalPlayer and game.ReplicatedStorage and game.Players.LocalPlayer:FindFirstChild("PlayerGui")

local CheckLoadingScreen = 0
local StarterGui = game:GetService("StarterGui")
local CurrentSetting = {}
ExternalSetting = {"Team","SlowLoadUi","FixCrash","FixCrash2","ForceUseSilentAim","AutoLoad"}
while game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") and CheckLoadingScreen < 30 do
    task.wait(1)
end
if CheckLoadingScreen >= 30 then 
    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",game.JobId)
end
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "W-azure",
        Text = "Loading",
        Duration = 10,
    })
end)

--[[
    for i,v in pairs(game.CoreGui:GetChildren()) do
    if v:FindFirstChild("PropertiesFrame") then
    if v:FindFirstChild("ExplorerPanel") then
    if v:FindFirstChild("SideMenu") then
             game:Shutdown()
 end)
]]
--Compality
local IsRetardExecutor = function()
    return string.find(identifyexecutor(),"Delta") or string.find(identifyexecutor(),"Hydrogen")
end

local __FireSignal = function(...)
    if IsRetardExecutor() then 
        return 
    end
    firesignal(...)
end
local __FireTouchInterest = function(...)
    if string.find(identifyexecutor(),"Wave") then 
        local WaveRetard = select(3, ...)
        
        if WaveRetard == 0 then
            WaveRetard = false
        elseif WaveRetard == 1 then
            WaveRetard = true
        end
        
        local args = {n = select("#", ...), ...}
        args[3] = WaveRetard
        firetouchinterest(table.unpack(args, 1, args.n))
    else 
        local args ={...}
        firetouchinterest(table.unpack(args))

    end

end

function TableEncodeSetting(table)
    local str = "{"
    for key, value in pairs(table) do
        local valueStr = ""
        if type(value) == "boolean" then
            valueStr = tostring(value)
        elseif type(value) == "string" then
            valueStr = string.format("%q", value)
        elseif type(value) == "number" then
            valueStr = tostring(value)
        end
        str = str .. string.format("[%q]=%s,", key, valueStr)
    end
    str = str .. "}"
    return str
end
for i, v in pairs(ExternalSetting) do
    print(v,getgenv()[v])
    CurrentSetting[v] = getgenv()[v]
end
function Decode(encodedStr)
    local chunk = loadstring("return " .. encodedStr)
    return chunk()
end
StringSaveSetting = TableEncodeSetting(CurrentSetting)
print(StringSaveSetting)
local _,b = pcall(function()
    Decode(StringSaveSetting)
end)
if b then
    print(b)
end
if not getgenv().Loaded and  LPH_OBFUSCATED and getgenv().AutoLoad then 
    queue_on_teleport = (syn and syn.queue_on_teleport) or queue_on_teleport or krnl.queue_on_teleport
    Next = [[
        getgenv().script_key = "%s" 

        local _, err = pcall(function()
            local CurrentSetting = %s
            print(CurrentSetting)
            for i, v in pairs(CurrentSetting) do
                getgenv()[i] = v
            end
            
        end)
        if err then
            print(err)
        end

        loadstring(game:HttpGet("https://raw.w-azure.pro/Main-BF.lua"))()
    ]]
    Next = Next:format(tostring(getgenv().script_key),StringSaveSetting)
    queue_on_teleport(Next)
end
--[[
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
setfflag("TaskSchedulerTargetFps", "10")

]]
getgenv().Loaded = true
isfluxus = string.find(identifyexecutor(),"Fluxus") or string.find(identifyexecutor(),"ScriptWare") 
local IsPremium = true
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local getidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function() return 8 end
local Executors = {
    ["Arceus"] = {
        firesignal =false, --crash,
        firetouchinterest=true,--didnt test
        fireclickdetector = false,
    }
}

getgenv().fluxus = isfluxus
fluxus = isfluxus
function SupportRetard()
    if not fluxus then
        setidentity(8)
    end
end
SupportRetard()
virtualUser = game:GetService('VirtualUser')
if getgenv().Team ~= "Pirates" and getgenv().Team ~= "Marines"  then
    getgenv().Team = "Pirates" 
end
spawn(function ()
    task.wait(5)
    SupportRetard()
    loadstring([[
        local DeathEffect = require(game:GetService("ReplicatedStorage").Effect.Container:WaitForChild("Death"))
        local old; 
        old = hookfunction(DeathEffect, function(...)

            return (function()
            end)()
        end)
    ]])()
        
end)
pcall(function()
    workspace._WorldOrigin["Foam;"]:Destroy()
workspace._WorldOrigin.WaterSplashes:Destroy()
end)

local IsAlive = function(Object,HaveHRP,HaveHumanoid)
    if Object and Object.Parent and Object:FindFirstChild("HumanoidRootPart") and Object:FindFirstChild('Humanoid') then
        if Object:FindFirstChild('Humanoid').Health and Object:FindFirstChild('Humanoid').Health > 0 then
            return true
        end
    end
    return false
end


--[[
local function child(v)
    if v.Name == "ErrorPrompt" then
        if v.Visible then
            if v.TitleFrame.ErrorTitle.Text ~= "Teleport Failed" then
                
                
                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",game.JobId)
            end
        end
        v:GetPropertyChangedSignal("Visible"):Connect(function()
            if v.Visible then
                if v.TitleFrame.ErrorTitle.Text ~= "Teleport Failed" then
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",game.JobId)
                end
            end
        end)
    end
end
for i,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
    child(v)
end
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(child)]]
function ConvertPing(v)
    v = v.Text:gsub(" ms", "")
    return tonumber(v)
end
function GetPingTextPath() 
    for i, v in ipairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
        if v:FindFirstChild("StatsMiniTextPanelClass") and v.StatsMiniTextPanelClass.TitleLabel.Text == "Ping" then
            return v.StatsMiniTextPanelClass.ValueLabel
        end
    end
end
function GetPing()
    if not game.CoreGui.RobloxGui:FindFirstChild("PerformanceStats") then 
        UserSettings().GameSettings.PerformanceStatsVisible = true
    else
        local path = GetPingTextPath()
        return ConvertPing(path)
    end
end
task.spawn(function()
    SupportRetard()
    local ListErrorCode = {    
        Enum.ConnectionError.DisconnectErrors.Value,
        Enum.ConnectionError.PlacelaunchOtherError.Value,
        17,
        279,
        266,
        267,
        722,
        --772, Server Full
        272,
        529,
        277,
        769
    } 
    
    while task.wait(1) do 

        local Code = game:GetService'GuiService':GetErrorCode().Value
        
        for i, v in pairs(ListErrorCode) do
            if Code == v then 
                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",game.JobId)
            end 
        end
        
        if LastPing == game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() and LastPing ~= 0 then
            LastCheck = tick()
        else
            LastCheck1 = tick()
        end
        if LastCheck and LastCheck1 then
            if LastCheck - LastCheck1 > 50 then 
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId, game.Players.LocalPlayer)

                task.wait(10)
            end
        end
        LastPing = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    end
end)


if not secure_call then
    secure_call =  loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/secure_call.lua", true))() 
end

while not game.Players.LocalPlayer.Team and task.wait(1)  do
       game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("SetTeam",getgenv().Team)
end 
repeat wait()
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main")
local RenderDist = {
    HakiPad = {
        CFrame.new(-5414.41357, 309.865753, -2212.45776, 0.374604106, -0, -0.92718488, 0, 1, -0, 0.92718488, 0, 0.374604106),200
    },
    Law = {
        CFrame.new(-5536.31396484375, 328.98834228515625, -5935.50244140625, 0.374604106, -0, -0.92718488, 0, 1, -0, 0.92718488, 0, 0.374604106),500
    }
}
function RenderFunc(Name)
    for i=1,25 do 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
    end
    local args = {
        {
            {
                cf = RenderDist[Name][1],
                distance = RenderDist[Name][2],
                showTime = 9e1
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestStreamAroundAsync"):FireServer(unpack(args)) -- Render Pad
    game.ReplicatedStorage.Remotes:WaitForChild("RequestStreamAroundAsync").OnClientEvent:Wait();
    for i=1,25 do 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
    end
end

if Sea3 then
   -- RenderFunc("HakiPad")
end
if Sea2 then
    RenderFunc("Law")
end



print("Choosed Team")
--[[
    do
        local old = getrenv()._G[""]
        if type(old) == 'function' then
            print("Found Stupid FUnction")
            getrenv()._G[""]= function(...)
            print(...)
            print("Elppti Called")
            print(debug.traceback())
            return old(...)
            end
        end
    end
    local function GetBoat()
    for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do 
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v:FindFirstChild("VehicleSeat") then
            return v
        end
    end
    return false
end
]]

local getasset = getsynasset or getcustomasset
local req = http_request or request or HttpPost or syn.request
--req({Url="http://127.0.0.1:6969/openroblox",Method = "POST"})
local Players = game:GetService("Players")
local VU = game:GetService("VirtualUser")
local VIM =game:GetService("VirtualInputManager")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local CG = game:GetService("CoreGui")
local HTTPS = game:GetService("HttpService")
local RunS = game:getService("RunService")
local Lighting = game:getService("Lighting")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local PG = LP.PlayerGui

local CurrentMaxLv = 2800

local _IronHubPlaceId = game.PlaceId
local MAP = workspace:GetAttribute("MAP")
if MAP == "Sea1" or _IronHubPlaceId == 85211729168715 or _IronHubPlaceId == 2753915549 then
    Sea1 = true
    MaxLevelSea = 675
elseif MAP == "Sea2" or _IronHubPlaceId == 79091703265657 or _IronHubPlaceId == 4442272183 then
    Sea2 = true
    MaxLevelSea = 1450
elseif MAP == "Sea3" or _IronHubPlaceId == 100117331123089 or _IronHubPlaceId == 7449423635 then
    Sea3 = true
    MaxLevelSea = 2800
else 
    game.Players.LocalPlayer:Kick(string.format("Unsupported game | %s", tostring(game.PlaceId)))
    while task.wait() do end
end

local PlaceToKey = {
    ["2753915549"] = "2753915549",
    ["4442272183"] = "4442272183",
    ["79091703265657"] = "4442272183",
    ["7449423635"] = "7449423635",
    ["100117331123089"] = "7449423635",
}

local CurrentPlaceKey
if Sea1 then
    CurrentPlaceKey = "2753915549"
elseif Sea2 then
    CurrentPlaceKey = "4442272183"
elseif Sea3 then
    CurrentPlaceKey = "7449423635"
end

getgenv().CurrentPlaceKey = CurrentPlaceKey

CurrentPlaceKey = CurrentPlaceKey or PlaceToKey[tostring(game.PlaceId)]

--Loader
local DefaultSetting = {
    Level = {Enable= false},
    OneClick = {Enable= false},
    Katakuri = {Enable = false},
    Bone = {Enable=false},
    AcceptQuest_Bone_Katakuri={Enable=true},
    Elite = {Enable=false},
    ["Tyrant Skies"] = {Enable=false},
    SubFarming = {},
    ["Pirate Raid"] = {Enable=false},
    ["Kill Aura"] = {Enable=false,DistanceFromAnchor=4000,AnchorTPBack=true},
    Factory = {Enable=false},
    Mastery = {Enable=false,["Fruit/Gun"]=false,["Sword/Low"]=false,["Sword"]=false},
    SelectWeapon = "Blox Fruit",
    LocalPlayer = {Speed=90,SpeedHack=false,AutoBuso=true,AutoEnableObservation=false,WaterWalker=true,AutoUseV4=false},
    FastAttack = {Enable=true,TimeFastAttack=80,TimeToAttack=3,FastAttackIfBoss=false,OnPlayer=true,OnMob=true,OldFastAttack=false},
    Tween = {Pause=true,TimeNeedPause=2,TimePause=0.2,Speed=300},
    Pvp = {AutoShootGun=false,Method="Nearest"},
    ESP = {Player=false,Chest=false,Boss=false,Island=false,Fruit=false},
    SeaEvents = {ShipSpeedModifier=false,ShipSpeed=300,SpinDistance=200,DistanceNearSeaBeast=300,DistanceNearMob=300,AutoEscapeRoughSea=true},
    Shop = {AutoBuyBribe=false,AutoRandomFruit=false,AutoRandomBone=false},
    SkillsSet2 = {["Blox Fruit"]=true,Gun=true,Sword=true,Melee=true},
    SkillsSettingRemake = {["Blox Fruit"]={"Z","X","C","V","F"},Gun={"Z","X"},Sword={"Z","X"},Melee={"Z","X","C"}},
    UseDragonStorm = false,
    FruitSkillsHold = {},
    BringMob = {Enable=true,Radius=200},
    Fruit = {AutoStore=false,FruitsToSnipe={}},
    GetFruit = {Enable=false},
    Trial = {Enable=false,AutoKill=false},
    AutoTrainTrial={Enable=false,TrainPlace="Bone"},
    FullyAutoTrial = {Enable=false},
    ["Rip Indra"] = {Enable=false},
    ["Black Beard"] = {Enable=false},
    ["Dough King"] = {Enable = false},
    ["Cake Prince"] = {Enable = false},
    ["Full Dough King"] = {Enable = false},
    ["FullyRaceV4_Entrance"] = {Enable=false},
    Material = {Enable=false,Select=""},
    Misc = {__RemoveNotification=false,__RemoveDMGCounter=false},
    Raid = {Select="",Enable=false,NoDelay=true},
    ["Winter Event"] = {Enable=false,},
    RaceV4 = {CheckStatus=false},
    Bartilo = {Enable=false},
    ["Race Evolve"] = {Enable=false},
    ["Haki Pad"] = {Enable=false},
    ["Collect Chest"] = {Enable=false,InstaTP=false},
    ["Open Pad"] = {Enable=false},
    ["Spawn Black Beard"] = {Enable=false},
    ["Spawn Rip Indra"] = {Enable=false},
    ["Mirage Snipe Fruit"] = {Enable=false},
    ["Soul Guitar"] = {Enable=false},
    ["Material Soul Guitar"] = {Enable=false},
    ["Black Beard Hop"] = {Enable=false},
    ["Tushita Hop__1"] = {Enable=false},
    ["Soul Reaper"] = {Enable=false},
    ["Spawn Soul Reaper"] = {Enable=false},
    Tushita = {Enable=false},
    ["Hybrid Fruit Hop"] = {Enable=false},
    ["Raid Fruit Hop"] = {Enable=false},
    ["Fully Cyborg"] = {Enable=false},
    ["Fully Ghoul"] = {Enable=false},
    ["Law"] = {Enable=false},
    ["CDK"] = {Enable=false},
    ["Level Observation"]= {Enable=false},
    ["Rainbow Haki"] = {Enable=false},
    ["__SaberHop"] = {Enable=false},
    ["Citizen Quest"] = {Enable=false},
    ["__PoleHop"] = {Enable=false},
    ["Evolve Observation"] = {Enable=false},
    ["SwordSwitcher"]= {Enable=false},
    ["GunSwitcher"]= {Enable=false},
    ["TrialTeam"] = {Enable=false},
    ["Get Ghoul"] = {Enable=false},
    ["Webhook"] = {Url=""},
    ["Unlock Electric Claw"] = {Enable=false},
    ["Shark Anchor"] = {Enable=false},
    ["Elite Hop"] = {Enable=false},
    ["Rip Indra Hop"] = {Enable=false},
    ["YoruV3"] = {Enable=false,Upgrade=false,SelectedPlayer=nil},
    ["BossSniper"] = {Enable=false,SelectedBoss={}},
    ["SafeMode_GetGoodItem"] = {Enable=true},
    ["Panel"] = {Enable=false},
    __KatakuriHop = {Enable=false},
    DragonHunterQuest = {Enable=false},
    ["BlackSmith"] = {
        Enable = false,
        WeaponType = false,
    },
    SubClass = {
        Shipwright = false,
    },
    CollectBerry = {Enable=false},
    DojoQuest = {
        Enable = false,
    },
    PatchVolcanic = {Enable = false},
    CraftVolcanicMagnet = {Enable = false},
    ResetAfterVolcano = {Enable = false},
    CollectDinoBones = {Enable = false},
    CollectDragonEggs = {Enable = false},
    AutoStartPrehistoric = {Enable = false},
    AutoFullVolcano = {Enable = false},
    FullItemsPrehistoric = {Enable = false},
}

getgenv().SettingManager = {}
if not SettingManager then
    SettingManager = getgenv().SettingManager
end
function SettingManager:SetTheme(Theme)
    if Theme then
        UIThemeCustom.ImageTransparency = 0
        UIThemeCustom.Image = Theme
    end
end
function SettingManager:SetDiscordIcon()
    local File = self.CurrentFolder.."/Cache".."/Discord.png"
    if not isfile(File) then
        local GetUrl = game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/W-azure/asset/DiscordIcon.png")
        writefile(File, GetUrl)
        repeat wait()
        until isfile(File)

    end
    if isfile(File) then
        UserIcon.Image = getasset(File)
    end
end
function SettingManager:SetAvatar(Avatar,Id)
    
    local a,b = pcall(function()
        local Id = tostring(Id)
        local File = self.CurrentFolder.."/Cache".."/Avt.png"
        if not isfile(File) then
            local response = req(
                {
                    Url = "https://cdn.discordapp.com/avatars/"..Id.."/"..Avatar..".png",  -- This website helps debug HTTP requests
                    Method = "GET",
                    Headers = {
                        ["Content-Type"] = "application/json"  -- When sending JSON, set this!
                    },
                }
            )
            writefile(File,response.Body)
            repeat wait()
            until isfile(File)
        end
        if isfile(File) then
            UserIcon.Image = getasset(File)
        end
    end)
    if b then
        SettingManager:SetDiscordIcon()
    end
end

function SettingManager:SetFolder(Folder)
    if not isfolder(Folder) then
        makefolder(Folder)
    end
    
    self.CurrentFolder = Folder
    self.Theme = self.CurrentFolder.."/Theme"
    self.Cache = self.CurrentFolder.."/Cache"
    self.AutoSave = self.CurrentFolder.."/Main"
    self.Config = self.CurrentFolder.."/ConfigMain"
    self.Global = self.CurrentFolder.."/Global"

    self.AutoLoad = self.AutoSave.."/"..game.Players.LocalPlayer.Name..".txt"
    self.GlobalTheme = self.Global.."/".."GlobalTheme.txt"
    self.GlobalTrans = self.Global.."/".."GlobalTrans.txt"

    self.AutoData = self.Config.."/"..game.Players.LocalPlayer.Name..".json"
    self.SameAcc = self.CurrentFolder.."/SameAcc"
    self.AutoConfig = self.AutoData
    if not isfolder(self.Theme) then
        makefolder(self.Theme)
    end
    if not isfolder(self.SameAcc) then
        makefolder(self.SameAcc)
    end
    if not isfolder(self.Cache) then
        makefolder(self.Cache)
    end       
    if not isfolder(self.AutoSave) then
        makefolder(self.AutoSave)
    end           
    if not isfolder(self.Config) then
        makefolder(self.Config)
    end 
end
function SettingManager:SetGlobalTrans(write,value)

    if write then
        writefile(self.GlobalTrans,HTTPS:JSONEncode(value))
    else
        return isfile(self.GlobalTrans) and HTTPS:JSONDecode(readfile(self.GlobalTrans))
    end
end
function SettingManager:SetGlobalTheme(write,value)

    if write then
        writefile(self.GlobalTheme,HTTPS:JSONEncode(value))
    else
        return isfile(self.GlobalTheme) and HTTPS:JSONDecode(readfile(self.GlobalTheme))
    end
end
function SettingManager:SetSameInstance()
    if isfolder(self.SameAcc) then 
        if isfile(self.SameAcc.."/Account.json") then
            local AccountChecked = HTTPS:JSONDecode(readfile(self.SameAcc.."/Account.json"))
            if not table.find(AccountChecked,LP.Name) then
                table.insert(AccountChecked,LP.Name)
                writefile(self.SameAcc.."/Account.json",HTTPS:JSONEncode(AccountChecked))
            end
            for i,v in pairs(Players:GetPlayers()) do 
                if v == LP then
                    continue 
                end
                if table.find(AccountChecked,v.Name) then
                    print("Checked Same: "..v.Name)

                    return true
                end
            end
        else
            writefile(self.SameAcc.."/Account.json",HTTPS:JSONEncode({LP.Name}))
        end
    end
end
function SettingManager:LoadAutoConfig()
        if not isfile(self.AutoLoad) then
            writefile(self.AutoLoad,self.Config.."/"..game.Players.LocalPlayer.Name..".json")
        else
            local Config = readfile(self.AutoLoad)
            
            if isfile(Config) then
                self.AutoConfig = Config
                print("Auto load")
                local ReturnVal
                local a,b = pcall(function()
                    ReturnVal = HTTPS:JSONDecode(readfile(self.AutoConfig ))
                end)
                if b  then
                end
                return ReturnVal
            end
        end
end
function SettingManager:SetAutoConfig(FileName)
    writefile(self.AutoLoad,FileName)
end
function SettingManager:New(FileName)
    writefile(self.Config.."/"..FileName,HTTPS:JSONEncode({}))
end
function SettingManager:Save(FileName,Data)
    if FileName and Data then
        local a,b = pcall(function()
            writefile(FileName,HTTPS:JSONEncode(Data))
        end)
        return a
    else

        --,DataSave = DataSave
        writefile(self.AutoData, getgenv().Setting and HTTPS:JSONEncode({Setting=getgenv().Setting}) or HTTPS:JSONEncode({}))
    end
end
function SettingManager:Load(FileName,Data)
    if isfile(self.Config.."/"..FileName) then
        return HTTPS:JSONDecode(readfile(self.AutoSave.."/"..FileName))
    end
end
function SettingManager:ListFile(Mode)
    local Files = {
        ["Theme"] = "/Theme",
        ["Config"] = "/ConfigMain",
    }
    --print(listfiles(self.CurrentFolder.."/Theme"))
    
    return listfiles(self.CurrentFolder..Files[Mode])
end
SettingManager:SetFolder("True W-azure V2_Beta")
do 
    if not getgenv().Setting then
        getgenv().Setting = {}
    end    
    local LoadConfigne = SettingManager:LoadAutoConfig()
    if LoadConfigne and LoadConfigne["Setting"] then -- and SettingManager:LoadAutoConfig()["DataSave"]
        for i,v in pairs(LoadConfigne["Setting"]) do
            getgenv().Setting[i] = v
            
        end

        for i,v in pairs(DefaultSetting) do
            if not getgenv().Setting[i] then
                print("Missing: " .. i,v)

                getgenv().Setting[i]=v
                print(getgenv().Setting[i])
            end
        end
        print("Loaded")
    -- DataSave = SettingManager:LoadAutoConfig()["DataSave"]
    else
        print("Dell load")
        getgenv().Setting = DefaultSetting
        SettingManager:Save()
            --Library:Notify("Config","Auto Config Didn't Have Properly Table, Auto Set Current Config To Default",10)
        
    end

end
for i,v in pairs(getgenv().OneClickSetting or {}) do
    getgenv().Setting.OneClick[i]=v 
end
--loadstring([[]])
--Game Data Usage: SpawnPosition, MapPos, TripleQuest, Ignore Ui If Load From Source
--[[
    getgenv().forceEnable  = true
    Init = loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/W-azure/LuaInit.lua", true))()
]]
SupportRetard()
print("Get Exteral Data")
PriorityQueue = loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/FixedQueue.lua", true))()
print("Getting Game Data")
local GameData = {}
GameData.MetaData = {
    
}
GameData.Places = {
    ["2753915549"] = {
        ['Pirate Start Island'] = CFrame.new(781.37255859375, 5.7767753601074, 1437.2399902344),
        ['Marine Start Island'] = CFrame.new(-2606.2143554688, 6.7695031166077, 2043.04553222667),
        ['Middle Town'] = CFrame.new(-655.824158, 7.88708115, 1436.67908),
        ['Jungle'] = CFrame.new(-1334.1259765625, 11.852984428406, 502.03717041016),
        ["Shank's Room"] = CFrame.new(-1455.4440917969, 29.851997375488, -37.440139770508),
        ['Pirate Village'] = CFrame.new(-1187.3435058594, 4.7515587806702, 3809.2456054688),
        ['Desert'] = CFrame.new(1094.14587, 6.47350502, 4192.88721),
        ['Frozen Village'] = CFrame.new(1112.4229736328, 7.3036189079285, -1159.3383789062),
        ['Marine Fortress'] = CFrame.new(-4817.0161132812, 20.651899337769, 4368.0639648438),
        ['Mob Leader Place'] = CFrame.new(-2839.7548828125, 7.3262448310852, 5319.9428710938),
        ['Prison'] = CFrame.new(4874.8125, 5.6519904136658, 735.57012939453),
        ['Colosseum'] = CFrame.new(-1423.5014648438, 7.2882599830627, -2798.2961425781),
        ['Skylands'] = CFrame.new(-4970.21875, 717.707275, -2622.35449),
        ['SkyArea1'] = CFrame.new(-4731.9462890625, 845.27691650391, -1933.5628662109),
        ['SkyArea2'] = CFrame.new(-7884.7309570312, 5545.509765625, -383.34613037109),
        ['Sky Secret Temple'] = CFrame.new(-8018.662109375, 5609.9936523438, -1979.3544921875),
        ['Magma Village'] = CFrame.new(-5231.75879, 8.61593437, 8467.87695),
        ["Fish Entrance Island"] = CFrame.new(3868.501953125, 5.592349529266357, -1917.993408203125),
        ['UnderWater City Gate'] = CFrame.new(3853.0385742188, 5.3731479644775, -1919.4447021484),
        ['UnderWater City'] = CFrame.new(61092.36328125, 18.471633911133, 1711.1674804688),
        ['Fountain City'] = CFrame.new(5053.0297851562, 1.5012743473053, 4054.8439941406),
    },
    ["4442272183"] = {
        ['First Spot'] = CFrame.new(-11.845784187317, 29.276727676392, 2768.9770507812),
        ['Cafe'] = CFrame.new(-384.03524780273, 73.020072937012, 353.2282409668),
        ['Swan Mansion'] = CFrame.new(-390.096313, 331.886475, 673.464966),
        ['Swan Room'] = CFrame.new(2302.19019, 15.1778421, 663.811035),
        ['Factory'] = CFrame.new(430.42569, 210.019623, -432.504791),
        ['Colosseum'] = CFrame.new(-1836.58191, 44.5890656, 1360.30652),
        ['Dark Arena'] = CFrame.new(3781.985107421875, 14.8506498336792, -3498.081298828125),
        ['Green bit'] = CFrame.new(-2304.93359375, 72.966117858887, -2782.6965332031),
        ['Graveyard Island'] = CFrame.new(-5377.3295898438, 8.9691047668457, -708.45489501953),
        ['Snow Mountain'] = CFrame.new(554.47235107422, 401.42199707031, -5364.732421875),
        ['Hot And Cold Island'] = CFrame.new(-5944.7875976562, 15.951756477356, -5114.8725585938),
        ['Cursed Ship Gate'] = CFrame.new(-6509.4169921875, 83.187019348145, -137.396774291998),
        ['Cursed Ship'] = CFrame.new(902.059143, 124.752518, 33071.8125),
        ['Ice Castle'] = CFrame.new(5662.44140625, 28.191165924072, -5982.9755859375),
        ['Forgotten Island'] = CFrame.new(-3043.31543, 238.881271, -10191.5791),
        ['Usoap Island'] = CFrame.new(4778.2431640625, 8.2086620330811, 2871.4936523438),
        ['Minisky Island'] = CFrame.new(-260.358917, 49325.7031, -35259.3008),
        ['Indra Island'] = CFrame.new(-27007.9363, 9.033, 466.6544),
    },
    ["7449423635"] = {
        ['Port Town'] = CFrame.new(-447.46743774414, 6.7299399375916, 5306.3686523438),
        ['Hydra Island'] = CFrame.new(5335.88623046875, 1004.7794799804688, 241.50193786621094),
        ['Secret Temple'] = CFrame.new(5231.6831054688, 7.3780846595764, 1102.6005859375),
        ['Great Tree'] = CFrame.new(2253.0600585938, 24.144220352173, -6405.6694335938),
        ['Castle on the sea'] = CFrame.new(-5026.3584, 323.515503, -2996.28442),
        ['Pineapple Town'] = CFrame.new(-11363.5166, 362.381439, -10327.9727),
        ['Mansion'] = CFrame.new(-12553.0595703125, 337.3874816894531, -7471.96142578125),
        --['Mansion(Insta TP)'] = game:GetService("Workspace").Map.Turtle.TradeTable.P1.CFrame,
        ['Floating Turtle'] = CFrame.new(-12001.6152, 1707.39319, -8789.03711),
        ['Beautiful Pirate Gate'] = CFrame.new(-11990.901367188, 331.80770874023, -8845.5888671875),
        ['Beautiful Pirate Domain'] = CFrame.new(5310.80957, 160.446838, 129.390533),
        ['Friendly Arena'] = CFrame.new(5220.28955, 72.8193436, -1500.86304),
        ['Haunted Castle'] = CFrame.new(-9530.61035, 200.860657, 5763.13477),
        ['Soul Reaper Raid Room'] = CFrame.new(-9522.0957, 315.89975, 6751.88818),
        ['Peanut Island'] = CFrame.new(-2087.0561523438, 11.722011566162, -10002.080078125),
        ['Ice Cream Island'] = CFrame.new(-851.74633789062, 65.819496154785, -10932.150390625),
        ['Sea Of Treats'] = CFrame.new(-1907.1773681640625, 9.565654754638672, -11539.8251953125),
        ["Tiki Outpost"] = CFrame.new(-16256.5566, 9.06057358, 430.995422),
        ["Mob Trade Anchor"] = CFrame.new(-16529.705078125, 108.0355224609375, 748.5739135742188)
    }
}


GameData.TripleQuest = {
    ["2753915549"] = {
        [150] = {
            ["Quest"] = "SkyQuest",
            QuestCFrame = CFrame.new(-4841.83447, 717.669617, -2623.96436),
            [1] = {
                Requirement = 150,
                Mob = "Sky Bandit [Lv. 150]",
                QuestCheck = "Sky Bandit",
            },
            [2] = {
                Requirement = 175,
                Mob = "Dark Master [Lv. 175]",
                QuestCheck = "Dark Master",
            },
        },
        [190] = {
            ["Quest"] = "PrisonerQuest",
            QuestCFrame = CFrame.new(5311.4677734375, 1.6553531885147095, 478.103271484375),
            [1] = {
                Requirement = 190,
                Mob = "Prisoner [Lv. 190]",
                QuestCheck = "Prisoner",
            },
            [2] = {
                Requirement = 210,
                Mob = "Dangerous Prisoner [Lv. 210]",
                QuestCheck = "Dangerous Prisoner",
            },
            [3] = {
                Requirement = 220,
                Boss = "Warden [Lv. 220]",
                QuestCheck = "Warden",
                ["Quest"] = "ImpelQuest",
                QuestCFrame = CFrame.new(5191.42431640625, 3.9040470123291016, 682.0729370117188),
                Index = 1
            },
            [4] = {
                Requirement = 230,
                Boss = "Chief Warden [Lv. 230]",
                QuestCheck = "Chief Warden",
                ["Quest"] = "ImpelQuest",
                QuestCFrame = CFrame.new(5191.42431640625, 3.9040470123291016, 682.0729370117188),
                Index = 2
            },
            [5] = {
                Requirement = 240,
                Boss = "Swan [Lv. 240]",
                QuestCheck = "Swan",
                ["Quest"] = "ImpelQuest",
                QuestCFrame = CFrame.new(5191.42431640625, 3.9040470123291016, 682.0729370117188),
                Index = 3
            },
        },
        [250] = {
            ["Quest"] = "ColosseumQuest",
            QuestCFrame = CFrame.new(-1576.11743, 7.38933945, -2983.30762),
            [1] = {
                Requirement = 250,
                Mob = "Toga Warrior [Lv. 250]",
                QuestCheck = "Toga Warrior",
            },
            [2] = {
                Requirement = 275,
                Mob = "Gladiator [Lv. 275]",
                QuestCheck = "Gladiator",
            },
        },
        [300] = {
            ["Quest"] = "MagmaQuest",
            QuestCFrame = CFrame.new(-5316.55859, 12.2370615, 8517.2998),
            [1] = {
                Requirement = 300,
                Mob = "Military Soldier [Lv. 300]",
                QuestCheck = "Military Soldier",
            },
            [2] = {
                Requirement = 325,
                Mob = "Military Spy [Lv. 325]",
                QuestCheck = "Military Spy",
            },
            [3] = {
                Requirement = 350,
                Boss = "Magma Admiral [Lv. 350] [Boss]",
                QuestCheck = "Magma Admiral",
                ["Quest"] = "MagmaQuest",
                QuestCFrame = CFrame.new(-5316.55859, 12.2370615, 8517.2998),
            },
        },
        [400] = {
            ["Quest"] = "FishmanQuest",
            QuestCFrame = CFrame.new(61122.5625, 18.4716396, 1568.16504),
            [1] = {
                Requirement = 375,
                Mob = "Fishman Warrior [Lv. 375]",
                QuestCheck = "Fishman Warrior",
            },
            [2] = {
                Requirement = 400,
                Mob = "Fishman Commando [Lv. 400]",
                QuestCheck = "Fishman Commando",
            },
            [3] = {
                Requirement = 425,
                Boss = "Fishman Lord [Lv. 425] [Boss]",
                QuestCheck = "Fishman Lord",
                ["Quest"] = "FishmanQuest",
                QuestCFrame = CFrame.new(61122.5625, 18.4716396, 1568.16504),
            },
        },
        [475] = {
            ["Quest"] = "SkyExp1Quest",
            QuestCFrame = CFrame.new(-4720.853515625, 845.2769775390625, -1947.7744140625),
            [1] = {
                Requirement = 450,
                Mob = "God's Guard [Lv. 450]",
                QuestCheck = "God's Guard",
            },
            [2] = {
                Requirement = 475,
                Mob = "Shanda [Lv. 475]",
                QuestCheck = "Shanda",
            },
            [3] = {
                Requirement = 500,
                Boss = "Wysper [Lv. 500] [Boss]",
                QuestCheck = "Wysper",
                ["Quest"] = "SkyExp1Quest",
                QuestCFrame = CFrame.new(-4720.853515625, 845.2769775390625, -1947.7744140625),
            },
        },
        [550] = {
            ["Quest"] = "SkyExp2Quest",
            QuestCFrame = CFrame.new(-7905.25732421875, 5636.03857421875, -1409.6732177734375),
            [1] = {
                Requirement = 525,
                Mob = "Royal Squad [Lv. 525]",
                QuestCheck = "Royal Squad",
            },
            [2] = {
                Requirement = 550,
                Mob = "Royal Soldier [Lv. 550]",
                QuestCheck = "Royal Soldier",
            },
            [3] = {
                Requirement = 575,
                Boss = "Thunder God [Lv. 575] [Boss]",
                QuestCheck = "Thunder God",
                ["Quest"] = "SkyExp2Quest",
                QuestCFrame = CFrame.new(-7905.25732421875, 5636.03857421875, -1409.6732177734375),
            },    
        },
        [650] = {
            ["Quest"] = "FountainQuest",
            QuestCFrame = CFrame.new(5257.68505859375, 38.50114059448242, 4046.49560546875),
            [1] = {
                Requirement = 625,
                Mob = "Galley Pirate [Lv. 625]",
                QuestCheck = "Galley Pirate",
            },
            [2] = {
                Requirement = 650,
                Mob = "Galley Captain [Lv. 650]",
                QuestCheck = "Galley Captain",
            },
            [3] = {
                Requirement = 675,
                Boss = "Cyborg [Lv. 675] [Boss]",
                QuestCheck = "Cyborg",
                ["Quest"] = "FountainQuest",
                QuestCFrame = CFrame.new(5257.68505859375, 38.50114059448242, 4046.49560546875),
            },    
        },
    },
    ["4442272183"] = {
        [700] = {
            ["Quest"] = "Area1Quest",
            QuestCFrame = CFrame.new(-424.080078, 73.0055847, 1836.91589),
            [1] = {
                Requirement = 700,
                Mob = "Raider [Lv. 700]",
                QuestCheck = "Raider",
            },
            [2] = {
                Requirement = 725,
                Mob = "Mercenary [Lv. 725]",
                QuestCheck = "Mercenary",
            },
            [3] = {
                Requirement = 750,
                Boss = "Diamond [Lv. 750] [Boss]",
                QuestCheck = "Diamond",
                ["Quest"] = "Area1Quest",
                QuestCFrame = CFrame.new(-424.080078, 73.0055847, 1836.91589),
            },       
        },
        [775] = {
            ["Quest"] = "Area2Quest",
            QuestCFrame = CFrame.new(934.597229, 73.3029785, 1250.96814),
            [1] = {
                Requirement = 775,
                Mob = "Swan Pirate [Lv. 775]",
                QuestCheck = "Swan Pirate",
            },
            [2] = {
                Requirement = 800,
                Mob = "Factory Staff [Lv. 800]",
                QuestCheck = "Factory Staff",
            },
            [3] = {
                Requirement = 800,
                Boss = "Jeremy [Lv. 850] [Boss]",
                QuestCheck = "Jeremy",
                ["Quest"] = "Area2Quest",
                QuestCFrame = CFrame.new(934.597229, 73.3029785, 1250.96814),
            },       
        },
        [875] = {
            ["Quest"] = "MarineQuest3",
            QuestCFrame = CFrame.new(-2442.65015, 73.0511475, -3219.11523),
            [1] = {
                Requirement = 875,
                Mob = "Marine Lieutenant [Lv. 875]",
                QuestCheck = "Marine Lieutenant",
            },
            [2] = {
                Requirement = 900,
                Mob = "Marine Captain [Lv. 900]",
                QuestCheck = "Marine Captain",
            },
            [3] = {
                Requirement = 925,
                Boss = "Fajita [Lv. 925] [Boss]",
                QuestCheck = "Fajita",
                ["Quest"] = "MarineQuest3",
                QuestCFrame = CFrame.new(-2442.65015, 73.0511475, -3219.11523),
            },         
        },
        [950] = {
            ["Quest"] = "ZombieQuest",
            QuestCFrame = CFrame.new(-5492.79395, 48.5151672, -793.710571),
            [1] = {
                Requirement = 950,
                Mob = "Zombie [Lv. 950]",
                QuestCheck = "Zombie",
            },
            [2] = {
                Requirement = 975,
                Mob = "Vampire [Lv. 975]",
                QuestCheck = "Vampire",
            },       
        },
        [1000] = {
            ["Quest"] = "SnowMountainQuest",
            QuestCFrame = CFrame.new(604.964966, 401.457062, -5371.69287),
            [1] = {
                Requirement = 1000,
                Mob = "Snow Trooper [Lv. 1000]",
                QuestCheck = "Snow Trooper",
            },
            [2] = {
                Requirement = 1050,
                Mob = "Winter Warrior [Lv. 1050]",
                QuestCheck = "Winter Warrior",
            }, 
        },
        [1100] = {
            ["Quest"] = "IceSideQuest",
            QuestCFrame = CFrame.new(-6060.10693, 15.9868021, -4904.7876),
            [1] = {
                Requirement = 1100,
                Mob = "Lab Subordinate [Lv. 1100]",
                QuestCheck = "Lab Subordinate",
            },
            [2] = {
                Requirement = 1125,
                Mob = "Horned Warrior [Lv. 1125]",
                QuestCheck = "Horned Warrior",
            },     
            [3] = {
                Requirement = 1150,
                Boss = "Smoke Admiral [Lv. 1150] [Boss]",
                QuestCheck = "Smoke Admiral",
                ["Quest"] = "IceSideQuest",
                QuestCFrame = CFrame.new(-6060.10693, 15.9868021, -4904.7876),
            },   
        },
        [1175] = {
            ["Quest"] = "FireSideQuest",
            QuestCFrame = CFrame.new(-5431.09473, 15.9868021, -5296.53223),
            [1] = {
                Requirement = 1175,
                Mob = "Magma Ninja [Lv. 1175]",
                QuestCheck = "Magma Ninja",
            },
            [2] = {
                Requirement = 1200,
                Mob = "Lava Pirate [Lv. 1200]",
                QuestCheck = "Lava Pirate",
            },     
            [3] = {
                Requirement = 1150,
                Boss = "Smoke Admiral [Lv. 1150] [Boss]",
                QuestCheck = "Smoke Admiral",
                ["Quest"] = "IceSideQuest",
                QuestCFrame = CFrame.new(-6060.10693, 15.9868021, -4904.7876),
            }, 
        },
        [1250] = {
            ["Quest"] = "ShipQuest1",
            QuestCFrame = CFrame.new(1037.80127, 125.092171, 32911.6016),
            [1] = {
                Requirement = 1250,
                Mob = "Ship Deckhand [Lv. 1250]",
                QuestCheck = "Ship Deckhand",
            },
            [2] = {
                Requirement = 1275,
                Mob = "Ship Engineer [Lv. 1275]",
                QuestCheck = "Ship Engineer",
            },     
        },
        [1300] = {
            ["Quest"] = "ShipQuest2",
            QuestCFrame = CFrame.new(968.80957, 125.092171, 33244.125),
            [1] = {
                Requirement = 1300,
                Mob = "Ship Steward [Lv. 1300]",
                QuestCheck = "Ship Steward",
            },
            [2] = {
                Requirement = 1325,
                Mob = "Ship Officer [Lv. 1325]",
                QuestCheck = "Ship Officer",
            },     
        },
        [1350] = {
            ["Quest"] = "FrostQuest",
            QuestCFrame = CFrame.new(5669.43506, 28.2117786, -6482.60107),
            [1] = {
                Requirement = 1350,
                Mob = "Arctic Warrior [Lv. 1350]",
                QuestCheck = "Arctic Warrior",
            },
            [2] = {
                Requirement = 1375,
                Mob = "Snow Lurker [Lv. 1375]",
                QuestCheck = "Snow Lurker",
            },      
            [3] = {
                Requirement = 1400,
                Boss = "Awakened Ice Admiral [Lv. 1400] [Boss]",
                QuestCheck = "Awakened Ice Admiral",
                ["Quest"] = "FrostQuest",
                QuestCFrame = CFrame.new(5669.43506, 28.2117786, -6482.60107),
            },
        },
        [1425] = {
            ["Quest"] = "ForgottenQuest",
            QuestCFrame = CFrame.new(-3053.89648, 236.881363, -10148.2324),
            [1] = {
                Requirement = 1425,
                Mob = "Sea Soldier [Lv. 1425]",
                QuestCheck = "Sea Soldier",
            },
            [2] = {
                Requirement = 1450,
                Mob = "Water Fighter [Lv. 1450]",
                QuestCheck = "Water Fighter",
            },      
            [3] = {
                Requirement = 1475,
                Boss = "Tide Keeper [Lv. 1475] [Boss]",
                QuestCheck = "Tide Keeper",
                ["Quest"] = "ForgottenQuest",
                QuestCFrame = CFrame.new(-3053.89648, 236.881363, -10148.2324),
            },   
        },
    },    
    ["7449423635"] = {
        [1500] = {
            ["Quest"] = "PiratePortQuest",
            QuestCFrame = CFrame.new(-292.5743713378906, 43.79322052001953, 5583.04052734375),
            [1] = {
                Requirement = 1500,
                Mob = "Pirate Millionaire [Lv. 1500]",
                QuestCheck = "Pirate Millionaire",
            },
            [2] = {
                Requirement = 1525,
                Mob = "Pistol Billionaire [Lv. 1525]",
                QuestCheck = "Pistol Billionaire",
            },
            [3] = {
                Requirement = 1550,
                Boss = "Stone [Lv. 1550] [Boss]",
                QuestCheck = "Stone",
                ["Quest"] = "PiratePortQuest",
                QuestCFrame = CFrame.new(-292.5743713378906, 43.79322052001953, 5583.04052734375),
            },

        },
        [1575] = {
            ["Quest"] = "DragonCrewQuest",
            QuestCFrame = CFrame.new(5833.5776367188, 51.575191497803, -1102.7550048828),
            [1] = {
                Requirement = 1575,
                Mob = "Dragon Crew Warrior [Lv. 1575]",
                QuestCheck = "Dragon Crew Warrior",
            },
            [2] = {
                Requirement = 1600,
                Mob = "Dragon Crew Archer [Lv. 1600]",
                QuestCheck = "Dragon Crew Archer",
            },
        },
        
        [1625] = {
            ["Quest"] = "VenomCrewQuest",
            QuestCFrame = CFrame.new(5216.09521484375, 1004.1062622070312, 758.3895874023438),
            [1] = {
                Requirement = 1625,
                Mob = "Hydra Enforcer [Lv. 1625]",
                QuestCheck = "Hydra Enforcer",
            },
            [2] = {
                Requirement = 1650,
                Mob = "Venomous Assailant [Lv. 1650]",
                QuestCheck = "Venomous Assailant",
            },
            [3] = {
                Requirement = 1675,
                Boss = "Island Empress [Lv. 1675] [Boss]",
                QuestCheck = "Island Empress",
                ["Quest"] = "VenomCrewQuest",
                QuestCFrame = CFrame.new(5216.09521484375, 1004.1062622070312, 758.3895874023438),
            },
        },
        [1700] = {
            ["Quest"] = "MarineTreeIsland",
            QuestCFrame = CFrame.new(2179.2548828125, 28.701448440552, -6739.7299804688),
            [1] = {
                Requirement = 1700,
                Mob = "Marine Commodore [Lv. 1700]",
                QuestCheck = "Marine Commodore",
            },
            [2] = {
                Requirement = 1725,
                Mob = "Marine Rear Admiral [Lv. 1725]",
                QuestCheck = "Marine Rear Admiral",
            },
            [3] = {
                Requirement = 1750,
                Boss = "Kilo Admiral [Lv. 1750] [Boss]",
                QuestCheck = "Kilo Admiral",
                ["Quest"] = "MarineTreeIsland",
                QuestCFrame = CFrame.new(2179.2548828125, 28.701448440552, -6739.7299804688),
            },
        },
        [1775] = {
            ["Quest"] = "DeepForestIsland3",
            QuestCFrame = CFrame.new(-10580.998046875, 331.75863647461, -8758.193359375),
            [1] = {
                Requirement = 1775,
                Mob = "Fishman Raider [Lv. 1775]",
                QuestCheck = "Fishman Raider",
            },
            [2] = {
                Requirement = 1800,
                Mob = "Fishman Captain [Lv. 1800]",
                QuestCheck = "Fishman Captain",
            },
        },
        
        
        [1825] = {
            ["Quest"] = "DeepForestIsland",
            QuestCFrame = CFrame.new(-13231.467773438, 332.37414550781, -7626.6860351563),
            [1] = {
                Requirement = 1825,
                Mob = "Forest Pirate [Lv. 1825]",
                QuestCheck = "Forest Pirate",
            },
            [2] = {
                Requirement = 1850,
                Mob = "Mythological Pirate [Lv. 1850]",
                QuestCheck = "Mythological Pirate",
            },
            [3] = {
                Requirement = 1875,
                Boss = "Captain Elephant [Lv. 1875] [Boss]",
                QuestCheck = "Captain Elephant",
                ["Quest"] = "DeepForestIsland",
                QuestCFrame = CFrame.new(-13231.467773438, 332.37414550781, -7626.6860351563),
            },
        },
        [1900] = {
            ["Quest"] = "DeepForestIsland2",
            QuestCFrame = CFrame.new(-12683.189453125, 390.85668945313, -9902.15625),
            [1] = {
                Requirement = 1900,
                Mob = "Jungle Pirate [Lv. 1900]",
                QuestCheck = "Jungle Pirate",
            },
            [2] = {
                Requirement = 1925,
                Mob = "Musketeer Pirate [Lv. 1925]",
                QuestCheck = "Musketeer Pirate",
            },
            [3] = {
                Requirement = 1875,
                Boss = "Captain Elephant [Lv. 1875] [Boss]",
                QuestCheck = "Captain Elephant",
                ["Quest"] = "DeepForestIsland",
                QuestCFrame = CFrame.new(-13231.467773438, 332.37414550781, -7626.6860351563),
            },
        },
        [1975] = {
            ["Quest"] = "HauntedQuest1",
            QuestCFrame = CFrame.new(-9490.2793, 142.104858, 5565.8501),
            [1] = {
                Requirement = 1975,
                Mob = "Reborn Skeleton [Lv. 1975]",
                QuestCheck = "Reborn Skeleton",
            },
            [2] = {
                Requirement = 2000,
                Mob = "Living Zombie [Lv. 2000]",
                QuestCheck = "Living Zombie",
            },
        },
        [2025] = {
            ["Quest"] = "HauntedQuest2",
            QuestCFrame = CFrame.new(-9506.95313, 172.104858, 6074.63086),
            [1] = {
                Requirement = 2025,
                Mob = "Demonic Soul [Lv. 2025]",
                QuestCheck = "Demonic Soul",
            },
            [2] = {
                Requirement = 2050,
                Mob = "Posessed Mummy [Lv. 2050]",
                QuestCheck = "Posessed Mummy",
            },
        },
        [2075] = {
            ["Quest"] = "NutsIslandQuest",
            QuestCFrame = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875),
            [1] = {
                Requirement = 2075,
                Mob = "Peanut Scout [Lv. 2075]",
                QuestCheck = "Peanut Scout",
            },
            [2] = {
                Requirement = 2100,
                Mob = "Peanut President [Lv. 2100]",
                QuestCheck = "Peanut President",
            },
        },
        [2125] = {
            ["Quest"] = "IceCreamIslandQuest",
            QuestCFrame = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438),
            [1] = {
                Requirement = 2125,
                Mob = "Ice Cream Chef [Lv. 2125]",
                QuestCheck = "Ice Cream Chef",
            },
            [2] = {
                Requirement = 2150,
                Mob = "Ice Cream Commander [Lv. 2150]",
                QuestCheck = "Ice Cream Commander",
            },
            [3] = {
                Requirement = 2175,
                Boss = "Cake Queen [Lv. 2175] [Boss]",
                QuestCheck = "Cake Queen",
                ["Quest"] = "IceCreamIslandQuest",
                QuestCFrame = CFrame.new(-820.64825439453, 65.819526672363, -10965.79589843),
            },
        },
        [2200] = {
            ["Quest"] = "CakeQuest1",
            QuestCFrame = CFrame.new(-2021.32007, 37.7982254, -12028.7295),
            [1] = {
                Requirement = 2200,
                Mob = "Cookie Crafter [Lv. 2200]",
                QuestCheck = "Cookie Crafter",
            },
            [2] = {
                Requirement = 2225,
                Mob = "Cake Guard [Lv. 2225]",
                QuestCheck = "Cake Guard",
            },
            [3] = {
                Requirement = 2175,
                Boss = "Cake Queen [Lv. 2175] [Boss]",
                QuestCheck = "Cake Queen",
                ["Quest"] = "IceCreamIslandQuest",
                QuestCFrame = CFrame.new(-820.64825439453, 65.819526672363, -10965.79589843),
            },
        },
        [2250] = {
            ["Quest"] = "CakeQuest2",
            QuestCFrame = CFrame.new(-1927.91602, 37.7981339, -12842.5391),
            [1] = {
                Requirement = 2250,
                Mob = "Baking Staff [Lv. 2250]",
                QuestCheck = "Baking Staff",
            },
            [2] = {
                Requirement = 2275,
                Mob = "Head Baker [Lv. 2275]",
                QuestCheck = "Head Baker",
            },
            [3] = {
                Requirement = 2175,
                Boss = "Cake Queen [Lv. 2175] [Boss]",
                QuestCheck = "Cake Queen",
                ["Quest"] = "IceCreamIslandQuest",
                QuestCFrame = CFrame.new(-820.64825439453, 65.819526672363, -10965.79589843),
            },
        },
        [2300] = {
            ["Quest"] = "ChocQuest1",
            QuestCFrame = CFrame.new(231.2322235107422, 24.73427391052246, -12195.1396484375),
            [1] = {
                Requirement = 2300,
                Mob = "Cocoa Warrior [Lv. 2300]",
                QuestCheck = "Cocoa Warrior",
            },
            [2] = {
                Requirement = 2325,
                Mob = "Chocolate Bar Battler [Lv. 2325]",
                QuestCheck = "Chocolate Bar Battler",
            },
            [3] = {
                Requirement = 2175,
                Boss = "Cake Queen [Lv. 2175] [Boss]",
                QuestCheck = "Cake Queen",
                ["Quest"] = "IceCreamIslandQuest",
                QuestCFrame = CFrame.new(-820.64825439453, 65.819526672363, -10965.79589843),
            },
        },
        [2350] = {
            ["Quest"] = "ChocQuest2",
            QuestCFrame = CFrame.new(148.080322265625, 24.79383087158203, -12775.1650390625),
            [1] = {
                Requirement = 2350,
                Mob = "Sweet Thief [Lv. 2350]",
                QuestCheck = "Sweet Thief",
            },
            [2] = {
                Requirement = 2375,
                Mob = "Candy Rebel [Lv. 2375]",
                QuestCheck = "Candy Rebel",
            },
            [3] = {
                Requirement = 2175,
                Boss = "Cake Queen [Lv. 2175] [Boss]",
                QuestCheck = "Cake Queen",
                ["Quest"] = "IceCreamIslandQuest",
                QuestCFrame = CFrame.new(-820.64825439453, 65.819526672363, -10965.79589843),
            },
        },
        [2400] = {
            ["Quest"] = "CandyQuest1",
            QuestCFrame = CFrame.new(-1147.919677734375, 16.107261657714844, -14444.125),
            [1] = {
                Requirement = 2400,
                Mob = "Candy Pirate [Lv. 2400]",
                QuestCheck = "Candy Pirate",
            },
            [2] = {
                Requirement = 2425,
                Mob = "Snow Demon [Lv. 2425]",
                QuestCheck = "Snow Demon",
            },           
        },
        [2450] = {
            ["Quest"] = "CandyQuest1",
            QuestCFrame = CFrame.new(-1147.919677734375, 16.107261657714844, -14444.125),
            [1] = {
                Requirement = 2400,
                Mob = "Candy Pirate [Lv. 2400]",
                QuestCheck = "Candy Pirate",
            },
            [2] = {
                Requirement = 2425,
                Mob = "Snow Demon [Lv. 2425]",
                QuestCheck = "Snow Demon",
            },   
        },
        [2500] = {
            ["Quest"] = "TikiQuest2",
            QuestCFrame = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, -0, -0.999156058, 0, 1, -0, 0.999156058, 0, 0.0410757065),
            [1] = {
                Requirement = 2500,
                Mob = "Sun-kissed Warrior [Lv. 2500]",
                QuestCheck = "Sun-kissed Warrior"
            },
            [2] = {
                Requirement = 2525,
                Mob = "Isle Champion [Lv. 2525]",
                QuestCheck = "Isle Champion"
            },
        },
        [2550] = {
            ["Quest"] = "TikiQuest3",
            QuestCFrame = CFrame.new(-16665.1914, 104.596008, 1579.69397, -0.0822139978, 0, 0.996614754, 0, 1, 0, -0.996614754, 0, -0.0822139978),
            [1] = {
                Requirement = 2550,
                Mob = "Serpent Hunter [Lv. 2550]",
                QuestCheck = "Serpent Hunter",
            },
            [2] = {
                Requirement = 2575,
                Mob = "Skull Slayer [Lv. 2575]",
                QuestCheck = "Skull Slayer",
            },
        },
        [2600] = {
            ["Quest"] = "SubmergedQuest1",
            QuestCFrame = CFrame.new(10778.6904296875, -2087.720458984375, 9261.7314453125),
            [1] = {
                Requirement = 2600,
                Mob = "Reef Bandit [Lv. 2600]",
                QuestCheck = "Reef Bandit",
            },
            [2] = {
                Requirement = 2625,
                Mob = "Coral Pirate [Lv. 2625]",
                QuestCheck = "Coral Pirate",
            },
        },
        [2650] = {
            ["Quest"] = "SubmergedQuest2",
            QuestCFrame = CFrame.new(10884.7021484375, -2086.197021484375, 10031.9970703125),
            [1] = {
                Requirement = 2650,
                Mob = "Sea Chanter [Lv. 2650]",
                QuestCheck = "Sea Chanter",
            },
            [2] = {
                Requirement = 2675,
                Mob = "Ocean Prophet [Lv. 2675]",
                QuestCheck = "Ocean Prophet",
            },
        },
        [2700] = {
            ["Quest"] = "SubmergedQuest3",
            QuestCFrame = CFrame.new(9639.4833984375, -1992.4415283203125, 9617.130859375),
            [1] = {
                Requirement = 2700,
                Mob = "High Disciple [Lv. 2700]",
                QuestCheck = "High Disciple",
            },
            [2] = {
                Requirement = 2725,
                Mob = "Grand Devotee [Lv. 2725]",
                QuestCheck = "Grand Devotee",
            },
        },
    },
}
GameData.MapPos = {
    ["2753915549"] = {
        [0] = {
            ["NameIS"] = "Default",
            ["Pos"] = CFrame.new(977.038269, 16.5166149, 1420.94336),
        },
        [10] = {
            ["NameIS"] = "Jungle",
            ["Pos"] = CFrame.new(-1332.1394, 11.8529119, 492.35907),
        },
        [30] = {
            ["NameIS"] = "Pirate",
            ["Pos"] = CFrame.new(-1186.37769, 4.75154591, 3810.49243),
        },
        [60] = {
            ["NameIS"] = "Desert",
            ["Pos"] = CFrame.new(917.85199, 3.37914562, 4114.66895),
        },
        [90] = {
            ["NameIS"] = "Ice",
            ["Pos"] = CFrame.new(1107.42444, 7.3035593, -1164.79614),
        },
        [120] = {
            ["NameIS"] = "MarineBase",
            ["Pos"] = CFrame.new(-4922.20264, 41.2520523, 4424.44434),
        },
        [150] = {
            ["NameIS"] = "Sky",
            ["Pos"] = CFrame.new(-4916.79346, 717.671265, -2637.03589),
        },
        [190] = {
            ["NameIS"] = "Prison",
            ["Pos"] = CFrame.new(4853.1650390625, 5.652617931365967, 746.6735229492188),
        },
        [250] = {
            ["NameIS"] = "Colosseum",
            ["Pos"] = CFrame.new(-1393.48926, 7.28934002, -2842.57324),
        },
        [300] = {
            ["NameIS"] = "Magma",
            ["Pos"] = CFrame.new(-5226.26416, 8.59022045, 8472.14844),
        },
        [375] = {
            ["NameIS"] = nil,
            ["Pos"] = nil,
        },
        [450] = {
            ["NameIS"] = "Sky",
            ["Pos"] = CFrame.new(-4916.79346, 717.671265, -2637.03589),
        },
        [450] = {
            ["NameIS"] = "Sky2",
            ["Pos"] = CFrame.new(-7873.7959, 5545.49316, -335.85321),
        },
        [625] = {
            ["NameIS"] = "Fountain",
            ["Pos"] = CFrame.new(5187.77197, 38.5011406, 4141.60791),
        },
    },
    ["4442272183"] = {
        [700] = {
            ["NameIS"] = "Default",
            ["Pos"] = CFrame.new(-32.1582031, 29.2783928, 2766.5874),       
        },
        [775] = {
            ["NameIS"] = "DressTown",
            ["Pos"] = CFrame.new(-389.968658, 72.9961472, 1148.09241),       
        },
        [875] = {
            ["NameIS"] = "Greenb",
            ["Pos"] = CFrame.new(-2220.05884, 72.967804, -2709.98462),       
        },
        [950] = {
            ["NameIS"] = "Graveyard",
            ["Pos"] = CFrame.new(-5386.68799, 8.97076797, -713.903381),       
        },
        [1000] = {
            ["NameIS"] = "Snowy",
            ["Pos"] = CFrame.new(394.089142, 401.423676, -5313.98486),     
        },
        [1100] = {
            ["NameIS"] = "CircleIslandIce",
            ["Pos"] = CFrame.new(-5852.72803, 18.316433, -5030.0752),     
        },
        [1250] = {
            ["NameIS"] = "Ship",
            ["Pos"] = CFrame.new(864.63134765625, 125.05711364746094, 32858.4609375),     
        },
        [1350] = {
            ["NameIS"] = "IceCastle",
            ["Pos"] = CFrame.new(5573.96826, 28.1925011, -6111.41455),     
        },
        [1425] = {
            ["NameIS"] = "ForgottenIsland",
            ["Pos"] = CFrame.new(-3066.82715, 236.847992, -10159.6846),     
        },
    },
    ["7449423635"] = {
        [1500] = {
            ["NameIS"] = "Default",
            ["Pos"] = CFrame.new(-346.9264221191406, 29.412704467773438, 5377.86376953125),
        },
        [1575] = {
            ["NameIS"] = "Hydra3",
            ["Pos"] = CFrame.new(4727.12988, 51.453064, -1401.72839),
        },
        [1625] = {
            ["NameIS"] = "Hydra1",
            ["Pos"] = CFrame.new(5264.06396, 602.526245, 353.749878),
        },
        [1700] = {
            ["NameIS"] = "GreatTree",
            ["Pos"] = CFrame.new(2260.66162, 25.852705, -6416.6084),
        },
        [1775] = {
            ["NameIS"] = "BigMansion",
            ["Pos"] = CFrame.new(-12550.4844, 337.168365, -7425.26855),
        },
        [1900] = {
            ["NameIS"] = "PineappleTown",
            ["Pos"] = CFrame.new(-11374.4658, 331.723297, -10390.6523),
        },
        [1975] = {
            ["NameIS"] = "HauntedCastle",
            ["Pos"] = CFrame.new(-9540.20898, 142.104858, 5537.26318),
        },
        [2075] = {
            ["NameIS"] = "Peanut",
            ["Pos"] = CFrame.new(-2074.8999023438, 38.104068756104, -10210.8320312),
        },
        [2150] = {
            ["NameIS"] = "IceCream",
            ["Pos"] = CFrame.new(-910.46862792969, 58.945728302002, -10889.098632812),
        },
        [2225] = {
            ["NameIS"] = "Loaf",
            ["Pos"] = CFrame.new(-1895.603271484375, 37.79813766479492, -11885.45703125),
        },
        [2300] = {
            ["NameIS"] = "Chocolate",
            ["Pos"] = CFrame.new(501.06365966796875, 24.734277725219727, -12431.494140625)
        },
        [2400] = {
            ["NameIS"] = "CandyCane",
            ["Pos"] = CFrame.new(-1060.913818359375, 16.107261657714844, -14178.02734375),
        },
        [2450] = {
            ["NameIS"] = "Tiki",
            ["Pos"] = CFrame.new(-16256.5566, 9.06057358, 430.995422),
        },
        [2600] = {
            ["NameIS"] = "Submerged",
            ["Pos"] = CFrame.new(10884, -2086, 10031),
        }
    },
}
GameData.SpawnPosition = {
    ["2753915549"] = {
        ["Pirate [Lv. 35]"] = { "-1269.51318359375, 5.60001277923584, 3857.15771484375", "-967.43310546875, 13.599993705749512, 4034.2470703125", "-972.43310546875, 13.599993705749512, 3939.2470703125", "-1140.51318359375, 5.60001277923584, 3902.15771484375", "-1289.51318359375, 5.60001277923584, 3940.15771484375", "-1182.51318359375, 5.60001277923584, 3972.15771484375" },
        ["Royal Soldier [Lv. 550]"] = { "-7759.458984375, 5606.9365234375, -1862.7027587890625", "-7762.33984375, 5606.9365234375, -1721.01318359375", "-7916.9501953125, 5606.9365234375, -1721.0130615234375", "-7936.9501953125, 5606.9365234375, -1625.0130615234375", "-7946.9501953125, 5606.9365234375, -1824.0130615234375" },
        ["God's Guard [Lv. 450]"] = { "-4820.5673828125, 844.13525390625, -2049.015380859375", "-4863.4169921875, 844.13525390625, -1909.6802978515625", "-4830.609375, 844.13525390625, -1779.0906982421875", "-4700.3125, 844.13525390625, -1792.79638671875", "-4583.8720703125, 843.195556640625, -1938.433837890625", "-4616.88671875, 844.13525390625, -2043.19140625" },
        ["Gorilla [Lv. 20]"] = { "-1249.1898193359375, 8.230012893676758, -456.1899719238281", "-1249.1898193359375, 8.230012893676758, -549.6799926757812", "-1363.1898193359375, 20.230012893676758, -486.1899719238281", "-1186.61865234375, 11.067436218261719, -650.2750854492188" },
        ["Trainee [Lv. 5]"] = { "-2857.82373046875, 41.861534118652344, 2122.80029296875", "-2965.82373046875, 41.861534118652344, 2170.80029296875", "-2888.82373046875, 41.861534118652344, 2226.80029296875", "-2820.250732421875, 24.28679656982422, 2172.480712890625", "-2788.250732421875, 24.28679656982422, 2281.480712890625", "-2726.250732421875, 24.28679656982422, 2238.480712890625", "-2966.090087890625, 39.3367805480957, 2319.310791015625" },
        ["Sky Bandit [Lv. 150]"] = { "-5081.96875, 277.91455078125, -2938.905517578125", "-4944.96875, 277.91455078125, -2784.905517578125", "-4860.96875, 277.91455078125, -2904.905517578125", "-5119.646484375, 274.91455078125, -2809.840576171875" },
        ["Toga Warrior [Lv. 250]"] = { "-2056.187255859375, 7.8789567947387695, -2713.576416015625", "-1838.7723388671875, 7.8789567947387695, -2669.1689453125", "-2128.41064453125, 7.878957271575928, -2853.247802734375", "-1799.861572265625, 7.8789567947387695, -2852.525146484375", "-1672.9788818359375, 7.8789567947387695, -2683.60498046875" },
        ["Monkey [Lv. 14]"] = { "-1202.499755859375, 10.900012969970703, 278.8699645996094", "-1292.669921875, 10.900012016296387, -4.8499908447265625", "-1801.07958984375, 20.980009078979492, 111.2900161743164", "-1743.529541015625, 20.980009078979492, -91.26998138427734", "-1610.469970703125, 20.980009078979492, -48.04999542236328", "-1579.2193603515625, 20.980010986328125, 377.60003662109375", "-1489.249755859375, 20.980009078979492, 88.49000549316406" },
        ["Dark Master [Lv. 175]"] = { "-5244.18017578125, 389.50006103515625, -2155.01416015625", "-5171.18017578125, 389.50006103515625, -2243.01416015625", "-5234.18017578125, 389.50006103515625, -2367.01416015625", "-5339.18017578125, 389.5, -2258.01416015625" },
        ["Galley Captain [Lv. 650]"] = { "5892.3544921875, 39.93544006347656, 4951.92333984375", "5352.00830078125, 39.34882354736328, 4929.39892578125", "5417.00830078125, 61.34882354736328, 4780.39892578125", "5922.3720703125, 58.93544006347656, 4765.84130859375", "5954.96240234375, 39.349098205566406, 4882.10205078125", "5792.3544921875, 58.93544006347656, 4823.92333984375", "5584.00830078125, 60.34881591796875, 4856.39892578125", "5557.00830078125, 39.34882354736328, 4996.39892578125" },
        ["Royal Squad [Lv. 525]"] = { "-7842.9501953125, 5606.9365234375, -1403.0130615234375", "-7724.9501953125, 5606.9365234375, -1511.0130615234375", "-7527.9501953125, 5606.9365234375, -1539.0130615234375", "-7513.9501953125, 5606.9365234375, -1421.0130615234375", "-7669.9501953125, 5606.9365234375, -1379.0130615234375" },
        ["Galley Pirate [Lv. 625]"] = { "5654.07275390625, 39.348819732666016, 3914.322021484375", "5838.07275390625, 39.348819732666016, 3914.322021484375", "5348.28271484375, 39.348819732666016, 3953.255126953125", "5483.07275390625, 55.34881591796875, 4059.322021484375", "5522.07275390625, 39.348819732666016, 3934.322021484375", "5717.07275390625, 57.34881591796875, 4042.322021484375" },
        ["Prisoner [Lv. 190]"] = { "5351.63671875, -0.29998499155044556, 391.106201171875", "5224.7568359375, -0.29998499155044556, 449.44921875", "5089.77880859375, -0.29998496174812317, 423.6646728515625", "5067.125, -0.2999846935272217, 546.4658813476562", "4937.3193359375, -0.4999849796295166, 649.5751342773438" },
        ["Bandit [Lv. 5]"] = { "1341.8011474609375, 16.681461334228516, 1568.909423828125", "1232.51708984375, 16.681461334228516, 1539.7890625", "1123.517578125, 16.681461334228516, 1665.0888671875", "1019.7772216796875, 16.68145751953125, 1566.62890625", "1219.017578125, 16.681461334228516, 1677.4892578125", "934.427490234375, 16.68145751953125, 1517.1414794921875", "1102.039794921875, 16.68145751953125, 1589.462646484375", "1331.8431396484375, 16.68145751953125, 1497.9910888671875", "950.2860107421875, 16.68145751953125, 1625.2266845703125", "1284.3343505859375, 16.681461334228516, 1627.64501953125" },
        ["Gladiator [Lv. 275]"] = { "-1228.0865478515625, 7.946243762969971, -3051.790771484375", "-1483.7042236328125, 7.946243762969971, -3195.212158203125", "-1125.0712890625, 7.946243762969971, -3270.250244140625", "-1356.9586181640625, 7.946243762969971, -3590.606201171875", "-1370.3577880859375, 7.946243762969971, -3377.359375" },
        ["Brute [Lv. 45]"] = { "-979.71533203125, 15.599998474121094, 4234.755859375", "-862.8901977539062, 15.599998474121094, 4281.9560546875", "-1397.734130859375, 15.599998474121094, 4185.5849609375", "-1191.412353515625, 15.599998474121094, 4235.50927734375", "-1230.371337890625, 15.599998474121094, 4331.93701171875", "-1048.6434326171875, 15.599998474121094, 4405.359375" },
        ["Military Soldier [Lv. 300]"] = { "-5413.6005859375, 9.100017547607422, 8591.2646484375", "-5287.19970703125, 9.100017547607422, 8659.865234375", "-5565.6015625, 9.100017547607422, 8327.5693359375", "-5667.80029296875, 9.100017547607422, 8428.666015625", "-5439.8017578125, 9.100017547607422, 8349.1689453125" },
        ["Fishman Commando [Lv. 400]"] = { "61785.90234375, 18.080078125, 1284.111328125", "62051.90234375, 18.080078125, 1422.111328125", "61976.90234375, 18.080078125, 1617.111328125", "61697.8984375, 18.080078125, 1519.111328125", "61760.8984375, 18.080078125, 1460.111328125", "61858.8984375, 18.080078125, 1695.111328125" },
        ["Fishman Warrior [Lv. 375]"] = { "60788.90234375, 17.94921875, 1526.111328125", "60841.90234375, 17.94921875, 1651.111328125", "60943.90234375, 17.94921875, 1744.111328125", "60906.90234375, 17.94921875, 1469.111328125", "60948.90234375, 17.94921875, 1377.111328125", "60840.90234375, 17.94921875, 1301.111328125", "60927.90234375, 17.94921875, 1179.111328125" },
        ["Shanda [Lv. 475]"] = { "-7595.154296875, 5546.34130859375, -653.5570068359375", "-7725.43017578125, 5546.34130859375, -586.8939208984375", "-7795.7646484375, 5546.34130859375, -486.4461975097656", "-7710.7646484375, 5546.34130859375, -336.4461975097656", "-7564.56201171875, 5546.34130859375, -417.35198974609375", "-7539.62109375, 5546.34130859375, -515.81689453125" },
        ["Military Spy [Lv. 325]"] = { "-5917.7041015625, 78.50004577636719, 8844.5693359375", "-5806.70068359375, 78.50004577636719, 8904.4697265625", "-5857.3037109375, 78.50004577636719, 8775.9677734375", "-5787.00537109375, 78.50004577636719, 8651.6630859375" },
        ["Chief Petty Officer [Lv. 120]"] = { "-4805.2421875, 20.5, 3993.880615234375", "-5121.3505859375, 20.5, 4059.597900390625", "-4989.3134765625, 20.5, 3947.639892578125", "-4923.107421875, 20.5, 4076.941650390625", "-4808.6650390625, 20.5, 4540.44921875", "-4873.90869140625, 20.5, 4655.7236328125", "-4614.81103515625, 20.5, 4416.05712890625", "-4633.921875, 20.5, 4551.83349609375" },
        ["Snowman [Lv. 100]"] = { "1148.2493896484375, 106.80999755859375, -1429.319580078125", "1190.08935546875, 106.80999755859375, -1626.5806884765625", "1035.978515625, 106.80999755859375, -1489.359619140625", "1265.4893798828125, 106.80999755859375, -1483.4197998046875" },
        ["Snow Bandit [Lv. 90]"] = { "1458.7076416015625, 88.79003143310547, -1447.1497802734375", "1199.32763671875, 88.79003143310547, -1329.03759765625", "1273.747802734375, 88.79003143310547, -1345.840087890625", "1316.162841796875, 88.79003143310547, -1396.5244140625", "1381.32470703125, 88.79003143310547, -1464.943359375" },
        ["Dangerous Prisoner [Lv. 210]"] = { "5554.5029296875, -0.4999849796295166, 584.723388671875", "5645.556640625, -0.4999849796295166, 764.613525390625", "5442.03857421875, -0.4999847412109375, 1078.8802490234375", "5561.36572265625, -0.4999849796295166, 964.7432250976562", "4955.9150390625, -0.4999847412109375, 925.52978515625", "5485.28271484375, -0.4999847412109375, 468.0664978027344", "5099.65673828125, -0.4999847412109375, 1055.7525634765625" }
    },
    ["4442272183"] = {
        ["Lab Subordinate [Lv. 1100]"] = { "-5590.3037109375, 14.292499542236328, -4436.53466796875", "-5640.390625, 14.292499542236328, -4680.9375", "-5897.822265625, 14.292499542236328, -4554.6240234375", "-5963.48046875, 14.292499542236328, -4340.27587890625", "-5766.35302734375, 14.292499542236328, -4249.67041015625" },
        ["Ship Engineer [Lv. 1275]"] = { "815.62890625, 43.692771911621094, 33111.33984375", "729.23046875, 43.69268035888672, 32950.34375", "834.796875, 43.69255828857422, 32720.92578125", "1025.6572265625, 43.69258117675781, 32740.85546875", "1088.251708984375, 43.69266891479492, 32890.09375", "1016.777587890625, 43.69276809692383, 33074.1328125" },
        ["Winter Warrior [Lv. 1050]"] = { "1142.4378662109375, 428.80767822265625, -5043.052734375", "1043.3046875, 428.80767822265625, -5049.7861328125", "1205.4586181640625, 428.80767822265625, -5397.35888671875", "1371.870849609375, 428.80767822265625, -5194.70263671875", "1446.2698974609375, 428.80767822265625, -5369.21533203125", "1226.30908203125, 428.80767822265625, -5215.9755859375" },
        ["Arctic Warrior [Lv. 1350]"] = { "5994.5888671875, 27.55978012084961, -6324.279296875", "6095.52587890625, 27.55978012084961, -6077.94140625", "6271.31689453125, 27.55978012084961, -6151.5380859375", "6167.22216796875, 27.55978012084961, -6319.22998046875", "5832.19580078125, 27.55978012084961, -6241.28955078125" },
        ["Mercenary [Lv. 725]"] = { "-913.7650146484375, 72.87559509277344, 1574.1514892578125", "-1085.1514892578125, 72.87559509277344, 1696.3944091796875", "-924.6840209960938, 72.87559509277344, 1788.1241455078125", "-1135.9444580078125, 72.87559509277344, 1248.3272705078125", "-1209.20458984375, 72.87559509277344, 1073.0367431640625", "-986.7745361328125, 72.87559509277344, 1088.446533203125" },
        ["Swan Pirate [Lv. 775]"] = { "967.173828125, 72.96783447265625, 1180.7564697265625", "984.63037109375, 72.80776977539062, 1401.6826171875", "823.6122436523438, 72.80776977539062, 1162.2205810546875", "1063.189453125, 72.80776977539062, 1399.762939453125", "1066.994384765625, 72.80776977539062, 1080.91796875", "827.80029296875, 72.80776977539062, 1326.8966064453125" },
        ["Marine Lieutenant [Lv. 875]"] = { "-3012.852294921875, 71.01408386230469, -2921.832275390625", "-3258.5498046875, 71.01408386230469, -2990.86669921875", "-2766.0703125, 71.01408386230469, -3144.748779296875", "-2932.50048828125, 71.01408386230469, -2604.09619140625", "-2583.945068359375, 71.01408386230469, -3039.6181640625" },
        ["Zombie [Lv. 950]"] = { "-5614.96044921875, 49.30769729614258, -938.4688720703125", "-5766.6494140625, 47.500980377197266, -824.6622924804688", "-5761.99169921875, 49.30769729614258, -654.9384765625", "-5595.60009765625, 49.30769729614258, -524.2483520507812", "-5856.5888671875, 70.35081481933594, -739.050048828125", "-5512.23193359375, 49.30769729614258, -847.97802734375" },
        ["Ship Steward [Lv. 1300]"] = { "986.8828125, 125.8344497680664, 33366.953125", "801.38330078125, 125.8344497680664, 33505.1796875", "918.6671752929688, 125.8344497680664, 33506.50390625", "1032.457763671875, 125.8344497680664, 33512.39453125", "815.0006713867188, 125.8344497680664, 33376.203125" },
        ["Marine Captain [Lv. 900]"] = { "-1928.388916015625, 73.01405334472656, -3119.57958984375", "-2103.933837890625, 73.01405334472656, -3259.303466796875", "-2030.2476806640625, 73.01405334472656, -3477.634765625", "-1601.3172607421875, 73.01405334472656, -3315.3251953125", "-1805.3643798828125, 73.01405334472656, -3313.325439453125" },
        ["Snow Lurker [Lv. 1375]"] = { "5443.421875, 27.55978012084961, -7031.28466796875", "5763.845703125, 27.55978012084961, -6671.0458984375", "5524.1572265625, 27.55978012084961, -6583.82080078125", "5567.857421875, 27.55978012084961, -6900.46533203125", "5484.41845703125, 27.55978012084961, -6733.74951171875" },
        ["Factory Staff [Lv. 800]"] = { "692.1103515625, 72.80769348144531, 227.75210571289062", "936.1103515625, 72.80769348144531, -71.24789428710938", "386.1103210449219, 72.80769348144531, 91.75210571289062", "-426.8896789550781, 72.80769348144531, -367.2478942871094", "-105.88967895507812, 72.80769348144531, -670.2479248046875", "-93.88967895507812, 72.80769348144531, -34.22792053222656" },
        ["Sea Soldier [Lv. 1425]"] = { "-3293.0498046875, 5.909453392028809, -9640.931640625", "-3240.3310546875, 27.452720642089844, -9813.9658203125", "-2550.921875, 28.452720642089844, -9839.9970703125", "-3459.692138671875, 25.62852668762207, -9934.7724609375", "-2840.09228515625, 27.452720642089844, -9814.380859375", "-3499.348388671875, 16.08629035949707, -9712.005859375" },
        ["Ship Officer [Lv. 1325]"] = { "657.529296875, 179.90567016601562, 33460.6328125", "505.529296875, 179.90567016601562, 33263.6328125", "694.529296875, 179.90567016601562, 33112.6328125", "1162.529296875, 179.90567016601562, 33445.6015625", "1320.529296875, 179.90567016601562, 33294.6015625", "1144.529296875, 179.90567016601562, 33112.6015625" },
        ["Ship Deckhand [Lv. 1250]"] = { "580.298828125, 125.57708740234375, 33124.25", "719.298828125, 125.57708740234375, 33032.109375", "1157.298828125, 125.57708740234375, 32930.109375", "1259.298828125, 125.57708740234375, 33032.109375", "1247.298828125, 125.57708740234375, 33218.109375", "1176.298828125, 125.57708740234375, 33119.109375", "580.298828125, 125.57708740234375, 32930.109375" },
        ["Water Fighter [Lv. 1450]"] = { "-3657.9501953125, 239.13833618164062, -10591.1474609375", "-3511.958984375, 239.13833618164062, -10346.9287109375", "-3316.75390625, 239.13833618164062, -10323.1689453125", "-3331.70458984375, 239.13833618164062, -10553.3564453125", "-3396.35888671875, 239.13833618164062, -10745.10546875" },
        ["Raider [Lv. 700]"] = { "-607.4367065429688, 40.007755279541016, 2202.435302734375", "-917.4367065429688, 40.007755279541016, 2250.435302734375", "-904.336669921875, 40.007755279541016, 2501.435302734375", "-612.4367065429688, 40.007755279541016, 2557.435302734375" },
        ["Magma Ninja [Lv. 1175]"] = { "-5097.60986328125, 14.292500495910645, -6117.45654296875", "-5206.634765625, 14.292499542236328, -5976.99072265625", "-5259.78369140625, 14.292499542236328, -6288.5830078125" },
        ["Snow Trooper [Lv. 1000]"] = { "572.6925048828125, 400.80767822265625, -5605.20654296875", "716.6273193359375, 400.80767822265625, -5706.44140625", "642.6663818359375, 400.80767822265625, -5454.4892578125", "484.3445739746094, 400.80767822265625, -5472.41552734375", "445.9443359375, 442.80767822265625, -5553.90576171875", "430.40191650390625, 400.80767822265625, -5069.0947265625", "392.2192687988281, 400.80767822265625, -5207.68505859375" },
        ["Vampire [Lv. 975]"] = { "-6132.39453125, 9.007694244384766, -1466.169189453125", "-5952.99462890625, 9.007694244384766, -1568.5291748046875", "-6277.263671875, 9.007694244384766, -1269.44921875", "-6039.689453125, 9.007694244384766, -1099.1590576171875", "-5776.55224609375, 9.007694244384766, -1373.4498291015625" },
        ["Horned Warrior [Lv. 1125]"] = { "-6499.001953125, 14.292499542236328, -5512.51171875", "-6589.38671875, 14.292499542236328, -5718.66650390625", "-6516.3408203125, 14.292499542236328, -5868.70458984375", "-6093.66748046875, 14.292499542236328, -6061.12353515625", "-6221.7490234375, 14.292499542236328, -5951.302734375", "-6331.76513671875, 14.292499542236328, -5778.94189453125" },
    
    },
    ["7449423635"] = {
        ["Isle Champion [Lv. 2525]"] = { "-16618.74609375, 58.377708435058594, 1099.5087890625", "-16735.67578125, 23.346088409423828, 1110.5850830078125", "-16787.3203125, 25.204872131347656, 992.1318359375", "-16940.798828125, 14.192967414855957, 1070.8662109375", "-16901.23046875, 12.45141887664795, 969.9686279296875" },
        ["Isle Outlaw [Lv. 2450]"] = { "-16351.77734375, 23.49412727355957, -282.4541015625", "-16433.71875, 57.22137451171875, -195.47314453125", "-16122.4052734375, 11.778807640075684, -257.353515625", "-16289.48828125, 22.874197006225586, -179.4443359375", "-16163.4248046875, 11.945096969604492, -99.35986328125" },
        ["Island Boy [Lv. 2475]"] = { "-16991.73046875, 12.766878128051758, -186.18252563476562", "-16736.21875, 22.171125411987305, -131.72105407714844", "-16661.57421875, 57.37247085571289, -252.96337890625", "-16883.048828125, 23.34747314453125, -250.8740234375", "-16905.3046875, 13.09433364868164, -73.5067367553711" },
        ["Sun-kissed Warrior [Lv. 2500]"] = { "-16153.365234375, 14.465398788452148, 942.4479370117188", "-16052.4560546875, 9.817989349365234, 1061.91259765625", "-16413.5078125, 56.710662841796875, 1054.435546875", "-16186.4208984375, 25.10376739501953, 1098.0830078125", "-16357.3125, 21.019332885742188, 1005.65087890625" },
        ["Pirate Millionaire [Lv. 1500]"] = { "-445.27423095703125, 42.67793273925781, 5511.88427734375", "-543.5744018554688, 43.67792892456055, 5639.18310546875", "-679.28759765625, 43.67792892456055, 5552.123046875", "-132.4427032470703, 43.67792892456055, 5596.91552734375", "-615.337158203125, 43.67793273925781, 5429.96484375", "21.131032943725586, 43.67792892456055, 5738.74609375", "53.43482971191406, 43.67792892456055, 5632.0107421875" },
        ["Pistol Billionaire [Lv. 1525]"] = { "-776.255615234375, 73.67793273925781, 5965.5029296875", "-991.5869140625, 73.67793273925781, 5755.0205078125", "56.2892951965332, 73.67793273925781, 6014.0615234375", "-569.86669921875, 73.67793273925781, 5900.66748046875", "-140.91534423828125, 73.67793273925781, 6018.48291015625", "-354.0088195800781, 73.67793273925781, 5961.24853515625", "5.966832637786865, 73.67793273925781, 6134.5986328125", "93.9766845703125, 73.67793273925781, 6249.533203125" },
        ["Jungle Pirate [Lv. 1900]"] = { "-12142.458984375, 331.60296630859375, -10419.9111328125", "-11918.103515625, 332.51800537109375, -10744.08984375", "-11612.466796875, 335.82196044921875, -10489.4091796875", "-11902.2734375, 331.2919616699219, -10432.0673828125", "-12321.3115234375, 331.43658447265625, -10669.2548828125", "-12306.3486328125, 331.071533203125, -10352.8779296875", "-11708.431640625, 331.8750305175781, -10700.0517578125" },
        ["Candy Rebel [Lv. 2375]"] = { "166.8196563720703, 25.58249855041504, -13035.345703125", "220.3782196044922, 26.58249855041504, -12913.9658203125", "52.998046875, 26.58249855041504, -12851.67578125", "-72.12920379638672, 25.58249855041504, -12940.32421875", "47.92314529418945, 25.58249855041504, -13029.240234375" },
        ["Chocolate Bar Battler [Lv. 2325]"] = { "701.3120727539062, 25.58249855041504, -12708.21484375", "806.958984375, 25.58249855041504, -12773.078125", "833.198486328125, 25.58249855041504, -12671.404296875", "717.5152587890625, 25.58249855041504, -12557.6708984375", "582.8286743164062, 25.58249855041504, -12550.7041015625", "598.833251953125, 25.58249855041504, -12395.12109375" },
        ["Head Baker [Lv. 2275]"] = { "-2263.3544921875, 51.00957489013672, -12711.3916015625", "-2100.70458984375, 51.00957489013672, -12720.9658203125", "-2389.2294921875, 51.00957489013672, -13018.3349609375", "-2251.576171875, 51.00957489013672, -13033.3974609375", "-2151.3779296875, 51.00957489013672, -13033.3974609375", "-2369.090087890625, 51.00957489013672, -12807.921875" },
        ["Candy Pirate [Lv. 2400]"] = { "-1437.5634765625, 17.148128509521484, -14385.693359375", "-1370.880859375, 17.148128509521484, -14477.8525390625", "-1291.90576171875, 17.148128509521484, -14384.1708984375", "-1412.2529296875, 17.148128509521484, -14704.599609375", "-1298.1181640625, 17.148128509521484, -14801.283203125", "-1254.3702392578125, 17.148128509521484, -14691.8759765625" },
        ["Posessed Mummy [Lv. 2050]"] = { "-9399.6474609375, 12.197922706604004, 6118.810546875", "-9449.3515625, 5.952804088592529, 6342.9736328125", "-9609.3515625, 5.952804088592529, 6361.9736328125", "-9759.3515625, 26.952804565429688, 6368.9736328125", "-9759.3515625, 26.952804565429688, 6051.9736328125" },
        ["Baking Staff [Lv. 2250]"] = { "-1774.078125, 34.66530990600586, -12850.4521484375", "-1759.3228759765625, 34.66530990600586, -12994.7021484375", "-1720.8507080078125, 34.66530990600586, -13087.125", "-1847.177978515625, 34.66530990600586, -13132.50390625", "-1980.4375, 34.66530990600586, -12983.8408203125", "-1828.8009033203125, 34.66530990600586, -12699.4375" },
        ["Forest Pirate [Lv. 1825]"] = { "-13345.5419921875, 332.2262268066406, -7630.7578125", "-13279.54296875, 332.2262268066406, -7897.7578125", "-13600.54296875, 332.2262268066406, -7741.75830078125", "-13651.54296875, 332.2262268066406, -7894.75830078125", "-13513.54296875, 332.2262268066406, -8008.7578125", "-13105.54296875, 332.2262268066406, -7705.7568359375" },
        ["Cookie Crafter [Lv. 2200]"] = { "-2499.169189453125, 37.005104064941406, -12165.0185546875", "-2423.398681640625, 37.005104064941406, -12265.7666015625", "-2321.7119140625, 37.005104064941406, -12216.7841796875", "-2246.3740234375, 37.005104064941406, -12126.94140625", "-2342.87255859375, 37.005104064941406, -12009.23828125", "-2212.8896484375, 37.005104064941406, -11969.2568359375", "-2464.476806640625, 37.005104064941406, -12049.9326171875" },
        ["Cocoa Warrior [Lv. 2300]"] = { "-125.0068359375, 26.225465774536133, -12345.80859375", "-128.67041015625, 26.225465774536133, -12249.8134765625", "34.84403991699219, 26.225465774536133, -12169.6630859375", "167.978515625, 26.225465774536133, -12238.8740234375", "6.332009315490723, 26.225465774536133, -12305.208984375" },
        ["Candy Rebel [Lv. 2375]"] = { "47.92314529418945, 25.58249855041504, -13029.240234375", "52.998046875, 26.58249855041504, -12851.67578125", "220.3782196044922, 26.58249855041504, -12913.9658203125", "166.8196563720703, 25.58249855041504, -13035.345703125", "-72.12920379638672, 25.58249855041504, -12940.32421875" },
        ["Ice Cream Chef [Lv. 2125]"] = { "-502.40997314453125, 64.55926513671875, -10873.794921875", "-1109.287109375, 64.55926513671875, -10931.265625", "-797.03125, 64.55926513671875, -10790.724609375", "-931.744873046875, 64.55926513671875, -11146.73046875", "-966.2890625, 64.55926513671875, -10973.5576171875", "-715.43359375, 64.55926513671875, -10920.435546875" },
        ["Musketeer Pirate [Lv. 1925]"] = { "-13337.8818359375, 472.0621643066406, -9698.6611328125", "-13556.078125, 391.3937072753906, -9735.9443359375", "-13270.8818359375, 472.0621643066406, -9860.6611328125", "-13198.6435546875, 391.3937072753906, -9602.2958984375", "-13417.6435546875, 391.3937072753906, -9962.2958984375", "-13514.8681640625, 403.4041748046875, -9866.51953125", "-13075.6435546875, 391.3937072753906, -9890.2958984375" },
        ["Sweet Thief [Lv. 2350]"] = { "88.47167205810547, 25.58249855041504, -12662.20703125", "143.9703369140625, 25.58249855041504, -12531.720703125", "-140.25830078125, 25.58249855041504, -12652.3115234375", "-77.64675903320312, 25.58249855041504, -12765.6201171875", "5.366209030151367, 25.58249855041504, -12537.42578125" },
        ["Fishman Raider [Lv. 1775]"] = { "-10853.8564453125, 332.60296630859375, -8425.240234375", "-10117.947265625, 332.60296630859375, -8174.68603515625", "-10603.64453125, 332.60296630859375, -8309.1259765625", "-10523.755859375, 332.60296630859375, -8597.5888671875", "-10391.73828125, 332.60296630859375, -8212.2763671875", "-10223.1142578125, 332.60296630859375, -8482.5458984375" },
        ["Living Zombie [Lv. 2000]"] = { "-10184.1015625, 152.95281982421875, 5741.9296875", "-10061.90234375, 140.1746826171875, 6038.626953125", "-10205.1015625, 151.95281982421875, 5861.9296875", "-10170.90234375, 141.1746826171875, 6159.626953125", "-9956.1015625, 140.95281982421875, 5966.9296875", "-10293.1015625, 152.95281982421875, 5960.9296875" },
        ["Cake Guard [Lv. 2225]"] = { "-1736.5443115234375, 35.21882247924805, -12249.060546875", "-1418.51123046875, 35.21882247924805, -12255.71875", "-1471.1275634765625, 35.21882247924805, -12436.84375", "-1693.98046875, 35.21882247924805, -12436.84375", "-1531.411376953125, 35.21882247924805, -12132.439453125" },
        ["Marine Commodore [Lv. 1700]"] = { "2220.769775390625, 73.01031494140625, -7445.7548828125", "2391.769775390625, 73.01031494140625, -7901.7548828125", "2904.5673828125, 73.01033020019531, -7889.30859375", "3175.78173828125, 73.01032257080078, -7878.54736328125", "2254.76953125, 73.01032257080078, -6894.66015625", "2460.76953125, 73.01031494140625, -7220.7548828125", "2604.76953125, 73.01031494140625, -7688.7548828125" },
        ["Training Dummy [Lv. 1500]"] = { "3758.32470703125, 91.5133056640625, 255.39100646972656" },
        ["Snow Demon [Lv. 2425]"] = { "-808.7568359375, 17.148128509521484, -14688.9287109375", "-927.0015869140625, 17.148128509521484, -14763.421875", "-916.22265625, 17.148128509521484, -14638.8125", "-848.005859375, 17.148128509521484, -14407.21484375", "-901.3642578125, 17.148128509521484, -14307.916015625", "-800.322998046875, 17.148128509521484, -14291.1259765625" },
        ["Peanut President [Lv. 2100]"] = { "-1993.406005859375, 37.22210693359375, -10682.9052734375", "-1874.362060546875, 37.22210693359375, -10596.576171875", "-1996.069580078125, 37.22210693359375, -10496.9267578125", "-2395.123779296875, 87.37577819824219, -10456.306640625", "-2311.986572265625, 87.32262420654297, -10609.3427734375", "-2247.476318359375, 87.32262420654297, -10440.8681640625" },
        ["Mythological Pirate [Lv. 1850]"] = { "-13221.03125, 519.10302734375, -6689.01611328125", "-13320.0302734375, 519.10302734375, -6785.017578125", "-13221.0302734375, 519.10302734375, -6902.017578125", "-13456.0498046875, 469.4332275390625, -7039.96435546875", "-13732.0478515625, 469.4332275390625, -6826.96484375", "-13876.0478515625, 469.4332275390625, -7009.96484375" },
        ["Reborn Skeleton [Lv. 1975]"] = { "-8868.1015625, 140.95281982421875, 6034.9296875", "-8682.1015625, 140.95281982421875, 5968.9296875", "-8646.1015625, 140.95281982421875, 5850.9296875", "-8762.6572265625, 141.6120147705078, 6183.34033203125", "-8710.1015625, 140.95281982421875, 6112.9296875", "-8811.5654296875, 143.10498046875, 5871.75341796875", "-8826.1015625, 140.95281982421875, 6165.9296875" },
        ["Fishman Captain [Lv. 1800]"] = { "-11210.2685546875, 331.82598876953125, -9072.7119140625", "-11135.2001953125, 331.82598876953125, -9240.88671875", "-10828.1064453125, 331.82598876953125, -9049.146484375", "-10736.6728515625, 331.82598876953125, -8807.5791015625", "-11107.8544921875, 331.82598876953125, -8842.916015625", "-11072.599609375, 331.8260192871094, -8610.072265625" },
        ["Dragon Crew Warrior [Lv. 1575]"] = { "4279.080078125, 51.61625289916992, -1490.453857421875", "4305.994140625, 51.61625289916992, -1242.9735107421875", "3930.806640625, 51.61625289916992, -1237.3629150390625", "6384.353515625, 51.61625289916992, -1552.883544921875", "6527.7119140625, 52.61625289916992, -1121.532470703125", "6005.84912109375, 52.61625289916992, -1641.8045654296875", "6356.71142578125, 52.61625289916992, -923.5322265625", "6644.71142578125, 52.61625289916992, -929.532470703125" },
        ["Ice Cream Commander [Lv. 2150]"] = { "-883.6304321289062, 70.14082336425781, -11485.525390625", "-528.7485961914062, 65.47904968261719, -11348.9228515625", "-366.8133544921875, 64.6534194946289, -11094.4228515625", "-675.09716796875, 67.66691589355469, -11371.724609375", "-770.4150390625, 125.61077117919922, -11159.8408203125", "-657.5498046875, 129.7410430908203, -11215.7919921875" },
        ["Giant Islander [Lv. 1650]"] = { "5275.6455078125, 604.7410888671875, -166.6568603515625", "5018.2265625, 604.79296875, -322.55908203125", "4847.2265625, 604.79296875, -163.55908203125", "4619.2265625, 604.79296875, -28.5589599609375", "5395.6455078125, 613.7410888671875, -247.6568603515625", "4745.4345703125, 604.79296875, 147.23529052734375" },
        ["Marine Rear Admiral [Lv. 1725]"] = { "3786.447265625, 160.37086486816406, -7283.22119140625", "3474.447021484375, 160.37086486816406, -7253.22119140625", "3396.447265625, 160.37086486816406, -7022.22119140625", "3192.9521484375, 73.01032257080078, -6812.322265625", "3366.952392578125, 73.01032257080078, -6611.322265625", "3520.554443359375, 157.32666015625, -6782.91943359375", "3915.447265625, 160.37086486816406, -6812.220703125", "3916.88525390625, 188.24818420410156, -7081.7158203125" },
        ["Female Islander [Lv. 1625]"] = { "4548.8564453125, 765.579345703125, 264.39056396484375", "5842.7529296875, 781.6395263671875, 843.773681640625", "5578.7529296875, 781.6395263671875, 972.773681640625", "5762.732421875, 800.4412841796875, 971.6632080078125", "4613.88525390625, 748.579345703125, 498.29150390625", "4627.73974609375, 729.6559448242188, 691.7916259765625", "4679.07470703125, 735.6559448242188, 938.0872802734375", "4850.85693359375, 683.1942749023438, 979.4578247070312" },
        ["Dragon Crew Archer [Lv. 1600]"] = { "6453.38818359375, 338.91796875, -171.9967041015625", "6582.38818359375, 338.91796875, -57.996734619140625", "6567.0751953125, 378.2533874511719, 58.22900390625", "6606.0751953125, 379.2533874511719, 418.22900390625", "6765.07568359375, 381.2533874511719, 211.22900390625", "6798.0751953125, 380.2533874511719, 397.22900390625" },
        ["Peanut Scout [Lv. 2075]"] = { "-2078.09130859375, 12.854767799377441, -9997.1044921875", "-1865.427490234375, 8.854758262634277, -10086.232421875", "-2065.34814453125, 34.952178955078125, -10066.810546875", "-2377.283203125, 37.952178955078125, -10308.21875", "-2250.190673828125, 8.85476016998291, -9948.8388671875", "-2294.24755859375, 37.236968994140625, -10176.12109375", "-1924.0009765625, 37.2721061706543, -10199.6630859375" },
        ["Demonic Soul [Lv. 2025]"] = { "-9426.9560546875, 171.95281982421875, 6048.408203125", "-9344.9560546875, 171.95281982421875, 6201.408203125", "-9253.9560546875, 171.95281982421875, 6050.408203125", "-9565.9560546875, 171.95281982421875, 6235.408203125", "-9631.9560546875, 171.95281982421875, 6053.408203125", "-9753.9560546875, 171.95281982421875, 6166.408203125" },
        ["Serpent Hunter [Lv. 2550]"] = { "-16820.546875, 35.377708435058594, 1180.5087890625", "-16750.67578125, 30.346088409423828, 1150.5850830078125", "-16800.3203125, 28.204872131347656, 1050.1318359375", "-16740.798828125, 20.192967414855957, 1120.8662109375" },
        ["Skull Slayer [Lv. 2575]"] = { "-16950.798828125, 18.192967414855957, 1100.8662109375", "-16910.23046875, 14.45141887664795, 1000.9686279296875", "-16880.048828125, 20.34747314453125, 1050.8740234375", "-16920.3046875, 16.09433364868164, 1100.5067367553711" },
        ["Reef Bandit [Lv. 2600]"] = { "11383, -2087, 9808", "11445, -2087, 9766", "11416, -2087, 9853", "11397, -2087, 9817", "11457, -2087, 9818" },
        ["Coral Pirate [Lv. 2625]"] = { "11352, -2087, 9766", "11321, -2087, 9725", "11325, -2087, 9794", "11373, -2087, 9732", "11309, -2087, 9779" },
        ["Sea Chanter [Lv. 2650]"] = { "11274, -2086, 9810", "11234, -2086, 9847", "11220, -2086, 9796", "11257, -2086, 9770", "11286, -2086, 9845" },
        ["Ocean Prophet [Lv. 2675]"] = { "11268, -2086, 9876", "11236, -2086, 9902", "11206, -2086, 9862", "11212, -2086, 9927", "11250, -2086, 9908" },
        ["High Disciple [Lv. 2700]"] = { "11194, -1992, 9859", "11157, -1992, 9887", "11176, -1992, 9924", "11116, -1992, 9865", "11130, -1992, 9912" },
        ["Grand Devotee [Lv. 2725]"] = { "11154, -1992, 9942", "11114, -1992, 9919", "11089, -1992, 9960", "11090, -1992, 9898", "11126, -1992, 9864" }
    }
}
GameData.Items = {
    ["Abilities"] = {
          {
             ["Name"] = "Geppo",
             ["Args"] = {"BuyHaki","Geppo"},
             ["Price"] = {
                ["Beli"] = 10000,
             },
          },
          {
             ["Name"] = "Buso",
             ["Args"] = {"BuyHaki","Buso"},
             ["Price"] = {
                ["Beli"] = 25000,
             },
          },
          {
             ["Name"] = "Soru",
             ["Args"] = {"BuyHaki","Soru"},
             ["Price"] = {
                ["Beli"] = 100000,
             },
          },
          {
             ["Name"] = "Ken",
             ["Args"] = {"KenTalk","Buy"},
             ["Price"] = {
                ["Beli"] = 150000,
             },
          },
       },
    ["Fighting Styles"]= {
            {
                ["Name"] = "Dark Step",
                ["Args"] = {"BuyBlackLeg"},
                ["Price"] = {
                    ["Beli"] = 150000,
                },
            },
            {
                ["Name"] = "Eletro",
                ["Args"] = {"BuyElectro"},
                ["Price"] = {
                    ["Beli"] = 500000,
                },
            },
            {
                ["Name"] = "Water Kung Fu",
                ["Args"] = {"BuyFishmanKarate"},
                ["Price"] = {
                    ["Beli"] = 750000,
                },
            },
            {
                ["Name"] = "Dragon Breath",
                ["Args"] = {"BlackbeardReward","DragonClaw","2"},
                ["Price"] = {
                    ["Fragment"] = 1500,
                },
            },
            {
                ["Name"] = "Superhuman",
                ["Args"] = {"BuySuperhuman"},
                ["Price"] = {
                    ["Beli"] = 3000000,
                },
            },
            {
                ["Name"] = "Death Step",
                ["Args"] = {"BuyDeathStep"},
                ["Price"] = {
                    ["Beli"] = 2500000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "Sharkman Karate",
                ["Args"] = {"BuySharkmanKarate"},
                ["Price"] = {
                    ["Beli"] = 2500000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "Eletric Claw",
                ["Args"] = {"BuyElectricClaw"},
                ["Price"] = {
                    ["Beli"] = 3000000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "Dragon Talon",
                ["Args"] = {"BuyDragonTalon"},
                ["Price"] = {
                    ["Beli"] = 3000000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "God Human",
                ["Args"] = {"BuyGodhuman"},

                ["Price"] = {
                    ["Beli"] = 5000000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "Saguine Art",
                ["Args"] = {"BuySanguineArt"},
                ["Price"] = {
                    ["Beli"] = 500000,
                    ["Fragment"] = 5000,
                },      
            },
        },
    ["Sword"] = {
          {
             ["Name"] = "Katana",
             ["Args"] = {"BuyItem","Katana"},
             ["Price"] = {
                ["Beli"] = 1000,
             },
          },
          {
             ["Name"] = "Cutlass",
             ["Args"] = {"BuyItem","Cutlass"},
             ["Price"] = {
                ["Beli"] = 1000,
             },
          },
          {
             ["Name"] = "Dual Katana",
             ["Args"] = {"BuyItem","Dual Katana"},
             ["Price"] = {
                ["Beli"] = 12000,
             },
          },
          {
             ["Name"] = "Iron Mace",
             ["Args"] = {"BuyItem","Iron Mace"},
             ["Price"] = {
                ["Beli"] = 25000,
             },
          },
          {
             ["Name"] = "Triple Katana",
             ["Args"] = {"BuyItem","Triple Katana"},
             ["Price"] = {
                ["Beli"] = 60000,
             },
          },
          {
             ["Name"] = "Pipe",
             ["Args"] = {"BuyItem","Pipe"},
             ["Price"] = {
                ["Beli"] = 100000,
             },
          },
          {
             ["Name"] = "Dual-Headed Blade",
             ["Args"] = {"BuyItem","Dual-Headed Blade"},
             ["Price"] = {
                ["Beli"] = 400000,
             },
          },
          {
             ["Name"] = "Bisento",
             ["Args"] = {"BuyItem","Bisento"},
             ["Price"] = {
                ["Beli"] = 1000000,
             },
          },
          {
             ["Name"] = "Soul Cane",
             ["Args"] = {"BuyItem","Soul Cane"},
             ["Price"] = {
                ["Beli"] = 750000,
             },
          },
          {
             ["Name"] = "Midnight Blade",
             ["Args"] = {"Ectoplasm","Buy",3},
             ["Price"] = {
                ["Ectoplasm"] = 100,
             },
          },
          {
             ["Name"] = "True Triple Katana",
             ["Args"] = {"MysteriousMan",2},
             ["Price"] = {
             },
          },
       },
    ["Gun"] = {
          {
             ["Name"] = "Slingshot",
             ["Args"] = {"BuyItem","Slingshot"},
             ["Price"] = {
                ["Beli"] = 5000,
             },
          },
          {
             ["Name"] = "Musket",
             ["Args"] = {"BuyItem","Musket"},
             ["Price"] = {
                ["Beli"] = 8000,
             },
          },
          {
             ["Name"] = "Flintlock",
             ["Args"] = {"BuyItem","Flintlock"},
             ["Price"] = {
                ["Beli"] = 10500,
             },
          },
          {
             ["Name"] = "Refined Slingshot",
             ["Args"] = {"BuyItem","Refined Slingshot"},
             ["Price"] = {
                ["Beli"] = 65000,
             },
          },
          {
             ["Name"] = "Cannon",
             ["Args"] = {"BuyItem","Cannon"},
             ["Price"] = {
                ["Beli"] = 100000,
             },
          },
          {
             ["Name"] = "Kabucha",
             ["Args"] = {"BlackbeardReward","Slingshot","2"},
             ["Price"] = {
                ["Fragment"] = 1500,
             },
          },
          {
             ["Name"] = "Bizarre Rifle",
             ["Args"] = {"Ectoplasm","Buy",1},
             ["Price"] = {
                ["Ectoplasm"] = 25,
             },
          },
       },
    ["Accessories"] = {
            {
                ["Name"] = "Black Cape",
                ["Args"] = {"BuyItem","Black Cape"},
                ["Price"] = {
                    ["Beli"] = 50000,
                },
            },
            {
                ["Name"] = "Swordsman Hat",
                ["Args"] = {"BuyItem","Swordsman Hat"},
                ["Price"] = {
                    ["Beli"] = 150000,
                },
            },
            {
                ["Name"] = "Tomoe Ring",
                ["Args"] = {"BuyItem","Tomoe Ring"},
                ["Price"] = {
                    ["Beli"] = 500000,
                },
            },
            {
                ["Name"] = "Ghoul Mask",
                ["Args"] = {"Ectoplasm","Buy",2},
                ["Price"] = {
                    ["Ectoplasm"] = 50,
                },
            },
        }
 }

GameData.Items = {
    [1] = {
       ["Abilities"] = {
          {
             ["Name"] = "Geppo",
             ["Args"] = {"BuyHaki","Geppo"},
             ["Price"] = {
                ["Beli"] = 10000,
             },
          },
          {
             ["Name"] = "Buso",
             ["Args"] = {"BuyHaki","Buso"},
             ["Price"] = {
                ["Beli"] = 25000,
             },
          },
          {
             ["Name"] = "Soru",
             ["Args"] = {"BuyHaki","Soru"},
             ["Price"] = {
                ["Beli"] = 100000,
             },
          },
          {
             ["Name"] = "Ken",
             ["Args"] = {"KenTalk","Buy"},
             ["Price"] = {
                ["Beli"] = 150000,
             },
          },
       },
    },
    [2] = {
        ["Fighting Styles"]= {
            {
                ["Name"] = "Dark Step",
                ["Args"] = {"BuyBlackLeg"},
                ["Price"] = {
                    ["Beli"] = 150000,
                },
            },
            {
                ["Name"] = "Eletro",
                ["Args"] = {"BuyElectro"},
                ["Price"] = {
                    ["Beli"] = 500000,
                },
            },
            {
                ["Name"] = "Water Kung Fu",
                ["Args"] = {"BuyFishmanKarate"},
                ["Price"] = {
                    ["Beli"] = 750000,
                },
            },
            {
                ["Name"] = "Dragon Breath",
                ["Args"] = {"BlackbeardReward","DragonClaw","2"},
                ["Price"] = {
                    ["Fragment"] = 1500,
                },
            },
            {
                ["Name"] = "Superhuman",
                ["Args"] = {"BuySuperhuman"},
                ["Price"] = {
                    ["Beli"] = 3000000,
                },
            },
            {
                ["Name"] = "Death Step",
                ["Args"] = {"BuyDeathStep"},
                ["Price"] = {
                    ["Beli"] = 2500000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "Sharkman Karate",
                ["Args"] = {"BuySharkmanKarate"},
                ["Price"] = {
                    ["Beli"] = 2500000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "Eletric Claw",
                ["Args"] = {"BuyElectricClaw"},
                ["Price"] = {
                    ["Beli"] = 3000000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "Dragon Talon",
                ["Args"] = {"BuyDragonTalon"},
                ["Price"] = {
                    ["Beli"] = 3000000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "God Human",
                ["Args"] = {"BuyGodhuman"},

                ["Price"] = {
                    ["Beli"] = 5000000,
                    ["Fragment"] = 5000,
                },
            },
            {
                ["Name"] = "Saguine Art",
                ["Args"] = {"BuySanguineArt"},
                ["Price"] = {
                    ["Beli"] = 500000,
                    ["Fragment"] = 5000,
                },      
            },
        },
    },
    [3] = {
       ["Sword"] = {
          {
             ["Name"] = "Katana",
             ["Args"] = {"BuyItem","Katana"},
             ["Price"] = {
                ["Beli"] = 1000,
             },
          },
          {
             ["Name"] = "Cutlass",
             ["Args"] = {"BuyItem","Cutlass"},
             ["Price"] = {
                ["Beli"] = 1000,
             },
          },
          {
             ["Name"] = "Dual Katana",
             ["Args"] = {"BuyItem","Dual Katana"},
             ["Price"] = {
                ["Beli"] = 12000,
             },
          },
          {
             ["Name"] = "Iron Mace",
             ["Args"] = {"BuyItem","Iron Mace"},
             ["Price"] = {
                ["Beli"] = 25000,
             },
          },
          {
             ["Name"] = "Triple Katana",
             ["Args"] = {"BuyItem","Triple Katana"},
             ["Price"] = {
                ["Beli"] = 60000,
             },
          },
          {
             ["Name"] = "Pipe",
             ["Args"] = {"BuyItem","Pipe"},
             ["Price"] = {
                ["Beli"] = 100000,
             },
          },
          {
             ["Name"] = "Dual-Headed Blade",
             ["Args"] = {"BuyItem","Dual-Headed Blade"},
             ["Price"] = {
                ["Beli"] = 400000,
             },
          },
          {
             ["Name"] = "Bisento",
             ["Args"] = {"BuyItem","Bisento"},
             ["Price"] = {
                ["Beli"] = 1000000,
             },
          },
          {
             ["Name"] = "Soul Cane",
             ["Args"] = {"BuyItem","Soul Cane"},
             ["Price"] = {
                ["Beli"] = 750000,
             },
          },
          {
             ["Name"] = "Midnight Blade",
             ["Args"] = {"Ectoplasm","Buy",3},
             ["Price"] = {
                ["Ectoplasm"] = 100,
             },
          },
          {
             ["Name"] = "True Triple Katana",
             ["Args"] = {"MysteriousMan",2},
             ["Price"] = {
             },
          },
       },
    },
    [4] = {
       ["Gun"] = {
          {
             ["Name"] = "Slingshot",
             ["Args"] = {"BuyItem","Slingshot"},
             ["Price"] = {
                ["Beli"] = 5000,
             },
          },
          {
             ["Name"] = "Musket",
             ["Args"] = {"BuyItem","Musket"},
             ["Price"] = {
                ["Beli"] = 8000,
             },
          },
          {
             ["Name"] = "Flintlock",
             ["Args"] = {"BuyItem","Flintlock"},
             ["Price"] = {
                ["Beli"] = 10500,
             },
          },
          {
             ["Name"] = "Refined Slingshot",
             ["Args"] = {"BuyItem","Refined Slingshot"},
             ["Price"] = {
                ["Beli"] = 65000,
             },
          },
          {
             ["Name"] = "Cannon",
             ["Args"] = {"BuyItem","Cannon"},
             ["Price"] = {
                ["Beli"] = 100000,
             },
          },
          {
             ["Name"] = "Kabucha",
             ["Args"] = {"BlackbeardReward","Slingshot","2"},
             ["Price"] = {
                ["Fragment"] = 1500,
             },
          },
          {
             ["Name"] = "Bizarre Rifle",
             ["Args"] = {"Ectoplasm","Buy",1},
             ["Price"] = {
                ["Ectoplasm"] = 25,
             },
          },
       },
    },
    [5] = {
        ["Accessories"] = {
            {
                ["Name"] = "Black Cape",
                ["Args"] = {"BuyItem","Black Cape"},
                ["Price"] = {
                    ["Beli"] = 50000,
                },
            },
            {
                ["Name"] = "Swordsman Hat",
                ["Args"] = {"BuyItem","Swordsman Hat"},
                ["Price"] = {
                    ["Beli"] = 150000,
                },
            },
            {
                ["Name"] = "Tomoe Ring",
                ["Args"] = {"BuyItem","Tomoe Ring"},
                ["Price"] = {
                    ["Beli"] = 500000,
                },
            },
            {
                ["Name"] = "Ghoul Mask",
                ["Args"] = {"Ectoplasm","Buy",2},
                ["Price"] = {
                    ["Ectoplasm"] = 50,
                },
            },
        },
    }
 }
GameData.Material = {

}
GameData.MaterialFarm = {
    CheckMob = {
        ["Magma Ore"] = {
            ["IsMob"] = function (Mob)
                if Sea1 then
                    if string.match(Mob.Name,"Military Soldier") or string.match(Mob.Name,"Military Spy") then
                        return true
                    end
                elseif Sea2 then
                    if string.match(Mob.Name,"Magma Ninja") or string.match(Mob.Name,"Lava Pirate") then
                        return true
                    end
                end
                return false
            end,
            ["Pos"] = {CFrame.new(-5458.927734375, 22.050642013549805, -5419.67724609375),CFrame.new(-5377.33251953125, 18.274900436401367, -5125.76416015625)}
            
        },
        ["Ectoplasm"] = {
            ["IsMob"] = function(Mob)
                if string.match(Mob.Name,"Ship Deckhand") or string.match(Mob.Name,"Ship Engineer") or string.match(Mob.Name,"Ship Steward") or string.match(Mob.Name,"Ship Officer") then
                    return true
                end
                return false
            end,
            ["Pos"] = CFrame.new(923.2125244140625, 126.97600555419922, 32852.83203125),

        },
        ["Demonic Wisp"] = {
            ["IsMob"] = function(Mob)
                if string.match(Mob.Name,"Reborn Skeleton") or string.match(Mob.Name,"Living Zombie") or string.match(Mob.Name,"Demonic Soul") or string.match(Mob.Name,"Posessed Mummy") and Mob:FindFirstChild("HumanoidRootPart") and (Mob:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-8736.5771484375, 143.10482788085938, 6034.9375)).magnitude < 3500 then
                    return true
                end
                return false
            end,
            ["Pos"] = CFrame.new(-9501.3447265625, 172.1398468017578, 6036.0341796875),
        },
        ["Bones"] = {
            ["IsMob"] = function(Mob)
                if string.match(Mob.Name,"Reborn Skeleton") or string.match(Mob.Name,"Living Zombie") or string.match(Mob.Name,"Demonic Soul") or string.match(Mob.Name,"Posessed Mummy") and Mob:FindFirstChild("HumanoidRootPart") and (Mob:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-8736.5771484375, 143.10482788085938, 6034.9375)).magnitude < 3500 then
                    return true
                end
                return false
            end,
            ["Pos"] = CFrame.new(-9501.3447265625, 172.1398468017578, 6036.0341796875),
        },
        ["Dragon Scale"] = {
            ["IsMob"] = function (Mob)
                if string.match(Mob.Name,"Dragon Crew Archer") or string.match(Mob.Name,"Dragon Crew Warrior") then
                    return true
                end
                return false
            end,
            ["Pos"] = {CFrame.new(6562.64111328125, 148.20350646972656, -712.1854858398438),
            CFrame.new(6525.68896484375, 378.2054138183594, 16.12466049194336),
            CFrame.new(4143.9814453125, 51.48188018798828, -1238.462890625)}
        } ,
        ["Angel Wings"] = {
            ["IsMob"] = function (Mob)
                if string.match(Mob.Name,"Shanda") or string.match(Mob.Name,"Royal Squad") or string.match(Mob.Name,"Royal Soldier") then
                    return true
                end
                return false
            end,
            ["Pos"] = {CFrame.new(-7640.81103515625, 5545.49169921875, -535.966064453125),
            CFrame.new(-7760.857421875, 5634.2216796875, -1555.6251220703125)}
        } ,
        
        ["Mystic Droplet"] = {
            ["IsMob"] = function(Mob)
                if string.match(Mob.Name,"Sea Soldier") or string.match(Mob.Name,"Water Fighter") then
                    return true
                end
                return false
            end,
            ["Pos"] = CFrame.new(-3246.47509765625, 298.66448974609375, -10551.6650390625),
        },
            
        ["Fish Tail"] = {
            ["IsMob"] = function(Mob)
                if Sea3 then
                    if string.match(Mob.Name,"Fishman Raider") or string.match(Mob.Name,"Fishman Captain") then
                        return true
                    end
                end
                return false
            end,
            ["Pos"] = CFrame.new(-10918.5673828125, 331.76263427734375, -8698.3408203125)
        },     
        ["Radioactive Material"] = {
            ["IsMob"] = function(Mob)
                if Sea2 then
                    if string.match(Mob.Name,"Factory Staff") then
                        return true
                    end
                end
                return false
            end,
            ["Pos"] = {CFrame.new(-16.391239166259766, 148.9493408203125, -182.6639862060547),CFrame.new(542.0455322265625, 72.95976257324219, 22.46308708190918)}
        },
        ["Vampire Fang"] = {
            ["IsMob"] = function(Mob)
                if Sea2 then
                    if string.match(Mob.Name,"Vampire") then
                        return true
                    end
                end
                return false
            end,
            ["Pos"] = CFrame.new(-6022.30810546875, 6.402711391448975, -1302.591552734375),
        },
        ["Conjured Cocoa"] = {
            ["IsMob"] = function(Mob)
                if Sea3 then
                    if string.match(Mob.Name,"Sweet Thief") or string.match(Mob.Name,"Candy Rebel") or string.match(Mob.Name,"Chocolate Bar Battler") or string.match(Mob.Name,"Cocoa Warrior")   then
                        return true
                    end
                end
                return false
            end,
            ["Pos"] = CFrame.new(233.32058715820312, 74.74764251708984, -12498.2861328125),
        },
        ["Mini Tusk"] = {
            ["IsMob"] = function(Mob)
                if Sea3 then
                    if string.match(Mob.Name,"Forest Pirate") or string.match(Mob.Name,"Mythological Pirate") then
                        return true
                    end
                end
                return false
            end,
            ["Pos"] = CFrame.new(-13527.8076171875, 523.6344604492188, -7424.10693359375),
        },
        ["Scrap Metal"] = {
            ["IsMob"] = function(Mob)
                if Sea3 then
                    if string.match(Mob.Name,"Pirate Millionaire") or string.match(Mob.Name,"Pistol Billionaire") then
                        return true
                    end
                end
                return false
            end,
            ["Pos"] = {CFrame.new(-315.9371337890625, 73.87043762207031, 5939.98193359375),
            CFrame.new(-289.22113037109375, 43.854217529296875, 5574.4697265625),
            CFrame.new(-636.85888671875, 57.015052795410156, 5626.41748046875),
            CFrame.new(-807.3641357421875, 84.8128890991211, 5991.45166015625),
            }
        },
        ["Leather"] = {
            ["IsMob"] = function(Mob)
                if Sea3 then
                    if string.match(Mob.Name,"Pirate Millionaire") or string.match(Mob.Name,"Pistol Billionaire") then
                        return true
                    end
                end
                return false
            end,
            ["Pos"] = {CFrame.new(-315.9371337890625, 73.87043762207031, 5939.98193359375),CFrame.new(-289.22113037109375, 43.854217529296875, 5574.4697265625)}
        }
    },
    ["CheckBoss"] =  {"Meteorite",["Meteorite"]={
        ["IsBoss"] = function()
            if Sea2 then
                if game.Workspace.Enemies:FindFirstChild("Fajita") then
                    return game.Workspace.Enemies:FindFirstChild("Fajita")
                end
            end
            return false
        end
    }}
}
GameData.MaterialName = {
    "Mystic Droplet",
    "Magma Ore",
    "Fish Tail",
    "Vampire Fang",
    "Dragon Scale",
    "Radioactive Material",
    "Conjured Cocoa",
    "Ectoplasm",
    "Mini Tusk",
    "Demonic Wisp",
    "Meteorite",
    "Angel Wings",
    "Scrap Metal",
    "Leather"
}
GameData.MaterialSeaChecker = {
    ["Leather"] = "7449423635",
    ["Scrap Metal"] = "7449423635",
    ["Mystic Droplet"] = "4442272183",
    ["Magma Ore"] = "4442272183",
    ["Ectoplasm"] = "4442272183",
    ["Bones"]= "7449423635",
    ["Demonic Wisp"]= "7449423635",
    ["Fish Tail"] = "7449423635",
    ["Dragon Scale"] = "7449423635",
    ["Radioactive Material"] = "4442272183",
    ["Mini Tusk"] = "7449423635",
    ["Vampire Fang"] = "4442272183",
    ["Meteorite"] = "4442272183",
    ["Conjured Cocoa"] = "7449423635",
    ["Angel Wings"] = "2753915549",
}
--local GameData = loadstring(game:HttpGet('https://raw.githubusercontent.com/vinhuchi/rblx/main/W-azure/Data.lua'))()
--
local Fluent, UiData, secure_call
local loaded = 0
local total = 2
task.spawn(function()
    Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/FixedFluent.lua"))()
    loaded = loaded + 1
end)
UiData = function()
repeat wait()
until getgenv().LoadUi and getgenv().IslandCaller and getgenv().SettingManager and getgenv().Fluent
local LP = game.Players.LocalPlayer
local Title = "W-azure" .. (getgenv().Premium and " [Premium]" or "")
local SubTitle = "True V2 discord.gg/w-azure"
local Fluent = getgenv().Fluent
local UiSetting = Fluent.Options
local IslandCaller = IslandCaller or getgenv().IslandCaller
local SettingManager = getgenv().SettingManager 
if not getgenv().Window then
    getgenv().Window = Fluent:CreateWindow({
        Title = Title,
        SubTitle = SubTitle,
        TabWidth = 160,
        Size = UDim2.fromOffset(480, 360),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })
end
local Window = getgenv().Window
local UiOrders
if getgenv().OneClickUi then
    UiOrders = {"Status","Setting","Game-Server","One Click","One Click Debugger"}
else
     UiOrders = {"Main Farm","Stack Auto farm","Sub Farming","Vocalnic","Status","Player-Status","Fruit","Local Player","Travel","Pvp-Visual","Raid-Material","RaceV4-Mirage","Sea Events","Sub Class","Shop","Setting","Webhook","Game-Server","One Click","One Click Debugger"}
end
local TabCollections = {
}
ElementsCollection = {}
for _,Name in pairs(UiOrders) do
    ElementsCollection[Name]={}
end
do 
    local utils = {}
    utils.create = 
        function(class, prop)
            local obj = Instance.new(class)
        
            for prop, v in next, prop do
                obj[prop] = v
            end
        
            pcall(function()
                obj.AutoButtonColor = false
            end)
        
    
            if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                if obj.Image == "http://www.roblox.com/asset/?id=13286125855" and obj.ImageColor3 ==  Color3.fromRGB(93, 93, 93) then
                    obj:Destroy()
                end
            end
        
            return obj
        end
    utils.tween = 
        function(obj, info, properties, callback)
            local anim = game:GetService("TweenService"):Create(obj, TweenInfo.new(unpack(info)), properties)
            anim:Play()
        
            if callback then
                anim.Completed:Connect(callback)
            end
        
            return anim
        end
    utils.dragify = function(object, hoverobj, speed, additionalObject, n)
        local start, objectPosition, dragging
    
    	speed = speed or 0
    
    	hoverobj.InputBegan:Connect(function(input)
    		if input.UserInputType == Enum.UserInputType.MouseButton1 then
    			dragging = true
    			start = input.Position
    			objectPosition = object.Position
    
                if n then
                    getgenv()["nhin cai deo gi dit con me may"] = true
                end
    		end
    	end)
    
    	hoverobj.InputEnded:Connect(function(input)
    		if input.UserInputType == Enum.UserInputType.MouseButton1 then
    			dragging = false
    
                if n then
                    getgenv()["nhin cai deo gi dit con me may"] = false
                end
    		end
    	end)
    
    	game:GetService("UserInputService").InputChanged:Connect(function(input)
    		if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
    			utils.tween(object, { speed }, {
    				Position = UDim2.new(
    					objectPosition.X.Scale,
    					objectPosition.X.Offset + (input.Position - start).X,
    					objectPosition.Y.Scale,
    					objectPosition.Y.Offset + (input.Position - start).Y
    				),
    			})
    			
                if additionalObject then
                    utils.tween(additionalObject, { speed + 0.0000001 }, {
                        Position = UDim2.new(
                            objectPosition.X.Scale,
                            objectPosition.X.Offset + (input.Position - start).X,
                            objectPosition.Y.Scale,
                            objectPosition.Y.Offset + (input.Position - start).Y
                        ),
                    })
                end
    		end
    	end)
    end
    local ScreenGui = utils.create('ScreenGui', {
        Parent = game.CoreGui,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        DisplayOrder = 100,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })
        local ToggleWindow = utils.create('Frame', {
            Name = "ToggleWindow",
            Parent = ScreenGui,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0,0,0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0.0284789652, 0, 0.054862842, 0),
            Size = UDim2.new(0.0384789652, 0, 0.054862842, 0),
        })

        utils.create('UIAspectRatioConstraint', {
            Parent = ToggleWindow,
            AspectRatio = 1.011
        })

        utils.create('UICorner', {
            CornerRadius = UDim.new(0, 4000),
            Parent = ToggleWindow,
        })

        local ToggleWindowIcon = utils.create('ImageLabel', {
            Name = "ToggleWindowIcon",
            Parent = ToggleWindow,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1.000,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0.681818187, 0, 0.681818187, 0),
            Image = "http://www.roblox.com/asset/?id=13286125855",
            ImageColor3 = Color3.fromRGB(107, 218, 255),
        })

        local ToggleWindowStroke = utils.create('UIStroke', {
            Color = Color3.fromRGB(107, 218, 255),
            Thickness = 1.600,
            Parent = ToggleWindow,
        })

        local ToggleWindowButton = utils.create('TextButton', {
            Parent = ToggleWindow,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1.000,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Font = Enum.Font.SourceSans,
            Text = "",
            TextColor3 = Color3.fromRGB(0, 0, 0),
            TextSize = 14.000,
        })

        utils.dragify(ToggleWindow, ToggleWindowButton, 0.08, ToggleWindow, true)

        ToggleWindowButton.MouseButton1Click:Connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftControl",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"LeftControl",false,game)
        end)
end
local UiIntilize = {
    ["Main Farm"] = {
        {Mode="Label",Title="Only Turn On 1 Farm At The Same Time"},
        {Mode="Toggle",Title="Auto Farm Level",Description="Self Explain",Args={"Level","Enable"}},
        {Mode="Toggle",Title="Auto Katakuri",Description="Turn On Auto Kill Cake Prince And Auto Kill Dough King By Default",Args={"Katakuri","Enable"}},
        
        {Mode="Toggle",Title="Auto Bone",Description="",Args={"Bone","Enable"}},
        
        {Mode="Toggle",Title="Accept Quest",Description="For Bone And Katakuri, Have A Chance of Getting Reseted(Noone  yet)",Args={"AcceptQuest_Bone_Katakuri","Enable"}},
        {Mode="Toggle",Title="Kill Aura",Description="Farm Near Lv Mob Or Near Position",Args={"Kill Aura","Enable"}},
        {Mode="Toggle",Title="Fully Auto Dough King",Description="",Args={"Full Dough King","Enable"}},
        {Mode="Label",Title="Setting For Auto Farm"},
        {Mode="Label",Title="Anchor Position"},
        {Mode="Toggle",Title="TP Back Anchor Position",Description="If Exceed Anchor Position Will Tp Back To Anchor Position",Args={"Kill Aura","AnchorTPBack"}},
        {Mode="Button",Title="Set Anchor Position",Callback=function ()
            pcall(function ()
                getgenv().Setting["Kill Aura"].AnchorPosition = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
            end)
        end},
        {Mode="Dropdown",Title="Distace From Anchor",Table = (function ()
            local Table = {}
            for i=400,4000,400 do 
                table.insert(Table,i)
            end
            return Table
        end)(),Default=getgenv().Setting["Kill Aura"].DistanceFromAnchor/400,OnChange=function (state)
            getgenv().Setting["Kill Aura"].DistanceFromAnchor = state
        end},
        {Mode="Toggle",Title="Use Sword",Args = {"Mastery","Sword"}},
        {Mode="Toggle",Title="Sword Switcher",Description="Switch Sword When Have Enough Skills (Default) or Max Mastery",Args={"SwordSwitcher","Enable"}},
        {Mode="Toggle",Title="Only Switch Max Mastery",Description="Only Switch When Max Mastery",Args={"SwordSwitcher","MaxMastery"}},
        {Mode="Toggle",Title="Switch Sword When Low", Description = "Must Enable Use Sword", Args={"Mastery","Sword/Low"}},
        {Mode="Toggle",Title="Gun Switcher",Description="Switch Gun When Have Enough Skills (Default) or Max Mastery",Args={"GunSwitcher","Enable"}},
        {Mode="Toggle",Title="Only Switch Max Mastery",Description="Only Switch Gun When Max Mastery",Args={"GunSwitcher","MaxMastery"}},
        {Mode="Label",Title="Go To Setting To Select Skills"},
        {Mode="Toggle",Title="Mastery Farm",Description="Need Enable Auto Katakuri Or Bone", Args={"Mastery","Enable"}},
        {Mode="Toggle",Title ="Aimbot Camera " ,Description = "Aimbot for Mastery Using Camera", Args={"Mastery","Camera"}},
        {
            Mode = "Dropdown",
            Title = "Matery Health",
            Args = {"Mastery", "Health"},
            Table = {20,25,30,35,40,45,50},
            Default = (function ()
                local Default = {20,25,30,35,40,45,50}
                local Found = 1
                if not table.find(Default,getgenv().Setting.Mastery.Health) then 
                    getgenv().Setting.Mastery.Health = 30
                else
                    Found = table.find(Default,getgenv().Setting.Mastery.Health) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting.Mastery.Health = tonumber(value)
                SettingManager:Save()
            end
        },        
        {Mode="Toggle",Title="Mastery Fruit / Gun", Description = "Default Is Fruit, Turning On = Using Gun, Must Enable Mastery Farm",Args = {"Mastery","Fruit/Gun"}},
        {
            Mode = "Toggle",
            Title = "Disable Silent Aim",
            Args = {"Pvp", "DisableSilentAim"},
            OnChange = function(state)
                getgenv().Setting.Pvp.DisableSilentAim = state
                SettingManager:Save()
            end
        },
        {Mode="Button",Title="Fps Boost",Callback = getgenv().LiteFpsBoost}
    },
    ["Stack Auto farm"] = {
        {Mode="Label",Title="Can Turn On Many Auto Farm Cuz Stackable"},
        {Mode="Toggle",Title="Auto Elite",Description="Sea 3 Function Only",Args={"Elite","Enable"}},
        {Mode="Toggle",Title="Auto Tyrant of the Skies",Description="Sea 3 only",Args={"Tyrant Skies","Enable"}},
        {Mode="Toggle",Title="Auto Pirate Raid",Description="Sea 3 Function Only",Args={"Pirate Raid","Enable"}},
        {Mode="Toggle",Title="Auto Open Haki Pad",Description="Sea 3 Function Only",Args={"Open Pad","Enable"}},
        {Mode="Toggle",Title="Auto Spawn Rip Indra",Description="Sea 3 Function Only", Args = {"Spawn Rip Indra","Enable"}},
        {Mode="Toggle",Title="Auto Rip Indra",Description = "Only Kill Rip Indra, Doesnt Do Anything Else",Args={"Rip Indra","Enable"}},
        {Mode="Toggle",Title="Auto Tushita",Descrition="Sea 3 Function only",Args={"Tushita","Enable"}},
        {Mode="Toggle",Title="Do Puzzle Electric Claw",Description="Sea 3 Function Only",Args={"Unlock Electric Claw","Enable"}},
        {Mode="Toggle",Title="Auto Dough King" ,Description="", Args = {"Dough King","Enable"}},
        {Mode="Toggle",Title="Auto Cake Prince",Description="",Args = {"Cake Prince","Enable"}},
        {Mode="Toggle",Title="Auto Spawn Soul Reaper",Args = {"Spawn Soul Reaper","Enable"}},
        {Mode="Toggle",Title="Auto Soul Reaper",Args = {"Soul Reaper","Enable"}},
        {
            Mode = "Dropdown",
            Title = "Select Boss To Snipe",
            Multi = true, 
            Table = (getgenv().AllBoss and getgenv().AllBoss[getgenv().CurrentPlaceKey]) or {},
            Default = getgenv().Setting.BossSniper.SelectedBoss or {},
            OnChange = function(state)
                local Values = {}
                for Value, State in pairs(state) do
                    if  type(Value) == "string" then
                        table.insert(Values, Value)
                    end
                end 
                

                getgenv().Setting.BossSniper.SelectedBoss = Values
                SettingManager:Save()
            end
        },     
        {Mode="Toggle",Title="Start Boss Snipe",Description="",Args={"BossSniper","Enable"}},
        {Mode="Toggle",Title="Auto Bartilo Quest",Description="Sea 2 Function",Args = {"Bartilo","Enable"}},
        {Mode="Toggle",Title="Auto Race Evolve",Description="Sea 2 Function, Need Bartilo Quest Finish",Args = {"Race Evolve","Enable"}},
        {Mode="Toggle",Title="Auto Factory",Description="Sea 2 Function Only",Args = {"Factory","Enable"}},
        {Mode="Toggle",Title="Auto Spawn Black Beard",Description="Sea 2 Function Only", Args = {"Spawn Black Beard","Enable"}},
        {Mode="Toggle",Title="Auto Black Beard",Description="Sea 2 Function Only", Args = {"Black Beard","Enable"}},
        {Mode="Toggle",Title="Auto Ghoul",Description="Travel To Sea2 and Stack Farming Until Have Ghoul", Args = {"Get Ghoul","Enable"}},
        {Mode="Toggle",Title="Auto Soul Guitar",Args = {"Soul Guitar","Enable"}},
        {Mode="Toggle",Title="Auto Soul Guitar Material",Args = {"Material Soul Guitar","Enable"}},
        {Mode="Toggle",Title="Auto CDK",Args = {"CDK","Enable"}},
        
        --{Mode="Toggle",Title="Auto Collect Gift", Description="Sea 3 Function Event",Args = {"Winter Event","Enable"}}
    },
    ["Sub Farming"] = {
        {Mode="Label",Title="Disable All Stack + Main Farm Before Using"},
        {Mode="Button",Title="Upgrade Yoru V2",Description="Only useable if you have yoru",Callback=function()
            IslandCaller("YoruV2")
        end},
        {Mode="Toggle",Title="Yoru V3",Description="Auto Upgrade Yoru V3",Args = {"YoruV3","Enable"}},
        {Mode="Dropdown",Title="Select Player",Description="Select Account to upgrade together",Table=IslandCaller("__StrGetPlayers"),OnChange=function (state)
            getgenv().Setting["YoruV3"].SelectedPlayer = state
        end},
        {Mode="Button",Title="Refresh Players",Callback=function()
            ElementsCollection["Sub Farming"]["Select Player"]:SetValues(IslandCaller("__StrGetPlayers"))
        end},
        
        
        {Mode="Toggle",Title="Account To Upgrade Yoru V3",Description="Turn On This If This Is Account Want to Upgrade, do not if account to spawn Black Beard",Args = {"YoruV3","Upgrade"}},
        {Mode="Toggle",Title="Auto BlackSmith",Description="Self Explain",Args = {"BlackSmith","Enable"}},
        {Mode="Toggle",Title="Auto Shark Anchor",Description="Self Explain",Args = {"Shark Anchor","Enable"}},
        {Mode="Toggle",Title="BlackSmith Sword/Gun Toggle",Description="Off = Sword, On = Gun",Args = {"BlackSmith","WeaponType"}},
        {Mode="Toggle",Title="Rip Indra Hop",Description="Self Explain",Args = {"Rip Indra Hop","Enable"}},
        {Mode="Toggle",Title="Race Evolve Hop",Description="Turning On This Will Make Race Evolve Hopping For Faster Farming",Args = {"Race Evolve","Hop"}},
        {Mode="Toggle",Title="Auto Elite Hop",Description="",Args = {"Elite Hop","Enable"}},
        {Mode="Toggle",Title="Black Beard Hop",Description="Auto Hop For Black Beard",Args={"Black Beard Hop","Enable"}},
        {Mode="Toggle",Title="Tushita Hop (Need All Haki Colors)",Description="Auto Chest + Auto Elite Till Find Cup And Spawn Then Get Tushita",Args={"Tushita Hop__1","Enable"}},
        {Mode="Toggle",Title="Hybrid Fruit Hop",Description="Pirate Raid + Collect Fruit Hop",Args={"Hybrid Fruit Hop","Enable"}},
        {Mode="Toggle",Title="Raid Fruit Hop",Description="Pirate Raid + Collect Fruit + Raid Hop" ,Args={"Raid Fruit Hop","Enable"}},
        {Mode="Toggle",Title="Auto Law",Description="Auto Farm Law",Args={"Law","Enable"}},
        {Mode="Toggle",Title="Auto Cyborg [Premium]",Description="Auto Chest For Fist Then Auto Law",Args={"Fully Cyborg","Enable"}},
        {Mode="Toggle",Title="Auto Ghoul Hop",Description="Auto Find Torch + Ghoul (Very Rare, Dont Recommend)",Args={"Fully Ghoul","Enable"}},
        {Mode="Toggle",Title="Boss Snipe Hop",Description="",Args={"BossSniper","Hop"}},
        {Mode="Label",Title="Chest Count"},
        {Mode="Toggle",Title="Auto Chest",Description="Stop On God Chalice And Fist Of Darkness By Default",Args={"Collect Chest","Enable"}},
        {Mode="Toggle",Title="Ignore Items - Chest",Description="Enable This To Not Stop On Getting Fist of Darkness Or God Chalice",Args={"Collect Chest","IgnoreItem"}},
        {Mode="Toggle",Title="Auto Chest Hop",Description="Hop After x Chest",Args = {"Collect Chest","Hop"}},
        {
            Mode = "Dropdown",
            Title = "x Chest To Hop",
            Args = {"Collect Chest", "LimitChest"},
            Table = {20,25,30,35,40,45,50,60,70},
            Default = (function ()
                local Default = {20,25,30,35,40,45,50,60,70}
                local Found = 9
                if not table.find(Default,getgenv().Setting["Collect Chest"].LimitChest) then 
                    getgenv().Setting["Collect Chest"].LimitChest = 70
                else
                    Found = table.find(Default,getgenv().Setting["Collect Chest"].LimitChest) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting["Collect Chest"].LimitChest = tonumber(value)
                SettingManager:Save()
            end
        },        

        {Mode="Toggle",Title="Insta Tp Chest",Description="Have A Risk Of Getting Banned(Noone yet)",Args={"Collect Chest","InstaTP"}},
        {Mode="Toggle",Title="Auto Level Observation",Description="Farm Observation Level Till Max",Args={"Level Observation","Enable"}},
        {Mode="Toggle",Title="Level Observation Hop",Description="Hopping For leveling Observation",Args={"Level Observation","Hop"}},
        {Mode="Toggle",Title="Auto Observation V2",Description="Must Have Maxed Ken Haki + Finish Citizen Quest",Args = {"Evolve Observation","Enable"}},
        {Mode="Toggle",Title="Observation V2 Hop",Description="Hopping For Finding Materials To Get Evolve Faster",Args = {"Evolve Observation","Hop"}},
        {Mode="Toggle",Title="Auto Saber Hop",Args={"__SaberHop","Enable"}},
        {Mode="Toggle",Title="Auto Pole Hop",Args={"__PoleHop","Enable"}},
        {Mode="Toggle",Title="Auto Katakuri Hop",Description="Hop If Dimension kill Is lower than 300",Args={"__KatakuriHop","Enable"}},
        {Mode="Toggle",Title="Auto Citizen Quest",Description="Must Be Level 1800 Above",Args = {"Citizen Quest","Enable"}},
        {Mode="Toggle",Title="Citizen Quest Hop",Description="",Args = {"Citizen Quest","Hop"}},
        {Mode="Toggle",Title="Auto Get Rainbow Haki",Description="",Args = {"Rainbow Haki","Enable"}},
        {Mode="Toggle",Title="Rainbow Haki Hop",Description="Hopping For Fast Getting Rainbow Haki",Args = {"Rainbow Haki","Hop"}},
    },
    ["Vocalnic"] = {
        {
            Mode = "Toggle",
            Title = "Auto Dojo Trainer",
            Args = {"DojoQuest", "Enable"},
            OnChange = function(state)
                getgenv().Setting.DojoQuest.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Ember (Dragon Hunter)",
            Args = {"DragonHunterQuest", "Enable"},
            OnChange = function(state)
                getgenv().Setting.DragonHunterQuest.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Find PrehistoricIsland",
            Description = "PrehistoricIsland",
            Args = {"SeaEvents", "AutoFindPrehistoricIsland"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoFindPrehistoricIsland = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Full Volcano",
            Description = "",
            Args = {"AutoFullVolcano", "Enable"},
            OnChange = function(state)
                getgenv().Setting.AutoFullVolcano.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Full Items Prehistoric Island",
            Description = "",
            Args = {"FullItemsPrehistoric", "Enable"},
            OnChange = function(state)
                getgenv().Setting.FullItemsPrehistoric.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Start Prehistoric Island",
            Description = "",
            Args = {"AutoStartPrehistoric", "Enable"},
            OnChange = function(state)
                getgenv().Setting.AutoStartPrehistoric.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Patch Volcanic",
            Description = "",
            Args = {"PatchVolcanic", "Enable"},
            OnChange = function(state)
                getgenv().Setting.PatchVolcanic.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Craft Volcanic Magnet",
            Description = "",
            Args = {"CraftVolcanicMagnet", "Enable"},
            OnChange = function(state)
                getgenv().Setting.CraftVolcanicMagnet.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Collect Dino Bones",
            Description = "",
            Args = {"CollectDinoBones", "Enable"},
            OnChange = function(state)
                getgenv().Setting.CollectDinoBones.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Collect Dragon Eggs",
            Description = "",
            Args = {"CollectDragonEggs", "Enable"},
            OnChange = function(state)
                getgenv().Setting.CollectDragonEggs.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Reset When Complete Volcano",
            Description = "",
            Args = {"ResetAfterVolcano", "Enable"},
            OnChange = function(state)
                getgenv().Setting.ResetAfterVolcano.Enable = state
            end
        },
        
    },
    ["Status"] = {
        {Mode="Label",Title="Client Time"},
        {Mode="Label",Title="Farming Status"},
        {Mode="Label",Title="Weapon Status [One Click]"},
        {Mode="Label",Title="Dimension Kill"},
        {Mode="Label",Title="Bribe Status"},
        {Mode="Label",Title="Server Haki Color"},
        {Mode="Label",Title="Elite Status"},
        {Mode="Label",Title="Mirage Status"},
        {Mode="Label",Title="PrehistoricIsland Status"},
        {Mode="Label",Title="Kitsune Status"},
        {Mode="Label",Title="FullMoon Status"},
        {Mode="Label",Title="Eyes"},
    },
    ["Player-Status"] = {
        {Mode="Label",Title="W.I.P"}
    },
    ["Fruit"] = {
        {
            Mode = "Toggle",
            Title = "Auto Collect Fruit",
            Description = "Stackable With Auto Farm",
            Args = {"GetFruit", "Enable"},
            OnChange = function(state)
                getgenv().Setting.GetFruit.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Store Fruit",
            Args = {"Fruit", "AutoStore"},
            OnChange = function(state)
                getgenv().Setting.Fruit.AutoStore = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Collect Berry",
            Args = {"CollectBerry", "Enable"},
            OnChange = function(state)
                getgenv().Setting.CollectBerry.Enable = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Berry Hop",
            Args = {"CollectBerry", "Hop"},
            OnChange = function(state)
                getgenv().Setting.CollectBerry.Hop = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Snipe Fruit",
            Args = {"Fruit", "EnableSnipeFruit"},
            Description = "Auto Buy Fruit If In The List And You Dont Have Fruit In That List",
            OnChange = function(state)
                getgenv().Setting.Fruit.EnableSnipeFruit = state
            end
        },
        {
            Mode = "Toggle",
            Title = "Snipe Mirage Fruit [Premium]",
            Description = "Stackable with Auto Farm, Snipe If In Mirage Fruit Stock And Mirage Dealer Appear",
            Args = {"Mirage Snipe Fruit", "Enable"},
            OnChange = function(state)
                getgenv().Setting["Mirage Snipe Fruit"].Enable = state
            end
            
        },
        {
            Mode = "Dropdown",
            Title = "Select Fruit To Snipe",
            Multi = true, 
            Table = getgenv().FruitTable or {},
            Default = getgenv().Setting.Fruit.FruitsToSnipe or {},
            OnChange = function(state)
                local Values = {}
                for Value, State in pairs(state) do
                    if  type(Value) == "string" then
                        table.insert(Values, Value)
                    end
                end 
                

                getgenv().Setting.Fruit.FruitsToSnipe = Values
                SettingManager:Save()
            end
        }
    },
    ["Local Player"] = {

        {Mode="Button",Title="Change Team To Pirates",Description="Team Changer",Callback=function()
            game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("SetTeam","Pirates")

        end},
        {Mode="Button",Title="Change Team To Marines",Description="Team Changer",Callback=function()
            game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("SetTeam","Marines")
        end},
        {
            Mode = "Button",
            Title = "Remove Enemies Skill Stun",
            Callback = function()
                IslandCaller("RemoveEnemiesStun")
            end
        },
        {
            Mode = "Toggle",
            Title = "No Clip",
            Args = {"LocalPlayer", "NoClip"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.NoClip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "No Clip Ship",
            Args = {"LocalPlayer", "NoClipShip"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.NoClipShip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Buso",
            Args = {"LocalPlayer", "AutoBuso"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.AutoBuso = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Enable Observation",
            Args = {"LocalPlayer", "AutoEnableObservation"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.AutoEnableObservation = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Water Walker",
            Args = {"LocalPlayer", "WaterWalker"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.WaterWalker = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Use Race V3",
            Args = {"LocalPlayer", "AutoUseV3"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.AutoUseV3 = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Use Race V4",
            Args = {"LocalPlayer", "AutoUseV4"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.AutoUseV4 = state
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Soru No CD",
            Args = {"LocalPlayer", "SoruNoCD"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.SoruNoCD = state
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Dash Modify",
            Args = {"LocalPlayer", "DashModify"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.DashModify = state
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Dash No CD",
            Args = {"LocalPlayer", "DashNoCD"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.DashNoCD = state
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Change Dash Rage",
            Args = {"LocalPlayer", "DoDashRange"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.DoDashRange = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Dropdown",
            Title = "Dash Range",
            Args = {"LocalPlayer", "DashRange"},
            Table = {100,150,200,250,300,500,750,1000},
            Default = (function ()
                local Default = {100,150,200,250,300,500,750,1000}
                local Found = 3
                if not table.find(Default,getgenv().Setting.LocalPlayer.DashRange) then 
                    getgenv().Setting.LocalPlayer.DashRange = 200 
                else
                    Found = table.find(Default,getgenv().Setting.LocalPlayer.DashRange) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting.LocalPlayer.DashRange = tonumber(value)
                SettingManager:Save()
            end
        },
        {

            Mode = "Toggle",
            Title = "Infinity Geppo",
            Args = {"LocalPlayer", "InfGeppo"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.InfGeppo = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Speed Hack",
            Args = {"LocalPlayer", "SpeedHack"},
            OnChange = function(state)
                getgenv().Setting.LocalPlayer.SpeedHack = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Speed",
            Args = {"LocalPlayer", "Speed"},
            Default = getgenv().Setting.LocalPlayer.Speed,
            Min = 16,
            Max = 500,
            OnChange = function(value)
                getgenv().Setting.LocalPlayer.Speed = value
                SettingManager:Save()
            end
        }
    },
    ["Travel"] = {
        {Mode="Button",Title="Stop Tween",Callback=function() IslandCaller("StopTween") end},
        {Mode="Button",Title="Travel Sea 1",Callback=function ()
            IslandCaller("Travel","Sea1")
        end},
        {Mode="Button",Title="Travel Sea 2",Callback=function ()
            IslandCaller("Travel","Sea2")
        end},
        {Mode="Button",Title="Travel Sea 3",Callback=function ()
            IslandCaller("Travel","Sea3")
        end},
        {Mode="Dropdown",Title="Insta Tp Place",Table=(function ()
            local Tbl = {}
            return Tbl
        end)(),OnChange=function (state)
        end},
        {Mode="Dropdown",Title="Travel Place",Table=(getgenv().IslandVariable and getgenv().IslandVariable.__Places) or {},OnChange=function (state)
            getgenv().IslandVariable.SelectedPlace = state
        end},

        {Mode="Button",Title="Start Traveling",Callback=function ()
            IslandCaller("TweenSelectedPlace")
        end},

        {Mode="Dropdown",Title="Tween to NPC",Table=(getgenv().IslandVariable and getgenv().IslandVariable.__NPCs) or {},OnChange=function (state)
            getgenv().IslandVariable.SelectedNPC = state
        end},
        {Mode="Button",Title="Start Tweening",Callback=function ()
            IslandCaller("TweenSelectedNPC")
        end},

        
    },
    ["Pvp-Visual"] = {
        {Mode="Dropdown",Title="Select Player",Table=IslandCaller("__StrGetPlayers"),OnChange=function (state)
            SelectedPlayer = state
        end},
        {Mode="Button",Title="Refresh Players",Callback=function()
            ElementsCollection["Pvp-Visual"]["Select Player"]:SetValues(IslandCaller("__StrGetPlayers"))
        end},
        {
            Mode = "Toggle",
            Title = "Tween To Player",
            Args = {"TweenToPlayer"},
            OnChange = function(state)
                getgenv().Setting.TweenToPlayer = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Shoot Gun(100%)",
            Args = {"Pvp", "AutoShootGun"},
            OnChange = function(state)
                getgenv().Setting.Pvp.AutoShootGun = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Silent Aim Selected",
            Args = {"Pvp", "SilentAimSelected"},
            OnChange = function(state)
                getgenv().Setting.Pvp.SilentAimSelected = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Silent Aim Near Player",
            Args = {"Pvp", "SilentAimNear"},
            OnChange = function(state)
                getgenv().Setting.Pvp.SilentAimNear = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Kill Near Player [Premium]",
            Description = "Use Very Fast Attack",
            Args = {"Pvp", "AutoKillNear"},
            OnChange = function(state)
                getgenv().Setting.Pvp.AutoKillNear = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Only Shoot In Shootable Distance",
            Args = {"Pvp", "GunDistanceCheck"},
            OnChange = function(state)
                getgenv().Setting.Pvp.GunDistanceCheck = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Players",
            Args = {"ESP", "Player"},
            OnChange = function(state)
                getgenv().Setting.ESP.Player = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Boss",
            Args = {"ESP", "Boss"},
            OnChange = function(state)
                getgenv().Setting.ESP.Boss = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Chests",
            Args = {"ESP", "Chest"},
            OnChange = function(state)
                getgenv().Setting.ESP.Chest = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Island",
            Args = {"ESP", "Island"},
            OnChange = function(state)
                getgenv().Setting.ESP.Island = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "ESP Fruit",
            Args = {"ESP", "Fruit"},
            OnChange = function(state)
                getgenv().Setting.ESP.Fruit = state
                SettingManager:Save()
            end
        }
    },
    ["Raid-Material"] = {
        {
            Mode = "Label",
            Title = "Selected Material",
        },
        {
            Mode = "Toggle",
            Title = "Start Farming Material",
            Args = {"Material","Enable"},
            Callback = function (state)
                getgenv().Setting.Material.Enable = state
                SettingManager:Save()
            end
        },
        {Mode="Dropdown",Title="Materials",Table=(getgenv().IslandVariable and getgenv().IslandVariable.MaterialName) or {},OnChange=function (state)
            getgenv().Setting.Material.Select = state
            SettingManager:Save()        
        end},
        {
            Mode = "Label",
            Title = "Selected Chip",
            Content = getgenv().Setting.Raid.Select or ""
        },
        {Mode="Dropdown",Title="Select",Table={"Flame","Ice","Sand","Quake","Light","Dark","Spider","Rumble","Magma","Human: Buddha","Bird: Phoenix","Dough"},OnChange=function (state)
            getgenv().Setting.Raid.Select = state
            SettingManager:Save()        
        end}, --Todo: Get Chips Data From Game
        {
            Mode = "Toggle",
            Title = "Enable Raid",
            Description = "Must Turn On This In Order To Raiding Works",
            Args = {"Raid", "Enable"},
            OnChange = function(state)
                getgenv().Setting.Raid.Enable = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "Select Current Fruit Chip",
            Callback = function()
                getgenv().Setting.Raid.Select = getgenv().IslandVariable.AutoChip[LP.Data.DevilFruit.Value] or ""
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "No Delay Next Island",
            Description = "May Get Reseted if You Turn Off This",
            Args = {"Raid", "NoDelay"},
            OnChange = function(state)
                getgenv().Setting.Raid.NoDelay = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Awaken",
            Args = {"Raid", "Awaken"},
            OnChange = function(state)
                getgenv().Setting.Raid.Awaken = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Unstore Fruit Under 1M",
            Args = {"Raid", "GetFruitUnder1M"},
            OnChange = function(state)
                getgenv().Setting.Raid.GetFruitUnder1M = state
                SettingManager:Save()
            end
        }
    },
    ["Sea Events"] = {
        {
            Mode = "Button",
            Title = "Tp Your Ship To Current Pos",
            Callback = function()
                IslandCaller("TPCurrentShip")
            end
        },
        {
            Mode = "Button",
            Title = "Remove Sea Terror Effect",
            Callback = function()
                if game.Lighting:FindFirstChild("SeaTerrorCC") then
                    game.Lighting.SeaTerrorCC:Destroy()
                end
            end
        },
        {
            Mode = "Button",
            Title = "Change Night Atmosphere",
            Callback = function()
                IslandCaller("NightAtmosphere")
            end
        },
        {
            Mode = "Button",
            Title = "Change Dark Atmosphere",
            Callback = function()
                IslandCaller("DarkAtmosphere")
            end
        },
        {
            Mode = "Toggle",
            Title = "Ship Speed Modifier",
            Args = {"SeaEvents", "ShipSpeedModifier"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.ShipSpeedModifier = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Ship Speed",
            Args = {"SeaEvents", "ShipSpeed"},
            Default = getgenv().Setting.SeaEvents.ShipSpeed,
            Min = 200,
            Max = 500,
            OnChange = function(value)
                getgenv().Setting.SeaEvents.ShipSpeed = value
                SettingManager:Save()
            end
        },
        {Mode="Dropdown",
        Title="Select Ship",
        Table={"PirateSloop","Swan Ship","Beast Hunter","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade"},
        Default = getgenv().Setting.SeaEvents.SelectShip 
        and table.find({"PirateSloop","SwanShip","Beast Hunter","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade"},getgenv().Setting.SeaEvents.SelectShip) or 1,
        OnChange=function (state)
            getgenv().Setting.SeaEvents.SelectShip = state
            SettingManager:Save()        
        end},
        {
            Mode = "Toggle",
            Title = "Start Farming Sea Event",
            Description = "For Farming Sharks, Piranha, Terror Shark, SeaBeast, Ship",
            Args = {"SeaEvents", "StartSeaEvents"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.StartSeaEvents = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Terror Shark",
            Description = "Farm Terror Shark",
            Args = {"SeaEvents", "TerrorShark"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.TerrorShark = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Sea Beasts",
            Description = "Farm Sea Beasts",
            Args = {"SeaEvents", "SeaBeast"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.SeaBeast = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Ship",
            Description = "Farm Ship",
            Args = {"SeaEvents", "Ship"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.Ship = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Repair Ship",
            Description = "Must Have ShipWright",
            Args = {"SeaEvents", "RepairShip"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.RepairShip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Ignore Sea Beast",
            Description = "Fly To Ignore Sea Beast, Must Turn On Auto Sea beast",
            Args = {"SeaEvents", "IgnoreSeaBeast"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.IgnoreSeaBeast = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Ignore Ship",
            Description = "TP Ship Back So Ship Despawn, Must Turn On Auto Ship",
            Args = {"SeaEvents", "IgnoreShip"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.IgnoreShip = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Shark",
            Description = "Farm Sharks",
            Args = {"SeaEvents", "Shark"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.Shark = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Piranha",
            Description = "Farm Piranha",
            Args = {"SeaEvents", "Piranha"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.Piranha = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Safe Mode",
            Args = {"SeaEvents", "SafeMode"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.SafeMode = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Escape Rough Sea",
            Args = {"SeaEvents", "AutoEscapeRoughSea"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoEscapeRoughSea = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Label",
            Title = "Leviathan Section"
        },
        {
            Mode = "Button",
            Title = "Tp To Frozen island",
            Description = "It Must Spawn First",
            Callback = function()
                IslandCaller("TPLeviathanIsland")
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Find Leviathan",
            Description = "Leviathan",
            Args = {"SeaEvents", "AutoFindLeviathan"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoFindLeviathan = state
                SettingManager:Save()
            end
        },

        {
            Mode = "Toggle",
            Title = "Auto Leviathan",
            Description = "Leviathan",
            Args = {"SeaEvents", "Leviathan"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.Leviathan = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Multi Segments Attack",
            Description = "More",
            Args = {"SeaEvents", "MultiSegmentAttack"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.MultiSegmentAttack = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Label",
            Title = "Kitsune Section"
        },
        {
            Mode = "Button",
            Title = "Tween To Kitsune Island",
            Description = "",
            Callback = function()

            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Find Kitsune Island",
            Description = "Wait For Near Full Moon Then Enable This",
            Args = {"SeaEvents", "AutoFindKitsune"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoFindKitsune = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Start Kitsune When In Island",
            Args = {"SeaEvents", "AutoStartKitsune"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoStartKitsune = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Collect Azure Wisp",
            Args = {"SeaEvents", "AutoCollectKitsune"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoCollectKitsune = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Dropdown",
            Title = "Azure Trade Min",
            Args = {"SeaEvents", "AzureEmberLimit"},
            Table = {15,20,25,30},
            Default = (function ()
                local Default = {15,20,25,30}
                local Found = 3
                if not table.find(Default,getgenv().Setting.SeaEvents.AzureEmberLimit) then 
                    getgenv().Setting.SeaEvents.AzureEmberLimit = 25
                else
                    Found = table.find(Default,getgenv().Setting.SeaEvents.AzureEmberLimit) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting.SeaEvents.AzureEmberLimit = tonumber(value)
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Trade Azure Wisp",
            Args = {"SeaEvents", "AutoTradeKitsune"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.AutoTradeKitsune = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Label",
            Title = "Sea Events Setting"
        },
        {
            Mode = "Toggle",
            Title = "Spin Ship If Farming",
            Description = "Safe Mode Ship",
            Args = {"SeaEvents", "FlyShipFarm"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.FlyShipFarm = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Spin Distance",
            Args = {"SeaEvents", "SpinDistance"},
            Default = getgenv().Setting.SeaEvents.SpinDistance,
            Min = 10,
            Max = 500,
            OnChange = function(value)
                getgenv().Setting.SeaEvents.SpinDistance = value
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Near Distance",
            Args = {"SeaEvents", "DistanceNearMob"},
            Default = getgenv().Setting.SeaEvents.DistanceNearMob or 300,
            Min = 300,
            Max = 1000,
            OnChange = function(value)
                getgenv().Setting.SeaEvents.DistanceNearMob = value
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Sea Beast Near Distance",
            Args = {"SeaEvents", "DistanceNearSeaBeast"},
            Default = getgenv().Setting.SeaEvents.DistanceNearSeaBeast or 300,
            Min = 300,
            Max = 2000,
            OnChange = function(value)
                getgenv().Setting.SeaEvents.DistanceNearSeaBeast = value
                SettingManager:Save()
            end
        }
    
    },
    ["Sub Class"] = {
        {
            Mode = "Label",
            Title = "Status",
        },
        {
            Mode = "Toggle",
            Title = "Start Unlocking SubClass",
            Args = {"SubClass", "Enable"},
        },
        {
            Mode = "Label",
            Title = "Select SubClass",
        },
        {
            Mode = "Toggle",
            Title = "Shipwright",
            Description ="Must Use [Gun] Soul Guitar Or Bazooka To Farm Wood",
            Args = {"SubClass", "Shipwright"},
        },

    },
    ["RaceV4-Mirage"] = {
        {
            Mode = "Button",
            Title = "TP To Gear",
            Callback = function()
                IslandCaller("TweenGear")
            end
        },
        {
            Mode = "Button",
            Title = "TP To Advandced Fruit Dealer",
            Callback = function()
                IslandCaller("TweenFruitDealer")
            end
            
        },
        {
            Mode = "Button",
            Title = "Tween To Highest Place Mirage",
            Callback = function()
                pcall(function()
                    IslandCaller("TweenHighestPlace")
                end)
            end
        },
        {
            Mode = "Toggle",
            Title = "Fully Auto Unlock Race v4 Entrance",
            Args = {"FullyRaceV4_Entrance", "Enable"},
        },
        {
            Mode = "Label",
            Title = "Trial Status",
        },
        {
            Mode = "Toggle",
            Title = "Check Status + Upgrade Race V4",
            Args = {"RaceV4", "CheckStatus"},
            OnChange = function(state)
                getgenv().Setting.RaceV4.CheckStatus = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Start Trial With Team",
            Args = {"TrialTeam", "Enable"},
        },
        {Mode="Dropdown",Title="Team Trial Player 1",Table=IslandCaller("__StrGetPlayers"),Default=getgenv().Setting["TrialTeam"].TrialPlayer1,OnChange=function (state)
            getgenv().Setting["TrialTeam"].TrialPlayer1 = state
            SettingManager:Save()
        end},
        {Mode="Dropdown",Title="Team Trial Player 2",Table=IslandCaller("__StrGetPlayers"),Default=getgenv().Setting["TrialTeam"].TrialPlayer2,OnChange=function (state)
            getgenv().Setting["TrialTeam"].TrialPlayer2 = state
            SettingManager:Save()
        end},
        {Mode="Button",Title="Refresh Players",Callback=function()
            ElementsCollection["RaceV4-Mirage"]["Team Trial Player 1"]:SetValues(IslandCaller("__StrGetPlayers"))
            ElementsCollection["RaceV4-Mirage"]["Team Trial Player 2"]:SetValues(IslandCaller("__StrGetPlayers"))
        end},
        {
            Mode = "Toggle",
            Title = "Fully Auto Finish Trial [Premium]",
            Description = "Train, Auto Kill After Trial, Auto Activate Race",
            Args = {"FullyAutoTrial", "Enable"},
            OnChange = function(state)
                if IsPremium then
                    getgenv().Setting.FullyAutoTrial.Enable = state
                end
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Use Weapon In Kill Trial",
            Args = {"Trial", "UseWeapon"},
        },
        {
            Mode = "Dropdown",
            Title = "Select Weapon For Kill trial",
            Multi = false, 
            Table = {"Sword","Gun"},
            Default = getgenv().Setting.Trial.WeaponToUse,
            OnChange = function(Value)
                getgenv().Setting.Trial.WeaponToUse = Value
                SettingManager:Save()
            end
        },
        {
            Mode = "Dropdown",
            Title = "Skills Weapon",
            Multi = true, 
            Table = {"Z","X"},
            Default = getgenv().Setting.Trial.WeaponSkills or {},
            OnChange = function(state)
                local Values = {}
                for Value, State in pairs(state) do
                    if  type(Value) == "string" then
                        table.insert(Values, Value)
                    end
                end 
                

                getgenv().Setting.Trial.WeaponSkills = Values
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Train",
            Args = {"AutoTrainTrial", "Enable"},
            OnChange = function(state)
                getgenv().Setting.AutoTrainTrial.Enable = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Finish Trial",
            Args = {"Trial", "Enable"},
            OnChange = function(state)
                getgenv().Setting.Trial.Enable = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Choose Gear",
            Args = {"Trial", "ChooseGear"},
            OnChange = function(state)
                getgenv().Setting.Trial.ChooseGear = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Kill After Trial [Premium]",
            Args = {"Trial", "AutoKill"},
            OnChange = function(state)
                getgenv().Setting.Trial.AutoKill = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Reset After Trial",
            Args = {"Trial", "AutoReset"},
            OnChange = function(state)
                getgenv().Setting.Trial.AutoReset = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Look Moon",
            Args = {"Trial", "LookAtMoon"},
            OnChange = function(state)
                getgenv().Setting.Trial.LookAtMoon = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "TP To Temple Of Time",
            Callback = function()
                IslandCaller("TPTempleOfTime")
            end
        },
        {
            Mode = "Button",
            Title = "TP To Acient Clock",
            Callback = function()
                IslandCaller("TPAcientClock")
            end
        },
        {
            Mode = "Button",
            Title = "TP Current Race Entrance",
            Callback = function()
                IslandCaller("TPCurrentEntrance")
            end
        },
    },
    ["Shop"] = {
        {
            Mode = "Toggle",
            Title = "Auto Buy Bribe",
            Args = {"Shop", "AutoBuyBribe"},
            OnChange = function(state)
                getgenv().Setting.Shop.AutoBuyBribe = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Random Bone",
            Args = {"Shop", "AutoRandomBone"},
            OnChange = function(state)
                getgenv().Setting.Shop.AutoRandomBone = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Random Fruit",
            Args = {"Shop", "AutoRandomFruit"},
            OnChange = function(state)
                getgenv().Setting.Shop.AutoRandomFruit = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Buy Legendary Sword",
            Args = {"Shop", "AutoLegendarySword"},
            OnChange = function(state)
                getgenv().Setting.Shop.AutoLegendarySword = state
                SettingManager:Save()
            end
        },

        {
            Mode = "Toggle",
            Title = "Auto Buy Haki Color",
            Args = {"Shop", "HakiColor"},
            OnChange = function(state)
                getgenv().Setting.Shop.HakiColor = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Only Buy Legendary Haki Color",
            Args = {"Shop", "LegendaryHakiColor"},
            OnChange = function(state)
                getgenv().Setting.Shop.LegendaryHakiColor = state
                SettingManager:Save()
            end
        },

        {
            Mode = "Button",
            Title = "Stats Refund",
            Description = "2500 Fragment",
            Callback = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
            end
        },
        {
            Mode = "Button",
            Title = "Reroll Race",
            Description = "3000 Fragment",
            Callback = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
            end
        },
        {
            Mode = "Button",
            Title = "Change Race To Ghoul",
            Callback = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
            end
        },
        {
            Mode = "Button",
            Title = "Change Race To Cyborg",
            Callback = function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
            end
        }
    },
    ["Setting"] = {
        {
            Mode = "Label",
            Title = "Tween Section"
        },
        {
            Mode = "Dropdown",
            Title = "Tween Speed",
            Args = {"Tween", "Speed"},
            Table = {250,275,300,325,350},
            Default = (function ()
                local Default = {250,275,300,325,350}
                local Found = 1
                if not table.find(Default,getgenv().Setting.Tween.Speed) then 
                    getgenv().Setting.Tween.Speed = 250 
                else
                    Found = table.find(Default,getgenv().Setting.Tween.Speed) 
                end
                return Found
            end)(),
            OnChange = function(value)
                getgenv().Setting.Tween.Speed = tonumber(value)
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Tween Pause",
            Description = "Prevent Security Kick",
            Args = {"Tween", "Pause"},
            OnChange = function(state)
                getgenv().Setting.Tween.Pause = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Label",
            Title = "Bring Mob Section"
        },
        {
            Mode = "Toggle",
            Title = "Bring Mob",
            Description = "Not Recommended May Error But Works If in PS",
            Args = {"BringMob", "Enable"},
            OnChange = function(state)
                getgenv().Setting.BringMob.Enable = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Slider",
            Title = "Bring Mob Radius",
            Args = {"BringMob", "Radius"},
            Default = getgenv().Setting.BringMob.Radius or 200,
            Min = 200,
            Max = 500,
            OnChange = function(value)
                getgenv().Setting.BringMob.Radius = value
                SettingManager:Save()
            end
        },
        {
            Mode = "Label",
            Title = "Fast Attack Section"
        },
        {
            Mode = "Toggle",
            Title = "Fast Attack",
            Args = {"FastAttack", "Enable"},
            OnChange = function(state)
                getgenv().Setting.FastAttack.Enable = state
                SettingManager:Save()
            end
        },

        {
            Mode = "Toggle",
            Title = "On Player",
            Description = "Fast Attack On Player",
            Args = {"FastAttack", "OnPlayer"},
            OnChange = function(state)
                getgenv().Setting.FastAttack.OnPlayer = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "On Mob",
            Description = "Fast Attack On Mob",
            Args = {"FastAttack", "OnMob"},
            OnChange = function(state)
                getgenv().Setting.FastAttack.OnMob = state
                SettingManager:Save()
            end
        },

        {
            Mode = "Label",
            Title = "Mastery Position",

        },
        function ()
            local MultiBuild = {}
            local Pos = {"X","Y","Z"}
            for i,v in pairs(Pos) do
                table.insert(
                    MultiBuild,
                    {
                        Mode = "Slider",
                        Title = "Position "..v,
                        Args = {"Mastery", v},
                        Default = getgenv().Setting.Mastery[v] or ( (v == "Y") and  30 or 0),
                        Min = 0,
                        Max = 60,
                        OnChange = function(value)
                            getgenv().Setting.Mastery[v] = value
                            SettingManager:Save()
                        end
                    } 
                )
            end
            return MultiBuild
        end,
        {
            Mode = "Dropdown",
            Title = "Weapon For Sea Events",
            Multi = true, 
            Table = {"Melee","Blox Fruit","Sword","Gun"},
            Default = (function ()
                local Default = {}
                for i,v in pairs(getgenv().Setting.SkillsSet2) do
                    if type(i) == "string" then
                        table.insert(Default,i)
                    end
                end
                return Default
            end)(),
            OnChange = function(ReturnTable)
                local ProxyTable = {}
                for Value, State in pairs(ReturnTable) do
                    if type(Value) == "string" then
                        ProxyTable[Value]=State
                    end
                end
                getgenv().Setting.SkillsSet2 = ProxyTable
                SettingManager:Save()
            end
        },
        {
            Mode = "Label",
            Title = "Fruit Skills Setting"
        },
        {
            Mode = "Toggle",
            Title = "Use Dragonstorm",
            Description = "",
            Args = {"UseDragonStorm"},
            OnChange = function(state)
                getgenv().Setting.UseDragonStorm = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Dropdown",
            Title = "Skills For fruit",
            Multi = true, 
            Table = {"Z","X","C","V","F"},
            Default = getgenv().Setting.SkillsSettingRemake["Blox Fruit"],
            OnChange = function(state)
                local Values = {}
                for Value, State in pairs(state) do
                    if  type(Value) == "string" then
                        table.insert(Values, Value)
                    end
                end 
                

                getgenv().Setting.SkillsSettingRemake["Blox Fruit"] = Values
                SettingManager:Save()
            end
        },
        function ()
            local MultiBuild = {}
            local Pos = {"Z","X","C","V","F"}
            for i,v in pairs(Pos) do
                table.insert(
                    MultiBuild,
                    {
                        Mode = "Dropdown",
                        Title = "Hold Time "..v,
                        Args = {"FruitSkillsHold", v},
                        Table = {0,0.25,0.5,1,2,3},
                        Default = (function ()
                            local Default = {0,0.25,0.5,1,2,3}
                            local Found = 1
                            if not table.find(Default,getgenv().Setting.FruitSkillsHold[v]) then 
                                getgenv().Setting.FruitSkillsHold[v] = 0
                            else
                                Found = table.find(Default,getgenv().Setting.FruitSkillsHold[v]) 
                            end
                            return Found
                        end)(),
                        OnChange = function(value)
                            getgenv().Setting.FruitSkillsHold[v] = tonumber(value)
                            SettingManager:Save()
                        end
                    } 
                )
            end
            return MultiBuild
        end,
    },
    ["Webhook"] = {
        {
            Mode = "TextBox",
            Title = "Webhook",
            Default = getgenv().Setting.Webhook.Url,
            Callback = function(arg)
                getgenv().Setting.Webhook.Url = arg
            end
        },
        {
            Mode = "Button",
            Title = "Test Webhook",
            Callback = function()
                getgenv().WebhookCenter.SimpleSend("Testing","Success")
            end
        },
    },
    ["Game-Server"] = {
        {
            Mode = "Toggle",
            Title = "Panel [Premium]",
            Args = {"Panel","Enable"},
            OnChange = function(state)
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "Copy Job Id",
            Callback = function ()
                setclipboard(tostring(game.JobId))
            end
        },
        {
            Mode = "TextBox",
            Title = "Server Code [Premium]",
            Callback = function(arg)
                getgenv().PreServerCode = arg
            end
        },
        {
            Mode = "Toggle",
            Title = "Join Server Code",
            Args = {"Misc","__PreJoin"},
            OnChange = function(state)
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "Clear Server Code",
            Callback = function(arg)
                local _, err = pcall(function ()
                    ElementsCollection["Game-Server"]["Server Code [Premium]"]:SetValue("")
                end)
                if err then
                    print(err)
                end
            end
        },
        {
            Mode = "TextBox",
            Title = "Job Id",
            Callback = function(arg)
                pcall(function ()
                    local a = arg
                    if a ~= "" then
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", a)     
                    end
                end)

            end
        },
        {
            Mode = "Button",
            Title = "Clear Job Id",
            Callback = function(arg)
                local _, err = pcall(function ()
                    ElementsCollection["Game-Server"]["Job Id"]:SetValue("")
                end)
                if err then
                    print(err)
                end
            end
        },
        {
            Mode = "Toggle",
            Title = "No Fog",
            Description = "For Better Vision",
            Args = {"Misc", "__NoFog"},
            OnChange = function(state)
                getgenv().Setting.Misc.__NoFog = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Remove Effect (Fluxus Only)",
            Description = "Disable And Rejoin To Get The Effect Back If You Want Effects",
            Args = {"Misc", "__RemoveEffects"},
            OnChange = function(state)
                getgenv().Setting.Misc.__RemoveEffects = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Disable 3D Render",
            Args = {"Misc", "DisableRender3D"},
            OnChange = function(state)
                getgenv().Setting.Misc.DisableRender3D = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Disable Notifications",
            Args = {"Misc", "__RemoveNotification"},
            OnChange = function(state)
                getgenv().Setting.Misc.__RemoveNotification = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Disable DMG Counter",
            Args = {"Misc", "__RemoveDMGCounter"},
            OnChange = function(state)
                getgenv().Setting.Misc.__RemoveDMGCounter = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "Server Hop",
            Callback = function ()
                IslandCaller("TrueServerHop")
            end
        },
        {
            Mode = "Button",
            Title = "Low Player Server Hop",
            Callback = function ()
                IslandCaller("TrueServerHop",1,3)
            end
        },
        {
            Mode = "Button",
            Title = "Rejoin",
            Callback = function ()
                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",game.JobId)
            end
        },
    },
    ["One Click"] = {
        {
            Mode = "Toggle",
            Title = "Start One Click",
            Description = "Do Not Farm Levels Too Fast Or Enjoy Getting Reseted",
            Args = {"OneClick", "Enable"},
            OnChange = function(state)
                getgenv().Setting.OneClick.Enable = state
                SettingManager:Save()
            end
        },

        {
            Mode = "Toggle",
            Title = "Remove limit 1 Minute Get Quest",
            Description = "Turn This On = Farm Faster But May Get Reseted",
            Args = {"OneClick", "UnlimitGetQuest"},
            OnChange = function(state)
                getgenv().Setting.OneClick.UnlimitGetQuest = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Triple Quests",
            Description = "Only use this if you only farm for a while or get reseted",
            Args = {"OneClick", "TripleQuest"},
            OnChange = function(state)
                getgenv().Setting.OneClick.TripleQuest = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Add Stats",
            Description = "Melee -> Health, The Last One You Chose",
            Args = {"OneClick", "AutoAddStats"},
            OnChange = function(state)
                getgenv().Setting.OneClick.AutoAddStats = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Disable Melees Switcher",
            Description = "Melees Switcher Is For God Human, Turn Off If You Only Want To Farm A Melee",
            Args = {"OneClick", "DisableMeleeSwitcher"},
            OnChange = function(state)
                getgenv().Setting.OneClick.DisableMeleeSwitcher = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Farms All Melee 600 Mastery",
            Description = "Melee -> Health, The Last One You Chose",
            Args = {"OneClick", "Melee600Mastery"},
            OnChange = function(state)
                getgenv().Setting.OneClick.Melee600Mastery = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Hop For Library Key / Water Key",
            Description = "",
            Args = {"OneClick", "Sea2KeyHop"},
            OnChange = function(state)
                getgenv().Setting.OneClick.Sea2KeyHop = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "Redeem All Codes",
            Callback = function()
                IslandCaller("RedeemAllCode")

            end
        }
    },
    ["One Click Debugger"] = {
        {Mode="Label",Title="God Human Progress"},
        {Mode="Label",Title="Raid"},
        {Mode="Label",Title="Spawn Rip Indra"},
        {Mode="Label",Title="Unlock Sea 2"},
        {Mode="Label",Title="Unlock Sea 3"},
        {Mode="Label",Title="Travel Sea 3"},
        
    },
}
print("Adding Shop Items")
    for _,v in pairs((getgenv().IslandVariable and getgenv().IslandVariable.Items) or {}) do 
        for i,t in pairs(v) do
            table.insert(UiIntilize["Shop"],{
                Mode = "Label",
                Title = i .. " Section",
            })
            local AllMelees = {}
            local Caller ={}
            for _,v2 in pairs(t) do
                table.insert(AllMelees,v2.Name)
                Caller[v2.Name]=v2.Args
            end
            table.insert(UiIntilize["Shop"],{Mode="Dropdown",Title=i,Table=AllMelees,OnChange=function (state)
                if Caller[state] then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(table.unpack(Caller[state]))
                end
            end})
        end
    end
    print("Building Ui")
    local BuildUI = function (Tab,i,v,Name)

        if v.Mode == "Toggle" then
            local pointer = getgenv().Setting
            local args = v.Args
            for i = 1, #args - 1 do
                pointer = pointer[args[i]]
            end
            local BuildToggle = {}
            BuildToggle.Title = v.Title
            BuildToggle.Default = pointer[args[#args]]
            if v.Description then
                BuildToggle.Description  = v.Description
            end
            ElementsCollection[Name][v.Title] =  Tab:AddToggle(v.Title, BuildToggle)
            ElementsCollection[Name][v.Title]:OnChanged(function()
                pointer[args[#args]] = UiSetting[v.Title].Value
                if not v.NoSave then
                    SettingManager:Save()
                end
            end)
        elseif v.Mode == "Label" then 
            local BuildLabel = {}
            BuildLabel.Title=v.Title
            if v.Content then
                BuildLabel.Content = v.Content
            end
            ElementsCollection[Name][v.Title] = Tab:AddParagraph(BuildLabel)
        elseif v.Mode == "Button" then
            local BuildButton = {}
            BuildButton.Title = v.Title
            BuildButton.Callback = v.Callback
            if v.Description then 
                BuildButton.Description = v.Description
            end
            ElementsCollection[Name][v.Title]  = Tab:AddButton(BuildButton) 
        elseif v.Mode == "Slider" then
            local BuildSlider = {}
            BuildSlider.Title = v.Title

            if v.Description then 
                BuildSlider.Description = v.Description
            end
            if v.Default then
                BuildSlider.Default = v.Default
            end
            BuildSlider.Min = v.Min
            BuildSlider.Max = v.Max
            BuildSlider.Rounding = 1
            ElementsCollection[Name][v.Title]  = Tab:AddSlider(v.Title,BuildSlider)  
            ElementsCollection[Name][v.Title]:OnChanged(function (v2)
                v.OnChange(tonumber(v2))
            end)
        elseif v.Mode == "Dropdown" then
            local BuildDropdown = {}
            BuildDropdown.Title = v.Title

            if v.Description then 
                BuildDropdown.Description = v.Description
            end
            if v.Multi then
                BuildDropdown.Multi = v.Multi 
            end
            if v.Default then
                BuildDropdown.Default = v.Default 
            end
            BuildDropdown.Values = v.Table
            ElementsCollection[Name][v.Title]  = Tab:AddDropdown(v.Title,BuildDropdown)  
            ElementsCollection[Name][v.Title]:OnChanged(v.OnChange)
        elseif v.Mode == "TextBox" then 
            local BuildTextBox = {}
            BuildTextBox.Title = v.Title
            BuildTextBox.Callback = v.Callback
            BuildTextBox.Finished = v.Finished
            ElementsCollection[Name][v.Title]  = Tab:AddInput(v.Title,BuildTextBox)  
        end
    end
    for _,Name in pairs(UiOrders) do
        TabCollections[Name] = Window:AddTab({ Title = Name, Icon = "" })
        local Tab = TabCollections[Name]
        for i,v in pairs(UiIntilize[Name]) do   
            if type(v)== 'function' then 
                for i2,v2 in pairs(v()) do
                    BuildUI(Tab,i2,v2,Name)
                end
            else
                BuildUI(Tab,i,v,Name)
            end
            if getgenv().SlowLoadUi then
                task.wait()
            end
        end
        
    end
return Title, SubTitle, ElementsCollection

end
task.spawn(function()
    secure_call = loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/secure_call.lua", true))()
    loaded = loaded + 1
end)
repeat task.wait(0.1) until loaded >= total
print("Getting Ui")

local Title = "W-azure [Premium]"
local SubTitle = "True V2 discord.gg/w-azure"

spawn(function()
    SupportRetard()
    
    if getgenv().IgnoreUi then 
        FinishLoadUi = true
        return
    end
    --local suc,err = pcall(function()
    print("Loadin Ui")
        
    if getgenv().IgnoreUi then 
        FinishLoadUi = true
        return
    end
    local suc,err = pcall(function()
        local RTitle, RSubTitle, R = UiData()
        FinishLoadUi = true
        ElementsCollection = R

        if RTitle ~= Title then
            while true do 
            end
        end
        if SubTitle ~= RSubTitle then
            while true do 
            end 
        end
        if not R then
            while true do 
            end
        end
        FinishLoadUi = true
    end)
    if err then
        print("UI Error")
        print(err)
        print(debug.traceback())
    end
        
end)
print("UI Attempt Loaded")
--Mapping Blox Fruit Values
local Enemies = game:GetService("Workspace").Enemies
RaceEntrances = {
    ['Cyborg'] = CFrame.new(28492.52734375, 14895.9755859375, -422.6058654785156),
    ["Human"] = {
        CFrame.new(29019.9609375, 14891.1474609375, -389.439697265625),
        CFrame.new(29237.48828125, 14891.052734375, -204.71849060058594),
    },
    ["Mink"] = CFrame.new(29020.9492, 14890.6328, -380.407867, -0.0712743625, 8.85832776e-08, -0.997456729, -3.87927805e-08, 1, 9.15811214e-08, 0.997456729, 4.52215083e-08, -0.0712743625),
    ["Fishman"] = CFrame.new(28224.0938, 14891.2402, -212.507004, 0.0963651389, -3.22392211e-08, 0.995346069, 3.76359344e-09, 1, 3.20255857e-08, -0.995346069, 6.59927724e-10, 0.0963651389),
    ["Ghoul"] = CFrame.new(28673.8555, 14890.334, 454.733765, -0.999887466, -3.48198981e-09, 0.0150030479, -3.48583518e-09, 1, -2.30164096e-10, -0.0150030479, -2.82436352e-10, -0.999887466),
    ["Skypiea"] = CFrame.new(28967.8086, 14919.2803, 234.668045, -0.00638482161, 3.80502279e-08, -0.999979615, 6.83823131e-08, 1, 3.76143845e-08, 0.999979615, -6.8140757e-08, -0.00638482161),
}
PlacesPosition = {
    SpawnRipIndra = CFrame.new(-5564.91406, 313.950531, -2666.69287, -0.892237544, -1.03326805e-08, -0.451566368, 1.39742387e-08, 1, -5.04931776e-08, 0.451566368, -5.13622034e-08, -0.892237544),
    CenterCastle = Vector3.new(-5581.2353515625, 313.76556396484375, -3064.094970703125),
    DefaultSeaPosition = Vector3.new(0, -10010, 0)
}
LastClick = tick()
AllFruitKeys = {"Z","X","C","V","F"}
Weapon600Mas = {}
GatesInfo = {
    ["Castle"] = {
        CanInstaTP = true,
        Pos = Vector3.new(-5069.12158203125, 314.5155029296875, -3000.46728515625),
    },
    ["Hydra"] = {
        CanInstaTP = true,
        Hitbox = function()
            return game:GetService("Workspace").Map["Boat Castle"].MapTeleportB.Hitbox
        end,
        Pos = Vector3.new(5657.0947265625, 1013.0795288085938, -340.00445556640625),
    },
   -- ["Entrance"] = {
    --    CanInstaTP = true,
    --    Pos = Vector3.new(5369.29345703125, 25.22520637512207, -503.0862731933594),
    --    Hitbox = function()
    --        return game:GetService("Workspace").Map.Waterfall.BossRoom.Door.BossDoor.Hitbox
    --    end,
    --    
    --},
    --["Entrance2"] = {
    --    CanInstaTP = true,
    --    Pos = Vector3.new(-11996.9296875, 331.8427734375, -8839.8603515625),
    --    Hitbox = function()
    --        return game:GetService("Workspace").Map.Turtle.Entrance.Door.BossDoor.Hitbox
    --    end,
    --},
    ["Mansion"] = {
        CanInstaTP = true,
        Pos = Vector3.new(-12547.1396484375, 337.16827392578125, -7471.8818359375)
    }
}
ListNpc = {}
NPCInstances = {}
BlacklistNpcName = {"Boat Dealer","Quest Giver","Dealer","Set Home Point"}
for i,v in pairs(workspace.NPCs:GetChildren()) do 
    IsBlacklist=false
    for _,v2 in pairs(BlacklistNpcName) do 
        if string.find(v.Name,v2) then
            IsBlacklist = true
            break 
        end
    end
    if (v:GetAttribute("FloorPos")-PlacesPosition.DefaultSeaPosition).magnitude < 100 then
        IsBlacklist = true 
    end
    if not IsBlacklist then
        table.insert(ListNpc,v.Name) 
        NPCInstances[v.Name]=v
    end
end
for i,v in pairs(game:GetService("ReplicatedStorage").NPCs:GetChildren()) do 
    IsBlacklist=false
    for _,v2 in pairs(BlacklistNpcName) do 
        if string.find(v.Name,v2) then
            IsBlacklist = true
            break 
        end
    end
    if (v:GetAttribute("FloorPos")-PlacesPosition.DefaultSeaPosition).magnitude < 100 then
        IsBlacklist = true 
    end
    if not IsBlacklist then
        table.insert(ListNpc,v.Name) 
        NPCInstances[v.Name]=v
    end
end
UIInfo = {
    InCombat = LP.PlayerGui.Main.BottomHUDList.InCombat,
    InCombatBottom = LP.PlayerGui.Main.BottomHUDList.InCombatBottom
}
SkillsV3Name ={
    ["Mink"] = "Agility",
    ["Skypiea"] = "Heavenly Blood",
    ["Ghoul"] = "Heightened Senses",
    ["Fishman"] = "Water Body",
    ["Cyborg"] = "Energy Core",
    ["Human"] = "Last Resort"
}
BossQuest = {
    ["2753915549"] = {
        ["The Gorilla King"] = {
            Quest = "JungleQuest",
            Require  = 25,
            LvQuest = 3,
            Pos = CFrame.new(-1604.12012, 36.8521118, 154.23732),
        },
        ["Bobby"] = {
            Quest = "BuggyQuest1",
            Require  = 55,
            LvQuest = 3,
            Pos = CFrame.new(-1139.59717, 4.75205183, 3825.16211),
        },
        ["Yeti"] = {
            Quest = "SnowQuest",
            LvQuest = 3,
            Require  = 110,
            Pos = CFrame.new(1384.90247, 87.3078308, -1296.6825),
        },
        ["Vice Admiral"] = {
            Quest = "MarineQuest2",
            LvQuest = 2,
            Require  = 130,
            Pos = CFrame.new(-5035.42285, 28.6520386, 4324.50293),
        },
        ["Warden"] = {
            Quest = "ImpelQuest",
            LvQuest = 1,
            Require  = 220,
            Pos = CFrame.new(5189.8603515625, 3.5371694564819336, 689.46923828125),
        },
        ["Chief Warden"] = {
            Quest = "ImpelQuest",
            LvQuest = 2,
            Require  = 230,
            Pos = CFrame.new(5189.8603515625, 3.5371694564819336, 689.46923828125),
        },
        ["Swan"] = {
            Quest = "ImpelQuest",
            LvQuest = 3,
            Require  = 230,
            Pos = CFrame.new(5189.8603515625, 3.5371694564819336, 689.46923828125),
        },
        ["Magma Admiral"] = {
            Quest = "MagmaQuest",
            LvQuest = 3,
            Require  = 350,
            Pos = CFrame.new(-5317.07666, 12.2721891, 8517.41699),
        },
        ["Fishman Lord"] = {
            Quest = "FishmanQuest",
            LvQuest = 3,
            Require  = 425,
            Pos = CFrame.new(61123.0859, 18.5066795, 1570.18018),
        },
        ["Wysper"] = {
            Quest = "SkyExp1Quest",
            LvQuest = 3,
            Require  = 500,
            Pos = CFrame.new(-7862.94629, 5545.52832, -379.833954),
        },
        ["Thunder God"] = {
            Quest = "SkyExp2Quest",
            LvQuest = 3,
            Require  = 575,
            Pos = CFrame.new(-7902.78613, 5635.99902, -1411.98706),
        },
        ["Cyborg"] = {
            Quest = "FountainQuest",
            LvQuest = 3,
            Require  = 675,
            Pos = CFrame.new(-5253.54834, 38.5361786, 4050.45166),
        },
    },
    ["4442272183"] = {
        ["Diamond"] = {
            Quest = "Area1Quest",
            LvQuest = 3,
            Require  = 750,
            Pos = CFrame.new(-424.080078, 73.0055847, 1836.91589),
        },
        ["Jeremy"] = {
            Quest = "Area2Quest",
            LvQuest = 3,
            Require  = 850,
            Pos = CFrame.new(632.698608, 73.1055908, 918.666321),
        },
        ["Fajita"] = {
            Quest = "MarineQuest3",
            LvQuest = 3,
            Require  = 925,
            Pos = CFrame.new(-2442.65015, 73.0511475, -3219.11523),          
        },
        ["Smoke Admiral"] = {
            Quest = "IceSideQuest",
            LvQuest = 3,
            Require  = 1150,
            Pos = CFrame.new(-6059.96191, 15.9868021, -4904.7373),          
        },
        ["Awakened Ice Admiral"] = {
            Quest = "FrostQuest",
            LvQuest = 3,
            Require  = 1400,
            Pos = CFrame.new(5669.33203, 28.2118053, -6481.55908),  
        },
        ["Tide Keeper"] = {
            Quest = "ForgottenQuest",
            LvQuest = 3,
            Require  = 1475,
            Pos = CFrame.new(-3053.89648, 236.881363, -10148.2324),  
        },
    },
    ["7449423635"]  = {
        ["Stone"] = {
            Quest = "PiratePortQuest",
            LvQuest = 3,
            Require  = 1550,
            Pos = CFrame.new(-288.003815, 43.7675667, 5573.12012),  
        },
        ["Island Empress"]  = {
            Quest = "AmazonQuest2",
            LvQuest = 3,
            Require  = 1675,
            Pos = CFrame.new(5444.14355, 601.603821, 751.306763),  
        },
        ["Kilo Admiral"] = {
            Quest = "MarineTreeIsland",
            LvQuest = 3,
            Require  = 1750,
            Pos = CFrame.new(2223.3645, 28.7049141, -6719.18408),
        },
        ["Captain Elephant"] = {
            Quest = "DeepForestIsland",
            LvQuest = 3,
            Require  = 1875,
            Pos = CFrame.new(-13231.1602, 333.744446, -7624.40723),
        },
        ["Cake Queen"] = {
            Quest = "IceCreamIslandQuest",
            LvQuest = 3,
            Require  = 1875,
            Pos = CFrame.new(-821.71612548828, 65.819519042969, -10965.169921875),
        }
    },
}   
AllBoss = {
    ["2753915549"] = {
        "Saber Expert","The Saw","Bobby","The Gorilla King","Yeti","Vice Admiral",
        "Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper",
        "Thunder God","Cyborg"
    },
    ["4442272183"] =  {
        "Diamond","Jeremy","Fajita","Smoke Admiral","Awakened Ice Admiral","Tide Keeper",
        "Don Swan","Cursed Captain"
    },
    ["7449423635"] = {
        "Stone","Island Empress","Kilo Admiral","Captain Elephant","Cake Queen","Beautiful Pirate",
        "Soul Reaper","rip_indra True Form","Cake Prince","Dough King"
    },
}
getgenv().AllBoss = AllBoss
AutoBlackSmithv1 = {
    ["Dark Blade"] = {
        ["Magma Ore"] = 10,
        ["Dragon Scale"] = 15,
        ["Dark Fragment"] = 1,
    },
    ["Cursed Dual Katana"] = {
        ["Scrap Metal"] = 60,
        ["Mini Tusk"] = 10,
        ["Demonic Wisp"] = 10,
    },
    ["Hallow Scythe"] = {
        ["Scrap Metal"] = 25,
        ["Bones"] = 800,
        ["Demonic Wisp"] = 8,
    },
    ["True Triple Katana"] = {
        ["Leather"] = 50,
        ["Mystic Droplet"] = 20,
        ["Dragon Scale"] = 5,
    },
    ["Spikey Trident"] = {
        ["Scrap Metal"] = 25,
        ["Conjured Cocoa"] = 8,
        ["Mystic Droplet"] = 5,
    },
    ["Koko"] = {
        ["Scrap Metal"] = 15,
        ["Vampire Fang"] = 10,
    },
    ["Tushita"] = {
        ["Leather"] = 6,
        ["Mini Tusk"] = 20,
    },
    ["Pole (2nd Form)"] = {
        ["Scrap Metal"] = 12,
        ["Mystic Droplet"] = 10,
        ["Fish Tail"] = 15,
    },
    ["Saddi"] = {
        ["Leather"] = 10,
        ["Mystic Droplet"] = 8,
    },
    ["Saber"] = {
        ["Scrap Metal"] = 10,
        ["Radioactive Material"] = 5,
        ["Magma Ore"] = 10,
    },
    ["Yama"] = {
        ["Leather"] = 6,
        ["Mini Tusk"] = 20,
    },
    ["Midnight Blade"] = {
        ["Scrap Metal"] = 15,
        ["Ectoplasm"] = 40,
    },
    ["Buddy Sword"] = {
        ["Leather"] = 25,
        ["Conjured Cocoa"] = 8,
        ["Mystic Droplet"] = 5,
    },
    ["Shisui"] = {
        ["Leather"] = 10,
        ["Mystic Droplet"] = 8,
    },
    ["Bisento"] = {
        ["Scrap Metal"] = 15,
        ["Angel Wings"] = 12,
        ["Magma Ore"] = 10,
    },
    ["Pole (1st Form)"] = {
        ["Scrap Metal"] = 20,
        ["Angel Wings"] = 10,
        ["Radioactive Material"] = 10,
    },
    ["Canvander"] = {
        ["Leather"] = 20,
        ["Dragon Scale"] = 6,
    },
    ["Dark Dagger"] = {
        ["Scrap Metal"] = 10,
        ["Dragon Scale"] = 8,
        ["Dark Fragment"] = 1,
    },
    ["Rengoku"] = {
        ["Vampire Fang"] = 8,
        ["Scrap Metal"] = 15,
        ["Magma Ore"] = 20,
    },
    ["Wando"] = {
        ["Leather"] = 10,
        ["Mystic Droplet"] = 8,
    },
    ["Longsword"] = {
        ["Scrap Metal"] = 10,
        ["Radioactive Material"] = 10,
    },
    ["Pipe"] = {
        ["Scrap Metal"] = 10,
        ["Fish Tail"] = 12,
    },
    ["Dragon Trident"] = {
        ["Leather"] = 10,
        ["Dragon Scale"] = 10,
    },
    ["Jitte"] = {
        ["Scrap Metal"] = 15,
        ["Vampire Fang"] = 10,
    },
    ["Dual-Headed Blade"] = {
        ["Scrap Metal"] = 10,
        ["Fish Tail"] = 12,
    },
    ["Gravity Cane"] = {
        ["Scrap Metal"] = 10,
        ["Meteorite"] = 3,
    },
    ["Soul Cane"] = {
        ["Leather"] = 20,
        ["Radioactive Material"] = 5,
    },
    ["Iron Mace"] = {
        ["Leather"] = 10,
        ["Angel Wings"] = 10,
    },
    ["Shark Saw"] = {
        ["Leather"] = 12,
    },
    ["Twin Hooks"] = {
        ["Leather"] = 20,
        ["Mini Tusk"] = 8,
        ["Fish Tail"] = 10,
    },
    ["Triple Katana"] = {
        ["Leather"] = 15,
        ["Scrap Metal"] = 15,
    },
    ["Skull Guitar"] = {
        ["Magma Ore"] = 10,
        ["Dragon Scale"] = 15,
        ["Dark Fragment"] = 1,
    },
    ["Kabucha"] = {
        ["Leather"] = 50,
        ["Dragon Scale"] = 15,
        ["Vampire Fang"] = 3,
    },
    ["Serpent Bow"] = {
        ["Meteorite"] = 1,
        ["Scrap Metal"] = 10,
        ["Vampire Fang"] = 10,
    },
    ["Bazooka"] = {
        ["Magma Ore"] = 10,
        ["Dragon Scale"] = 15,
        ["Dark Fragment"] = 1,
    },
    ["Cannon"] = {
        ["Leather"] = 5,
        ["Fish Tail"] = 5,
        ["Magma Ore"] = 5,
    },
    ["Refined Musket"] = {
        ["Scrap Metal"] = 10,
        ["Fish Tail"] = 10,
    },
    ["Refined Slingshot"] = {
        ["Scrap Metal"] = 10,
        ["Angel Wings"] = 10,
    },
    ["Bizarre Rifle"] = {
        ["Leather"] = 20,
        ["Angel Wings"] = 10,
        ["Magma Ore"] = 5,
    },
    ["Musket"] = {
        ["Leather"] = 5,
        ["Fish Tail"] = 5,
    },
    ["Flintlock"] = {
        ["Leather"] = 5,
        ["Magma Ore"] = 5,
    },  
    ["Refined Musket"] = {
        ["Scrap Metal"] = 10,
        ["Fish Tail"] = 10,
    },
    ["Acidum Rifle"] = {
        ["Leather"] = 10,
        ["Vampire Fang"] = 8,
    },
}


local GetUpdateBloxFruitCode = {"GAMERROBOT_YT","FUDD10","fudd10_v2","BIGNEWS","THEGREATACE","SUB2NOOBMASTER123","Sub2Daigrock","Axiore"
,"TantaiGaming","STRAWHATMAINE","Sub2OfficialNoobie","UPD16","SUB2GAMERROBOT_EXP1","3BVISITS","Enyu_is_Pro","Sub2Fer999","Bluxxy","JCWK"
,"Magicbus","Starcodeheo","kittgaming","ADMINGIVEAWAY","GAMER_ROBOT_1M","Sub2CaptainMaui","15B_BESTBROTHERS","DEVSCOOKING","krazydares","Sub2CaptainMaui","DEVSCOOKING",
"KITT_RESET","Sub2UncleKizaru","SUB2GAMERROBOT_RESET1","NOMOREHACK","BANEXPLOIT","GIFTING_HOURS"}

local IsNightC = {
    "18","19","20","21","23","24","00","01","02","03","04"
}

function IsNight()
    return table.find(IsNightC,tostring(game:GetService("Lighting").TimeOfDay:split(':')[1]))

end
local MoonStatus = {
    [4] = "Near Full Moon",
}

local function CheckMoon()
    local MoonCheck = game:GetService("Lighting"):GetAttribute("MoonPhase")

    
    local LastDigit = tonumber(string.sub(tostring(MoonCheck),#tostring(MoonCheck)));
    if MoonStatus[LastDigit] then 
        return MoonStatus[LastDigit]
    end
    if MoonCheck%5==0 then
        return "Full Moon OMG"
    end
    return LastDigit
end
function TimeRemain()
    if IsNight() then
        local timeremaining = 10 
        if table.find(IsNightC,tostring(game:GetService("Lighting").TimeOfDay:split(':')[1])) >= 6 then
            timeremaining = timeremaining - table.find(IsNightC,tostring(game:GetService("Lighting").TimeOfDay:split(':')[1])) + 1 
        else
            timeremaining = timeremaining - table.find(IsNightC,tostring(game:GetService("Lighting").TimeOfDay:split(':')[1])) 
            
        end
        return timeremaining
    end
end
spawn(function () --Cant Change Good Luck
    while task.wait() do
        for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if IsAlive(v) and v:IsA("Model") then
                v.Parent = Enemies
            end
        end
        for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
            if IsAlive(v) and v:IsA("Model") then
                v.Parent = Enemies
            end
        end
    end
end)
do 
    spawn(function()

        
        local function bxor(a, b)
            local result = 0
            local bitval = 1
            while a > 0 and b > 0 do
                local aOdd = a % 2 == 1
                local bOdd = b % 2 == 1
                if aOdd ~= bOdd then
                    result = result + bitval
                end
                a = math.floor(a / 2)
                b = math.floor(b / 2)
                bitval = bitval * 2
            end
            result = result + (a + b) * bitval
            return result
        end
        local charsMap = {"\1", "\2", "\3", "\4", "\5", "\6", "\7", "\8", "\9", "\10", "\11", "\12", "\13", "\14", "\15", "\16", "\17", "\18", "\19", "\20", "\21", "\22", "\23", "\24", "\25", "\26", "\27", "\28", "\29", "\30", "\31", "\32", "\33", "\34", "\35", "\36", "\37", "\38", "\39", "\40", "\41", "\42", "\43", "\44", "\45", "\46", "\47", "\48", "\49", "\50", "\51", "\52", "\53", "\54", "\55", "\56", "\57", "\58", "\59", "\60", "\61", "\62", "\63", "\64", "\65", "\66", "\67", "\68", "\69", "\70", "\71", "\72", "\73", "\74", "\75", "\76", "\77", "\78", "\79", "\80", "\81", "\82", "\83", "\84", "\85", "\86", "\87", "\88", "\89", "\90", "\91", "\92", "\93", "\94", "\95", "\96", "\97", "\98", "\99", "\100", "\101", "\102", "\103", "\104", "\105", "\106", "\107", "\108", "\109", "\110", "\111", "\112", "\113", "\114", "\115", "\116", "\117", "\118", "\119", "\120", "\121", "\122", "\123", "\124", "\125", "\126", "\127", "\128", "\129", "\130", "\131", "\132", "\133", "\134", "\135", "\136", "\137", "\138", "\139", "\140", "\141", "\142", "\143", "\144", "\145", "\146", "\147", "\148", "\149", "\150", "\151", "\152", "\153", "\154", "\155", "\156", "\157", "\158", "\159", "\160", "\161", "\162", "\163", "\164", "\165", "\166", "\167", "\168", "\169", "\170", "\171", "\172", "\173", "\174", "\175", "\176", "\177", "\178", "\179", "\180", "\181", "\182", "\183", "\184", "\185", "\186", "\187", "\188", "\189", "\190", "\191", "\192", "\193", "\194", "\195", "\196", "\197", "\198", "\199", "\200", "\201", "\202", "\203", "\204", "\205", "\206", "\207", "\208", "\209", "\210", "\211", "\212", "\213", "\214", "\215", "\216", "\217", "\218", "\219", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\228", "\229", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\238", "\239", "\240", "\241", "\242", "\243", "\244", "\245", "\246", "\247", "\248", "\249", "\250", "\251", "\252", "\253", "\254", "\255"}
        charsMap[0] = "\0"
        local function safe_string_char(...)
            local res = ""
            local tbl = {...}
            for i=1,#tbl do
                res = res .. charsMap[tbl[i]]
            end
            return res
        end
        local function stringtonumber(str)
            local encoded = ""
            for i = 1, #str do
                local ascii = string.byte(str, i)
                encoded = encoded .. string.format("%03d", ascii)
            end
            return encoded
        end
        local function numbertostring(num)
            local str = tostring(num)
            local decoded = ""
            for i = 1, #str, 3 do
                local ascii = tonumber(str:sub(i, i+2))
                decoded = decoded .. safe_string_char(ascii)
            end
            return decoded
        end
        local function xorEncryptDecrypt(input, key)
            local output = {}
            for i = 1, #input do
                local byte = bxor(string.byte(input, i), string.byte(key, (i - 1) % #key + 1))
                table.insert(output, safe_string_char(byte))
            end
            return table.concat(output)
        end
        local function mqs(data)
            local qs = ''
            for k, v in pairs(data) do
                qs = qs .. k .. '=' .. v .. '&'
            end
            return qs:sub(1, #qs-1)
        end
        local function shiftString(inputString, shiftAmount)
            local shiftedString = ""
            for i = 1, #inputString do
                local charCode = string.byte(inputString, i)
                if charCode >= 65 and charCode <= 90 then  -- Uppercase letters
                    charCode = (charCode - 65 + shiftAmount) % 26 + 65
                elseif charCode >= 97 and charCode <= 122 then  -- Lowercase letters
                    charCode = (charCode - 97 + shiftAmount) % 26 + 97
                end
                shiftedString = shiftedString .. safe_string_char(charCode)
            end
            return shiftedString
        end
        local function generateRandomLikeString()
            local rawString = tostring({}) .. tostring(function() end)
            
            local numbers = {}
            for num in rawString:gmatch("%d+") do
                table.insert(numbers, num)
            end
            
            local letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'}
            local result = ""
            local letterIndex = 1
            
            for _, num in ipairs(numbers) do
                for i = 1, #num do
                    result = result .. num:sub(i, i)
                    if letterIndex <= #letters then
                        result = result .. letters[letterIndex]
                        letterIndex = letterIndex + 1
                        if letterIndex > #letters then
                            letterIndex = 1 -- Reset index to cycle through letters again
                        end
                    end
                end
            end
            
            return result
        end
        local function generateRandomLikeStringV2()
            local rawString = tostring({}) .. tostring(function() end) .. tostring(game:GetService("HttpService"):GenerateGUID(false)) .. tostring(math.random()) .. tostring(os.clock())..tostring(game.Workspace.DistributedGameTime)
            
            local numbers = {}
            for num in rawString:gmatch("%d+") do
                table.insert(numbers, num)
            end
            
            local letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
            local result = ""
            
            for _, num in ipairs(numbers) do
                for i = 1, #num do
                    result = result .. num:sub(i, i)
                    result = result .. letters[math.random(#letters)]
                end
            end
            
            local shuffledResult = {}
            for i = 1, #result do
                table.insert(shuffledResult, result:sub(i,i))
            end
            
            for i = #shuffledResult, 2, -1 do
                local j = math.random(i)
                shuffledResult[i], shuffledResult[j] = shuffledResult[j], shuffledResult[i]
            end
            
            return table.concat(shuffledResult)
        end
        local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- You will need this for encoding/decoding
        -- encoding
        function enc(data)
            return ((data:gsub('.', function(x) 
                local r,b='',x:byte()
                for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
                return r;
            end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
                if (#x < 6) then return '' end
                local c=0
                for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
                return b:sub(c+1,c+1)
            end)..({ '', '==', '=' })[#data%3+1])
        end
        -- decoding
        function dec(data)
            data = string.gsub(data, '[^'..b..'=]', '')
            return (data:gsub('.', function(x)
                if (x == '=') then return '' end
                local r,f='',(b:find(x)-1)
                for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
                return r;
            end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
                if (#x ~= 8) then return '' end
                local c=0
                for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
                    return safe_string_char(c)
            end))
        end
        local function SendPanel()
            local HTTPS = game:GetService("HttpService")
            local LP = game.Players.LocalPlayer
            local DataC = game.Players.LocalPlayer.Data
            local Level = tostring(DataC.Level.Value)
            local Beli = tostring(DataC.Beli.Value)
            local Fragment = tostring(DataC.Fragments.Value)
            local Returned = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
            while not Returned do 
                task.wait(1)
                Returned = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
            end
            local Race = tostring(LP.Data.Race.Value) .. "[%s]"
            
            local Melee = ""
            local WeakMelee = {"BlackLeg","Electro","FishmanKarate"}
            local AllMelee = {"Superhuman","SharkmanKarate","DeathStep","ElectricClaw","Godhuman","DragonTalon","SanguineArt"}
            local MeleeString = "%s / 6"
            local dem = 0
            local CurrentSea = (Sea1 and "1") or  (Sea2 and "2") or  (Sea3 and "3")
            for i,v in pairs(AllMelee) do
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy"..v,true) == 1  then
                    dem = dem +1
                end
            end
            if dem == 7 then
                MeleeString = "Sanguine Art"
            elseif dem == 6 then
                MeleeString = "God Human"
            else
                MeleeString = MeleeString:format(tostring(dem))
            end
            
            local SkillsV3Name ={
                ["Mink"] = "Agility",
                ["Skypiea"] = "Heavenly Blood",
                ["Ghoul"] = "Heightened Senses",
                ["Fishman"] = "Water Body",
                ["Cyborg"] = "Energy Core",
                ["Human"] = "Last Resort"
            }
            LP = game.Players.LocalPlayer
            Type = ""
            local function CheckRaceV3()
                for i,v in pairs(LP.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == Type and v.Name == SkillsV3Name[LP.Data.Race.Value] then
                        return true
                        
                    end
                end
                for i,v in pairs(LP.Character:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == Type and v.Name == SkillsV3Name[LP.Data.Race.Value] then
                        return true
                    end
                end
            end
            if CheckRaceV3() then
                Race = Race:format("V3")
            elseif  LP.Data.Race:FindFirstChild("Evolved") then
                Race = Race:format("V2")
            else
                Race = Race:format("V1")
            end
            Melee = string.sub(Melee,1,#Melee> 2 and #Melee-2 or 1)
            local function GetAwaken()
                return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
             end
            local AwakenStr = ""
            local Order = {"Z","X","C","V","F","TAP"}
            local CheckAwaken = GetAwaken()
            if not CheckAwaken then
                AwakenStr = "Can't Awaken"
            else
                for i,v in pairs(Order) do
                    if CheckAwaken[v] and CheckAwaken[v].Awakened then
                        AwakenStr = AwakenStr .. v  ..  ", "
                    end
                end
            
            end
            local Arr = {
                Sword = {},
                Material = {},
                ["Blox Fruit"] = {},
                Wear = {},
                Gun = {},
            }
            local Arr2 = {
                Sword = {},
                Material = {},
                ["Blox Fruit"] = {},
                Wear = {},
                Gun = {},
            }
            local MythicalFruit = {}
            for i,v in pairs(Returned) do
                if Arr[v.Type] then
                    table.insert(Arr[v.Type],v)
                end
            end
            local MythicalWeapon = {}
            local Rarities = {3,2,1,0}
            for i,v in pairs(Arr) do
                if i=="Material" or i == "Blox Fruit" then
                    continue
                end
                for i2,v2 in pairs(v) do
                    local Marked = false
                    for i3,v3 in pairs(Rarities) do
                        if v2.Rarity == v3 then
                            table.insert(Arr2[i],v2.Name)
                            Marked=true
                        end
                    end
                    if Marked then
                        continue
                    end
                    table.insert(MythicalWeapon,v2.Name)
            
                end
            end
            Rarities = {4,3,2,1,0}
            
            for i,v in pairs(Arr) do
                if i~="Material" and i ~= "Blox Fruit" then
                    continue
                end
                for i2,v2 in pairs(v) do
                    for i3,v3 in pairs(Rarities) do
            
                        if v2.Rarity == v3 then
                            table.insert(Arr2[i],v2.Name)
                        end
                    end
                    if v2.Rarity ==4 and i == "Blox Fruit"  then 
                        table.insert(MythicalFruit,v2.Name)
                    end
                end
            end
            local MythicalIns = ""
            local SwordIns = ""
            local MaterialIns = ""
            local FruitIns = ""
            local WearIns = ""
            local GunIns = ""
            local MythicalFruitIns = ""
            for i,v in pairs(MythicalWeapon) do
                MythicalIns = MythicalIns..v..", "
            end
            for i,v in pairs(MythicalFruit) do
                MythicalFruitIns = MythicalFruitIns..v..", "
            end
            for i,v in pairs(Arr2["Sword"]) do
                SwordIns = SwordIns..v..", "
            end
            for i,v in pairs(Arr2["Material"]) do
                MaterialIns = MaterialIns..v..", "
            end
            for i,v in pairs(Arr2["Blox Fruit"]) do
                FruitIns = FruitIns..v..", "
            end
            for i,v in pairs(Arr2["Wear"]) do
                WearIns = WearIns..v..", "
            end
            for i,v in pairs(Arr2["Gun"]) do
                GunIns = GunIns..v..", "
            end
            SwordIns = string.sub(SwordIns,1,#SwordIns-2)
            
            
            local MiscInfoTable = {}
            local miscinfo = ""
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor")  then
                table.insert(MiscInfoTable,"Unlocked Entrance")
            else
                local Curstate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Check") 
                if Curstate and type(Curstate) == "number" then 
                    table.insert(MiscInfoTable,"Entrace Stage: " .. tostring(Curstate))
                end
            end
            if string.find(MaterialIns,"Mirror Fractal") then 
                table.insert(MiscInfoTable,"Mirror Fractal")
            end
            if string.find(WearIns,"Valkyrie Helm") then 
                table.insert(MiscInfoTable,"Valkyrie Helm")
            end
            for i,v in pairs(MiscInfoTable) do
                miscinfo = miscinfo..v..", "
            end
            
            
            Status = StatusFarming .. "[%s]"
            Status=Status:format(tostring(StatusFarming2))
            local clientPublic = generateRandomLikeStringV2()
            local ClientPrivate = shiftString("DitConMeMayNhinNhinCaiLonOcCacCutMeDi12312312313097473@@@", 1)
            local Data = {
                ["Client"] = clientPublic,
                ["Username"] = game.Players.LocalPlayer.Name,
                ["Discord"] = 'Unknown'
            }
            local response = request{
                Url = "https://thetakenisland.xyz/api/script/diffhell.php",
                Method = "POST",
                headers = {
                    ["Content-Type"] = "application/x-www-form-urlencoded",
                },
                Body = mqs(Data),
            }
            local serverPublic = HTTPS:JSONDecode(response.Body).Server
            local sharedSecret = enc(xorEncryptDecrypt(clientPublic, serverPublic))
            local message = "Hello from Lua!"
            function EncryptAndToHex(str,key)
                str = xorEncryptDecrypt(str, key)
                str = str:gsub('.', function(c)
                    return string.format('%02X', string.byte(c))
                end)
                return str
            end
            --print(sharedSecret..ClientPrivate)
            function EncryptTable(Tbl,IgnoreIndex)
                local IgnoreIndex = IgnoreIndex or {}
                for i,v in pairs(Tbl) do 
                    if not table.find(IgnoreIndex,i) then 
                        Tbl[i]= EncryptAndToHex(v,sharedSecret..ClientPrivate)
                    end
                end
            end
            function AddData(Tbl)
                Tbl["Message"] = message
                Tbl["sharedSecret"] = stringtonumber(sharedSecret)
                Tbl["JobId"] = game.JobId
                Tbl["Username"] = game.Players.LocalPlayer.Name
                Tbl["TimeStamp"]= tostring(os.time())
                Tbl["Discord"] = 'Unknown'
            end
            --[[
            local encryptedMessage = xorEncryptDecrypt(message, sharedSecret..ClientPrivate)
            local encryptedMessageHex = encryptedMessage:gsub('.', function(c)
                return string.format('%02X', string.byte(c))
            end)
            print(sharedSecret,stringtonumber(sharedSecret))
            print(encryptedMessage)
            print(encryptedMessageHex)]]
            local Data = {
                Username=LP.Name,
                level=Level,
                beli=Beli,
                fragment=Fragment,
                bounty= tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value),
                sea=CurrentSea,
                melee=MeleeString,
                mythicalweapon = MythicalIns,
                mythicalfruit = MythicalFruitIns,
                sword=SwordIns,
                gun=GunIns,
                wear=WearIns,
                dfstored=FruitIns,
                miscinfo=miscinfo,
                dfs=DataC.DevilFruit.Value == "" and "Fruitless" or DataC.DevilFruit.Value,
                Awaken = AwakenStr,
                CheckSum = "DitMeMaySpamDi?",
                Status =Status,
                Traffic = "Blox Fruit Panel",
                Race=Race,
            }
            AddData(Data)
            EncryptTable(Data,{"sharedSecret"})
            response = request{
                Url = "https://thetakenisland.xyz/api/script/diffhell.php",
                Method = "POST",
                headers = {
                    ["Content-Type"] = "application/x-www-form-urlencoded",
                },
                Body = mqs(Data),
            }
            if not LPH_OBFUSCATED then
              --  print(response.Body)
            end
        end
        spawn(function()
            while task.wait(120) do 
                if getgenv().Setting.Panel.Enable then
                    SendPanel()
                end
            end
        end)
    end)
end
--Notify 2
do 
    repeat task.wait()
    until game:IsLoaded() and game:GetService("Players") and game:GetService("Players").LocalPlayer and game.ReplicatedStorage and game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local req = http_request or request or (http and http.request) or (game.HttpGet or httpget)
    local IsNightC = {
        "18","19","20","21","23","24","00","01","02","03","04"
    }
    local MoonStatus = {
        [4] = "Near Full Moon",
    }
    local RareBoss = {"Dough King" , "Darkbeard"  , "rip_indra True Form"}
    local CommonBoss = {"Cursed Captain", "Soul Reaper"}
    local BossNotified = {}
    local MAP = workspace:GetAttribute("MAP")
    if MAP == "Sea1" then
        Sea1 = true
    elseif MAP == "Sea2" then
        Sea2 = true
    elseif MAP == "Sea3" then
        Sea3 = true
    end
    local Enemies = game.Workspace.Enemies
    local IsAlive = function(Object,HaveHRP,HaveHumanoid)
        if Object and Object.Parent and Object:FindFirstChild("HumanoidRootPart") and Object:FindFirstChild('Humanoid') then
            if Object:FindFirstChild('Humanoid').Health and Object:FindFirstChild('Humanoid').Health > 0 then
                return true
            end
        end
        return false
    end
    function CheckEnemySpawn(Name) --For Hard Boss only
        if IsAlive(Enemies:FindFirstChild(Name)) then
            return true 
        end
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
            if (v.Name == Name or string.find(v.Name,Name)) and v:GetAttributes().Active then 
                return true
            end
        end
    end
    local function CheckMoon()
        local MoonCheck = game:GetService("Lighting"):GetAttribute("MoonPhase")
    
        
        local LastDigit = tonumber(string.sub(tostring(MoonCheck),#tostring(MoonCheck)));
        if MoonStatus[LastDigit] then 
            return MoonStatus[LastDigit]
        end
        if MoonCheck%5==0 then
            return "Full Moon OMG"
        end
        return LastDigit
    end
    function IsNight()
        return table.find(IsNightC,tostring(game:GetService("Lighting").TimeOfDay:split(':')[1]))
    
    end
    
    function TimeRemain()
        if IsNight() then
            local timeremaining = 10 
            if table.find(IsNightC,tostring(game:GetService("Lighting").TimeOfDay:split(':')[1])) >= 6 then
                timeremaining = timeremaining - table.find(IsNightC,tostring(game:GetService("Lighting").TimeOfDay:split(':')[1])) + 1 
            else
                timeremaining = timeremaining - table.find(IsNightC,tostring(game:GetService("Lighting").TimeOfDay:split(':')[1])) 
                
            end
            return timeremaining
        end
    end
    local ServerDataGet = {
        DayTime = function() 
            return IsNight() 
        end,
        NightTimeRemain = function ()
            return TimeRemain()
        end,
        TimeTillNight = function()
            return 18-game.Lighting.ClockTime
        end,
        ClockTime = function ()
            return tostring(game.Lighting.ClockTime)
        end,
        SwordName = function()
            if Sea2 then
                return game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
            end
    
            return "None"
        end,
        BossName = function ()
            return "None"
        end
    }
    local AllData = {"PlayerCount","JobId","Type","NightTimeRemain","ClockTime","DayTime","TimeTillNight","SwordName","BossName"}
    local RequireData = {
        ["Mirage"] = {"JobId","PlayerCount","DayTime","NightTimeRemain","TimeTillNight"},
        ["FullMoon"] = {"JobId","PlayerCount","DayTime","NightTimeRemain"},
        ["NearFullMoon"] = {"JobId","PlayerCount","DayTime","TimeTillNight"},
        ["LegendarySword"] = {"JobId","PlayerCount","SwordName"},
        ["CommnonBoss"]  = {"JobId","PlayerCount"},
    }
    local function GetServerData(Type,AdditionData)
        local ServerData = {
            JobId = game.JobId,
            PlayerCount = #game.Players:GetPlayers(),
        }
        for i,v in pairs(AllData) do
            if ServerDataGet[v] then 
                ServerData[v]=ServerDataGet[v]()
            end 
        end
        if type(AdditionData) =='table' then
            for i,v in pairs(AdditionData) do 
                ServerData[i]=v 
            end
        end
        ServerData.Type = Type
        return ServerData
    end
    
    local function SendNotify(Data)
        
        local url = "https://thetakenisland.xyz/api/notify/main.php"
    
        local response = request({
            Url = url,
            Method = "POST",
            headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService('HttpService'):JSONEncode(Data),
        })
        return response
    end
    local ListNotifier = {"FullMoon","NearFullMoon","Mirage","LegendarySword","CommonBoss","RareBoss"}
    local NotifyFunc = {
        FullMoon = function()
            local ServerData = GetServerData("FullMoon")
            local response = SendNotify(ServerData)
            print(response.Body)
        end,
        NearFullMoon = function()
            local ServerData = GetServerData("NearFullMoon")
            local response = SendNotify(ServerData)
            print(response.Body)
        end,
        Mirage = function()
            local ServerData = GetServerData("Mirage")
            local response = SendNotify(ServerData)
            print(response.Body)
        end,
        LegendarySword = function()
            local ServerData = GetServerData("LegendarySword")
            local response = SendNotify(ServerData)
            print(response.Body)
        end,
        CommonBoss = function(Name)
            local ServerData = GetServerData("CommonBoss",{BossName=Name})
            local response = SendNotify(ServerData)
            print(response.Body)
        end,
        RareBoss = function(Name)
            local ServerData = GetServerData("RareBoss",{BossName=Name})
            local response = SendNotify(ServerData)
            print(response.Body)
        end,
    }
    function StartMoonLoop()
        local FullMoonPhase,FullMoonDay
        game.Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
            if CheckMoon() == "Full Moon OMG"  then
                if IsNight() then
                    if not FullMoonPhase then
                        FullMoonPhase = true
                        FullMoonDay = false
                        NotifyFunc.FullMoon()
                    end
                elseif 18-game.Lighting.ClockTime >= 0 and game.Lighting.ClockTime < 18 and game.Lighting.ClockTime >= 13 then
                    if not FullMoonDay then
                        FullMoonDay = true
                        NotifyFunc.NearFullMoon()
                    end
                end
    
            else
                FullMoonPhase = false
            end
        end)
    end
    function StartMirageLoop()
        for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
            if string.find(v.Name,"MysticIsland")  then
                NotifyFunc.Mirage()
            end
        end
        game.Workspace.Map.ChildAdded:Connect(function(p1)
            if string.find(p1.Name,"MysticIsland") then
                NotifyFunc.Mirage()
            end
        end)
    end
    function StartLegendarySword() 
        if  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
            NotifyFunc.LegendarySword()
            FoundLegendarySword = true
            delay(1500,function()
                FoundLegendarySword = false
            end)
        end
        spawn(function()
            while Sea2 and task.wait(60) do
                if not FoundLegendarySword and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")   then
                    NotifyFunc.LegendarySword()
                    FoundLegendarySword = true
                    delay(1500,function()
                        FoundLegendarySword = false
                    end)
                end
            end
        end)
    end
    if game:GetService("ReplicatedStorage").PrivateServerOwnerId.Value==0 then
        if Sea2 then 
            StartLegendarySword()
        end
        if Sea3 then
            StartMoonLoop()
            StartMirageLoop()
    
        end
        
        spawn(function()
            while task.wait(5) do
    
                for i,v in pairs(RareBoss) do 
                    local BossCheck = CheckEnemySpawn(v)
                    if BossCheck then
                        if not BossNotified[v] or (tick()-BossNotified[v]) >= 20*60 then
                            print("Notified",v)
                            BossNotified[v] = tick()
                            NotifyFunc.RareBoss(v)
                        end
                    end
                end
                for i,v in pairs(CommonBoss) do 
                    local BossCheck = CheckEnemySpawn(v)
                    if BossCheck then
                        if not BossNotified[v] or (tick()-BossNotified[v]) >= 20*60 then
                            print("Notified",v)
                            BossNotified[v] = tick()
                            NotifyFunc.CommonBoss(v)
                        end
                    end
                end
            end
        end)
    end
end
--Characters Functions
local function GetPlayers()
    local tbl = Players:GetPlayers()
    table.remove(tbl,table.find(tbl,LP))
    return tbl
end
local function __StrGetPlayers()
    local tbl = {}
    for i,v in pairs(Players:GetPlayers()) do 
        if v == LP then
            continue 
        end
        table.insert(tbl,v.Name) 
    end
    return tbl
end
local function getRoot(char)
    return char:FindFirstChild("HumanoidRootPart")
end
local function getHead(char)
    if char.Parent == Players then
        char = char.Character
    end
    if char then
        local headchar = char:FindFirstChild('Head')
        return headchar
    end
    return false
end
local function getHum(char)
    if char then
        local humPart = char:FindFirstChild('Humanoid')
        return humPart
    end
    return false
end
local IsAlive = function(Object,HaveHRP,HaveHumanoid)
    if Object and Object.Parent and getRoot(Object) and Object:FindFirstChild('Humanoid') then
        if Object:FindFirstChild('Humanoid').Health and Object:FindFirstChild('Humanoid').Health > 0 then
            return true
        end
    end
    return false
end
getgenv().Alive = function()
    if LP.Character then
        if getRoot(LP.Character) and LP.Character:FindFirstChild('Humanoid') then
            if LP.Character:FindFirstChild('Humanoid').Health > 0 then    
                return true
            end
        end
    end

    return false
end
local function ResizeHRP(Mob,NoCollide)
    if Mob and getRoot(Mob) then
        getRoot(Mob).Transparency = 1
        if NoCollide then
            getRoot(Mob).CanCollide = false
        end
        getRoot(Mob).Size = Vector3.new(50,50,50)
    end
end
local Floating = function(bool)
    if getRoot(LP.Character) then
        if bool then
            if not getRoot(LP.Character):FindFirstChild("VelocityBody") then
                local BV = Instance.new("BodyVelocity")
                BV.Parent = getRoot(LP.Character)
                BV.Name = "VelocityBody"
                BV.MaxForce = Vector3.new(100000, 100000, 100000)
                BV.Velocity = Vector3.new(0, 0, 0)
            end
        else
            if getRoot(LP.Character):FindFirstChild("VelocityBody") then
                getRoot(LP.Character).VelocityBody:Destroy()
            end
        end
    end
end
local RunningSteppedLoop = {}
function CreateSteppedLoop(func,Name)
    if Name then
        if RunningSteppedLoop[Name] then
            return RunningSteppedLoop[Name]
        end 
    end
    local Con = RunS.Stepped:Connect(func)
    if Name then
        RunningSteppedLoop[Name] = Con
    end
    return Con
end
function DisconnectLoop(Connection) 
    if Connection then
        if type(Connection) == "string" then
            if RunningSteppedLoop[Connection] then
                RunningSteppedLoop[Connection]:Disconnect()
            end
        else
            if typeof(Connection) == "RBXScriptConnection" then
                if table.find(RunningSteppedLoop,Connection) then
                    table.remove(RunningSteppedLoop,table.find(RunningSteppedLoop,Connection))
                end
                
                Connection:Disconnect() 
            else
                print("DisconnectLoop","Can't Disconnect",typeof(Connection) )
            end
        end

    end
end
local NoclipLoop = LPH_NO_VIRTUALIZE(function()
    if LP.Character ~= nil then
       for _, child in pairs(LP.Character:GetDescendants()) do
          if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
             child.CanCollide = false
          end
       end
    end
end)

local ShipLoop = LPH_NO_VIRTUALIZE(function ()
    if Alive() and LP.Character.Humanoid.SeatPart and LP.Character.Humanoid.SeatPart.Parent then
        for _, child in pairs(LP.Character.Humanoid.SeatPart.Parent:GetDescendants()) do
            pcall(function ()
                if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                    child.CanCollide = false
                 end    
            end)
        end
     end
end)

local BeGod = function (Char)
    if Char ~= nil then
        pcall(function()
            if not DoneBeGod then
            else
                return
            end
            StatusFarming = "Waiting For Team + Torso"
            local TimerStart = tick()
            repeat wait()
            until (LP.Team
            and Char:FindFirstChild("LowerTorso") 
            and Char:FindFirstChild("LowerTorso"):FindFirstChild("Root")) or (tick() - TimerStart > 5)
            local character = Char
            local hrp = Char:WaitForChild("HumanoidRootPart")
            for i,v in pairs(hrp:GetChildren()) do
                if v.Name == "CrewBBG" or v.Name == "MarineBBG" then   
                    v:Destroy()
                end
            end
            local old = hrp.CFrame
            
            if not character:FindFirstChild("LowerTorso") or character.PrimaryPart ~= hrp then
            return 
            end
            removeNametags = true
            if removeNametags then
                local tag = hrp:FindFirstChildOfClass("BillboardGui")
                if tag then tag:Destroy() end
                
                hrp.ChildAdded:Connect(function(item)
                    if item:IsA("BillboardGui") then
                    task.wait()
                    item:Destroy()
                    end
                end)
            end
            
            local newroot = character.LowerTorso.Root:Clone()
            hrp.Parent = workspace
            character.PrimaryPart = hrp
            character:MoveTo(Vector3.new(old.X,9e9,old.Z))
            hrp.Parent = character
            task.wait(0.5)
            newroot.Parent = hrp
            hrp.CFrame = old
            if Char:WaitForChild("CharacterReady",5) then
                Char:WaitForChild("CharacterReady"):Destroy()
            end
        end)

        DoneBeGod = true
    end
end

--Vector And CFrame Calculator
local function AllToVector(Val) -- GetDistance Sub Function
    local Returner
    if Val then
        if type(Val) == "CFrame" or typeof(Val)  == "CFrame"  then 
            Returner = Val.Position
        elseif type(Val) == "vector" or typeof(Val)  == "vector" then 
            Returner = Val
        elseif typeof(Val) == "Instance" and Val:IsA("BasePart") then
            Returner = Val.Position
        elseif Val:FindFirstChild("HumanoidRootPart") then
            Returner = Val:FindFirstChild("HumanoidRootPart").Position
        else
            print("Wrong Type AllToVector",type(Val),typeof(Val))
        end
    end
    return Returner
end
local function IsNan(p1)
    local v2 = true;
    if p1 == p1 then
        v2 = true;
        if p1 ~= (1 / 0) then
            v2 = p1 == (-1 / 0);
        end;
    end;
    return v2;
end;
function ConvertStringToVector3(str)
    local x, y, z = str:match("([-0-9.]+),%s([-0-9.]+),%s([-0-9.]+)")
    return Vector3.new(tonumber(x), tonumber(y), tonumber(z))
end
local function GetDistance(Object1, Object2)
    local Pos1 , Pos2 = AllToVector(Object1), AllToVector(Object2)
    if Pos1 and Pos2 then
        return  (Pos1-Pos2).magnitude
    end
    return print("Invalid Type",debug.traceback())
end
local function GetDistance2D(Object1, Object2)
    local Pos1 , Pos2 = AllToVector(Object1), AllToVector(Object2)
    if Pos1 and Pos2 then
        local dx = Pos2.x - Pos1.x
        local dy = Pos2.y - Pos1.y
        local dz = Pos2.z - Pos1.z
        return math.sqrt(dx*dx + dz*dz)
    end
    return print("Invalid Type",debug.traceback())
end
function NewPos(Mob,Add)
    if Alive() and IsAlive(Mob) then
        if Add == nil then
            Add = Vector3.new(0,0,0)
        end
        local YMob = getRoot(Mob).Position.Y
        local YTP = YMob + Add.Y
        return CFrame.new(getRoot(Mob).Position.X,YTP,getRoot(Mob).Position.Z) * CFrame.new(Add.X,0,Add.Z)
    end 
end
local function CancelTween()
    if tween then
        tween:Cancel()
        tween=nil
    end
    DisconnectLoop("NoClipTween")
end
function StopTween()
    CancelingTween =true
    TweeningV2 = false
    CancelTween()
    local info = TweenInfo.new(0,Enum.EasingStyle.Linear)
    local tween =  game:service"TweenService":Create(getRoot(LP.Character), info, {CFrame = getRoot(LP.Character).CFrame})
    tween:Play() 
    CancelTween()    
    Floating(false)
    CancelingTween = false
end
DoTween = function(dist, ForceNoWait)
    while not Alive() do
        task.wait(1)
    end
    if dist ~= nil then
        local range = (getRoot(LP.Character).Position - dist.Position).magnitude
        if range <= 300 then
            NewSpeed = 400
        elseif range <= 700 and range > 300 then
            NewSpeed = 350
        else
            NewSpeed = 300
        end            
        if IsNan(dist.Position.X) then
            return
        end
        if math.abs(getRoot(LP.Character).Position.Y -dist.Position.Y) > 70 then
            getRoot(LP.Character).CFrame = CFrame.new(getRoot(LP.Character).Position.X,dist.Position.Y,getRoot(LP.Character).Position.Z)
            task.wait()
        end
        if dist.Position.Y < 0.3 then
            dist = CFrame.new(dist.Position.X,1,dist.Position.Z)
        end
        RealSpeed = NewSpeed
        --[[
        if Sea1 then
            if  (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude > 2000 and (dist.Position- Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 1000 then
                repeat wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                until (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 2000
            end 
            if  (getRoot(LP.Character).Position - Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875)).magnitude > 3000 and (dist.Position- Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875)).magnitude < 3000 then
                repeat wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875))
                until (getRoot(LP.Character).Position - Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875)).magnitude < 3000
            end 
            if  (getRoot(LP.Character).Position - Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625)).magnitude > 3000 and (dist.Position- Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625)).magnitude < 2500 then
                repeat wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625))
                until (getRoot(LP.Character).Position - Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625)).magnitude < 3000
            end
            -- Script generated by SimpleSpy - credits to exx#9394

            if  (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.784179687525)).magnitude < 3000 and (dist.Position- Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude > 1500 then
                repeat wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125))
                until (getRoot(LP.Character).Position - Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125)).magnitude < 3000
            end       
        end
        if Sea2 then
            if  (getRoot(LP.Character).Position - Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude > 3000 and (dist.Position- Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude < 1000 then
                repeat wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125))
                until (getRoot(LP.Character).Position - Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude < 2000
            end       
            if  (getRoot(LP.Character).Position - Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude < 3000 and (dist.Position- Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude > 3000 then
                repeat wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.55810546875, 89.03499603271484, -132.83953857421875))
                until (getRoot(LP.Character).Position - Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude > 2000
            end  
        end]]
        --[[
        if Sea3 then
            if  (getRoot(LP.Character).Position - Vector3.new(-1864.4100341796875, 4532.970703125, -14661.35546875)).magnitude > 1500 and (dist.Position- Vector3.new(-1864.4100341796875, 4532.970703125, -14661.35546875)).magnitude < 1000 then
               -- repeat wait()
               --     --game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-1990.672607421875, 4532.97216796875, -14973.6748046875))
--
               -- until (getRoot(LP.Character).Position - Vector3.new(-1864.4100341796875, 4532.970703125, -14661.35546875)).magnitude < 2000
            end   
            
        end]]
        if not Recursive then
            --FastTP(dist)
        end
        local info = TweenInfo.new((getRoot(LP.Character).Position - dist.Position).magnitude / RealSpeed,Enum.EasingStyle.Linear)
        if tween then
            tween:Cancel()
            tween = nil
        end
        tween =  game:service"TweenService":Create(getRoot(LP.Character), info, {CFrame = dist})
        if CancelingTween then
            if tween then
                tween:Cancel()
                tween = nil
            end
            CancelingTween = false
            return
        end
        if Alive() then
            if (getRoot(LP.Character).Position - dist.Position).magnitude <= 250 then
                CancelTween()                
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dist
            else
                tween:Play()
                Floating(true)
                Tweening = true
                if Noclipping then
                    if Clip then
                        Noclipping:Disconnect()
                        Noclipping = nil
                    end
                elseif not Clip then
                    Noclipping =  RunS.Stepped:Connect(NoclipLoop)
                end
                LP.Character:WaitForChild("Humanoid").Died:Connect(function()
                    Tweening = false
                    if tween then
                        tween:Cancel()
                    end                
                end)
                if not ForceNoWait then
                    tween.Completed:wait()
                end
                tween.Completed:Connect(function()
                    tween=nil
                    Floating(false)
                end)
                if Noclipping then
                    Noclipping:Disconnect()
                    Noclipping = nil
                end
                Tweening = false
                Floating(false)
            end
        else
            Floating(false)
            tween:Cancel()
            tween=nil
            if Noclipping then
                Noclipping:Disconnect()
                Noclipping = nil
            end    
            Tweening = false
   
        end
    end
end
do
    local RunService = game:GetService("RunService");
    local Players = game:GetService("Players");
    local Player = Players.LocalPlayer;

    local TeleportSpeed = getgenv().Setting.Tween.Speed or 250
    local NextFrame = RunService.Heartbeat;

    local function ImprovedTeleport(Target)

        TeleportSpeed = getgenv().Setting.Tween.Speed
        local HRP = (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"));
        if (not HRP) then return; end;

        local StartingPosition = HRP.Position;
        local PositionDelta = (Target - StartingPosition);--Calculating the difference between the start and end positions.
        local StartTime = tick();
        local TotalDuration = (StartingPosition - Target).magnitude / TeleportSpeed;

        repeat NextFrame:Wait();
            local Delta = tick() - StartTime;
            local Progress = math.min(Delta / TotalDuration, 1);--Getting the percentage of completion of the teleport (between 0-1, not 0-100)
            local MappedPosition = StartingPosition + (PositionDelta * Progress);
            HRP.CFrame = CFrame.new(MappedPosition);
        until (HRP.Position - Target).magnitude <= TeleportSpeed / 2;
        HRP.CFrame = CFrame.new(Target);
    end;

    DoTween2 = function (Target,Condition,PartToTween,TweenSetting) -- Make it a table, why the fuck make it a tons of parameter
        if Target == nil then
            return 
        end
        while not Alive() do
            if Condition and not Condition() then return end
            task.wait(1)
        end
        local _,err = pcall(function()
            local TweenSetting = TweenSetting or {}
            local NoTweenPause,Speed,ForceTweenPause,IgnoreSafeY,DisableInstaTP
            NoTweenPause=TweenSetting.NoTweenPause
            Speed=TweenSetting.Speed
            DisableInstaTP=TweenSetting.DisableInstaTP
            ForceTweenPause=TweenSetting.ForceTweenPause
            IgnoreSafeY=TweenSetting.IgnoreSafeY
            local OldInstance
            if (typeof(Target) == "Instance" and Target:IsA("BasePart")) then OldInstance =Target Target = Target.Position; end;
            if (typeof(Target) == "CFrame") then Target = Target.p end; 
            local Condition = Condition or function ()
                return true
            end 
            if Sea3 and (Vector3.new(11256, -2138.0, 9888) - Target).magnitude < 2000 then
                IgnoreSafeY = true
            end
            if Target.Y < 1.5 and not IgnoreSafeY then
                Target = Vector3.new(Target.X,2,Target.Z)
            end
            --print("started Tween v2")
            Floating(true)
            local NextTween = false
            TeleportSpeed = Speed or getgenv().Setting.Tween.Speed or 250
            local NoClip = CreateSteppedLoop(NoclipLoop,"NoClipTween")
            if not DisableInstaTP then
                if Sea1 then
                    if  (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude > 2000 and (Target - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 1000 then
                        repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        until (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 2000
                    end 
                    
                    if  (getRoot(LP.Character).Position - Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875)).magnitude > 5000 and (Target- Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875)).magnitude < 3000 then
                        repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875))
                        until (getRoot(LP.Character).Position - Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875)).magnitude < 3000
                    end 
                    if  (getRoot(LP.Character).Position - Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625)).magnitude > 5000 and (Target- Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625)).magnitude < 3000 then
                        repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625))
                        until (getRoot(LP.Character).Position - Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625)).magnitude < 3000
                    end
                    -- Script generated by SimpleSpy - credits to exx#9394
    
                    if  (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.784179687525)).magnitude < 3000 and (Target- Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude > 1500 then
                        repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125))
                        until (getRoot(LP.Character).Position - Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125)).magnitude < 3000
                    end       
                end
                if Sea2 then
                    if  (getRoot(LP.Character).Position - Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude > 3000 and (Target- Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude < 1000 then
                        repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125))
                        until (getRoot(LP.Character).Position - Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude < 2000
                    end       
                    if  (getRoot(LP.Character).Position - Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude < 3000 and (Target- Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude > 3000 then
                        repeat wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.55810546875, 89.03499603271484, -132.83953857421875))
                        until (getRoot(LP.Character).Position - Vector3.new(923.2125244140625, 126.97600555419922, 32852.83203125)).magnitude > 2000
                    end  
                end
                if Sea3 then
                    local SubmergedPos = Vector3.new(11256, -2138.0, 9888)
                    local TikiPos = Vector3.new(-16269.0, 23, 1371)
                    if (SubmergedPos - (typeof(Target)=="CFrame" and Target.Position or Target)).magnitude < (getRoot(LP.Character).Position - (typeof(Target)=="CFrame" and Target.Position or Target)).magnitude - 700 then
                        if (getRoot(LP.Character).Position - TikiPos).magnitude > 60 then
                            return DoTween2(CFrame.new(TikiPos), Condition, PartToTween, TweenSetting)
                        end
                        local Net = require(game.ReplicatedStorage.Modules.Net)
                        Net:RemoteFunction('SubmarineWorkerSpeak'):InvokeServer('AskKilledTikiBoss')
                        Net:RemoteFunction('SubmarineWorkerSpeak'):InvokeServer('TravelToSubmergedIsland')
                        return
                    end
                    if  (getRoot(LP.Character).Position - Vector3.new(-1864.4100341796875, 4532.970703125, -14661.35546875)).magnitude > 1500 and (Target- Vector3.new(-1864.4100341796875, 4532.970703125, -14661.35546875)).magnitude < 1000 then
                    -- repeat wait()
                    --     --game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-1990.672607421875, 4532.97216796875, -14973.6748046875))
        --
                    -- until (getRoot(LP.Character).Position - Vector3.new(-1864.4100341796875, 4532.970703125, -14661.35546875)).magnitude < 2000
                    end   
                    if (getRoot(LP.Character).Position-Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875)).magnitude <= 4000 and (Target-Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875)).magnitude >= 4000 then
                        local args = {
                            [1] = "requestEntrance",
                            [2] = Vector3.new(-5069.12158203125, 314.5155029296875, -3000.46728515625)
                        }
                        
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))                
                        task.wait(0.2)
                    end
                end
            end
            -- print(getRoot(LP.Character).Position,Target,(getRoot(LP.Character).Position-Target).magnitude)
           -- print(Alive() , (getRoot(LP.Character).Position-Target).magnitude > 1 , Condition())
            local HRP = PartToTween or (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"));
            if (not HRP) then return; end;
            local Started = tick()
            local StartingPosition = HRP.Position;
            local PositionDelta = (Target - StartingPosition);--Calculating the difference between the start and end positions.
            local StartTime = tick();
            local TotalDuration = (StartingPosition - Target).magnitude / TeleportSpeed;
            local LastPosition = StartingPosition
            TweeningV2 = true
            local CountReset = 0
            while Alive() and Condition() and NextFrame:Wait() and (HRP.Position - Target).magnitude > TeleportSpeed / 2 and TweeningV2  do
                if not PartToTween then
                    LP.Character.Humanoid.Sit = false 
                end
                if math.abs(getRoot(LP.Character).Position.Y -Target.Y) > 50 then
                    getRoot(LP.Character).CFrame = CFrame.new(getRoot(LP.Character).Position.X,Target.Y,getRoot(LP.Character).Position.Z)
                end
                local Delta = tick() - StartTime;
                local Progress = math.min(Delta / TotalDuration, 1);--Getting the percentage of completion of the teleport (between 0-1, not 0-100)
                local MappedPosition = StartingPosition + (PositionDelta * Progress);
                HRP.CFrame = CFrame.new(MappedPosition)
                pcall(function()
                    HRP.Velocity = HRP.Velocity +  Vector3.new(math.random(-10,10),math.random(-100,12),math.random(-10,10)) 
                    LP.Character.Humanoid.MoveDirection = LP.Character.Humanoid.MoveDirection + Vector3.new(math.random(-10,10),math.random(-100,12),math.random(-10,10)) 
                end)
                if ((not NoTweenPause and getgenv().Setting.Tween.Pause) or ForceTweenPause) and tick()-Started>3 then
    
                    
                    task.wait(0.4)
                    Started=tick()
                    CountReset=CountReset+1
                    if CountReset >= 3 then
                        NextTween = true
                        break
                    end
                    if (HRP.Position-LastPosition).magnitude>500 then
                        NextTween = true
                        break
                    end
                end
                LastPosition = MappedPosition
            end
            if Alive() and Condition() and (HRP.Position - Target).magnitude <= TeleportSpeed / 2 then
                HRP.CFrame = CFrame.new(Target);
            end
            DisconnectLoop(NoClip)
            TweeningV2 = false
            if NextTween then
                StopTween()
                task.wait(0.3)
                return DoTween2(OldInstance or Target,Condition,PartToTween,TweenSetting)
            else
                Floating(false)
            end
        end)
        if err then
            print("Tween Error",err) 
        end
    end

    
end
local TP =  function(Mob,Add,Trial)
    if Alive() and IsAlive(Mob) then
        if (getRoot(LP.Character).Position - getRoot(Mob).Position).magnitude < 300 or Trial then
            Floating(true)
            if istween then
            end
            getRoot(LP.Character).CFrame = NewPos(Mob,Add) 
            
        else
            DoTween2(NewPos(Mob,Add))
            Floating(true)
        end
    end
end
function FixTP(Name)
    if Name and Alive() then
        if Sea1 then
            local CheckFish = Name == "Fishman Warrior" or Name == "Fishman Commando" or Name == "Fishman Lord" or string.find(Name,"Fishman Commando")
            local CheckShip = Name == "Fishman Warrior" or Name == "Fishman Commando" or Name == "Fishman Lord" or string.find(Name,"Fishman Commando")
            or string.find(Name,"Fishman Warrior")
            if  CheckFish and (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude >= 3000  then
                repeat wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                until (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 3000
            end     
            if  CheckFish and (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude >= 3000  then
                repeat wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                until (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 3000
            end   
            if not CheckFish and (getRoot(LP.Character).Position - Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)).magnitude < 3000 then
            end
        end
    end
end
--Game Control

function ServerHop(a, b, recursive)
    local HttpService = game:GetService("HttpService")
    local LocalPlayer = game.Players.LocalPlayer
    local TeleportService = game:GetService("TeleportService")

    if not recursive and CalledServerHop then
        return
    end

    CalledServerHop = true
    local success, _ = pcall(function()
        local AllServers = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
        for _, server in pairs(AllServers["data"]) do
            if server["maxPlayers"] > server["playing"] then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server["id"], LocalPlayer)
            end
        end
    end)
    if not success then
        ServerHop(a,b,true)
    end
end

function ServerHop(min,max,recursive)
    --if not recursive and Funcs.ServerHop.LimitHopTime then
   --     StatusFarming = "Waiting Server Hop Time"
   ----     wait(Funcs.ServerHop.HopTime)
    --end
    SupportRetard()
    if not recursive and CalledServerHop then
        return
    end
    print("Hopping")
    CalledServerHop = true
    local cancheck
    local Servers = {}
    local args = {
        [1] = math.random(1,120)
    }
    local returned = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(unpack(args))
    if returned then
        for i3,v3 in pairs(returned) do
            for i2,v2 in pairs(v3) do
                --print(v2)
                if i2 == "Count" and v2 <= 11 and (min and v2 >= min  or not min ) and (max and v2 <= max or not max) then
                    table.insert(Servers,i3) 
                end
            end
        end
        local Count = 0
        local OldJobId = game.JobId
        DangServerHop = true
        local xi = {}
        pcall(function()
            for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
                table.insert(xi,{v.id,v.maxPlayers,v.playing,v.ping})
                --print(x[1])
            end
        end)

        for i,v in pairs(xi) do
         --   print(i)
            if v[3] and v[3]<12 and (max and v[3] <= max or not max)  and ((min and v[3]>= min) or not min) then
             table.insert(Servers,v[1])
            end
        end
        if #Servers >0 then
            while task.wait(1) and #Servers > 0 and game.JobId == OldJobId do
                Count = Count + 1
                local getserver = math.random(1,#Servers)
                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",tostring(Servers[getserver]))

                table.remove(Servers,getserver)
            end
        end
        ServerHop(min,max,true)
    else
        ServerHop(min,max,true)
    end
end
function TrueServerHop(...)
    local Args = {...}
    --if IsRetardExecutor() then
    --    Args = {}
    --end
    if CalledServerHop then
        return
    end
    ServerHop(table.unpack(Args))
    while task.wait()  do
    end
end
--Tool Controller
GetCurrentTool = function (Type,Name)
    for i,v in pairs(LP.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == Type then
            local Wait = v:WaitForChild("Level")
            return Name and v.Name or v
        end
    end
    for i,v in pairs(LP.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == Type then
            local Wait = v:WaitForChild("Level")
            return Name and v.Name or v
        end
    end

    return false
end
local SkillCheck = function(v)
    if not string.find(v.Name,"Swing") and not string.find(v.Name,"Melee") and not string.find(v.Name,"SlimeString") and not string.find(v.Name,"BodyVelocity") and not string.find(v.Name,"BodyPosition") and not string.find(v.Name,"BodyGyro") and not string.find(v.Name,"TouchInterest") then
        return true
    end
    return false
end
function CheckItem(Item)
    return LP.Character:FindFirstChild(Item) or LP.Backpack:FindFirstChild(Item)
end
Equip = function (Tool)
    pcall(function()
        local ToolEquip = LP.Backpack:FindFirstChild(Tool)
        if LP.Character:FindFirstChild('Humanoid') and ToolEquip then
            LP.Character:FindFirstChild('Humanoid'):EquipTool(ToolEquip)
            return true
        end
        if LP.Character:FindFirstChild(Tool) then
            return true
        end
    end)
end
ClickOnPart = function(Part)
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local Camera = workspace.CurrentCamera
    local Pos = Camera:WorldToViewportPoint(Part.Position)
    local X,Y = Pos.X, Pos.Y
    Camera.CFrame = CFrame.new(Camera.CFrame.Position, Part.Position)
    VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 0)
    task.wait(0.5)
    VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 0)

end
--
getgenv().LocalPlayerInv = {}
getgenv().GetServerData = {}
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local Inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
            local SkinInv = require(game.ReplicatedStorage.Controllers.SkinController).GetInventory()
            local WeaponType = {"Gun","Wear","Sword"}
            local AllType = {"Blox Fruit","Gun","Wear","Sword"}
            if Inventory then
                local Temp = {}
                Temp.All=Inventory
                Temp.Weapons = {}
                for i,v in pairs(Inventory) do

                    
                    if not Temp[v.Type] then
                        Temp[v.Type] = {}
                    end
                    if table.find(WeaponType,v.Type) then
                        table.insert(Temp.Weapons,v)
                    end
                    table.insert(Temp[v.Type] ,v)

                end
                for i,v in pairs(SkinInv) do
                    
                    if not Temp[v.Type] then
                        Temp[v.Type] = {}
                    end
                    if v.Count > 0 then
                        table.insert(Temp[v.Type] ,v)
                    end
                end
                for i,v in pairs(AllType) do 
                    if not Temp[v] then
                        Temp[v] = {}
                    end
                end
                getgenv().LocalPlayerInv=Temp
                
                
            end
            if Sea2 or Sea3 then
                getgenv().GetServerData.ColorDealer = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","1")
            end
        end)
    end
end)
--Server Hop Library

local ServerHopLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/W-azure/Module/ServerHopUi.lua"))()
function MainRejoin(Time,Reason,...)

    spawn(function()
        task.wait(60)
        game:Shutdown()
    end)
    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",game.JobId)
        

end
function MainTravel(Time,Reason,Sea)
    local State = ServerHopLibrary:CreateScreen({Duration=Time,Reason=Reason})
    if State == "Success" then
        while true do
            Travel(Sea)
            task.wait(5) 
        end
    else
        task.wait(15)
    end
end
function MainServerHop(Time,Reason,...)
    local State = ServerHopLibrary:CreateScreen({Duration=Time,Reason=Reason})
    if State == "Success" then
        TrueServerHop(...) 
    else
        task.wait(15)
    end
end

function GetWeaponSmith(Type)
    local PrioritySword = {
        ["0"] = {},
        ["1"] = {},
        ["2"] = {},
        ["3"] = {},
        ["4"] = {},
    }
    local CheckA = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
    if CheckA then
        for i,v in pairs(CheckA) do
            if v.Type == Type and not DataSave.BlackSmith[v.Name] then

                if PrioritySword[tostring(v.Rarity)] then
                    table.insert(PrioritySword[tostring(v.Rarity)],v.Name)
                else
                    print("Errored At ", v.Rarity)
                end
            end
            
        end
        for i=4,1,-1 do
            for i,v in pairs(PrioritySword[tostring(i)]) do
                return v
            end
        end
    else
        return GetWeaponSmith()
    end 
end
local __Places = {}
local SelectedPlace
for i,v in pairs(GameData.Places[CurrentPlaceKey]) do
    table.insert(__Places,i)
end
function SwitchWeaponSmith(Type)
    local WeaponChange = GetWeaponSmith(Type)
    if WeaponChange then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",WeaponChange)
    end
end
local AlternativeFruitName = function(v)
    if v:FindFirstChild("Fruit") then
        local F = v:FindFirstChild("Fruit")
        local RP = F:FindFirstChild("RootPart") 
        if RP then 
            local Bone = RP:FindFirstChild("Bone.001")
            local parts = {"eye.L","Halo","eye.R","Asa.R","Asa.L"}
            local c = 0
            for i,v2 in pairs(Bone:GetChildren()) do 
                if table.find(parts,v2.Name) then
                    c=c+1
                end 
            end
            if c== 5 then
                return "Spirit-Spirit"
            end
        end
    end
    return v.Name
end
local RealFruitName = {
    ["rbxassetid://15100283484"] = "Light-Light",
    ["rbxassetid://15116730102"] = "Love-Love",
    ["rbxassetid://15116967784"] = "Spider-Spider",
    ["rbxassetid://15112263502"] = "Shadow-Shadow",
    ["rbxassetid://15104782377"] = "Chop-Chop",
    ["rbxassetid://15060012861"] = "Rocket-Rocket",
    ["rbxassetid://15112469964"] = "Falcon-Falcon",
    ["rbxassetid://15708895165"] = "T-Rex-T-Rex",
    ["rbxassetid://15107005807"] = "Spike-Spike",
    ["rbxassetid://15112215862"] = "Portal-Portal",
    ["https://assetdelivery.roblox.com/v1/asset/?id=10395893751"] = "Venom-Venom",
    ["rbxassetid://14661873358"] = "Sound-Sound",
    ["rbxassetid://15111584216"] = "Flame-Flame",
    ["rbxassetid://15105281957"] = "Spring-Spring",
    ["rbxassetid://15116740364"] = "Bomb-Bomb",
    ["rbxassetid://15057683975"] = "Spin-Spin",
    ["rbxassetid://15105350415"] = "Magma-Magma",
    ["rbxassetid://15482881956"] = "Kitsune-Kitsune",
    ["rbxassetid://15116721173"] = "Pain-Pain",
    ["rbxassetid://15100433167"] = "Ice-Ice",
    ["rbxassetid://15100299740"] = "Gravity-Gravity",
    ["rbxassetid://15112600534"] = "Diamond-Diamond",
    ["rbxassetid://15116696973"] = "Smoke-Smoke",
    ["rbxassetid://15100485671"] = "Barrier-Barrier",
    ["rbxassetid://15111517529"] = "Sand-Sand",
    ["rbxassetid://15100184583"] = "Control-Control",
    ["rbxassetid://15100246632"] = "Phoenix-Phoenix",
    ["rbxassetid://15100313696"] = "Buddha-Buddha",
    ["rbxassetid://15116747420"] = "Rumble-Rumble",
    ["rbxassetid://15100384816"] = "Blizzard-Blizzard",
    ["rbxassetid://15111553409"] = "Dark-Dark",
    ["rbxassetid://15057718441"] = "Quake-Quake",
    ["rbxassetid://15112333093"] = "Ghost-Ghost",
    ["rbxassetid://14661837634"] = "Mammoth-Mammoth",
    ["rbxassetid://15100273645"] = "Dough-Dough"

}
local function GetNPC(Name)
    for i,v in pairs(game:GetService("ReplicatedStorage").NPCs:GetChildren()) do
        if v.Name == Name then 
            return v

        end 
    end
    for i,v in pairs(workspace.NPCs:GetChildren()) do
        if v.Name == Name then 
            return v

        end 
    end
end
local GetRealFruitName = function(v)
    local F = v:FindFirstChild("Fruit")
    if F then
        local FF = F:FindFirstChild("Fruit")
        if FF then 
            return RealFruitName[FF.MeshId] or "Unknown Fruit"
        else
            return AlternativeFruitName(v)
        end
    else
        print("WTH ?: "..v.Name)
    end
    return v.Name
end
MirageFunctions = {
    GetFruitDealerNPC = function() 
        return GetNPC("Advanced Fruit Dealer")
    end,
    GetMirageIsland = function ()
        return game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    end,
    LookAtMoon = function ()
        pcall(function()

            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position + game.Lighting:GetMoonDirection())

        end)
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
    end,


}
MirageFunctions.GetGear = function()
    if not MirageFunctions.GetMirageIsland() then 
        return 
    end
    CheckN = true
    for i,v in pairs(MirageFunctions.GetMirageIsland():GetChildren()) do
        if v:IsA("MeshPart") and v.Name == "Part" and v.Transparency ~= 1 then
            return v
        end
    end
    CheckN = false
end
MirageFunctions.TweenGear = function()
    local GetGear = MirageFunctions.GetGear()
    if GetGear then
        CheckN = true
        pcall(function ()
            DoTween2(GetGear.CFrame,function ()
                return GetGear and GetGear.Parent
            end)
        end)        
        CheckN = false
    end
end
MirageFunctions.IsRendered = function()
    if not MirageFunctions.GetMirageIsland() then 
        return 
    end
    if #MirageFunctions.GetMirageIsland().npcspawn:GetChildren() == 0 then 
        return
    end 
    return true
end
MirageFunctions.GetHighestPlace = function ()
    if not MirageFunctions.GetMirageIsland() then 
        return 
    end
    if not MirageFunctions.IsRendered() then
        return
    end

    local tallestPart = nil
    local biggestHeight = 0
    local blacklist = {"BiggTree"}
    for _, part in ipairs(MirageFunctions.GetMirageIsland():GetDescendants()) do
        if part.ClassName == "Model" and not table.find(blacklist, part.Name) then
            local height = part.WorldPivot.Y
            if height > biggestHeight then
                tallestPart = part
                biggestHeight = height
            end
        end
    end
    return tallestPart
end
MirageFunctions.TweenFruitDealer = function()
    local __NPC = MirageFunctions.GetFruitDealerNPC()
    if __NPC then
        pcall(function ()
            DoTween2(__NPC["Head"],function ()
                return __NPC and __NPC["Head"]
            end)
        end) 

    end
end
MirageFunctions.TweenHighestPlace = function (Condition)
    if not MirageFunctions.IsRendered() then
        DoTween2(MirageFunctions.GetMirageIsland().WorldPivot.Position)
        task.wait(2)
    end
    local __Part = MirageFunctions.GetHighestPlace()
    if __Part then
        DoTween2(__Part.WorldPivot + Vector3.new(0, 210, 0))
    end
end
ObservationManager = {

}
ObservationManager.IsActive = function()
    if getrenv()._G then
        if getrenv()._G.OM and getrenv()._G.OM.active  then 
            return getrenv()._G.OM.active 
        end 
        return false
    else 
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
            if v.Name == "ScreenGui" then
                if v:FindFirstChild("ImageLabel") and v:FindFirstChild("ImageLabel").BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
                    return true 
                end
            end
        end
        return false
    end
end
ObservationManager.SetActive = function(state)
    if getrenv()._G then
        if getrenv()._G.OM then 
            getrenv()._G.OM:setActive(state)
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",state)
            
        end 
    else 
        if ObservationManager.IsActive() ~= state then
            VU:CaptureController()
            VU:SetKeyDown('0x65')
            wait()
            VU:SetKeyUp('0x65') 
        end
    end
end
RaceV4Manager = {
    TPCurrentEntrance = function ()
        local a = RaceEntrances[LP.Data.Race.Value]
    
        if (getRoot(LP.Character).Position-Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875)).magnitude >= 4000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875))
            task.wait(0.5)
    
        end
        if type(a) == 'table' then
            for i, v in pairs(a) do
                getRoot(LP.Character).CFrame = v
                task.wait(2)
            end
        else
            getRoot(LP.Character).CFrame = a
        end
    end,
    TPAcientClock = function()
        if Alive() then
            if (getRoot(LP.Character).Position-Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875)).magnitude > 4000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875))
            end
            task.wait()
            DoTween2(CFrame.new(29551.474609375, 15068.7197265625, -84.86554718017578))
        end   
    end,
    TPTempleOfTime = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875))
    end
}
ShipController = {
    GetSitBoat = function()
    end,
    GetBoat = function()
        for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do 
            if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v:FindFirstChild("VehicleSeat") then
                return v
            end
        end
        return false
    end,
}
ShipController.TPCurrentShip = function()
    if ShipController.GetBoat() then
        ShipController.GetBoat().VehicleSeat.CFrame = LP.Character.HumanoidRootPart.CFrame
    end
end
ShipController.IsValid = function(Boat)
    if Boat and Boat.Parent and Boat.VehicleSeat then
        return true
    end
end
SeaManager = {}
SeaManager.TPLeviathanIsland = function()
    if game:GetService("Workspace").Map:FindFirstChild("LeviathanGate") and game:GetService("Workspace").Map:FindFirstChild("LeviathanGate"):FindFirstChild("Teleporter") then
        DoTween2(game:GetService("Workspace").Map:FindFirstChild("LeviathanGate").Teleporter.CFrame)
    end
end
SeaManager.TPKitsuneIsland = function()
    if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and game:GetService("Workspace").Map.KitsuneIsland:FindFirstChild("ShrineDialogPart") then
        LP.Character.Humanoid.Sit = false
        DoTween2(game:GetService("Workspace").Map.KitsuneIsland.ShrineDialogPart.CFrame)
    end 
end
ItemsUiController = {}
ItemsUiController.YoruV2 = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RobotTalk")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("IndraTalk")
    for i=1,3 do 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoveLetter",i)
    end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RobotTalk")
end


SkillsController = {
    Weapon = {},
    Skills = {}, -- For Blox Fruit Only
}
RequirementGuitar = {
    ["Ectoplasm"] = 250,
    ["Bones"] = 500,
    ["1"] = false,
    ["2"] = false,
}
RequirementGod = {
    ["Mystic Droplet"] = 10,
    ["Magma Ore"] = 20,
    ["Fish Tail"] = 20,
    ["Dragon Scale"]= 10,
    ["1"] = false,
    ["2"] = false,
    ["3"] = false,
    ["4"] = false
}
ChestCount = 0
AllSeaEvents = {"Leviathan","TerrorShark","Ship","Piranha","SeaBeast","Shark"}
SeaEventsController = {}
FruitTable = {}

FruitPrice = {}
function CloneTable(Table)
    local TableT = {}
    for i=1, #Table do
        TableT[i] = Table[i]
    end
    return TableT
end
function Travel(Sea)
    if Sea=="Sea1" or Sea == "2753915549" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
    if Sea=="Sea2" or Sea == "4442272183" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
    if Sea=="Sea3" or Sea == "7449423635" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
end
FruitRemote = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
StoreFruitTable = CloneTable(FruitRemote)
for i,v in pairs(StoreFruitTable) do
    FruitPrice[v.Name] = v.Price
end
for i,v in pairs(StoreFruitTable) do
    for i2,v2 in pairs(v) do
        if i2 == "Name" then
            table.insert(FruitTable, v2)
        end
    end
end  

--Webhook Intilizer
getgenv().WebhookCenter = {
}
if not WebhookCenter then
WebhookCenter = getgenv().WebhookCenter
end
WebhookCenter.GetWebhook = function()
    if getgenv().Setting.Webhook.Url and getgenv().Setting.Webhook.Url ~= "" then 
        return getgenv().Setting.Webhook.Url
    end
    return nil
end
WebhookCenter.SimpleSend = function(Title,Description)
    pcall(function()
        local WebhookUrl = WebhookCenter.GetWebhook()
        if not WebhookUrl then
            return 
        end
        local ClientTime = game.Workspace.DistributedGameTime
        local seconds = ClientTime%60
        local minutes = math.floor(ClientTime/60%60)
        local hours = math.floor(ClientTime/3600)
        local ClientTime = string.format("%.0fh:%.0fm:%.0fs", hours ,minutes, seconds)
        local data = {
            ["embeds"] = {
                {
                    ["title"] = "True V2",
                    ["url"] = "https://www.roblox.com/games/"..game.PlaceId,
                    --AMessage[math.random(1,14)],
                    ["thumbnail"] = {
                        ["url"] = "https://i.vgy.me/FrdDph.png"
                    },
                    ["color"] = 3447003,
                    ["fields"] = {
                        {
                            ["name"] = "Player:",
                            ["value"] = tostring("||"..LP.Name.."||"),
                            ["inline"] = true
                        },
                        {
                            ["name"] = "Client Elapsed:",
                            ["value"] = tostring("```"..ClientTime.."```"),
                            ["inline"] = true
                        },
                        {
                            ["name"] = Title,
                            ["value"] = "```"..Description.."```",
                            ["inline"] = true
                        },
                        
                    },
                    ["timestamp"] = os.date('!%Y-%m-%dT%H:%M:%S'),
                    ["footer"] = {
                        ["text"] = "https://discord.gg/W-azure",
                    }
                }
            }
        }
        local Post = req({Url = WebhookUrl,  Method = 'POST', Headers = 
        { ['Content-Type'] = 'application/json' }, Body = game:GetService('HttpService'):JSONEncode(data)})
    end)
end
--Global Func For UI Support
do 
    IslandHub = {}
    IslandHub.TPCurrentEntrance = RaceV4Manager.TPCurrentEntrance
    IslandHub.TPAcientClock = RaceV4Manager.TPAcientClock
    IslandHub.__StrGetPlayers = __StrGetPlayers
    IslandHub.TPCurrentShip = ShipController.TPCurrentShip
    IslandHub.YoruV2 = ItemsUiController.YoruV2
    IslandHub.StopTween = StopTween
    IslandHub.Travel = Travel
    IslandHub.TPLeviathanIsland = SeaManager.TPLeviathanIsland 
    IslandHub.TPKitsuneIsland = SeaManager.TPKitsuneIsland
    IslandHub.TweenSelectedPlace = function()
        if getgenv().IslandVariable and getgenv().IslandVariable.SelectedPlace then
            DoTween2(GameData.Places[CurrentPlaceKey][getgenv().IslandVariable.SelectedPlace])
    end
end

    IslandHub.TweenSelectedNPC = function()
        if getgenv().IslandVariable and getgenv().IslandVariable.SelectedNPC then
            DoTween2(getRoot(NPCInstances[getgenv().IslandVariable.SelectedNPC]).CFrame)
        end
    end
    IslandHub.TrueServerHop = TrueServerHop
    IslandHub.RedeemAllCode = function() 
        for i, Code in pairs(GetUpdateBloxFruitCode) do
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Code)
        end
    end
    IslandHub.RemoveEnemiesStun = function()
        if fluxus then
            for i,v in pairs(getconnections(game.ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("BodyMover").OnClientEvent)) do 
                v:Disconnect()
            end
        end
    end
    IslandHub.NightAtmosphere = function()
        game:GetService("Lighting").LightingLayers.Night.Intensity.Value = (game:GetService("Lighting").LightingLayers.Night.Intensity.Value == 0) and 1 or 0
    end
    IslandHub.DarkAtmosphere = function()
        game:GetService("Lighting").LightingLayers.DarkFog.Intensity.Value = (game:GetService("Lighting").LightingLayers.DarkFog.Intensity.Value == 0) and 1 or 0
    end
    IslandHub.TPTempleOfTime = RaceV4Manager.TPTempleOfTime
    IslandHub.TweenGear = MirageFunctions.TweenGear 
    IslandHub.TweenFruitDealer = MirageFunctions.TweenFruitDealer
    IslandHub.TweenHighestPlace = MirageFunctions.TweenHighestPlace
    getgenv().IslandCaller = {}
    getgenv().IslandVariable = {}
    getgenv().IslandVariable.MaterialName = GameData.MaterialName
    getgenv().IslandVariable.GatePos = GatePos
    getgenv().IslandVariable.AutoChip = AutoChip
    getgenv().IslandVariable.Items = GameData.Items
    getgenv().IslandVariable.__Places = __Places
    getgenv().IslandVariable.__NPCs = ListNpc
    setmetatable(IslandCaller, {
    __call = function(table, functionName, ...)
        local func = IslandHub[functionName]
        if type(func) == "function" then
            return func(...)
        end
    end,

    __index = function(table, key)
        while true do 
        end
    end,

    __newindex = function(table, key, value)
        while true do 
        end
    end,

    __metatable = "Dit Me May",

    __pairs = function()
        while true do 
        end
    end,
    __ipairs = function()
        while true do 
        end
    end,
})
end

--Virtualization
function Click()
    pcall(function()
        if Alive() then
            local VU = game:GetService("VirtualUser")
            VU:CaptureController()
            VU:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
        end 
    end)
 end

 function Press(key,Delay)
    if not Pressing then
        local IST = LP.Character:FindFirstChildOfClass("Tool")
        if IST then
            --print("Attmp")
            local CT = IST.Name
            task.wait()
            local function IsValidSkillCheck()
                if not IST.ToolTip then
                   -- print("Cant Find ToolTip")
                    return 
                end
                if CT == "Summon Sea Beast" or IST.ToolTip == "Wear" then
                   -- print("Wrong Tool")
                    return
                end
                if not (LP.PlayerGui.Main and LP.PlayerGui.Main.Skills) then
                   -- print("Cant Find Main Ui")
                    return 
                end
                if not LP.PlayerGui.Main.Skills[CT] then
                    --print("Not Holding")
                end
                if  not (LP.PlayerGui.Main.Skills[CT] and LP.PlayerGui.Main.Skills[CT]:FindFirstChild(key)) then
                    --print("Cant find keys",CT,key)
                    return 
                end
                return true
            end
            if  IsValidSkillCheck() then
               -- print("Check CoolDown")
                if NotCooldown(key,CT) then
                   -- print("Pressing")
                    Pressing = true
                    VIM:SendKeyEvent(true,key,false,game)
                    if Delay == nil or typeof(Delay) ~= "number"  or Delay == 0 then
                    else
                        task.wait(Delay) 
                    end   
                    VIM:SendKeyEvent(false,key,false,game)
                    Pressing = false
                end
            end
        end
    end
end

--Blox Fruit Exclusive Function
FindQuest = function(a,b)
    return string.find(a:gsub("-",""),b:gsub("-",""))
end
function IsInSafeZone(Char)
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
        if v:IsA("Part") then
            if GetDistance(v,Char) <= 400 and Char.Humanoid.Health >= Char.Humanoid.MaxHealth*80/100  then
                return true
            end
        end
    end
end
function MakeSeaEventSkill()
    SkillsController.Weapon = {}
    for i,v in pairs({"Melee","Blox Fruit","Gun","Sword"}) do
        if getgenv().Setting.SkillsSet2[v] then
            if not table.find(SkillsController.Weapon,v) then
                table.insert(SkillsController.Weapon,v)
            end
        elseif table.find(SkillsController.Weapon,v) then
            table.remove(SkillsController.Weapon,table.find(SkillsController.Weapon,v))
        end
    end
    SkillsController.Skills = getgenv().Setting.SkillsSettingRemake["Blox Fruit"]
end
function MakeMasterySkill()
    SkillsController.Weapon = {}
    table.insert(SkillsController.Weapon,getgenv().Setting.Mastery["Fruit/Gun"] and "Gun" or "Blox Fruit")
    SkillsController.Skills = getgenv().Setting.SkillsSettingRemake["Blox Fruit"]
end
function VoidSkillController()
    SkillsController.Skills = {}
    SkillsController.Weapon = {}
    SkillsController.Condition = nil
    SkillsController.Idle = nil
end
AutoChip = {
    ["Flame-Flame"] = "Flame",
    ["Ice-Ice"] = "Ice",
    ["Sand-Sand"] = "Sand",
    ["Quake-Quake"] = "Quake",
    ["Light-Light"] = "Light",
    ["Dark-Dark"] = "Dark",
    ["String-String"] = "String",
    ["Rumble-Rumble"] = "Rumble",
    ["Magma-Magma"] = "Magma",
    ["Human-Human: Buddha"]= "Human: Buddha",
    ["Bird-Bird: Phoenix"] = "Bird: Phoenix",
    ["Dough-Dough"] = "Dough",
}
function CanAwakenDough()
    local args = {
        [1] = "RaidsNpc",
        [2] = "Check"
    }
    local a,b = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    return b.Dough
end
function CanAwaken()
    if GetLevel() < CurrentMaxLv then
        return false, "Not Enough Level 2"
    end
    if AutoChip[LP.Data.DevilFruit.Value] then
        if LP.Data.DevilFruit.Value == "Dough-Dough" and  (not CanAwakenDough() or not Sea3) then
            return false
        end
        local GetAwakenAbility = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
        if GetAwakenAbility and type(GetAwakenAbility) =='table' then
            for i,v in pairs(GetAwakenAbility) do
                if not v.Awakened and LP.Data.Fragments.Value >= v.Cost  then
                    return true
                end
            end
        end
    end
end
Raid = {

}

FruitFunc = {
    IgnoreStoreFruit = nil,
    HaveFruitInv = function()
        local TableOfFruit = {}
        for i,v in pairs(LP.Character:GetChildren()) do
            if string.find(v.Name, "Fruit") then
                table.insert(TableOfFruit,v)
            end
        end
        for i,v in pairs(LP.Backpack:GetChildren()) do
            if string.find(v.Name, "Fruit") then
                table.insert(TableOfFruit,v)
            end
        end
        return TableOfFruit
    end,
    HaveFruitMap = function()
        local TableOfFruit = {}
        for i,v in pairs(game.Workspace:GetChildren()) do
            if string.find(v.Name, "Fruit") and v.Name ~= "Fruit" then
                table.insert(TableOfFruit,v)

            end
        end
        return TableOfFruit
    end,
    CheckHasFruit = function()
        for i,v in pairs(game.Workspace:GetChildren()) do
            
            if string.find(v.Name,"Fruit") then
                return true
            end
            if v:IsA("Tool") then
                return true
            end
    
        end
        return false
    end,
    GetFruitBelow1M = function()
        local FruitCA = getgenv().LocalPlayerInv["Blox Fruit"]
        local SmallestPrice = 1000000
        local FruitSmallest = 999999999
        local FruitName 
        if FruitCA then
            for i,v in pairs(FruitCA) do
                if v.Value < SmallestPrice  and v.Value < FruitSmallest and v.Count > 0 then
                    FruitSmallest = v.Value
                    FruitName = v.Name
                end
            end
        end
        return FruitName
    end,
    GetFruitAbove1M = function()
        local FruitCA = getgenv().LocalPlayerInv["Blox Fruit"]
        local SmallestPrice = 1000000
        local FruitSmallest = 999999999
        local FruitName 
        if FruitCA then
            for i,v in pairs(FruitCA) do
                if v.Value >= SmallestPrice  and v.Value < FruitSmallest and v.Value <= 3000000 and v.Count > 0  then
                    FruitSmallest = v.Value
                    FruitName = v.Name
                end
            end
        end
        return FruitName
    end,
    IsValidFruit = function(TableOfFruit)
        local FruitCanStore = {}
        local FruitCA = getgenv().LocalPlayerInv["Blox Fruit"] 
        if FruitCA then
            local dem = {}
            local StoredFruit = CloneTable(FruitTable)
            for i,v in pairs(FruitCA) do
                dem[v.Name]=v.Count
            end
        
            local FruitToStore
            for i,v in pairs(StoredFruit) do
                if not dem[v] then
                    dem[v]=0
                end
                for i2,v2 in pairs(TableOfFruit) do 
                    if v ==v2:GetAttributes().OriginalName and dem[v] < game:GetService("Players").LocalPlayer.Data.FruitCap.Value then
                        FruitToStore = v2
                        FruitName = v2.Name
                        table.insert(FruitCanStore,{v,v2})
                    end
                end
            end
            
            return FruitCanStore
        end
    end
}
SwanDoor = {
    Check = function ()
        if DataSave.Unlocked.SwanDoor then
            return true
        end
        local CheckSW = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2") == 0 
        if CheckSW then
            DataSave.Unlocked.SwanDoor = CheckSW
        end
        return CheckSW
    end,
    GetFruit = function ()
        return FruitFunc.GetFruitAbove1M()
    end,
}

getgenv().LiteFpsBoost = function()
    LPH_NO_VIRTUALIZE(function()
        workspace.ClientAnimatorThrottling = Enum.ClientAnimatorThrottlingMode.Enabled
        workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled
        settings():GetService("RenderSettings").EagerBulkExecution = false
        workspace.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
        game:GetService("Lighting").GlobalShadows = false
        workspace:FindFirstChildOfClass("Terrain").WaterWaveSize = 0
        workspace:FindFirstChildOfClass("Terrain").WaterWaveSpeed = 0
        workspace:FindFirstChildOfClass("Terrain").WaterReflectance = 0
        workspace:FindFirstChildOfClass("Terrain").WaterTransparency = 0
        game:GetService("Lighting").GlobalShadows = false
        workspace:SetPhysicsThrottleEnabled(true)
        game:GetService("Lighting").FogEnd = 9e9
        game:GetService("Lighting").Brightness = 0
        settings().Rendering.QualityLevel = "Level01"
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04

        if sethiddenproperty then
            sethiddenproperty(workspace.Terrain, "Decoration", false)
            sethiddenproperty(Lighting,"Technology",2)
        end
        setfflag("DebugGraphicsDisableDirect3D11", "false")
        setfflag("TextureCompositorActiveJobs","0")
        setfflag("DebugSkyGray","true")
        setfflag("RenderLocalLightUpdatesMax","1")
        setfflag("TextureQualityOverrideEnabled", "true")
        setfflag("TextureQualityOverride","0")
        setfflag("RenderGrassHeightScaler","0")
        setfflag("RenderGrassDetailStrands","0")
        local Workspace = game.Workspace
        local Lighting = game.Lighting
        for i, v in pairs(Workspace:GetDescendants()) do
            pcall(function() v.TopSurface = "Smooth" end)
            if v:IsA("BasePart") and not v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif (v:IsA("Decal") or v:IsA("Texture")) then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
                v.TextureID = 10385902758728957
            elseif v:IsA("SpecialMesh") then
                v.TextureId=0
            elseif (v:IsA("Shirt") or v:IsA("Pants")) then
                v[v.ClassName.."Template"]=0
            end
        end
        for i = 1,#Lighting:GetChildren() do
            e=Lighting:GetChildren()[i]
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end
    end)()
end
local function ValidChest(v)
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        if v.Parent == game:GetService("Workspace").Map:FindFirstChild("MysticIsland").Chests then
            return false
        end
    end 
    return true
end
local GetChests = function()
    -- ValidChest
    local Chestss = {}
    for i,v in pairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
        if v:GetAttribute("IsDisabled") then 
            continue
        end
        if v:GetAttribute("LastCollect") and tick() - v:GetAttribute("LastCollect") <= 120 then
            print("Last Collect Excluded")
            continue
        end
        table.insert(Chestss,v)
    end
    return  Chestss
end
pcall(function()
    SupportRetard()
    CamMod = require(game:GetService("ReplicatedStorage").Util.CameraShaker)
    CamMod:Stop()
end)
LastGetQuest = 0
SafeGetQuest = function(Pos,Name,Level,BypassSafe,QuestCheck)
    local NotSafe = getgenv().Setting.OneClick.UnlimitGetQuest or BypassSafe
    local CanGetQuest = QuestCheck and  (not LP.PlayerGui.Main.Quest.Visible or not FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,QuestCheck)) or not QuestCheck
    if QuestCheck and  LP.PlayerGui.Main.Quest.Visible and FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,QuestCheck) then
        return true 
    end
    if Alive() and (getRoot(LP.Character).Position- Pos.Position).magnitude <= 10 and (NotSafe or (tick() - LastGetQuest >= ((Sea2 or Sea3) and  60 or 60))) and CanGetQuest then
        task.wait(2)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", Name, Level)
        if not NotSafe then
            LastGetQuest = tick()
        end
        Floating(false)
        return true
    end
    return false
end

function GetMaterial(Name)
    local Returned = getgenv().LocalPlayerInv.All
    if Returned then
        for i,v in pairs(Returned) do
            if v.Name == Name then
                return v.Count
            end
        end 
        return 0 
    else
        print("Recursive Get Material")
        repeat wait()
        until Alive()
        wait(1)
        return GetMaterial(Name)
    end
end
function CheckFlower()
    for i,v in pairs(LP.Backpack:GetChildren()) do
        if string.find(v.Name,"Flower") then
           return true
        end
    end
    local ToolAlt = LP.Character:FindFirstChildOfClass("Tool")
    if ToolAlt then
        if string.find(ToolAlt.Name,"Flower") then
            return true
        end
    end
    return false
end


CanUseGate = function()
    local args = {
        [1] = "GetUnlockables"
    }
    
   return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)).DefeatedIndraTrueForm
end



GetNearestEntrance = function(TargetedPos)
    local NearestGate = math.huge
    local GatePos
    local NameGate
    if Sea3 then
        for i,v in pairs(GatesInfo) do
            if (v.Pos - TargetedPos).magnitude < NearestGate  then
                NearestGate = (v.Pos - TargetedPos).magnitude
                GatePos = v.Pos
                NameGate = i
            end
        end
    end
    
    return NameGate, GatesInfo[NameGate]
end
TPToEntrance = function(Name)
    GateInfo = GatesInfo[Name]
    if not CanUseGate() then
        return 
    end
    if not GateInfo.CanInstaTP and not GateInfo.Hitbox().Parent == nil then
        return 
    end
    repeat wait() 

        if Alive() then
            StatusFarming = "Attemping To TP Gate "..Name
            local info = TweenInfo.new(0,Enum.EasingStyle.Linear)
            local tween =  game:service"TweenService":Create(getRoot(LP.Character), info, {CFrame = getRoot(LP.Character).CFrame})
            tween:Play() 
            tween:Cancel()
            if GateInfo.CanInstaTP then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",GateInfo.Pos)
                
                
            else 
                LP.Character.HumanoidRootPart.CFrame = GateInfo.Hitbox().CFrame
                __FireTouchInterest(getRoot(LP.Character),GateInfo.Hitbox(),0)
                task.wait()
                __FireTouchInterest(getRoot(LP.Character),GateInfo.Hitbox(),1)
                task.wait(0.5)
            end
        end
    until (getRoot(LP.Character).Position - GateInfo.Pos).magnitude < 300 

end



function TpNearestEntrance(TargetedPos)
    if CanUseGate() then
        Name, Info = GetNearestEntrance(TargetedPos)
        TPToEntrance(Name)
    end
end
GetNearSpawn = function(TargetedPos)
    while not Alive() do
        task.wait() 
    end
    if (#FruitFunc.HaveFruitInv() > 0 and not getgenv().Setting.OneClick.Enable) or CheckItem("Hallow Essence") or CheckItem("Fist of Darkness") or CheckItem("God's Chalice") or CheckItem("Sweet Chalice") or 
    (Sea3 and CheckItem("Red Key") and not CanAwakenDough()) or ((Sea3 or Sea2) and CheckItem("Special Microchip")) or (Sea2 and CheckFlower())  or ((Sea3 or Sea2) and CheckItem("Microchip")) then
        return
    end


    Nearest = math.huge
    TPPos = CFrame.new(TargetedPos)

    if getRoot(LP.Character) then
        if (getRoot(LP.Character).Position - TargetedPos).magnitude < 1000 then
            return nil
        end
    end
    if Sea3 and (Vector3.new(11256, -2138.0, 9888) - TargetedPos).magnitude < 1500 then
        return nil
    end
    if CanUseGate() then
        local NameGate, GateInfo = GetNearestEntrance(TargetedPos)
        if GateInfo and GateInfo.Pos then
            if (GateInfo.Pos - TargetedPos).magnitude < 2000 and (GateInfo.Pos - TargetedPos).magnitude <  (getRoot(LP.Character).Position - TargetedPos).magnitude then
                TPToEntrance(NameGate)
                return nil
            end
        end
    end
    --[[
    if getRoot(LP.Character) then
        if (getRoot(LP.Character).Position - TargetedPos).magnitude >= 1000 then
            if LP.Character:FindFirstChild("Humanoid") then
                LP.Character:FindFirstChild("Humanoid").Health = 0
                return
            end
        end
    end]]
    --return nil 
    return TargetedPos
end
BypassTpLocation = {}
PlayerSpawnsLot = {}
for _, v7 in pairs(workspace._WorldOrigin.PlayerSpawns:GetChildren()) do
    for _, v9 in pairs(v7:GetChildren()) do
        local l_p_0 = v9:GetModelCFrame().p;
        table.insert(PlayerSpawnsLot, {
            v9.Name, 
            l_p_0
        });
    end;
    v7.ChildAdded:Connect(function(v11) --[[ Line: 20 ]]
        local l_p_1 = v11:GetModelCFrame().p;
        table.insert(PlayerSpawnsLot, {
            v11.Name, 
            l_p_1
        });
    end);
end;
for _, v14 in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
    BypassTpLocation[v14.Name] = BypassTpLocation[v14.Name] or {};
    for _, v16 in pairs(PlayerSpawnsLot) do
        if (v16[2] - v14.Position).Magnitude <= v14.Size.X * v14.Mesh.Scale.X / 2 then
            table.insert(BypassTpLocation[v14.Name], v16);
        end;
    end;
end;
workspace._WorldOrigin.Locations.ChildAdded:Connect(function(v14)
    task.wait(3)
    BypassTpLocation[v14.Name] = BypassTpLocation[v14.Name] or {};
    for _, v16 in pairs(PlayerSpawnsLot) do
        if (v16[2] - v14.Position).Magnitude <= v14.Size.X * v14.Mesh.Scale.X / 2 then
            table.insert(BypassTpLocation[v14.Name], v16);
        end;
    end;
end)
function GetTPLocation(targetPosition)
    local closestDistance = math.huge
    local closestSpawnPoint = nil
    local enemyRegionData = {
        distance = math.huge,
        priority = math.huge
    }
    
    -- Search through all locations for valid spawn points
    for _, location in next, workspace._WorldOrigin.Locations:GetChildren() do
        local mesh = location:FindFirstChild("Mesh")
        
        if mesh then
            local distanceToLocation = (targetPosition - location.Position).Magnitude
            local locationRadius = mesh.Scale.X * location.Size.X / 2
            
            if distanceToLocation <= locationRadius and BypassTpLocation[location.Name] then
                for _, spawnData in pairs(BypassTpLocation[location.Name]) do
                    local spawnPointName = spawnData[1]
                    local spawnPointPosition = spawnData[2]
                    local distanceToSpawn = (targetPosition - spawnPointPosition).Magnitude
                    
                    if distanceToSpawn < closestDistance then
                        closestDistance = distanceToSpawn
                        closestSpawnPoint = spawnPointName
                    end
                end
            end
        end
    end
    
    for _, enemyRegion in next, workspace._WorldOrigin.EnemyRegions:GetChildren() do
        local mesh = enemyRegion:FindFirstChild("Mesh")
        
        if mesh then
            local distanceToRegion = (targetPosition - enemyRegion.Position).Magnitude
            local regionRadius = mesh.Scale.X * enemyRegion.Size.X / 2
            
            if distanceToRegion <= regionRadius and distanceToRegion < enemyRegionData.distance then
                enemyRegionData = {
                    distance = distanceToRegion,
                    priority = math.huge,
                    region = enemyRegion
                }
            end
        end
    end
    
    return closestSpawnPoint
end
function SSS(targetPosition, Condition)
    if not targetPosition then
        return
    end
    
    local availableSpawnPoints = {}
    
    for _, location in next, workspace._WorldOrigin.Locations:GetChildren() do
        if BypassTpLocation[location.Name] then
            for _, spawnData in pairs(BypassTpLocation[location.Name]) do
                if not table.find(availableSpawnPoints, spawnData[1]) then
                    table.insert(availableSpawnPoints, spawnData[2])
                end
            end
        end
    end
    
    if #availableSpawnPoints == 0 then
        return 
    end
    
    if #availableSpawnPoints > 1 then
        table.sort(availableSpawnPoints, function(spawnA, spawnB)
            return GetDistance(spawnA, targetPosition) < GetDistance(spawnB, targetPosition)
        end)
    end
    
    local localPlayer = game:GetService("Players").LocalPlayer
    local character = localPlayer.Character
    
    if not character or not character:FindFirstChild("LastSpawnPoint") then
        return
    end
    
    character.LastSpawnPoint.Disabled = true
    task.wait()
    
    for index, spawnPoint in pairs(availableSpawnPoints) do
        local distanceToTarget = GetDistance(spawnPoint, targetPosition)
        local distanceToPlayer = GetDistance(spawnPoint, character)
        local playerToTarget = GetDistance(targetPosition, character)
        
        if distanceToTarget + 500 < playerToTarget and distanceToPlayer >= 1000 then
            if Condition and not Condition() then
                character.LastSpawnPoint.Disabled = false
                return
            end
            local spawnLocation, tag = GetTPLocation(spawnPoint)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", spawnLocation)
            
            if localPlayer.Data.LastSpawnPoint.Value == spawnLocation then
                if character:FindFirstChild("Humanoid") then
                    character.Humanoid.Health = 0
                end
                
                while not Alive() do
                    if Condition and not Condition() then
                        character.LastSpawnPoint.Disabled = false
                        return
                    end
                    task.wait()  
                end
                
                return SSS(targetPosition, Condition)
            end
        end
    end
    
    -- Re-enable last spawn point
    character.LastSpawnPoint.Disabled = false
end
function TPKatakuriGate(KatakuriBoss)
    if getRoot(LP.Character) then
        if GetDistance(LP.Character,KatakuriBoss) > GetDistance(LP.Character,Vector3.new(-2144.967041015625, 70.37715911865234, -12399.751953125)) + 500 then
            
            DoTween2(CFrame.new(-2144.967041015625, 70.37715911865234, -12399.751953125),(function()
                return IsAlive(KatakuriBoss)
            end))
            task.wait(3)

        end
        
    end
end
function CheckEnemySpawn(Name) --For Hard Boss only
    if IsAlive(Enemies:FindFirstChild(Name)) then
        return true 
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        if (v.Name == Name or string.find(v.Name,Name)) and v:GetAttributes().Active then 
            return true
        end
    end
end
function GetMainEnemy(Name) --For Hard Boss only
    local Condition = function()
        return not Enemies:FindFirstChild(Name) or not Enemies:FindFirstChild(Name):FindFirstChild("CharacterReady")
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        if (v.Name == Name or string.find(v.Name,Name)) and v:GetAttributes().Active then 
            SSS(GetNearSpawn(v.Position),Condition)
            DoTween2(v.CFrame+Vector3.new(0,30,20))
            Floating(true)
        end
    end
    Enemies:WaitForChild(Name,10)
    Floating(false)
    return Enemies:FindFirstChild(Name)
end
NotInCoolDownSize =UDim2.new(0, 0, 1, -1) 
function NotCooldown(Skill,Name)
    return LP.PlayerGui.Main.Skills[Name][Skill].Cooldown.Size == NotInCoolDownSize
end
function IsSkillsNotCooldown(Skills, Name)
    if type(Skills)=='table' then
        local Flag =false
        for i,v in pairs(Skills) do
            Flag = NotCooldown(v,Name)
            if Flag then
                break
            end
        end
        return Flag
    else
        return NotCooldown(Skills,Name)
    end
end
function CancelQuest() -- Fuck This Shit Get Reset
    if LP.PlayerGui.Main.Quest.Visible == true then
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
      -- firesignal(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Abandon.MouseButton1Click)
    end
end
function IsPlayerValid(TargetLOL)
	local Addition = 180
    local MyLv = LP.Data.Level.Value
    if MyLv < 75 then
        Addition = 80
    end
	local TChar = TargetLOL.Character
	if IsAlive(TChar) and (math.abs(TargetLOL.Data.Level.Value-LP.Data.Level.Value) < Addition) and TargetLOL.Data.Level.Value > 20 and 
    (TChar.HumanoidRootPart.Position-getRoot(LP.Character).Position).magnitude < 10000 and not string.find(TargetLOL.Data.DevilFruit.Value,"Buddha") then
        return true
	end
    return false
end
local function GetValidPlayer()
    local ValidPlrs = {}
    for i,v in pairs(Players:GetChildren()) do
		
        if v ~= LP and IsPlayerValid(v) == true and not table.find(ValidPlrs,v.Name) then
            table.insert(ValidPlrs,v.Name)
        end
    end
    return ValidPlrs
end
local function GetAlivePlayer()
    local AlivePlrs = {}
    for i,v in pairs(Players:GetChildren()) do
		
        if v ~= LP and IsAlive(v)and not table.find(AlivePlrs,v.Name) then
            table.insert(AlivePlrs,v.Name)
        end
    end
    return AlivePlrs
end
--Mob Manication
function ResizeBoss(Boss,NoCollide)
    if Boss and getRoot(Boss) then
       getRoot(Boss).Transparency = 1
       if NoCollide then
          getRoot(Boss).CanCollide = false
       end
       getRoot(Boss).Size = Vector3.new(90,90,90)
    end
end
function LegitName(Name)
    return not string.find(Name,"Boss") and not string.find(Name,"Friend") and not string.find(Name,"friend")
end
function GetCloseRangeAttack()
    if getgenv().Setting.Mastery.Sword and not getgenv().Setting.Mastery["Sword/Low"] then
        return "Sword"
    end
    return "Melee"
end
getgenv().getcallingfunction = function(stack)
    return debug.getinfo(stack + 1).func
end
local function IsMob(v) 
    if v:FindFirstChild("CharacterReady") then
        return true 
    end
end
pcall(function()
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end)
OldSize = {}
OrginalPosition = {}
ConMob = {}
LastBringMob = tick()
BringMobCheck = {}
networkownerswitch = {}

if not isnetworkowner or (string.find(identifyexecutor(),"Cryptic"))then
    FakeOwnerNetWork=true
    isnetworkowner = function(part)
        if not networkownerswitch[part] then
            networkownerswitch[part]  = tick() 
        end
        local suc, res = pcall(function() return gethiddenproperty(part, "NetworkOwnershipRule") end)
    -- print(suc,res)
        if suc and res == Enum.NetworkOwnership.Manual then
            sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
            networkownerswitch[part]  = tick() + 4
        end
        return networkownerswitch[part]  <= tick() and  not part:IsGrounded() and part.AssemblyRootPart.ReceiveAge == 0
    end
end
local BringMob = LPH_JIT_MAX(function(Type,Type2,Resize,Radius)
    if tick()-LastBringMob<=0 then
        return
    end
    LastBringMob = tick()
    for i,v in pairs(Enemies:GetChildren()) do
        if IsAlive(v) and not Tweening and Alive() and LegitName(v.Humanoid.DisplayName) and IsMob(v)  then
            if ((Type == "Specific" and v.Name == Type2) or Type=="Near") then
                if (Type=="Near" and IsAlive(Type2)) and not BringMobCheck[Type2] then
                    BringMobCheck[Type2]=tick()
                    BringCFrame = getRoot(Type2).CFrame
                    BringPos = getRoot(Type2).Position
                end
                if not OrginalPosition[v] then
                    OrginalPosition[v]=getRoot(v).Position
                end

                local RadiusBring = Radius or (FakeOwnerNetWork and 250) or 350
                local a,b = pcall(function()
					if BringCFrame~= nil and BringPos ~= nil and getgenv().Setting.BringMob.Enable then
						if  (GetDistance(v,LP.Character) <= RadiusBring) and (BringPos-getRoot(v).Position).magnitude <= RadiusBring and (BringPos-OrginalPosition[v]).magnitude <= RadiusBring and isnetworkowner(getRoot(v)) then
                            pcall(function()
                                if setscriptable then
                                    setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
                                end

                            end)
                            pcall(function()
                                if sethiddenproperty then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 9999999)
                                end
                            end)

							v.Humanoid.WalkSpeed = 0

                            for _,x in next,v:GetDescendants() do 
                                if (x:IsA("Part") or x:IsA("MeshPart")) and not string.find(v.Name,"Leg") and  x.CanCollide then 
                                    x.CanCollide = false 
                                end
                                
                            end

                            --[[

                            v.HumanoidRootPart.CanCollide = false
							v.LowerTorso.CanCollide = false
                            v.UpperTorso.CanCollide = false
							v.Head.CanCollide = false
                           if not fluxus then --not Resize
                            --    OldSize[v]=v.HumanoidRootPart.Size
							    --ResizeHRP(v)
                            --else
                            --    v.HumanoidRootPart.Size=OldSize[v]
                            end
                            v.Humanoid:ChangeState(11)
                                                        v.Humanoid:ChangeState(14)

                            for _, child in pairs(v:GetChildren()) do
                                pcall(function()

                                    if child:IsA("BasePart") or x:IsA("MeshPart")  then
                                        child.CanCollide = false
                                    end
                                end)

                            end]]
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
                            getRoot(v).CFrame = BringCFrame
							getRoot(v).Position = BringPos
						end
					end
				end)
            end
        end
    end
end)
GetBoat = function()
    for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do 
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v:FindFirstChild("VehicleSeat") then
            return v
        end
    end
    return false
end


--Progress Checker
DataSave = {
    ["Inventory"] = {
        ["Saber"] = false,
        ["Pole"]  = false,
        ["Wando"] = false,
        ["Shisui"] = false,
        ["Saddi"] = false,
        ["Rengoku"] = false,
        ["Yama"] = false,
        ["Tushita"] = false,
        ["Dagger"] = false,
        ["Soul Guitar"] = false,
    },
    ["BlackSmith"] = {},
    ["FullMas"] = {},
    ["FullSkill"] = {},
    ["LockedMas"] = {
        ["Tushita"] = false,
        ["Yama"] = false,
    },
    TimerOneClick = 0,
    ["TTK"] =  {
        Shisui = false,
        Wando = false,
        Saddi = false,
    },
    ["Melee"] = {
        ["Black Leg"] = {
            ["Have"] =  false,
            ["Mas300"] = false,
            ["Mas400"] = false,
        },
        ["Electro"] = {
            ["Have"] = false,
            ["Mas300"] = false,
            ["Mas400"] = false,
        },
        ["Fishman Karate"] = {
            ["Have"] = false,
            ["Mas300"] = false,
            ["Mas400"] = false,        
        },
        ["DragonClaw"] = {
            ["Have"] = false,
            ["Mas300"] = false,
            ["Mas400"] = false,        
        },
        ["Superhuman"] = {
            ["Have"] = false,
            ["Mas400"] = false,        
            ["Mas600"] = false,
        },
        ["Sharkman Karate"] = {
            ["Have"] = false,
            ["Mas400"] = false,   
            ["Mas600"] = false,
        },
        ["Death Step"] = {
            ["Have"] = false,
            ["Mas400"] = false,
            ["Mas600"] = false,   
        },
        ["Electric Claw"] = {
            ["Have"] = false,
            ["Mas400"] = false,  
            ["Mas600"] = false, 
        },
        ["Dragon Tailon"] = {
            ["Have"] = false,
            ["Mas400"] = false,  
            ["Mas600"] = false, 
        },
        ["God Human"] = {
            ["Have"] = false,
            ["Mas400"] = false,   
            ["Mas600"] = false,
        },
    },
    ["Unlocked"] = {
        ["Sleigh"] = false,
        ["Electricclaw"] = false,
        ["Dragontailon"] = false,
        ["Sharkman"] = false,
        ["Deathstep"] = false,
        ["SoulGuitar"] = false,
        ["SwanDoor"] = false,
    },
    ["Sea2Done"] = false,
    ["BartiloQuest"] = false,
    ["CitizenQuest"] = false,
    ["RainbowHaki"] = false,
}
function GetLevel()
    return LP.Data.Level.Value
end
ProgressChecker = {}
for i,v in pairs({"Saber","Sea2","Sea3","Bartilo","RaceV2","SoulGuitar","Citizen Quest"}) do
    ProgressChecker[v]={}
end
function SecondSeaProgress()
    if ProgressChecker.Sea2.KilledIceBoss then
        return 
    end
    local CheckSea2 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress")
    if CheckSea2 then
        for i,v in pairs(CheckSea2) do 
            if typeof(v) ~= "Table" then
                ProgressChecker.Sea2[i]=v
            end
        end
    end
end
function CitizenQuest()
    if ProgressChecker["Citizen Quest"].Hat then 
        return 
    end
    local returner = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
    if returner then 
        if returner == 1 then
            ProgressChecker["Citizen Quest"].Bandit = true
        end
        if returner == 2 then
            ProgressChecker["Citizen Quest"].Bandit = true
            ProgressChecker["Citizen Quest"].ElephantBoss = true
        end
        if returner == 3 then 
            ProgressChecker["Citizen Quest"].Hat = true
            ProgressChecker["Citizen Quest"].Bandit = true
            ProgressChecker["Citizen Quest"].ElephantBoss = true
        end
    end
end
function RaceV2Progress()
    local returner = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1")
    if returner == 0 then
        ProgressChecker.RaceV2.DoneRace = false
    elseif returner == 1 then
        ProgressChecker.RaceV2.StartRace = true
    elseif returner ~= nil then
        ProgressChecker.RaceV2.DoneRace = true
    end
end
function RaceV3Progress()
    local returner = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1")
    if returner == 0 then
        ProgressChecker.RaceV2.DoneRace = false
    elseif returner == 1 then
        ProgressChecker.RaceV2.StartRace = true
    elseif returner ~= nil then
        ProgressChecker.RaceV2.DoneRace = true
    end
end
function GuitarProgress()
    if GetLevel() < 2300 then
        return false
    end
    local check = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check")
    if check then
        for i,v in pairs(check) do 
            ProgressChecker.SoulGuitar[i] = v
        end
        if check.Trophies then
            DataSave["Unlocked"].SoulGuitar = true
        end
    end
end
local function CDKProgress()
    local args = {
        [1] = "CDKQuest",
        [2] = "Progress",
        [3] = "Good"
    }
    local returner = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if returner then
        return returner 
    else
        return CDKProgress()
    end
    
end
function IsRaceV3()
    return CheckItem(SkillsV3Name[LP.Data.Race.Value])
end
function BartiloProgress() -- KilledBandits, KilledSpring, DidPlates
    if ProgressChecker.Bartilo.DidPlates or DataSave.BartiloQuest then
        return
    end
    local returner = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress")
    if returner then
        for i,v in pairs(returner) do
            ProgressChecker.Bartilo[i]=v
        end
    end
    if ProgressChecker.Bartilo.DidPlates then 
        DataSave.BartiloQuest = true
    end
end
function CheckBartilo()
    if DataSave.BartiloQuest then
        return true
    end
    if CheckInvItem("Warrior Helmet") then
        DataSave.BartiloQuest = true
        return true
    end
    return false
end
function ThirdSeaProgress()
    local stored = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check")
    if  stored == 0 then
        ProgressChecker.Sea3.Doflamingo = true
    end
    if stored == 1 then
        ProgressChecker.Sea3.Doflamingo = true
        ProgressChecker.Sea3.FakeRipIndra = true
    end

    
    
end
function SaberProgress()
    if ProgressChecker.Saber.KilledShanks then
        return
    end
    local args = {
        [1] = "ProQuestProgress"
    }
    CheckSaber = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if CheckSaber then
        for i,v in pairs(CheckSaber) do
            if typeof(v) == "table" then
                Plates = 0
                for i2,v2 in pairs(v) do
                    if v2 == true then
                        Plates = Plates + 1
                    end
                end
            end
            ProgressChecker.Saber[i]=v
        end
        return false
    end
end


function UseRaceV4()
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 
    and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
        --Y button is fine
        local ToolAwk = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Awakening") or LP.Character:FindFirstChild("Awakening")
        if ToolAwk then
            ToolAwk.RemoteFunction:InvokeServer(true)
        end 
    end
end
AbilityCondition = {
    ["Mink"] = function (Condition) --Fucking Useless Lol
        return true
    end,
    ["Skypiea"] = function (Condition) --Health 20%
        local Condition = Condition or function ()
            return true
        end
        if Alive() and LP.Character.Humanoid.Health <= LP.Character.Humanoid.MaxHealth*80/100 and Condition() then
            return true
        end
    end,
    ["Ghoul"] = function (Condition) --Health 20%
        local Condition = Condition or function ()
            return true
        end
        if Alive() and Condition()  then
            return true
        end
    end,
    ["Fishman"] = function (Condition) --Health 20%
        local Condition = Condition or function ()
            return true
        end
        if Alive() and LP.Character.Humanoid.Health <= LP.Character.Humanoid.MaxHealth*80/100 and Condition()  then
            return true
        end
    end,
    ["Cyborg"] = function (Condition)
        local Condition = Condition or function ()
            return true
        end
        if Alive() and Condition()  then
            return true
        end
    end,
    ["Human"] = function (Condition)
        local Condition = Condition or function ()
            return true
        end
        if Alive() and Condition() and LP.Character.Humanoid.Health <= LP.Character.Humanoid.MaxHealth*70/100 then
            return true
        end
    end
}
LastAbilityUse = tick()
function SmartAbilityUse(Bypass)
    if (AbilityCondition[LP.Data.Race.Value] and AbilityCondition[LP.Data.Race.Value]() or Bypass)  and  tick()-LastAbilityUse>0.5 then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
    end
end
function CheckInvItem(Name)

    if not DataSave.Inventory[Name] then
        if Alive() then
            if LP.Backpack:FindFirstChild(Name) or LP.Character:FindFirstChild(Name) then
                DataSave.Inventory[Name] = true
                return true
            end
            CheckA = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
            if CheckA then
                for i,v in pairs(CheckA) do
                    for i2,v2 in pairs(v) do
                        if string.find(v2,Name) or v2 == Name then
                            DataSave.Inventory[Name] = true
                            return true
                        end
                    end
                end
    
                
            else
                print("Recursive Check Inv Item")

                return CheckInvItem(Name)
            end 
        else
            print("Recursive Check Inv Item")
            repeat wait() 
            until Alive()
            wait(1)
            return CheckInvItem(Name)
        end

    else
        return true
    end
    return false

end


function GetSettingHopExploiter()
    if CheckItem("Hallow Essence") or CheckItem("Fist of Darkness") or CheckItem("God's Chalice") or CheckItem("Sweet Chalice") or 
    (Sea3 and CheckItem("Red Key") and not CanAwakenDough()) or ((Sea3 or Sea2) and CheckItem("Special Microchip")) or (Sea2 and CheckFlower()) then
        return
    end
    return getgenv().OneClickSetting and getgenv().OneClickSetting.HopIfFoundNearExploiter and WorkingFarm:empty()
end
function HopNearExploiter()
    if getgenv().IsExploiting then 
        for i,v in getgenv().IsExploiting   do 
            Char = workspace.Characters:FindFirstChild(i)  
            if Char and Char:FindFirstChild("HumanoidRootPart") and v then 
                if GetDistance(LP.Character,Char) < 500 then 
                    MainServerHop(5,"Exploiter Found Nearby",1,5)
                end
            end
        end
    end
end
function GetMaxMastery(Tool)
    if Tool then
        local CurMax = 0
        if Tool:FindFirstChild("Data") then
            local Data = require(Tool.Data)
            for i,v in pairs(AllFruitKeys) do 
                if Data.Lvl[v] then 
                    CurMax = math.max(CurMax,Data.Lvl[v] )
                end
            end
        end
        return CurMax
    end
    return 0
end
function GetMaxMasteryWeapon(Tool)
    if Tool and Tool:FindFirstChild("Data") then
        return require(Tool.Data).Lvl.X
    end
    return 0
end
function GetCurrentWeaponSwitcher(MaxMastery,Weapon)
    local MaxMastery = MaxMastery 
    if Weapon600Mas[Weapon] then
        return
    end
    PrioritySword = {
        ["0"] = {},
        ["1"] = {},
        ["2"] = {},
        ["3"] = {},
        ["4"] = {},
    }
    CheckA = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
    if CheckA then
        for i,v in pairs(CheckA) do
            if v.Type == Weapon and not ((MaxMastery and DataSave.FullMas[v.Name]) or (not MaxMastery and DataSave.FullSkill[v.Name])) then

                if PrioritySword[tostring(v.Rarity)] then
                    table.insert(PrioritySword[tostring(v.Rarity)],v.Name)
                else
                    print("Errored At ", v.Rarity)
                end
            end
            
        end
        for i=4,1,-1 do
            for i,v in pairs(PrioritySword[tostring(i)]) do
                return v
            end
        end
    end 
end
local function IsInCondition(Force, Condition)
    local Condition = Condition or function ()
        return true
    end
    return function ()
        return getgenv().Setting[Force].Enable and  Condition()
    end
end
local function GetGear() --Im Retarded
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear5","Default")
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear4","Omega")
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear4","Alpha" )
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear3","Omega")
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear3","Alpha")
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear2","Omega")
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint","Gear2","Alpha")
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TempleClock","SpendPoint")
end 
LastCheckGear = tick()
local function AutoChooseGear()
    if tick()-LastCheckGear<=2 then
        return 
    end
    LastCheckGear = tick()
    GetPoint = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
    if GetPoint and GetPoint.HadPoint then
        print("Choosed Gear")
        GetGear()

        --for i, v in pairs(workspace.Map["Temple of Time"].InnerClock:GetChildren()) do
            --print(v:FindFirstChild("Highlight") )
            --if v:FindFirstChild("Highlight") and v.Highlight.Enabled then
            --    print(v.Name)
            --end
        --end
    end
end

    
print("Intilizing UI")

getgenv().Premium = true
CheckPremium =  true
getgenv().LoadUi = true
--Archive
        
       --[[ {
            Mode = "Toggle",
            Title = "Auto Trade X2 Exp (Candy)",
            Args = {"Shop", "Candy X2 EXP"},
            OnChange = function(state)
                getgenv().Setting.Shop["Candy X2 EXP"] = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Toggle",
            Title = "Auto Trade 500 Fragments (Candy)",
            Args = {"Shop", "Candy 500 Fragments"},
            OnChange = function(state)
                getgenv().Setting.Shop["Candy 500 Fragments"] = state
                SettingManager:Save()
            end
        },
        {
            Mode = "Button",
            Title = "Stats Refund( Candy)",
            Description = "75 Candy",
            Callback = function()
                local args = {
                    [1] = "Candies",
                    [2] = "Buy",
                    [3] = 1,
                    [4] = 2
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))            
            end
        },
        {
            Mode = "Button",
            Title = "Reroll Race( Candy)",
            Description = "100 Candy",
            Callback = function()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Candies","Buy",1,3)         
            end

            
        },]]
                --[[{
            Mode = "Toggle",
            Title = "Only Farm Near",
            Description = "Only Farm Near Mobs So You Dont Have To Deal With Far Mobs That Aren't From Yours",
            Args = {"SeaEvents", "OnlyFarmNearMob"},
            OnChange = function(state)
                getgenv().Setting.SeaEvents.OnlyFarmNearMob = state
                SettingManager:Save()
            end
        },]]

        --{
         --   Mode = "Button",
           -- Title = "Tween Ship To Tiki",
        --    Description = "For Transporting Heart",
        --[[{
            Mode = "Button",
            Title = "Kick Player Safe Zone",
            Description = "Near Safe Zone + Need To Shit On Ship",
            Callback = KickPlayer
        },
        {
            Mode = "Button",
            Title = "Buy Ship",
            Description = "",
            Callback = function()
=
            end
        },

        {
            Mode = "Button",
            Title = "Fly",
            Description = "",
            Callback = function()
            end
        },
        {
            Mode = "Button",
            Title = "Stop Fly",
            Description = "",
            Callback = function()
            end
        },]]
repeat wait()
until getgenv().LoadUi and getgenv().IslandCaller and getgenv().SettingManager 


print("Adding Char Connection")
--Adding char Connection
LP.CharacterAdded:Connect(function(char)

    DoneBeGod = false
end)
TeleportService = game:GetService("TeleportService")
    TeleportService.TeleportInitFailed:Connect(function(...)
    local LP, Result, Err = ...
    if Err=="The previous teleport is in processing" then
        
    end
end)
SupportRetard()
Animation = Instance.new("Animation")
local function GetAnimation()
    if Animation then
        return Animation 
    else
        Animation = Instance.new("Animation")
        return Animation
    end
end

local CanAttack = function()
    if Alive() then
        local Tool = LP.Character:FindFirstChildOfClass("Tool")
        if Tool and Tool.ToolTip and (Tool.ToolTip == "Sword" or Tool.ToolTip == "Melee") then
            return true
        end 
    end

    return false
end
function getHits(Size,APart)
    local Hits = {}
    local Enemies = workspace.Enemies:GetChildren()
    local Characters = workspace.Characters:GetChildren()
    for i=1,#Enemies do local v = Enemies[i]
        if getgenv().Setting.FastAttack.OnMob then
            local Human = v:FindFirstChildOfClass("Humanoid")
            if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size then
                table.insert(Hits,APart and v[APart] or Human.RootPart)
            end
        end
    end
    for i=1,#Characters do local v = Characters[i]
        if getgenv().Setting.FastAttack.OnPlayer then
            if v ~= game.Players.LocalPlayer.Character then
                local Human = v:FindFirstChildOfClass("Humanoid")
                if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size then
                    table.insert(Hits,APart and v[APart] or Human.RootPart)
                end
            end
        end
    end
    return Hits
end

--[[

                    GetAnimation().AnimationId = "rbxassetid://9841359181"
                        game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(GetAnimation()):Play(100, 99)
]]
Delay = 0
LastHash = tick()
print("Attack No CD")

local AttackTest = function()
    --v3 = require(game.ReplicatedStorage.Controllers.CombatController)
    --v3:Attack(GetCurrentTool("Melee"))
    if Alive() then
        --[[
            local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
            local l_RunService_0 = game:GetService("RunService");
            local v3 = require(l_ReplicatedStorage_0.Modules.Net);
            local v4 = require(l_ReplicatedStorage_0.Modules.CombatUtil);
            v4:GetMovesetAnimCache(game.Players.LocalPlayer.Character.Humanoid);
            v24=1
            local l_v4_WeaponName_3 = v4:GetWeaponName(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"));
            print(l_v4_WeaponName_3)
            l_v4_MovesetAnimCache_0[v4:GetPureWeaponName(l_v4_WeaponName_3) .. "-basic" .. v24];
            ]]
        local args = {
            [1] = 0.43
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(unpack(args))
    end
    --[[
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(GetAnimation()):Play(100, 99)
    end)             
    ]]
end
AttackNoCD = function(v)

end 

local GetNearestPlayers = function ()
    local NearPlr, NearDist = nil, 9999999
    for i,v in pairs(GetPlayers()) do
        if v == LP then continue end
        if Alive() and IsAlive(v.Character) then
           -- print(GetDistance(v.Character,LP.Character), NearDist )
            if GetDistance(v.Character,LP.Character) <= NearDist then
                NearPlr = v
                NearDist = GetDistance(v.Character,LP.Character)
            end
        end
    end
    return NearPlr
end
print("Setting Gun Method")
function BypassShootGun()
    local Vinhuchi = debug.getupvalues(require(game:GetService("ReplicatedStorage").Controllers.CombatController).Attack)[9]

    local u8 = debug.getupvalue(Vinhuchi, 14)

    local u9 = debug.getupvalue(Vinhuchi, 16)
    local u7 = debug.getupvalue(Vinhuchi, 12)
    local u10 = debug.getupvalue(Vinhuchi, 18)
    
    local u13 = u7 * 798405
    local u12 = (u8 * 798405 + u7 * 727595) % u9
    
    function calcccc()
        u12 = (u12 * u9 + u13) % 1099511627776
        u8 = math.floor(u12 / u9)
        u7 = u12 - u8 * u9
    end
    calcccc()
    debug.setupvalue(Vinhuchi, 14, u8)
    debug.setupvalue(Vinhuchi, 16, u9)
    debug.setupvalue(Vinhuchi, 12, u7)
    debug.setupvalue(Vinhuchi, 18, u10)
    game.ReplicatedStorage.Remotes.Validator2:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)

end


function ShootGun(Obj,ShootAllNear)
    local IsPlayer = typeof(Obj) == "Instance" and Obj:IsA("Model") and Players:FindFirstChild(Obj.Name)
    local Pos, EnemyHRP, EnemyHead, IsEnemyAlive
    local GetGun

    for i,v in pairs(LP.Character:GetChildren()) do

        if v:IsA("Tool") then
            if v.ToolTip == "Gun" then
                GetGun =  v
            end
        end
    end

    
    if GetGun then
        Pos = AllToVector(Obj)
        if typeof(Obj) == "Instance" and Obj:IsA("Model") then
            EnemyHead=Obj.Head 
            EnemyHRP=Obj:FindFirstChild("HumanoidRootPart") 
        end
        if IsPlayer then
            
            IsEnemyAlive = Obj and Obj:FindFirstChild("HumanoidRootPart") and Obj:FindFirstChild("Humanoid") and Obj:FindFirstChild("Humanoid").Health > 0        
        end
       local _, err = pcall(function ()
            if Alive() then
                if (IsPlayer and IsEnemyAlive) or not IsPlayer then
                    if GetGun.Name == "Skull Guitar" then
                        local args = {
                            [1] = "TAP",
                            [2] = Pos
                        }
                        
                        GetGun.RemoteEvent:FireServer(unpack(args))
                         
        --game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild(""):InvokeServer("TAP",Vector3.new(0,0,0))
                    else
                        BypassShootGun()
                        local args = {
                            [1] = Pos,
                            
                        }
                        if GetGun.Name ~= "Bazooka" and GetGun.Name ~= "Cannon" then
                            args[2] = ShootAllNear and {EnemyHead} or  getHits(100,"Head")
                        end
                        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/ShootGunEvent"):FireServer(unpack(args))
                        
                    end
                
                end
            end
        end)
        if err then 
            print("Shoot Gun Err:",err) 
        end
    end
end
StartAttack = tick()

print("Adjusting Animation")
local function CanFastAttack()
    return true
end
print("Last Fast attack")
local _sendHitsOk, _sendHitsResult = pcall(function()
    return (getmenv or getsenv)(game:GetService("ReplicatedStorage").Modules.Net)._G.SendHitsToServer
end)
SendHitsToServer = _sendHitsOk and _sendHitsResult or nil

spawn(function ()

    SupportRetard()
    local AttackRemote
    pcall(function()
        local RegisterHit = getupvalue(require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("CombatUtil")).RunHitDetection,5)
        getgenv().coroutineDetect = getupvalue(RegisterHit,4)
        
        -- The Code Below Will Make Luraph bug
        --[[

        local old
        old = hookfunction(coroutine.yield,function(...)
            local args = {...}
    
            if string.find(debug.traceback(),"CombatUtil") then
                AttackRemote =  tostring(game.Players.LocalPlayer.UserId):sub(2, 4) .. tostring(coroutine.running()):sub(11, 15);
    
            end
            return old(...)
        end)
        
        if not AttackRemote then
            coroutine.resume(coroutineDetect,game.Players.LocalPlayer.Character.Head,{})
            setreadonly(coroutine,false)
            coroutine.yield = old
            setreadonly(coroutine,true)
        end]]

    end)
    --[[
    if not AttackRemote then
        StarterGui:SetCore("SendNotification", {
            Title = "Warning",
            Text = "Couldn't Find Report This In Bug Report And Do Not use the script",
            Duration = 120,
        })
    end]]
    LastNewClickAttack = tick()

    change1 = tick()
    Attack2 = function ()
        if CanAttack() and LP.Character and LP.Character:FindFirstChild("Stun") and LP.Character.Stun.Value == 0 then
            local hits =getHits(100,"Head")
            
            if hits and #hits>0 then
                

                if tick()-change1>=0.05 then
                    change1 = tick()
                    
                end
                Interate = getgenv().MasteringWeapon and 1 or 4
                CountS = #hits
                
                pcall(AttackTest)
                MakeAttackTable = {

                }
                table.insert(MakeAttackTable,hits[1])
                
                local MultiAttack = {}
                if CountS > 1 then
                    count = 1
                    for i=1,CountS do 
                        MultiAttack[count]={}
                        MultiAttack[count][1]=hits[i].Parent
                        MultiAttack[count][2]=hits[i]
                        count=count+1
                    end
                    
                end  
                table.insert(MakeAttackTable,MultiAttack)
                MakeAttackTable[3]=nil
                MakeAttackTable[4]=AttackRemote
                --game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(unpack(MakeAttackTable))
                if SendHitsToServer then
                    SendHitsToServer(hits[1],MultiAttack)
                else
                    local _ok, _err = pcall(function()
                        SendHitsToServer = (getmenv or getsenv)(game:GetService("ReplicatedStorage").Modules.Net)._G.SendHitsToServer
                    end)
                    if SendHitsToServer then
                        SendHitsToServer(hits[1],MultiAttack)
                    end
                end

                if getgenv().MasteringWeapon then
                    task.wait() 
                end
            --[[else 
                local MultiAttack = {}

                for i=1,CountS do 
                    MultiAttack[1] = {
                        hits[i].Parent,
                        hits[i]
                    }
                    MultiAttack[2]=hits[i]
                    table.insert(MakeAttackTable,MultiAttack)
                    MakeAttackTable[3]=nil
                    MakeAttackTable[4]=AttackRemote
                    for i=1,Interate do
                        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(unpack(MakeAttackTable))
                    end
                end

                    
            -- coroutine.resume(getgenv().coroutineDetect,hits[1],MultiAttack)

                if getgenv().MasteringWeapon then
                    task.wait() 
                end]]
                 
            end
        end
    end
    --[[
                    if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                    game.Players.LocalPlayer.Character.Stun.Value = 0
                end
                game.Players.LocalPlayer.Character.Busy.Value = false      ]]
    while task.wait() do 
        if getgenv().Setting.FastAttack.Enable then
            if Attack2 then pcall(Attack2) end
        end

    end
end)

print("SKill Controllẻ")
--Skill Controller
task.spawn(function()
    while task.wait(0.1) do
        if not Debounce and SkillsController.Condition and SkillsController.Condition() then
           -- print("Trying To Press")
            Debounce = true
            --[[
            local a,b = pcall(function ()
                for i,v in pairs({"Melee","Blox Fruit","Gun","Sword"}) do
                    if getgenv().Setting.SkillsSet2[v] then
                        --local CurrentWeaponN = GetCurrentTool(v)
                        --local WeaponData 
                        if v == "Blox Fruit" then
                            pcall(Equip,GetCurrentTool("Blox Fruit",true))       
                            --WeaponData = require(CurrentWeaponN.Data)      
                            local a = {"Z","X","C","V"}                      
                            for i,v in pairs(a) do 
                                --local LvRequire = WeaponData.Lvl[v]
                               -- if LvRequire <= LP.Character:FindFirstChild(CurrentWeaponN).Level.Value then
                                if NeedUseSkill and NeedUseSkill() then
                                    Press(v)
                                    task.wait(0.5)
                                end
                               -- end
                            end
                            
                        else
                            local AllWeapon = GetCurrentTool(v) and GetCurrentTool(v).Name 
                            if AllWeapon then
                                Equip(AllWeapon)
                                --WeaponData = require(CurrentWeaponN.Data)      
                                --local LvRequire = WeaponData.Lvl["Z"]
                                --if LvRequire <= CurrentWeaponN.Level.Value then
                                    Press("Z")
                                    task.wait(0.5)
                               -- end
                                --LvRequire = WeaponData.Lvl["X"]
                                --if LvRequire <= CurrentWeaponN.Level.Value then
                                    Press("X")
                                    task.wait(0.5)
                               -- end
                                --LvRequire = WeaponData.Lvl["C"]
                                if v== "Melee" then
                                    task.wait(0.25)
                                    Press("C")
                               end
                            end
                        end
                        task.wait()
                    end
                end
            end)]]
            local a,b = pcall(function()
                for i,v in pairs(SkillsController.Weapon) do
                    
                    if not (SkillsController.Condition and SkillsController.Condition()) then
                        break
                    end
                    local CurrentWeaponN = GetCurrentTool(v)  
                    if CurrentWeaponN then
                        if Alive() then
                            WeaponData = require(CurrentWeaponN.Data)  
                            if v == "Blox Fruit" then
                                pcall(Equip,GetCurrentTool("Blox Fruit",true))    
                                
                                    
                                local a = SkillsController.Skills     
                                for _,v2 in pairs(a) do 
                                    if LP.Character:FindFirstChild(CurrentWeaponN.Name):FindFirstChild("Level") then
                                        local LvRequire = WeaponData.Lvl[v2]
                                        if LvRequire <= LP.Character:FindFirstChild(CurrentWeaponN.Name).Level.Value then
                                            if SkillsController.Condition and SkillsController.Condition() and not (SkillsController.Idle and SkillsController.Idle()) then
                                                Press(v2,getgenv().Setting.FruitSkillsHold[v2] or 0)
                                                task.wait(0.3)
                                            end
                                        end
                                    end
                                end
                                
                            else
                                local AllWeapon = GetCurrentTool(v) and GetCurrentTool(v).Name 
                                if AllWeapon then
                                    Equip(AllWeapon)
                                    local Skills = {"Z","X","C"}
                                    for _,v2 in pairs(Skills) do 
                                        if LP.Character:FindFirstChild(CurrentWeaponN.Name):FindFirstChild("Level") then
                                            if v~= "Melee" and v2 == "C" then 
                                                continue
                                            end
                                            if not (SkillsController.Condition and SkillsController.Condition()) then
                                                break 
                                            end
                                            local LvRequire = WeaponData.Lvl[v2]
                                            if LvRequire <= LP.Character:FindFirstChild(CurrentWeaponN.Name).Level.Value then
                                                if  not (SkillsController.Idle and SkillsController.Idle()) then
                                                    Press(v2)
                                                    task.wait(0.2)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if SkillsController.Idle and SkillsController.Idle() then 
                        while not (SkillsController.Idle and SkillsController.Idle()) and (SkillsController.Condition and SkillsController.Condition()) do
                            task.wait(0.1)
                        end
                    end
                end
                
            end)
            if b then
                print("Skill Controller: ",b)
            end
            task.wait()
            Debounce = false
    
        end
            
    end
end)
print("Load SilentAim")
do 
    --local mouse = require(game:GetService("ReplicatedStorage").Mouse)
        
        --[[ local gg = getrawmetatable(game)
            local old = gg.__namecall
            setreadonly(gg, false)
            gg.__namecall = newcclosure(function(...)
                local method = getnamecallmethod()
                local args = {...}
                if tostring(args[1]) == "mouse" or tostring(args[1]) == "Mouse" then
                    --print(args[1],method,args[2],args[1].Parent,args[1].Parent.Parent)
                end
                if tostring(method) == "FireServer" then
                    if tostring(args[1]) == "RemoteEvent" then
                        if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" and not getgenv().Setting.Pvp.DisableSilentAim then
                            local HookPosition = (getgenv().SilentAimPos and getgenv().PosToHook) or (getgenv().Setting.Pvp.SilentAimNear and getgenv().HitPosition)
                            if HookPosition then
                                args[2] = HookPosition 
                                return old(unpack(args))
                            end
                            
                        end
                    end
                end
        
                return old(...)
            end)
            setreadonly(gg, true)
        ]]


            --[[
        setreadonly(Vector3,false)
        local t = Vector3.new()
        local meta = debug.getmetatable(t)
        setreadonly(meta,false)
        local oldindex = meta.__index
        
        meta.__index = newcclosure(function(a,b,c)
            LPH_NO_VIRTUALIZE(function()
                if not checkcaller() and getcallingscript() == game:GetService("Players").LocalPlayer.PlayerScripts.RenderDistance and tostring(b) == "magnitude" then
                    return 0
                end
                if not checkcaller() and getcallingscript() == game.ReplicatedStorage.Queue and tostring(b) == "magnitude" then
                    local t = oldindex(a,b,c)
                    if t > 10 then
                        return 400
                    else
                        return t
                    end
                end
                return oldindex(a,b,c)
            end)()
        
        end)]]
        if (getgenv().OneClickSetting and getgenv().OneClickSetting.Mastery or not getgenv().OneClickSetting) then
            loadstring([[
                if string.find(identifyexecutor(),"macsploit") then
                    return 
                end
                local gt = getrawmetatable(game)
                local namecall = gt.__namecall
                setreadonly(gt, false)
                gt.__namecall = newcclosure(function(self, ...)

                    local method = getnamecallmethod()
                    local args = {...}
                    if method == "FireServer" then 
                        if tostring(self) == "RemoteEvent" then 
                            if tostring(args[1]) ~= "true" and tostring(args[1]) ~= "false" and not getgenv().Setting.Pvp.DisableSilentAim then
                                local HookPosition = (getgenv().SilentAimPos and getgenv().PosToHook) or (getgenv().Setting.Pvp.SilentAimNear and getgenv().HitPosition)
                                if HookPosition then
                                    if  #args == 1 and typeof(args[1]) == "Vector3" then
                                        args[1] = HookPosition
                                    end
                                    if #args == 1 and typeof(args[1]) == "CFrame" then
                                        args[1] = CFrame.new(HookPosition)
                                    end
                                end 
                            end
                        end

                    end
                    if method == "InvokeServer" then 
                        
                        if self.Parent ~= nil and tostring(self.Parent) == "Humanoid" then 
                        
                            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" and type(args[2]) == "vector" and not getgenv().Setting.Pvp.DisableSilentAim then
                            --  print(tostring(self),self.Parent,self.Parent.Parent)
                            --  print(tostring(getcallingscript()))
                                local HookPosition = (getgenv().SilentAimPos and getgenv().PosToHook) or (getgenv().Setting.Pvp.SilentAimNear and getgenv().HitPosition)
                                if HookPosition then
                                    --print("hooked 2")
                                    if  typeof(args[2]) == "Vector3" then
                                        args[2] = HookPosition
                                    end
                                    if typeof(args[2]) == "CFrame" then
                                        args[2] = CFrame.new(HookPosition)
                                    end
                                end
                            end
                        end
                    end
                    if method == "GetServerTimeNow" then
                        local callingscript = getcallingscript().Name
                        local func = getgenv().getcallingfunction(3)
                        if  callingscript == "Skyjump" then
                            
                            if debug.getinfo(func).name  == "jumped" then
                                getgenv().SkyFunc = func
                            end
                        else
                            if debug.getinfo(func).name  == "handleAction" then
                                if callingscript == "Dodge" then
                                    getgenv().DodgeFunc = func
                                end
                                if callingscript == "Soru" then 
                                    getgenv().SoruFunc = func
                                end
                            end
                        end
                    end

                    return namecall(self, unpack(args))
                end)
            ]])()
        end
        spawn(function()
            print("Loaded LP Modifier")
            while task.wait(0.1) do 
                if getgenv().Setting.LocalPlayer.SoruNoCD  then
                    if getgenv().SoruFunc then
                        local func = getgenv().SoruFunc
                        for i, v in pairs(debug.getconstants(func)) do
                            if type(v) == "number" and v > 0.03 and v < 0.04 then 
                                debug.setconstant(func, i, 0)
                            end
                        end
                        if #debug.getconstants(func) > 50 and #debug.getupvalues(func) > 8 then 
                            for i, v in pairs(debug.getupvalues(func)) do
                                if type(v) == "table" then
                                    if v.LastUse and v.LastAfter then 
                                        v.LastAfter = 0
                                        v.LastUse = 0
                                    end 
                                end    
                            end
                        end
                    end
                end
                if getgenv().Setting.LocalPlayer.DashNoCD then
                    if getgenv().DodgeFunc then
                        local func = getgenv().DodgeFunc
                        setupvalue(func,6,0)
                        if getgenv().Setting.LocalPlayer.DoDashRange and getgenv().Setting.LocalPlayer.DashRange then
                            setupvalue(func,10,getgenv().Setting.LocalPlayer.DashRange)
                        end
                    end
                end
                if getgenv().Setting.LocalPlayer.InfGeppo and getgenv().SkyFunc then
                    local func = getgenv().SkyFunc
                    for i2,v2 in next, getupvalues(func) do
                        if tostring(i2) == "9" then
                            setupvalue(func,i2,0)
                        end
                    end
                end
            end
        end)

        --loadstring(
          --[[
            local gt = getrawmetatable(game)
            local old = gt.__namecall
            setreadonly(gt,false)
            gt.__namecall = newcclosure(function(...)
                local args = {...}
                if getnamecallmethod() == "InvokeServer" then 
                    if tostring(args[2]) == "TAP" then
                        local HookPosition = (getgenv().SilentAimPos and getgenv().PosToHook) or (getgenv().Setting.Pvp.SilentAimNear and getgenv().HitPosition)
                        if HookPosition then
                            args[3] = HookPosition 
        
                        end
                    end
                
                end
                return old(unpack(args))
            end)
        ]]
       -- )
    if not getgenv().Setting.OneClick.Enable then
        loadstring(
            [[  
                if string.find(identifyexecutor(),"macsploit") then
                    return 
                end
                print("loading [0x02]")
                local lp = game.Players.LocalPlayer
                local gt2 = getrawmetatable(lp)
                local newIndex = gt2.__newindex
                setreadonly(gt2, false)
                gt2.__newindex = newcclosure(function(self, Index, Value)
                    if getgenv().Setting.LocalPlayer.SpeedHack and tostring(Index) == "WalkSpeed" and tostring(self) == "Humanoid"  then
                        Value = getgenv().Setting.LocalPlayer.Speed or 100
                    end
                    return newIndex(self, Index, Value)
                end)
            ]]
        )()
    end
end
--


print("Load Queue")

--loadstring(game:HttpGet("https://thetakenisland.xyz/api/script/BloxStock-obfuscated.lua", true))()
--[[
local IceWalk 
spawn(LPH_NO_VIRTUALIZE(function()
    IceWalkMod = game.ReplicatedStorage.Effect.Container.Shared:WaitForChild("IceWalk")
    IceWalk = require(IceWalkMod)
end))]]


local function GetNearest(List,Oneclick,Priority)
    local NearestDist = 99999 
    local Mob
    if Priority then
        for i,v in pairs(List) do
            if  LegitName(v.Name) and IsAlive(v) and string.find(v.Name,Priority) then 
                return v 
            end
        end 
    end
    local Checker = function(Name)
        if Oneclick == "Level30" then
            return string.find(Name,"Sky")
        end
        if Oneclick == "Level60" then
            return not table.find(AllBoss[CurrentPlaceKey],Name) and not string.find(Name,"Royal Soldier")
        end
        return true
    end
    for i,v in pairs(List) do
        if  LegitName(v.Name) and IsAlive(v) and GetDistance(v,LP.Character) < NearestDist and Checker(v.Name) and IsMob(v) then
            NearestDist = GetDistance(v,LP.Character)
            Mob = v
        end
    end
    return Mob
end
local function FindMob(Name)
    local Mob = Enemies:FindFirstChild(Name)
    if IsAlive(Mob) then
        return Mob
    end
    return nil
end

local GetNearMob = function(Custom,Name)
    local MobChecker =  {
        ["Katakuri"] = function(Mob)
            if string.match(Mob.Name,"Baking Staff") or string.match(Mob.Name,"Head Baker") or string.match(Mob.Name,"Cake Guard") or string.match(Mob.Name,"Cookie Crafter")  then
                return true
            end
        end,
        ["Bone"] = function (Mob)
            if string.match(Mob.Name,"Reborn Skeleton") or string.match(Mob.Name,"Living Zombie") or string.match(Mob.Name,"Demonic Soul") or string.match(Mob.Name,"Posessed Mummy") then
                return true
            end
        end,
        ["Elite"] = function (Mob)
            if  string.find(Mob.Name, "Diablo") or string.find(Mob.Name, "Deandre") or string.find(Mob.Name, "Urban") then
                return true
            end
            
        end,
        ["Pirate Raid"] = function (Mob)
            if  IsAlive(Mob) and Alive() and (getRoot(Mob).Position-PlacesPosition.CenterCastle).magnitude <= 1000 and Mob.Name ~= "rip_indra True Form" then
                return true
            end
        
        end,
        ["Material"] = function (Mob)
            if Alive() and IsAlive(Mob) and GameData.MaterialFarm.CheckMob[Name].IsMob(Mob) then
                local Valid = true
                if Name ~= "Dragon Scale" then
                    if type(GameData.MaterialFarm.CheckMob[Name]["Pos"]) ~= 'table' then
                        if (GameData.MaterialFarm.CheckMob[Name]["Pos"].Position-getRoot(Mob).Position).magnitude>=2500 then
                            Valid = false
                        end
                    else
                        for i2,v2 in pairs(GameData.MaterialFarm.CheckMob[Name]["Pos"]) do
                            if (v2.Position-getRoot(Mob).Position).magnitude>=3000 then
                                Valid = false
                            end 
                        end
                    end
                end
                return Valid
            end
        end,
        ["Factory"] = function (Mob)
            if Mob.Name == "Core" then
                return true
            end
        end,
    }
    local List = {}
    for i,v in pairs(Enemies:GetChildren()) do 
        if type(Custom) == "string" and MobChecker[Custom] then
            
            if  MobChecker[Custom](v) then
                table.insert(List,v)
            end
        elseif type(Custom) == "function" then 
            if Custom(v) and LegitName(v.Name) then 
                table.insert(List,v)
            end
        else
            if v.Name==Custom or not Custom then
                table.insert(List,v)
            end
        end
        
    end
    return GetNearest(List,nil,Name == "Pirate Raid" and "Tanky")
end

local LastCooldown = nil
local LastNotCooldown = tick()
local MasteryShootDelay = 0.5
local MasteryShootTick = tick()
local GetMasteryPosition = function (Vector)
    local Method = Vector and Vector3.new or CFrame.new
    return CFrame.new(getgenv().Setting.Mastery.X or 0,getgenv().Setting.Mastery.Y or 30, getgenv().Setting.Mastery.Z or 0)
end

local HashTable = {}
local BuggedMobC ={}
local function SetTimer(Mob,CanFarm,Condition) 

    if not HashTable[Mob] then
        table.clear(HashTable)
        HashTable[Mob]  = tick()
    elseif tick()- HashTable[Mob] >= 15 and Alive() and IsAlive(Mob) then
        if not BuggedMobC[Mob] then 
            BuggedMobC[Mob]=true
        else
            Mob:Destroy()
            return true
        end
        StatusFarming = "Bugged Mob"
        local StartFixing = tick()
        local CurPos = getRoot(LP.Character).Position
        CanFarm = CanFarm or function()
            return true
        end
        Condition = Condition or function()
            return true
        end
        
        while task.wait(0.1) and Alive() and tick() - StartFixing < 10 and CanFarm() and Condition() and IsAlive(Mob) do 

            pcall(function()
                Mob.PrimaryPart:SetNetworkOwner(nil)
            end)
            getRoot(LP.Character).CFrame = CFrame.new(CurPos)*CFrame.new(0,2000,0)
        end
        getRoot(LP.Character).CFrame = CFrame.new(CurPos)
        table.clear(HashTable)
        return true
    end
end
local function AttackMob(Mob,CanMastery,Condition,NoTween,NoBringMob,TweenSetting,AttackSetting) -- Make This Table
    local Condition = Condition or function ()
        return true
    end
    local TweenCondition = function()
        return Condition() and IsAlive(Mob) and Mob.Parent.Name == "Enemies"
    end
    local AttackSetting = AttackSetting or {}
    local IgnoreEquip = AttackSetting.IgnoreEquip
    local ForceNotMastery = AttackSetting.ForceNotMastery
    local FarmMastery = AttackSetting.FarmMastery
    local Spin = AttackSetting.Spin
    local _, err = pcall(function ()
        if IsAlive(Mob) and Alive() and Condition() then
            local HRP = getRoot(Mob) 
            local H = Mob:FindFirstChild("Humanoid")
            if not fluxus then
                pcall(function()
                 --   ResizeHRP(Mob)
                end)
            end
            Mastery =  getgenv().Setting.Mastery.Enable or FarmMastery
            SwordMastery = getgenv().Setting.Mastery["Sword/Low"] or SelectedWeaponAlternative
            CanMastery = (CanMastery or SelectedWeaponAlternative or FarmMastery) and not ForceNotMastery
            local MasteryHealth =  (Mastery and  getgenv().Setting.Mastery.Health and (getgenv().Setting.Mastery.Health/100)  or (50/100)) or (SelectedWeaponAlternative and 60/100)
            if H and H.Health <= H.MaxHealth* MasteryHealth and CanMastery and (SwordMastery or Mastery) then
                if Mastery then
                    if getgenv().Setting.Mastery.Camera  then
                        LP.CameraMaxZoomDistance = 0
                        local camera = workspace.CurrentCamera
                        camera.CFrame = CFrame.new(camera.CFrame.Position, HRP.Position)
                    elseif LP.CameraMaxZoomDistance <= 1 then 
                        LP.CameraMaxZoomDistance = 200
                        LP.CameraMinZoomDistance = 100
                        LP.CameraMinZoomDistance = 0
                    end
                    local SelectWeapon  
                    if getgenv().Setting.UseDragonStorm then
                        SelectWeapon = "Gun"
                    elseif getgenv().Setting.OneClick.Enable then 
                        SelectWeapon = "Blox Fruit"
                    else 
                        SelectWeapon = "Melee"
                    end
                    getgenv().PosToHook = HRP.Position
                    getgenv().SilentAimPos = true
                    if getgenv().Setting.UseDragonStorm then
                        if not LP.Character:FindFirstChild("Dragonstorm") then
                            pcall(Equip, "Dragonstorm")
                            task.wait(0.1)
                        end
                    else
                        pcall(Equip,GetCurrentTool(SelectWeapon,true))
                    end    
                    local a = SelectWeapon == "Gun" and {"Z","X"} or SelectWeapon == "Melee" and {"Z","X","C"} or SelectWeapon == "Sword" and {"Z","X"} or getgenv().Setting.SkillsSettingRemake["Blox Fruit"]
                    local b = GetCurrentTool(SelectWeapon,true)  
                    if SelectWeapon == "Gun" then
                        DoTween2(NewPos(Mob,GetMasteryPosition(true)),TweenCondition)
                        local _dsDelay = getgenv().Setting.UseDragonStorm and 0.2 or MasteryShootDelay
                        if tick()-MasteryShootTick > _dsDelay then
                            MasteryShootTick = tick()
                            if getgenv().Setting.UseDragonStorm then
                                BypassShootGun()
                                local _dsArgs = {
                                    HRP.Position,
                                    {HRP},
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/ShootGunEvent"):FireServer(unpack(_dsArgs))
                            else
                                ShootGun(HRP.Parent,true)
                            end
                                
                        end
                    else
                        local CurTool=LP.Character:FindFirstChild(b) 
                        if  CurTool then
                            if CurTool:FindFirstChild("Data") and CurTool:FindFirstChild("Level") then
                                WeaponData= require(CurTool.Data)
                                if WeaponData then
                                    local Temp = {}
                                    for _,v3 in pairs(a) do 
                                        
                                        local LvRequire = WeaponData.Lvl[v3]

                                        if LvRequire <= CurTool.Level.Value then
                                            table.insert(Temp,v3)
                                        end
                                    end
                                    a=Temp
                                end 
                            end
                        end 
                    
                        if IsSkillsNotCooldown(a,b) then
                            LastCooldown = nil
                            if not LastNotCooldown then
                                LastNotCooldown= tick()
                            end
                            if not NoTween then
                                                                    DoTween2(NewPos(Mob,GetMasteryPosition(true)),TweenCondition,nil,TweenSetting)
                            end
                        else
                            if not NoTween then
                                if not LastCooldown then
                                    LastCooldown = tick()
                                    LastNotCooldown = nil
                                elseif tick() - LastCooldown <= 0.5 then
                                                                            DoTween2(NewPos(Mob,GetMasteryPosition(true)),TweenCondition,nil,TweenSetting)
                                else
                                    
                                    DoTween2(NewPos(Mob,Vector3.new(0,200,0)),Condition)
                                end  
                            end
                        end 
                    end
                    --[[
                    local Weapon = GetCurrentTool(SelectWeapon)
                    if Weapon then
                        WeaponData = require(Weapon.Data)                                  
                        local IsGun = (SelectWeapon == "Gun")
                        
                        spawn(function ()      
                            for i,v in pairs(a) do 
                                --if (not IsGun and not LastCooldown and LastNotCooldown and tick() - LastNotCooldown > 0.5) or  IsGun then
                                    --print(IsGun)
                                    local LvRequire = WeaponData.Lvl[v]
                                    --print(LvRequire,Weapon.Level.Value)
                                    if (LvRequire and LvRequire <= Weapon.Level.Value) or not LvRequire then
                                        --print("Passed",SelectWeapon,table.find(getgenv().Setting.SkillsSettingRemake[SelectWeapon],v))
                                        if table.find(getgenv().Setting.SkillsSettingRemake[SelectWeapon],v) then
                                            if SelectWeapon == "Blox Fruit" then
                                                Press(v,getgenv().Setting.FruitSkillsHold[v] or 0)
                                            else
                                                Press(v)
                                            end
                                            task.wait(0.5)
                                        end
                                    end
                                --end

                            end                  
                        end)
                    end ]]
                else
                    pcall(Equip,GetCurrentTool("Sword",true)) 
                    if not NoTween then
                        DoTween2(NewPos(Mob,Vector3.new(0,40,0)),TweenCondition,nil,TweenSetting)
                    end
                end
                Floating(true)
                if not NoBringMob then
                    BringMob("Near",Mob,true)
                end
            else
                if not IgnoreEquip then
                    Equip(GetCurrentTool(GetCloseRangeAttack(),true))
                    
                end
                if not NoTween then
                    if Spin and GetDistance(Mob,LP.Character) <= 200 then
                        local trueOffset = 360 * 1
                        local DISTANCE = 30
                        getRoot(LP.Character).CFrame = CFrame.new(HRP.Position.X + math.sin(math.rad(Spin+trueOffset)) *DISTANCE,HRP.Position.Y + 30 ,HRP.Position.Z + math.cos(math.rad(Spin+trueOffset)) * DISTANCE)
                    else
                        DoTween2(NewPos(Mob,Vector3.new(0,40,0)),TweenCondition,nil,TweenSetting)
end
                end
                Floating(true)
                if not NoBringMob then
                    BringMob("Near",Mob)
                end
            end
        end
    end)
    if not getgenv().Setting.Mastery.Camera and LP.CameraMaxZoomDistance <= 1 then
        LP.CameraMaxZoomDistance = 200
        LP.CameraMinZoomDistance = 100
        LP.CameraMinZoomDistance = 0
    end
    if err then 
        print(err)
    end
end
FlagFirstExec = false
local RaceV3Func = {
    Human = function(Hop)                             
        local BossHuman = {"Jeremy","Diamond","Fajita"}
        FlagBoss = true;
        for i,v in pairs(BossHuman) do
            if (Enemies:FindFirstChild(v) and IsAlive(Enemies:FindFirstChild(v))) then
            else
                print(v)
                FlagBoss = false
            end
        end
        if  not FlagFirstExec then --Funcs.AutoRacev3.Hop and
            if FlagBoss then
                FlagFirstExec = true
            elseif getgenv().Setting["Race Evolve"].Hop or Hop then
                print("Sv Hop")
                MainServerHop(5,"Finding Enough Bosses For Human [Race Evolve Hop]")
            end
        end
        for i,v in pairs(BossHuman) do
            local MobToFarm = Enemies:FindFirstChild(v)
            if IsAlive(MobToFarm) then
                SSS(GetNearSpawn(getRoot(MobToFarm).Position))
                while IsAlive(MobToFarm) and task.wait(0.1) do 
                    AttackMob(MobToFarm)
                end
            end
            
        end 
    end,
    Skypiea = function(Hop)
        --print("Calling Function Skypia")
        for i,v in pairs(GetPlayers()) do 
            if v==LP then continue end
            if not (v and v.Character) then continue end
            if (v.Team and not (v.Team.Name == "Pirates" or v.Team.Name == "Marines")) or not v.Team  then continue end
            if v.Data.Race.Value == "Skypiea" then
                local SelectedChar = v.Character
                print("Found")
                if IsAlive(SelectedChar) and not IsInSafeZone(SelectedChar) then
                    print("Is Alive")
                    local dungdi = false
                    if not racvai then
                        racvai = game:GetService("ReplicatedStorage").Remotes.CommE.OnClientEvent:Connect(function(p1,...)
                            if p1=="Notify" then
                                if string.find(...,"Cannot attack players in a Safe Zone") then
                                    racvai:Disconnect()
                                    racvai = nil
                                    dungdi = true
                                end
                                if string.find(...,"Player died recently") then
                                    racvai:Disconnect()
                                    racvai = nil
                                    dungdi = true
                                end
                            end
                        end)
                    end
                    local StartFarmingTick = tick()
                    SSS(GetNearSpawn(getRoot(SelectedChar).Position))
                    print("Attacking")
                    local OldState2 = getgenv().Setting.FastAttack.Enable
                    local Condition = function ()
                        return IsAlive(SelectedChar) and not dungdi and tick() - StartFarmingTick < 90 
                    end
                    while Condition() and task.wait(0.1) do
                        if LP.PlayerGui.Main.PvpDisabled.Visible == true then
                            if not damopvp then
                                damopvp = true
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                                wait(6)
                                damopvp = false
                                        
                            end
                        end
                        pcall(Equip,GetCurrentTool("Melee",true))
                        Floating(true)
                        DoTween2(getRoot(SelectedChar),Condition,nil,{ForceTweenPause=true})
                        Floating(true)
                    end
                    if racvai then
                        racvai:Disconnect()
                        racvai = nil
                    end
                end
            end
        end
        local Start = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1")
        --print("End: "..tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1")))
        --print(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "info"))
        if Start == 2 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
        elseif getgenv().Setting["Race Evolve"].Hop or Hop then
            MainServerHop(5,"Find Player For Angel Race [Race Angel Hop]",8)
        end
        
    end,
    Ghoul = function(Hop)
        --print("Calling Function Skypia")
        for i,v in pairs(GetPlayers()) do 
            if v==LP then continue end
            if not (v and v.Character) then continue end
            if (v.Team and not (v.Team.Name == "Pirates" or v.Team.Name == "Marines")) or not v.Team  then continue end
            local SelectedChar = v.Character
            print("Found")
            if IsAlive(SelectedChar) then
                print("Is Alive")
                local dungdi = false
                if not racvai then
                    racvai = game:GetService("ReplicatedStorage").Remotes.CommE.OnClientEvent:Connect(function(p1,...)
                        if p1=="Notify" then
                            if string.find(...,"Cannot attack players in a Safe Zone") then
                                racvai:Disconnect()
                                racvai = nil
                                dungdi = true
                            end
                            if string.find(...,"Player died recently") then
                                racvai:Disconnect()
                                racvai = nil
                                dungdi = true
                            end
                        end
                    end)
                end
                local StartFarmingTick = tick()
                SSS(GetNearSpawn(getRoot(SelectedChar).Position))
                print("Attacking")
                local Condition = function ()
                    return IsAlive(SelectedChar) and not dungdi and tick() - StartFarmingTick < 90 
                end
                while Condition() and task.wait(0.1) do
                    if LP.PlayerGui.Main.PvpDisabled.Visible == true then
                        if not damopvp then
                            damopvp = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                            wait(6)
                            damopvp = false
                                    
                        end
                    end
                    pcall(Equip,GetCurrentTool("Melee",true))

                    DoTween2(getRoot(SelectedChar),Condition,nil,{ForceTweenPause=true})

                end
                if racvai then
                    racvai:Disconnect()
                    racvai = nil
                end
                
            end
        end
        local Start = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1")
        --print("End: "..tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1")))
        --print(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "info"))
        if Start == 2 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
        end
        
    end,
    Mink = function(Hop)
        local Chests = GetChests()
        ChestCount = 0
        while ChestCount < 30  and task.wait(0.2) do
            if #Chests == 0 then
                Chests = GetChests()
                continue
            end
            local lowestdist = math.huge
            local chest = nil
            for i,v in pairs(Chests) do
                if v then
                    local distance = (v.Position - getRoot(LP.Character).Position).magnitude
                    if distance < lowestdist then
                        lowestdist = distance
                        chest = v
                    end
                end
            end
            if not chest then
                task.wait(0.1)
                continue
            end
            local NearChestTick
            while chest and chest.Parent and #chest:GetChildren() > 1 and task.wait() do
                if GetDistance(chest,LP.Character) <= 10 and not NearChestTick then 
                    NearChestTick = tick()
                end
                if NearChestTick and tick()-NearChestTick>=2 then
                    chest:SetAttribute("LastCollect",tick())
                    break 
                end 
                LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                DoTween2(chest.CFrame)
            end
            --task.wait(2)
            if chest and table.find(Chests,chest) then
                table.remove(Chests,table.find(Chests,chest))
            end
            ChestCount = ChestCount + 1
        end
    end,
    Fishman = function (OneClick)
        local Sea2Funcs = {"StartSeaEvents","SeaBeast","Ship"}
        for i,v in pairs(Sea2Funcs) do
            SeaEventsController[v] = OneClick and "OneClick" or "Race Evolve"
        end
        print("Starting Race Evolve Shark")
        while not IsRaceV3() and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 do
            task.wait(1)
        end
        print("End Race Evolve Shark")
        for i,v in pairs(Sea2Funcs) do
            SeaEventsController[v] = nil
        end
    end,
    Cyborg = function()
        if #FruitFunc.HaveFruitInv() == 0  then 
            FruitFunc.IgnoreStoreFruit = FruitFunc.GetFruitBelow1M()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",FruitFunc.IgnoreStoreFruit)
            
            task.wait(0.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
            
            FruitFunc.IgnoreStoreFruit =nil
        else 
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")

        end
    end
}
HaveHaki = {}
HakiColors = {
    ["Snow White"] = "Oyster",
    ["Winter Sky"] = "Hot pink",
    ["Pure Red"] = "Really red"
}
HakiFunc = {

}
HakiFunc.GetColor = function()
    return getgenv().LocalPlayerInv["AuraSkin"]
end
HakiFunc.CanOpenPad = function()
    if Sea3 then
        local DonePad = {}
        if #game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren() < 4 then 
            return false
            --RenderFunc("HakiPad")
        end
        for i,v in pairs(game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren()) do
            if v:FindFirstChild("TouchInterest") and  tostring(v:FindFirstChild("Part").BrickColor) == "Lime green" then

                DonePad[tostring(v.BrickColor)] = true
            end
        end
        local R = 0
        for i,v in pairs(HakiColors) do
            if DonePad[v]  then
                R = R + 1
            end
        end
        if HaveHaki["Snow White"] and HaveHaki["Winter Sky"] and HaveHaki["Pure Red"] then
            return {[1] = true,[2] = R==3}
        end
        for i,v in pairs(HakiFunc.GetColor()) do
            HaveHaki[v.DisplayName] = true
            
        end
        local CNT = 0
        local R = 0
        for i,v in pairs(HakiColors) do
            if DonePad[v]  then
                R = R + 1
            end
            if DonePad[v] or HaveHaki[i] then
                CNT= CNT + 1
            end
        end
        return {[1] = CNT == 3,[2] = R==3}
        --1: Haki Color
        --2: Pad Opened
    end
end

function HaveAllHaki()
    for i,v in pairs(getgenv().LocalPlayerInv.AuraSkin) do
        HaveHaki[v.DisplayName] = true
        
    end
    return HaveHaki["Snow White"] and HaveHaki["Winter Sky"] and HaveHaki["Pure Red"]
end
OpenPad = LPH_JIT_MAX(function ()
    local Attempt = 0
    print("Called ")
    if Sea3 then
        if HakiFunc.CanOpenPad() and HakiFunc.CanOpenPad()[1] and not HakiFunc.CanOpenPad()[2] then
            print("In Called Open Pad")
            while Attempt<5 and HakiFunc.CanOpenPad() and not HakiFunc.CanOpenPad()[2] and task.wait(0.1) do

                Attempt=Attempt+1
                local a,b = pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren()) do
                        if v:FindFirstChild("TouchInterest") and  tostring(v:FindFirstChild("Part").BrickColor) ~= "Lime green" then
                            local FindIndex
                            for i2,v2 in pairs(HakiColors) do
                                if v2==tostring(v.BrickColor) then
                                    FindIndex = i2
                                end
                            end
                            local args = {
                                {
                                    StorageName = FindIndex,
                                    Type = "AuraSkin",
                                    Context = "Equip"
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF"):InvokeServer(unpack(args))
                            
                            TpNearestEntrance(v.Position)
                            DoTween2(v.CFrame+Vector3.new(0,2,0))
                            
                            task.wait(0.5)
                        end
                    end
                end)
                if b then
                    print("Errored Open pad", b)
                end
            end
           -- print("Stopped")
        end
    end
end)


WorkingFarm = PriorityQueue.thieunangquatroi()
local CasualFarm = PriorityQueue.thieunangquatroi()
function isMinuteZero(timeString)
    if string.find(timeString, ":") then
        local colonIndex1, colonIndex2 = string.find(timeString, ":"), string.find(timeString, ":", string.find(timeString, ":") + 1)
        local minute = string.sub(timeString, colonIndex1 + 1, colonIndex2 - 1)
        return minute == "00" or minute == "01"
    else 
        return true
    end
end
function IsPresentTime()
    return game:GetService("Workspace"):FindFirstChild("Countdown") and isMinuteZero(game:GetService("Workspace").Countdown.SurfaceGui.TextLabel.Text)
end
function CanGetFlower()
    return (game.Workspace:FindFirstChild("Flower1").Transparency ~= 1 and not CheckItem("Flower 1")) or not CheckItem("Flower 2") or not CheckItem("Flower 3")
end
function V3Requirement()
    local Race = LP.Data.Race.Value
end
function GetMirageSnipeFruit()
    if Sea3 and  MirageFunctions.GetMirageIsland() and getgenv().Setting.Fruit.EnableSnipeFruit and #getgenv().Setting.Fruit.FruitsToSnipe > 0 and not table.find(getgenv().Setting.Fruit.FruitsToSnipe,LP.Data.DevilFruit.Value) and getgenv().Setting["Mirage Snipe Fruit"].Enable  then
        local CurTable = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits",true)
        if CurTable then
            for i, v in pairs(CurTable) do
                if v.OnSale and table.find(getgenv().Setting.Fruit.FruitsToSnipe ,v.Name) then

                    return v.Name
                    
                end
            end
        end
    end
end
function Sea2KeyHop() -- For Water Key/ Library Key
    if getgenv().Setting.OneClick.Sea2KeyHop and Sea2 and GetLevel() >= 1500 then
        if  WorkingFarm:empty() then
            if (not DataSave.Unlocked.Deathstep and not CheckEnemySpawn("Awakened Ice Admiral") ) or (not DataSave.Unlocked.Sharkman and not CheckEnemySpawn("Tide Keeper"))then
                return true
                
            end
        end
    end
end
function X2Exp()
    return ((getrenv()._G and getrenv()._G.ServerData and getrenv()._G.ServerData.ExpBoost ~= 0) or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Exp.Text,"2x")) and GetLevel() ~= CurrentMaxLv
end
local Dimensions = {
    Hell = function()
        return game:GetService("Workspace").Map:FindFirstChild("HellDimension") and game:GetService("Workspace").Map:FindFirstChild("HellDimension"):FindFirstChild("ActivePlayers") 
        and game:GetService("Workspace").Map:FindFirstChild("HellDimension"):FindFirstChild("ActivePlayers"):FindFirstChild("Value") and 
        LP.Name == tostring(game:GetService("Workspace").Map:FindFirstChild("HellDimension"):FindFirstChild("ActivePlayers"):FindFirstChild("Value").Value)
    end,
    Heaven = function()
        return game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") and game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension"):FindFirstChild("ActivePlayers") 
        and game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension"):FindFirstChild("ActivePlayers"):FindFirstChild("Value") and 
        LP.Name == tostring(game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension"):FindFirstChild("ActivePlayers"):FindFirstChild("Value").Value)
    end
}

local CDKIntilize = {
    LastUse = tick(),
}
CDKIntilize.Good = function()
    if tick()-CDKIntilize.LastUse>=1 then
        CDKIntilize.LastUse = tick()
        local args = {
            [1] = "CDKQuest",
            [2] = "OpenDoor"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
    end
end
CDKIntilize.Evil = function()
    if tick()-CDKIntilize.LastUse>=1 then
        CDKIntilize.LastUse = tick()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
        task.wait(1)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")        
    end

end
CDKIntilize.GetMob = function()
    local NearestMob;
    local NearestDist = math.huge
    for i, v in pairs(Enemies:GetChildren()) do
        if getRoot(v) and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
            if (getRoot(v).Position-getRoot(LP.Character).Position).magnitude <= 3000 then
                if (getRoot(v).Position-getRoot(LP.Character).Position).magnitude < NearestDist then
                    NearestDist = (getRoot(v).Position-getRoot(LP.Character).Position).magnitude
                    NearestMob = v
                end
            end
        end
    end
    return NearestMob
end

CDKIntilize.GetHaze = function()
    local MobToFarm
    local SmallestDistance = math.huge
    for i,v in pairs(Enemies:GetChildren()) do
        if Alive() and IsAlive(v) and v.Parent == Enemies  and v:FindFirstChild("HazeESP")  then
            if SmallestDistance > (getRoot(v).Position-getRoot(LP.Character).Position).magnitude then
                SmallestDistance = (getRoot(v).Position-getRoot(LP.Character).Position).magnitude
                MobToFarm = v
            end
        end
    end   
    for i,v in pairs(getnilinstances()) do
        if Alive() and IsAlive(v) and v:FindFirstChild("HazeESP")  then
            if SmallestDistance > (getRoot(v).Position-getRoot(LP.Character).Position).magnitude then
                SmallestDistance = (getRoot(v).Position-getRoot(LP.Character).Position).magnitude
                MobToFarm = v
            end
        end
    end 
    return MobToFarm
end
local function TPToSafeZone()
    if Sea3 then 
        DoTween2(CFrame.new(-5026.3584, 323.515503, -2996.28442))
    elseif Sea2 then
        DoTween2(CFrame.new(-384.03524780273, 73.020072937012, 353.2282409668))
    end
end
local function UnStoreFruit(Name)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",Name)

end
local function GetFruitPart(v)
    if v:FindFirstChild("RootPart") then
        return v:FindFirstChild("RootPart")
    end
    if v:FindFirstChild("Handle") then
        return v:FindFirstChild("Handle")
    end
end 
local function GetNearestFruit()
    local near,dist = nil, 999999 
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
        if v:IsA("Tool") or string.find(v.Name,"Fruit") then 
            if Alive() and v.Parent and v.Parent == game:GetService("Workspace") then 
                if string.find(v.Name,"Fruit") then
                    if v:FindFirstChild("Fruit") then 
                        v=v.Fruit
                    else
                        continue
                    end
                    
                end
                if GetFruitPart(v) then

                    local GetDist = GetDistance(GetFruitPart(v),LP.Character)
                    if GetDist <= dist then
                        dist = GetDist
                        near = v
                    end
                end
            end
        end
    end
    return near
end
local function EatCurrentFruit(Name)
    pcall(function()
        UnStoreFruit(Name)
        task.wait()
        local Fruit 
    
        for i,v in pairs(LP.Backpack:GetChildren()) do 
            if v:GetAttribute("OriginalName") == Name then
                Fruit = v
            end 
        end
        for i,v in pairs(LP.Character:GetChildren()) do 
            if v:GetAttribute("OriginalName") == Name then
                Fruit = v
            end 
        end
        Fruit.Parent = game.Players.LocalPlayer.Character
        Fruit.EatRemote:InvokeServer()
    end)

end
local function CheckSnipeFruit()
    local ListFruit = getgenv().OneClickSetting and getgenv().OneClickSetting.FruitEat or {}
    if #ListFruit == 0 then
        return false 
    end
    local AlreadyHaveCurrentFruit
    local CurrentFruitSales = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits",false)
    local CurrentMirageFruitSales = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits",true)

    local ListPriority = {}
    for i,v in pairs(ListFruit) do 
        table.insert(ListPriority,i)
    end
    table.sort(ListPriority,function(a,b)
        return a > b
    end)
    for _,n in pairs(ListPriority) do 
        for i,v in pairs(ListFruit[n]) do 
            if LP.Data.DevilFruit.Value == v then
                AlreadyHaveCurrentFruit = true
            end
            if AlreadyHaveCurrentFruit then
                break 
            end
        end
        if AlreadyHaveCurrentFruit then
            break 
        end
        for i,v in pairs(ListFruit[n]) do 
            for _,tbl in pairs(CurrentFruitSales) do 
                if tbl.Name == v and tbl.OnSale then
                    if LP.Data.Beli.Value >= tbl.Price then
                        return v, "Normal"
                    end
                    
                end
            end
            
            
        end
        for i,v in pairs(ListFruit[n]) do 
            for _,tbl in pairs(CurrentMirageFruitSales) do 
                if tbl.Name == v and tbl.OnSale then
                    if LP.Data.Beli.Value >= tbl.Price then
                        return v, "Mirage"
                    end
                end
            end
            
            
        end
    end
    return false

end
local function CheckEatAble()
    local ListFruit = getgenv().OneClickSetting and getgenv().OneClickSetting.FruitEat or {}
    if #ListFruit == 0 then
        return false 
    end
    local AlreadyHaveCurrentFruit
    local CurrentFruitStorage = getgenv().LocalPlayerInv["Blox Fruit"]
    local ListPriority = {}
    for i,v in pairs(ListFruit) do 
        table.insert(ListPriority,i)
    end
    table.sort(ListPriority,function(a,b)
        return a > b
    end)
    for _,n in pairs(ListPriority) do 
        for i,v in pairs(ListFruit[n]) do 
            if LP.Data.DevilFruit.Value == v then
                AlreadyHaveCurrentFruit = true
            end
            if AlreadyHaveCurrentFruit then
                break 
            end
        end
        if AlreadyHaveCurrentFruit then
            break 
        end
        for i,v in pairs(ListFruit[n]) do 
            for _,tbl in pairs(CurrentFruitStorage) do 
                if tbl.Name == v then
                    return v
                    
                end
            end
            
            
        end
    end
    return false

end
local ListSword_Boss = {
    ["Pilot Helmet"] = "Stone", 
    ["Serpent Bow"] = "Island Empress" ,
    ["Lei"] = "Kilo Admiral",
    ["Twin Hook"] = "Captain Elephant",
    ["Canvander"] = "Beautiful Pirate",
    ["Buddy Sword"] = "Cake Queen",
}
local StateItems_Boss  = {
    
}
local ListItemsBoss = {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Cake Queen"}--"Beautiful Pirate"
local function UpdateStateBoss(Name)
    for i,v in pairs(ListSword_Boss) do 
        if v == Name then
            print("State Items Boss: ",Name, CheckInvItem(i) )
            StateItems_Boss[Name] = CheckInvItem(i) 
        end
    end
    return StateItems_Boss[Name]
end
local MultiTrialManager = {}
MultiTrialManager.Group = {} --Player Name
MultiTrialManager.Main = ""
MultiTrialManager.Ready = {}
local function MultiTrial_AllSet()
    if #MultiTrialManager.Group == 3 then 
        for i,v in pairs(MultiTrialManager.Group) do 
            if not MultiTrialManager.Ready[v] then
                print(v, "Not Ready")
                return false
            end
        end
        return true
    end
end
local charsMap = {"\1", "\2", "\3", "\4", "\5", "\6", "\7", "\8", "\9", "\10", "\11", "\12", "\13", "\14", "\15", "\16", "\17", "\18", "\19", "\20", "\21", "\22", "\23", "\24", "\25", "\26", "\27", "\28", "\29", "\30", "\31", "\32", "\33", "\34", "\35", "\36", "\37", "\38", "\39", "\40", "\41", "\42", "\43", "\44", "\45", "\46", "\47", "\48", "\49", "\50", "\51", "\52", "\53", "\54", "\55", "\56", "\57", "\58", "\59", "\60", "\61", "\62", "\63", "\64", "\65", "\66", "\67", "\68", "\69", "\70", "\71", "\72", "\73", "\74", "\75", "\76", "\77", "\78", "\79", "\80", "\81", "\82", "\83", "\84", "\85", "\86", "\87", "\88", "\89", "\90", "\91", "\92", "\93", "\94", "\95", "\96", "\97", "\98", "\99", "\100", "\101", "\102", "\103", "\104", "\105", "\106", "\107", "\108", "\109", "\110", "\111", "\112", "\113", "\114", "\115", "\116", "\117", "\118", "\119", "\120", "\121", "\122", "\123", "\124", "\125", "\126", "\127", "\128", "\129", "\130", "\131", "\132", "\133", "\134", "\135", "\136", "\137", "\138", "\139", "\140", "\141", "\142", "\143", "\144", "\145", "\146", "\147", "\148", "\149", "\150", "\151", "\152", "\153", "\154", "\155", "\156", "\157", "\158", "\159", "\160", "\161", "\162", "\163", "\164", "\165", "\166", "\167", "\168", "\169", "\170", "\171", "\172", "\173", "\174", "\175", "\176", "\177", "\178", "\179", "\180", "\181", "\182", "\183", "\184", "\185", "\186", "\187", "\188", "\189", "\190", "\191", "\192", "\193", "\194", "\195", "\196", "\197", "\198", "\199", "\200", "\201", "\202", "\203", "\204", "\205", "\206", "\207", "\208", "\209", "\210", "\211", "\212", "\213", "\214", "\215", "\216", "\217", "\218", "\219", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\228", "\229", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\238", "\239", "\240", "\241", "\242", "\243", "\244", "\245", "\246", "\247", "\248", "\249", "\250", "\251", "\252", "\253", "\254", "\255"}
charsMap[0] = "\0"
local function safe_string_char(...)
    local res = ""
    local tbl = {...}
    for i=1,#tbl do
        res = res .. charsMap[tbl[i]]
    end
    return res
end
function MultiTrial_SetAccount()
    print("Set account Trial")
    local Accounts  ={}
    for i,v in pairs(MultiTrialManager.Group) do 
        if v == LP.Name then
            continue 
        end
        table.insert(Accounts,v)
    end
    print("Set: ", Accounts[1], Accounts[2])
    getgenv().Setting["TrialTeam"].TrialPlayer1 = Accounts[1]
    getgenv().Setting["TrialTeam"].TrialPlayer2 = Accounts[2]
end
--[[
spawn(function()
    if not LPH_OBFUSCATED then 
        local function NotifyUse(Title,Text,Duration)
            pcall(function()
                StarterGui:SetCore("SendNotification", {
                    Title = Title,
                    Text = Text,
                    Duration = Duration,
                })
        end)
        end
        local function SendRaceV4()
            local HTTPS = game:GetService("HttpService")
            local LP = game.Players.LocalPlayer
            local DataC = game.Players.LocalPlayer.Data
            local Level = tostring(DataC.Level.Value)
            local Beli = tostring(DataC.Beli.Value)
            local Fragment = tostring(DataC.Fragments.Value)
            local Returned = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
            while not Returned do 
                task.wait(1)
                Returned = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
            end
            local OriginalRace = tostring(LP.Data.Race.Value)
            local Race = OriginalRace .. "[%s]"
            
            local Melee = ""
            local WeakMelee = {"BlackLeg","Electro","FishmanKarate"}
            local AllMelee = {"Superhuman","SharkmanKarate","DeathStep","ElectricClaw","Godhuman","DragonTalon","SanguineArt"}
            local MeleeString = "%s / 6"
            local dem = 0
            local CurrentSea = (Sea1 and "1") or  (Sea2 and "2") or  (Sea3 and "3")
            for i,v in pairs(AllMelee) do
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy"..v,true) == 1  then
                    dem = dem +1
                end
            end
            if dem == 7 then
                MeleeString = "Sanguine Art"
            elseif dem == 6 then
                MeleeString = "God Human"
            else
                MeleeString = MeleeString:format(tostring(dem))
            end
            
            local SkillsV3Name ={
                ["Mink"] = "Agility",
                ["Skypiea"] = "Heavenly Blood",
                ["Ghoul"] = "Heightened Senses",
                ["Fishman"] = "Water Body",
                ["Cyborg"] = "Energy Core",
                ["Human"] = "Last Resort"
            }
            LP = game.Players.LocalPlayer
            Type = ""
            local function CheckRaceV3()
                for i,v in pairs(LP.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == Type and v.Name == SkillsV3Name[LP.Data.Race.Value] then
                        return true
                        
                    end
                end
                for i,v in pairs(LP.Character:GetChildren()) do
                    if v:IsA("Tool") and v.ToolTip == Type and v.Name == SkillsV3Name[LP.Data.Race.Value] then
                        return true
                    end
                end
            end
            if CheckRaceV3() then
                Race = Race:format("V3")
            elseif  LP.Data.Race:FindFirstChild("Evolved") then
                Race = Race:format("V2")
            else
                Race = Race:format("V1")
            end
            Melee = string.sub(Melee,1,#Melee> 2 and #Melee-2 or 1)
            local function GetAwaken()
                return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
             end
            local AwakenStr = ""
            local Order = {"Z","X","C","V","F","TAP"}
            local CheckAwaken = GetAwaken()
            if not CheckAwaken then
                AwakenStr = "Can't Awaken"
            else
                for i,v in pairs(Order) do
                    if CheckAwaken[v] and CheckAwaken[v].Awakened then
                        AwakenStr = AwakenStr .. v  ..  ", "
                    end
                end
            
            end
            local Arr = {
                Sword = {},
                Material = {},
                ["Blox Fruit"] = {},
                Wear = {},
                Gun = {},
            }
            local Arr2 = {
                Sword = {},
                Material = {},
                ["Blox Fruit"] = {},
                Wear = {},
                Gun = {},
            }
            local MythicalFruit = {}
            for i,v in pairs(Returned) do
                if Arr[v.Type] then
                    table.insert(Arr[v.Type],v)
                end
            end
            local MythicalWeapon = {}
            local Rarities = {3,2,1,0}
            for i,v in pairs(Arr) do
                if i=="Material" or i == "Blox Fruit" then
                    continue
                end
                for i2,v2 in pairs(v) do
                    local Marked = false
                    for i3,v3 in pairs(Rarities) do
                        if v2.Rarity == v3 then
                            table.insert(Arr2[i],v2.Name)
                            Marked=true
                        end
                    end
                    if Marked then
                        continue
                    end
                    table.insert(MythicalWeapon,v2.Name)
            
                end
            end
            Rarities = {4,3,2,1,0}
            
            for i,v in pairs(Arr) do
                if i~="Material" and i ~= "Blox Fruit" then
                    continue
                end
                for i2,v2 in pairs(v) do
                    for i3,v3 in pairs(Rarities) do
            
                        if v2.Rarity == v3 then
                            table.insert(Arr2[i],v2.Name)
                        end
                    end
                    if v2.Rarity ==4 and i == "Blox Fruit"  then 
                        table.insert(MythicalFruit,v2.Name)
                    end
                end
            end
            local MythicalIns = ""
            local SwordIns = ""
            local MaterialIns = ""
            local FruitIns = ""
            local WearIns = ""
            local GunIns = ""
            local MythicalFruitIns = ""
            for i,v in pairs(MythicalWeapon) do
                MythicalIns = MythicalIns..v..", "
            end
            for i,v in pairs(MythicalFruit) do
                MythicalFruitIns = MythicalFruitIns..v..", "
            end
            for i,v in pairs(Arr2["Sword"]) do
                SwordIns = SwordIns..v..", "
            end
            for i,v in pairs(Arr2["Material"]) do
                MaterialIns = MaterialIns..v..", "
            end
            for i,v in pairs(Arr2["Blox Fruit"]) do
                FruitIns = FruitIns..v..", "
            end
            for i,v in pairs(Arr2["Wear"]) do
                WearIns = WearIns..v..", "
            end
            for i,v in pairs(Arr2["Gun"]) do
                GunIns = GunIns..v..", "
            end
            SwordIns = string.sub(SwordIns,1,#SwordIns-2)
            
            
            local MiscInfoTable = {}
            local miscinfo = ""
            local Curstate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Check") 
            if Curstate == 4 then 
                table.insert(MiscInfoTable,"Unlocked Entrance")
            end
            if string.find(MaterialIns,"Mirror Fractal") then 
                table.insert(MiscInfoTable,"Mirror Fractal")
            end
            if string.find(WearIns,"Valkyrie Helm") then 
                table.insert(MiscInfoTable,"Valkyrie Helm")
            end
            for i,v in pairs(MiscInfoTable) do
                miscinfo = miscinfo..v..", "
            end
            
            
            Status = StatusFarming .. "[%s]"
            Status=Status:format(tostring(StatusFarming2))
            function bxor(a, b)
                local result = 0
                local bitval = 1
                while a > 0 and b > 0 do
                    local aOdd = a % 2 == 1
                    local bOdd = b % 2 == 1
                    if aOdd ~= bOdd then
                        result = result + bitval
                    end
                    a = math.floor(a / 2)
                    b = math.floor(b / 2)
                    bitval = bitval * 2
                end
                result = result + (a + b) * bitval
                return result
            end
    
            function stringtonumber(str)
                local encoded = ""
                for i = 1, #str do
                    local ascii = string.byte(str, i)
                    encoded = encoded .. string.format("%03d", ascii)
                end
                return encoded
            end
            function numbertostring(num)
                local str = tostring(num)
                local decoded = ""
                for i = 1, #str, 3 do
                    local ascii = tonumber(str:sub(i, i+2))
                    decoded = decoded .. safe_string_char(ascii)
                end
                return decoded
            end
            function xorEncryptDecrypt(input, key)
                local output = {}
                for i = 1, #input do
                    local byte = bxor(string.byte(input, i), string.byte(key, (i - 1) % #key + 1))
                    table.insert(output, safe_string_char(byte))
                end
                return table.concat(output)
            end
            local function mqs(data)
                local qs = ''
                for k, v in pairs(data) do
                    qs = qs .. k .. '=' .. v .. '&'
                end
                return qs:sub(1, #qs-1)
            end
            local function shiftString(inputString, shiftAmount)
                local shiftedString = ""
                for i = 1, #inputString do
                    local charCode = string.byte(inputString, i)
                    if charCode >= 65 and charCode <= 90 then  -- Uppercase letters
                        charCode = (charCode - 65 + shiftAmount) % 26 + 65
                    elseif charCode >= 97 and charCode <= 122 then  -- Lowercase letters
                        charCode = (charCode - 97 + shiftAmount) % 26 + 97
                    end
                    shiftedString = shiftedString .. safe_string_char(charCode)
                end
                return shiftedString
            end
            local function generateRandomLikeString()
                local rawString = tostring({}) .. tostring(function() end)
                
                local numbers = {}
                for num in rawString:gmatch("%d+") do
                    table.insert(numbers, num)
                end
                
                local letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'}
                local result = ""
                local letterIndex = 1
                
                for _, num in ipairs(numbers) do
                    for i = 1, #num do
                        result = result .. num:sub(i, i)
                        if letterIndex <= #letters then
                            result = result .. letters[letterIndex]
                            letterIndex = letterIndex + 1
                            if letterIndex > #letters then
                                letterIndex = 1 -- Reset index to cycle through letters again
                            end
                        end
                    end
                end
                
                return result
            end
            local function generateRandomLikeStringV2()
                local rawString = tostring({}) .. tostring(function() end) .. tostring(game:GetService("HttpService"):GenerateGUID(false)) .. tostring(math.random()) .. tostring(os.clock())..tostring(game.Workspace.DistributedGameTime)
                
                local numbers = {}
                for num in rawString:gmatch("%d+") do
                    table.insert(numbers, num)
                end
                
                local letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
                local result = ""
                
                for _, num in ipairs(numbers) do
                    for i = 1, #num do
                        result = result .. num:sub(i, i)
                        result = result .. letters[math.random(#letters)]
                    end
                end
                
                local shuffledResult = {}
                for i = 1, #result do
                    table.insert(shuffledResult, result:sub(i,i))
                end
                
                for i = #shuffledResult, 2, -1 do
                    local j = math.random(i)
                    shuffledResult[i], shuffledResult[j] = shuffledResult[j], shuffledResult[i]
                end
                
                return table.concat(shuffledResult)
            end
            local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- You will need this for encoding/decoding
            -- encoding
            function enc(data)
                return ((data:gsub('.', function(x) 
                    local r,b='',x:byte()
                    for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
                    return r;
                end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
                    if (#x < 6) then return '' end
                    local c=0
                    for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
                    return b:sub(c+1,c+1)
                end)..({ '', '==', '=' })[#data%3+1])
            end
            -- decoding
            function dec(data)
                data = string.gsub(data, '[^'..b..'=]', '')
                return (data:gsub('.', function(x)
                    if (x == '=') then return '' end
                    local r,f='',(b:find(x)-1)
                    for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
                    return r;
                end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
                    if (#x ~= 8) then return '' end
                    local c=0
                    for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
                        return safe_string_char(c)
                end))
            end
            
            local clientPublic = generateRandomLikeStringV2()
            local ClientPrivate = shiftString("DitConMeMayNhinNhinCaiLonOcCacCutMeDi12312312313097473@@@", 1)
            local Data = {
                ["Client"] = clientPublic,
                ["Username"] = game.Players.LocalPlayer.Name,
                ["Discord"] = LRM_LinkedDiscordID or "None"
            }
            local response = request{
                Url = "https://thetakenisland.xyz/api/script/DebugMode.php",
                Method = "POST",
                headers = {
                    ["Content-Type"] = "application/x-www-form-urlencoded",
                },
                Body = mqs(Data),
            }
            local serverPublic = HTTPS:JSONDecode(response.Body).Server
            local sharedSecret = enc(xorEncryptDecrypt(clientPublic, serverPublic))
            local message = "Hello from Lua!"
            function EncryptAndToHex(str,key)
                str = xorEncryptDecrypt(str, key)
                str = str:gsub('.', function(c)
                    return string.format('%02X', string.byte(c))
                end)
                return str
            end
            --print(sharedSecret..ClientPrivate)
            function EncryptTable(Tbl,IgnoreIndex)
                local IgnoreIndex = IgnoreIndex or {}
                for i,v in pairs(Tbl) do 
                    if not table.find(IgnoreIndex,i) then 
                        Tbl[i]= EncryptAndToHex(v,sharedSecret..ClientPrivate)
                    end
                end
            end
            function AddData(Tbl)
                Tbl["Message"] = message
                Tbl["sharedSecret"] = stringtonumber(sharedSecret)
                Tbl["JobId"] = game.JobId
                Tbl["Username"] = game.Players.LocalPlayer.Name
                Tbl["TimeStamp"]= tostring(os.time())
                Tbl["Discord"] = LRM_LinkedDiscordID or "680712584286044182"
            end

            local args = {
                [1] = "UpgradeRace",
                [2] = "Check"
            }
            
            local a,b,c = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local CheckFullMoon = function()
                local MoonCheck = game:GetService("Lighting"):GetAttribute("MoonPhase")
            
                
                local LastDigit = tonumber(string.sub(tostring(MoonCheck),#tostring(MoonCheck)));
                return LastDigit == 5
            end
            local Data = {
                Username=LP.Name,
                level=Level,
                beli=Beli,
                fragment=Fragment,
                bounty= tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value),
                sea=CurrentSea,
                melee=MeleeString,
                mythicalweapon = MythicalIns,
                mythicalfruit = MythicalFruitIns,
                sword=SwordIns,
                gun=GunIns,
                wear=WearIns,
                dfstored=FruitIns,
                miscinfo=miscinfo,
                dfs=DataC.DevilFruit.Value == "" and "Fruitless" or DataC.DevilFruit.Value,
                Awaken = AwakenStr,
                CheckSum = "DitMeMaySpamDi?",
                Status =Status,
                Traffic = "Race V4 Manager",
                Race=OriginalRace,
                Tier=tostring(b),
                Ready = tostring(a ==0 or a == 5), 
                JobId=game.JobId,
                FullMoon=tostring(CheckFullMoon()),
            }
            AddData(Data)
            EncryptTable(Data,{"sharedSecret"})
            response = request{
                Url = "https://thetakenisland.xyz/api/script/DebugMode.php",
                Method = "POST",
                headers = {
                    ["Content-Type"] = "application/x-www-form-urlencoded",
                },
                Body = mqs(Data),
            }
            table.foreach(response,print)
            
            return  HTTPS:JSONDecode(response.Body)

        end
        local function R_Again()
            while true do
                local Body = SendRaceV4()
                NotifyUse("Account Ready",Body.Ready,10)
                NotifyUse("JobId",Body.JobId,10)
                NotifyUse("Main Account",Body.Main,10)
                local TotalAccount = {}
                for i,v in pairs(Body.Accounts or {}) do 
                    if v.Username then 
                        if game.Players:FindFirstChild(v.Username) then 
                            table.insert(TotalAccount,v.Username)
                        end
                    end
                end
                if #TotalAccount == 3 then 
                    MultiTrialManager.Main = Body.Main
                    MultiTrialManager.Group = TotalAccount
                    break
                end
                if Body.JobId ~= "Not Found" then
                    if game.JobId ~= Body.JobId then 
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",Body.JobId)
                
                    end
                end
                task.wait(60)
            end
        end
        while task.wait(1) do 
            R_Again()
            while CheckMoon() == "Full Moon OMG" do
                task.wait(1) 
            end
        end
    end
end)]]
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local SC_UI_Name = "Geta Bi Thieu Nang"
local existingUI = game:GetService("CoreGui"):FindFirstChild(SC_UI_Name)

local ScreenGui = Instance.new("ScreenGui")

if existingUI then
    existingUI:Destroy()
end

function Tween(object,time,easingstyle,easingdirection,properties)
    return TweenService:Create(object,TweenInfo.new(time, easingstyle, easingdirection),properties)
end

ScreenGui.Name = SC_UI_Name
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local NotificationContainer_1 = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local ImageAssets = {
    NotifyDetail = "rbxassetid://14184951412",
    NotifyIcon = "rbxassetid://3926307971",
    NotifyPaimon = "rbxassetid://14480278865", 
}

NotificationContainer_1.Name = "NotificationContainer_1"
NotificationContainer_1.Parent = ScreenGui
NotificationContainer_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationContainer_1.BackgroundTransparency = 1.000
NotificationContainer_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
NotificationContainer_1.BorderSizePixel = 0
NotificationContainer_1.Position = UDim2.new(1, 0, 0, 0)
NotificationContainer_1.Size = UDim2.new(0, 0, 0.970000029, 0)

UIListLayout_3.Parent = NotificationContainer_1
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout_3.Padding = UDim.new(0, 30)

function Notify(Configs)
    local Notify = Instance.new("Frame")
    local Notify2 = Instance.new("Frame")
    local NotifyText = Instance.new("TextLabel")
    local NotifyDetail = Instance.new("ImageLabel")
    local NotifyIcon = Instance.new("ImageButton")
    local NotifyIconFrame = Instance.new("Frame")
    local NotifyIcon2 = Instance.new("TextLabel")
    local NotifyDelayFrame1 = Instance.new("Frame")
    local NotifyDelayFrame2 = Instance.new("Frame")
    local UIStroke = Instance.new("UIStroke")
    local NotifyImage = Instance.new("ImageLabel")

    Notify.Name = "Notify"
    Notify.Parent = NotificationContainer_1
    Notify.BackgroundColor3 = Color3.fromRGB(15, 15, 14)
    Notify.BackgroundTransparency = 0.350
    Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Notify.BorderSizePixel = 0
    Notify.BackgroundTransparency = 1
    Notify.Size = UDim2.new(0, 110, 0, 45)

    UIStroke.Parent = NotifyIconFrame
    UIStroke.ApplyStrokeMode = "Border"
    UIStroke.Thickness = 2
    UIStroke.Color = Color3.fromRGB(236, 229, 216)
    UIStroke.Enabled = false

    Notify2.Name = "Notify2"
    Notify2.Parent = Notify
    Notify2.BackgroundColor3 = Color3.fromRGB(15, 15, 14)
    Notify2.BackgroundTransparency = 0.350
    Notify2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Notify2.BorderSizePixel = 0
    Notify2.Position = UDim2.new(3, -110, 0, 0)
    Notify2.Size = UDim2.new(1, 0, 1, 0)

    NotifyText.Name = "NotifyText"
    NotifyText.Parent = Notify2
    NotifyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyText.BackgroundTransparency = 1.000
    NotifyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyText.BorderSizePixel = 0
    NotifyText.Position = UDim2.new(0, 75, 0.200000003, 0)
    NotifyText.Size = UDim2.new(1, -110, 0.600000024, 0)
    NotifyText.Font = Enum.Font.Fantasy
    NotifyText.RichText = true
    NotifyText.Text = "<b>"..Configs.Text.."</b>"
    NotifyText.TextColor3 = Color3.fromRGB(236, 229, 216)
    NotifyText.TextSize = 22
    NotifyText.TextWrapped = true
    NotifyText.TextXAlignment = Enum.TextXAlignment.Left

    NotifyDetail.Name = "NotifyDetail"
    NotifyDetail.Parent = Notify2
    NotifyDetail.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyDetail.BackgroundTransparency = 1.000
    NotifyDetail.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyDetail.BorderSizePixel = 0
    NotifyDetail.Position = UDim2.new(0, -25, 0, 0)
    NotifyDetail.Size = UDim2.new(0, 25, 1, 0)
    NotifyDetail.Image = ImageAssets.NotifyDetail
    NotifyDetail.ImageColor3 = Color3.fromRGB(15, 15, 14)
    NotifyDetail.ImageTransparency = 0.350

    NotifyIcon.Name = "NotifyIcon"
    NotifyIcon.Parent = Notify2
    NotifyIcon.BackgroundTransparency = 1.000
    NotifyIcon.LayoutOrder = 9
    NotifyIcon.Position = UDim2.new(1, -30, 0.218999997, 0)
    NotifyIcon.Size = UDim2.new(0, 20, 0, 25)
    NotifyIcon.ZIndex = 3
    NotifyIcon.Image = ImageAssets.NotifyIcon
    NotifyIcon.ImageColor3 = Color3.fromRGB(236, 229, 216)
    NotifyIcon.ImageRectOffset = Vector2.new(764, 244)
    NotifyIcon.ImageRectSize = Vector2.new(36, 36)

    NotifyIconFrame.Name = "NotifyIconFrame"
    NotifyIconFrame.Parent = Notify2
    NotifyIconFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyIconFrame.BackgroundTransparency = 0.550
    NotifyIconFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyIconFrame.BorderSizePixel = 0
    NotifyIconFrame.Position = UDim2.new(0, 10, 0, -5)
    NotifyIconFrame.Rotation = 45.000
    NotifyIconFrame.Size = UDim2.new(0, 50, 0, 50)

    NotifyImage.Name = "NotifyImage"
    NotifyImage.Parent = NotifyIconFrame
    NotifyImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyImage.BackgroundTransparency = 1.000
    NotifyImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyImage.BorderSizePixel = 0
    NotifyImage.Position = UDim2.new(-0.1, -1, -0.1, -1)
    NotifyImage.Rotation = -45.000
    NotifyImage.Size = UDim2.new(1.2, 2, 1.2, 2)
    NotifyImage.Image = ImageAssets.NotifyPaimon
    if getgenv().Setting.Notify and getgenv().Setting.Notify.CustomIcon then
        NotifyImage.Image = getasset(IconFolder.."/"..getgenv().Setting.Notify.Image)
    end
    NotifyImage.Visible = false

    NotifyIcon2.Name = "NotifyIcon2"
    NotifyIcon2.Parent = NotifyIconFrame
    NotifyIcon2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyIcon2.BackgroundTransparency = 1.000
    NotifyIcon2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyIcon2.BorderSizePixel = 0
    NotifyIcon2.Rotation = -45.000
    NotifyIcon2.Size = UDim2.new(1, 0, 1, 0)
    NotifyIcon2.Font = Enum.Font.FredokaOne
    NotifyIcon2.Text = "!"
    NotifyIcon2.TextColor3 = Color3.fromRGB(255, 74, 74)
    NotifyIcon2.TextScaled = true
    NotifyIcon2.TextSize = 14.000
    NotifyIcon2.TextWrapped = true
    NotifyIcon2.Visible = false

    if Configs.Type2 == "Paimon" then
        NotifyImage.Visible = true
        UIStroke.Enabled = true
        NotifyIconFrame.BackgroundColor3 = Color3.fromRGB(159, 154, 145)
        NotifyIconFrame.Transparency = 0
    else
        NotifyIcon2.Visible = true
    end

    NotifyDelayFrame1.Name = "NotifyDelayFrame1"
    NotifyDelayFrame1.Parent = Notify2
    NotifyDelayFrame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyDelayFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyDelayFrame1.BorderSizePixel = 0
    NotifyDelayFrame1.BackgroundTransparency = 1
    NotifyDelayFrame1.Position = UDim2.new(0, 45, 1, -2)
    NotifyDelayFrame1.Size = UDim2.new(1, -45, 0, 2)

    NotifyDelayFrame2.Name = "NotifyDelayFrame2"
    NotifyDelayFrame2.Parent = NotifyDelayFrame1
    NotifyDelayFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyDelayFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyDelayFrame2.BorderSizePixel = 0
    NotifyDelayFrame2.Size = UDim2.new(1, 0, 1, 0)

    local totalTextSize = 0
    local saveTemp = Notify.Size.X.Offset/2
    for i,v in pairs((NotifyText.Text):split("")) do
        CalcTextSize = TextService:GetTextSize(v,22,"Fantasy",Vector2.new(0,0))
        totalTextSize = totalTextSize + CalcTextSize.X
    end
    Notify2.Position = UDim2.new(3, -(totalTextSize+saveTemp), 0, 0)
    Notify.Size = UDim2.new(0, totalTextSize+saveTemp, 0, 45)
    Tween(Notify2, 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out,
        {
            Position = UDim2.new(1, -(totalTextSize+saveTemp), 0, 0)
        }
    ):Play()
    if Configs.Delay then
        local checkTW = Tween(NotifyDelayFrame2, Configs.Delay, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut,
            {
                Size = UDim2.new(0,0,1,0),
                Position = UDim2.new(1,0,0,0)
            }
        )
        checkTW:Play()
        checkTW.Completed:Connect(function()
            local checkTW2 = Tween(Notify2, 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In,
                {
                    Position = UDim2.new(3, -(totalTextSize+saveTemp), 0, 0)
                }
            )
            checkTW2:Play()
            checkTW2.Completed:Connect(function()
                Notify:Destroy()
            end)
        end)
    end
    NotifyIcon.MouseButton1Click:Connect(function()
        local checkTW = Tween(Notify2, 0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.In,
            {
                Position = UDim2.new(3, -(totalTextSize+saveTemp), 0, 0)
            }
        )
        checkTW:Play()
        checkTW.Completed:Connect(function()
            Notify:Destroy()
        end)
    end)
end
local AllTrialManager = {"AutoReset"}
local TrialManager = {}
function ResetTrialManager()
    for i,v in pairs(AllTrialManager) do 
        TrialManager[v] = nil 
    end
end
local StateAdded = {}
local AllFuncs = {"Rip Indra","Black Beard","Saber Puzzle","Sea 2","Saber","Elite","Factory","Pirate Raid","Dough King","Cake Prince","GetFruit","Doflamingo","Sea 3","Red Key","Minimum Fragment","Awaken Fruit","Travel Sea3","Library Key","Water Key","FullyRaceV4_Entrance","Spawn Black Beard","Mirage Snipe Fruit","Soul Guitar","Sea 2 Key Hop","Soul Reaper","Spawn Soul Reaper","Unlock Electric Claw","Bartilo","God Human Material","Tushita","Tushita Hop","CDK","Pole","Dough King Force","Trade Sweet Chalice Force", "Material Soul Guitar","Items Farm Force","EatFruit","SnipeFruitOneClick","Swan Door Hop","Mirror Fractal Hop","Valkyrie Helm Hop","Open Pad","Spawn Rip Indra","Yama"}--,"Winter Event",,"Fully Ghoul","Race Evolve,,"Trade Sweet Chalice Force"
local FuncsRequirement = {
    ["Race Evolve"] = function()
        return Sea2 and CheckBartilo() and GetLevel() >= 850 and ((not LP.Data.Race:FindFirstChild("Evolved") and LP.Data.Beli.Value >= 500000 and CanGetFlower()) or (ProgressChecker.Sea3.Doflamingo and LP.Data.Race:FindFirstChild("Evolved") and LP.Data.Beli.Value >= 2000000 and not IsRaceV3() and RaceV3Func[LP.Data.Race.Value]))
    end,
    ["Yama"] = function()
        if Sea3 then
            if not CheckInvItem("Yama") then
                local EliteProcess = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress")
                if EliteProcess and EliteProcess >= 30 then
                    return true
                end
            end
        end
    end,
    ["Get Ghoul"] = function()
        return not Sea2 or IsAlive(Enemies:FindFirstChild("Cursed Captain")) or CheckItem("Hellfire Torch") or GetMaterial("Ectoplasm") < 100

    end,
    ["Valkyrie Helm Hop"] =  function()
        if GetLevel() < CurrentMaxLv then 
            return
        end
        if Sea3 and not CheckItem("God's Chalice") and not CheckInvItem("Valkyrie Helm") and HaveAllHaki() and GetMaterial("Mirror Fractal") >= 1  then 
            return true
        end
    end,
    ["Mirror Fractal Hop"] = function()
        if GetLevel() < CurrentMaxLv then 
            return
        end
        if Sea3 and not CheckItem("God's Chalice") and not CheckItem("Sweet Chalice") and GetMaterial("Mirror Fractal") == 0  and GetMaterial("Conjured Cocoa") >= 10 then 
            return true
        end
    end,
    ["SnipeFruitOneClick"] = function()
        local Fruit, Type = CheckSnipeFruit()
        if Type == "Normal" then 
            return Fruit
        end
        if Type == "Mirage" and Sea3 and  MirageFunctions.GetMirageIsland() then

            return Fruit
        end
    end,
    ["Tushita Hop"] = function()
        if Sea3 then
            if GetLevel() < 2000 then
                return 
            end
            if not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then 
                return 
            end
            if  HaveAllHaki() then
                return true 
            end
        end
    end,
    ["Awaken Fruit"] = function()
        if Sea1 then
            return false, "Cant Raid In Sea 1"
        end  
        if GetLevel() < 1100 then
            return false, "Not Enough Level"
        end
        if GetLevel() < CurrentMaxLv then
            return false, "Not Enough Level 2"
        end
        if  X2Exp() then 
            return false, "Not Gonna Waste X2 EXP LOL"
        end 
        if CanAwaken() then
            if getgenv().Setting.OneClick.Enable and LP.Data.DevilFruit.Value == "Dough-Dough" then 
                return false 
            end
            if CheckItem("Special Microchip") or GetValidFruitRaid() or GetRealFruitStore() then
                return true, "Activated"
            end
        end
    end,
    ["Multi Trial"] = function()
        return MultiTrial_AllSet()
    end,
    ["Items Farm Force"] = function()
        if  X2Exp() then  
            return 
        end
        if not DataSave.Unlocked.GodHuman then
            return 
        end
        for i,v in pairs(ListItemsBoss) do 
            if CheckEnemySpawn(v) then 

                if not StateItems_Boss[v] then
                    local UpdateState = UpdateStateBoss(v)
                    if not UpdateState then
                        return true 
                    end
                end
            end
        end
    end,
    ["Mirage Snipe Fruit"] = function ()
        return IsPremium and GetMirageSnipeFruit()
    
    end,
    ["Material Soul Guitar"] = function ()

        if not FirstTimeCheckSoulGuitar then
            print("Checked First Time Soul Guitar")
            GuitarProgress()
            FirstTimeCheckSoulGuitar = true 
        end
        if getgenv().Setting.OneClick.Enable then --Prevent Stuck Sea 2
            if Sea3 then
                if not DataSave.Unlocked.GodHuman and DataSave.Melee["Dragon Tailon"].Mas400 then
                    if not RequirementGod["3"] or not RequirementGod["4"]  then 
                        return false
                    end
                end
            end 
        end
        return  DataSave.Unlocked.SoulGuitar and not CheckInvItem("Skull Guitar") and (not RequirementGuitar["1"] or not RequirementGuitar["2"] or GetMaterial("Dark Fragment")==0) 
    end,
    ["Trade Sweet Chalice Force"] = function()
        if Sea3 and CheckItem("God's Chalice") then
            local Pad = HakiFunc.CanOpenPad()
            if GetLevel() >= 2000 and game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") and Pad[1]then
                return false
            end
            local MaterialReq = {}
            MaterialReq.Coca = GetMaterial("Conjured Cocoa")
            MaterialReq.Mirror = GetMaterial("Mirror Fractal")
            if ((MaterialReq.Mirror <= 0 or not CanAwakenDough()) and MaterialReq.Coca >= 10) then
                return true
            end
            
        end
        return false
    end,
    ["EatFruit"] = function()
        return CheckEatAble()
    end,
    ["Soul Guitar"] = function ()
        return Sea3 and game:GetService("Lighting"):GetAttribute("MoonPhase") and game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 and IsNight() and GetLevel() >= 2300 and not DataSave.Unlocked.SoulGuitar
    end,
    ["Open Pad"] = function ()
        return Sea3 and HakiFunc.CanOpenPad() and HakiFunc.CanOpenPad()[1] and not HakiFunc.CanOpenPad()[2]
    end,
    ["Bartilo"] = function ()
        if not FirstTimeCheckBartilo then
            CheckBartilo() 
            FirstTimeCheckBartilo=true
        end
        return Sea2 and GetLevel() >= 850 and not DataSave.BartiloQuest and not (not ProgressChecker.Bartilo.KilledSpring and ProgressChecker.Bartilo.KilledBandit and not Enemies:FindFirstChild("Jeremy") )
    end,
    ["Winter Event"] = function ()
        return Sea3 and IsPresentTime()
    end,
    ['FullyRaceV4_Entrance'] = function ()
       -- print(Sea3, IsRaceV3())
        if Sea3 and IsRaceV3() then
            local Curstate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Check") 
            --print("Cure State ",Curstate)
            if Curstate >= 1 and Curstate < 4 then 
                return true 
            end
            if Curstate == 4 and MirageFunctions.GetMirageIsland() and GetMaterial("Mirror Fractal") >= 1 and CheckInvItem("Valkyrie Helm")
            and not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor")  then 
                return true
            end
        end
        return false
    end,
    ["Rip Indra"] = function ()
        if Sea3 then
            for i,v in pairs(Enemies:GetChildren()) do
                if v.Name == "rip_indra True Form" and IsAlive(v) then
                    if GetLevel() >= 2000  and getgenv().Setting.OneClick.Enable and  game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then
                        return false
                    end
                    return true
                    
                end
            end
        end
        return false
    end,
    ["Red Key"] = function ()
        if Sea3 and CheckItem("Red Key") and not CanAwakenDough() then
            return true
        end
    end,
    ["Cake Prince"] = function ()
        if Sea3 then
            for i,v in pairs(Enemies:GetChildren()) do
                if v.Name == "Cake Prince" and IsAlive(v) then
                    return true
                end
            end
        end
        return false
    end,
    ["Dough King"] = function ()
        if Sea3 then
            for i,v in pairs(Enemies:GetChildren()) do
                if v.Name == "Dough King" and IsAlive(v) then
                    return true
                end
            end
        end
        return false
    end,
    ["Spawn Rip Indra"] = function()
        if not Sea3 then 
            return false, "Not In Sea 3"
        end
        if not CheckItem("God's Chalice") then 
            return false,  "Doesnt Have God Chalice"
        end
        if not HakiFunc.CanOpenPad() then 
            return false, "Unexpected error orrured, report to the dev"
        end
        if not HakiFunc.CanOpenPad()[2] then 
            return false, "Didnt Open All Haki Pad"
        end
        if not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then
            local MaterialReq = {}
            MaterialReq.Coca = GetMaterial("Conjured Cocoa")
            MaterialReq.Mirror = GetMaterial("Mirror Fractal")
            if ((MaterialReq.Mirror <= 0 or not CanAwakenDough()) and MaterialReq.Coca >= 10) then
                return false, "Need For Chocolate Cup"
            end
        end
        return true, "Activated"
    end,
    ["Dough King Force"] = function()
        return Sea3 and CheckItem("Sweet Chalice")
    end,
    ["Spawn Black Beard"] = function()
        return Sea2 and CheckItem("Fist of Darkness") 
    end,
    ["Spawn Soul Reaper"] = function()
        return Sea3 and CheckItem("Hallow Essence") and not IsAlive(Enemies:FindFirstChild("Soul Reaper")) and ((getgenv().Setting.OneClick.Enable and CDKProgress().Evil >= -1) or not getgenv().Setting.OneClick.Enable)
    end,
    ["Soul Reaper"] = function()
        local Check = CDKProgress()
        return Sea3 and IsAlive(Enemies:FindFirstChild("Soul Reaper")) and Check.Evil ~= -5 and Check.Evil ~= -4 
    end,
    ["Black Beard"] = function ()
        if Sea2 then
            for i,v in pairs(Enemies:GetChildren()) do
                if v.Name == "Darkbeard" and IsAlive(v) then
                    return true
                end
            end
        end
        return false
    end,
    ["Saber Puzzle"] = function ()
        --print(Sea1 ,  LP.Data.Level.Value >= 200 , not CheckInvItem("Saber") , not ProgressChecker.Saber.UsedRelic)
        if Sea1 and  LP.Data.Level.Value >= 200 and not CheckInvItem("Saber") and not ProgressChecker.Saber.UsedRelic then
            --print("HI")
            return true
        end
        return false
    end,
    ["Unlock Electric Claw"] = function()
        return GetLevel() >= 2000 and not DataSave.Unlocked.Electricclaw
    end,
    ["God Human Material"] = function()
        return not DataSave.Unlocked.GodHuman and DataSave.Melee["Dragon Tailon"].Mas400 and not (RequirementGod["1"] and RequirementGod["2"] and RequirementGod["3"] and RequirementGod["4"])
    end,
    ["Saber"] = function ()
        if Sea1 and GetLevel() >= 200 and not ProgressChecker.Saber.KilledShanks and not CheckInvItem("Saber") and ProgressChecker.Saber.UsedRelic and CheckEnemySpawn("Saber Expert") then
            return true
        end
        return false
    end,
    ["Minimum Fragment"] = function ()
        if Sea1 then
            return false, "Cant Raid In Sea 1"
        end  
        if GetLevel() < 1300 then
            return false, "Not Enough Level"
        end
        if  X2Exp() then 
            return false, "Not Gonna Waste X2 EXP LOL"
        end 
        if GetLevel() < 2000 then
            MinFragment = 2000
        end
        MinFragment = 5000
        if MinFragment and LP.Data.Fragments.Value >= MinFragment then 
            return false, "Over 10k Fragments"
        end
        --Try To Get Fruit
        if #FruitFunc.HaveFruitInv() >0 then
            task.wait(1) 
        end
        if CheckItem("Special Microchip") or #FruitFunc.HaveFruitInv() > 0 or FruitFunc.GetFruitBelow1M() then
            return true, "Activated"

        end
        return false, "Doesnt Have Fruit"
        
    end,
    ["Tushita"] = function()
        if Sea3 then
            if GetLevel() < 2000 then
                return 
            end
            
            if game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then
                return IsAlive(Enemies:FindFirstChild("rip_indra True Form"))
            else
                return (IsAlive(Enemies:FindFirstChild("Longma")) and not CheckInvItem("Tushita"))
            end
        end
    end,
    ["Travel Sea3"] = function (Mode)
        local NeedGodHumanMaterial = DataSave.Melee["Dragon Tailon"].Mas400 and not (DataSave.Unlocked.GodHuman or (RequirementGod["1"] and RequirementGod["2"])) --and SelectedWeaponAlternative ~= "Yama" and SelectedWeaponAlternative ~= "Tushita"
       -- print(Sea2,MeleeV2, not NeedGodHumanMaterial,not (DataSave.Unlocked.SoulGuitar and not CheckInvItem("Soul Guitar")) )
        if not Sea2 then 
            return false, "Not In Sea 2"
        end
        if not ProgressChecker.Sea3.FakeRipIndra then 
            return false, "Not Killed Rip Indra"
        end
        if not DataSave.Unlocked.Deathstep then
            return false, "Not Unlocked Death Step"
        end
        if not DataSave.Unlocked.Sharkman then
            return false, "Not Unlocked Death Step"
        end
        if NeedGodHumanMaterial then 
            return false, "Farming God Human Material" 
        end
        if (DataSave.Unlocked.SoulGuitar and not CheckInvItem("Skull Guitar")) and (not RequirementGuitar["1"]  or GetMaterial("Dark Fragment")==0) and not (getgenv().OneClickSetting and getgenv().OneClickSetting.DisableSoulGuitar)  then
            return false, "Farming Skull Guitar Material"
        end
        if not Mode == "Status" then
            task.wait(10)
        end
        local DebugMessage = ""
        local function AddMessage(Message)
            DebugMessage=DebugMessage..Message.." "
        end
        if DataSave.Melee["Dragon Tailon"].Mas400  then
            AddMessage("[1]")
        end
        if DataSave.Unlocked.GodHuman  then
            AddMessage("[2]")
        end
        if (RequirementGod["1"] and RequirementGod["2"]) then
            AddMessage("[3]")
        end
        if DebugMessage == "" then 
            DebugMessage = "Traveling To Sea 3"
        end
        return true, "Activated", DebugMessage

        
       

    end,
    ["Elite"] = function ()
        return GetNearMob("Elite")
    end,
    ["Factory"] = function ()
        if Sea2 then 
            return GetNearMob("Core")
        end
    end,
    ["Pirate Raid"] = function ()
        if Sea3 then
            return GetNearMob("Pirate Raid")
        end
        return false
    end,
    ["Sea 2"] = function()
        if not Sea1 then 
            return false, "Not Sea 1"
        end
        if LP.Data.Level.Value < 700 then 
            return false, "Not Enough Level"
        end
        if not CheckInvItem("Saber") then
            return false, "Doesnt Have Saber"
        end
        return true, "Activated"
    end,
    ["Greybeard"] = function()
        return  false and GetLevel() >= 400 and  CheckEnemySpawn("Greybeard")
    end,
    ["Pole"] = function()
        return  GetLevel() >= 400 and IsAlive(Enemies:FindFirstChild("Thunder God")) and not CheckInvItem("Pole (1st Form)")
    end,
    ["Doflamingo"] = function ()
        if LP.Data.Level.Value >= 1000 and Sea2 and SwanDoor.Check() and Enemies:FindFirstChild("Don Swan") and not CheckInvItem("Swan Glasses") then 
            return true
        end
        return false
    end,
    ["Swan Door Hop"] = function()
        return Sea2 and LP.Data.Level.Value >= 1500 and not SwanDoor.Check() and not SwanDoor.GetFruit() and getgenv().Setting.OneClick.SwanFruitHop 
    end,
    ["Sea 3"] = function ()
        ThirdSeaProgress()
       -- print(ProgressChecker.Sea3.Doflamingo ,ProgressChecker.Sea3.FakeRipIndra)
        if not Sea2 then
            return false, "Not In Sea 2"
        end
        if LP.Data.Level.Value < 1500 then  
            return false, "Not Enough Level"
        end
        if not DataSave.Unlocked.SwanDoor and not ProgressChecker.Sea3.Doflamingo then
            return false, "Not Unlocked Doflamingo Door"
        end
        if not ProgressChecker.Sea3.Doflamingo then 
            return false, "Not Killed Flamingo"
        end
        if ProgressChecker.Sea3.FakeRipIndra then  
            return false, "Already Killed Rip Indra"
        end
        return true 
    end,
    ["BossSniper"] = function()
        for i,v in pairs(getgenv().Setting.BossSniper.SelectedBoss) do 
            if IsAlive(game:GetService("Workspace").Enemies:FindFirstChild(v)) then
                return true
            end
        end
    end,
    ["GetFruit"] = function ()

        return GetNearestFruit()
    end,
    ["Library Key"] = function ()
        if Sea2 and not DataSave.Unlocked.Deathstep and CheckEnemySpawn("Awakened Ice Admiral") and GetLevel() >= 850  then
            return true
        end
        return false
    end,
    ["Water Key"] = function ()
        if Sea2 and not DataSave.Unlocked.Sharkman and CheckEnemySpawn("Tide Keeper") and GetLevel() >= 850 then
            return true
        end
    end,
    ["Sea 2 Key Hop"] = function()
        return Sea2KeyHop()
    end
}
FuncsRequirement["Shark Anchor"] = function()
    if not CheckInvItem("Shark Anchor") then
        return true
    end
end
FuncsRequirement["CDK"] = function()
    if GetLevel() <= 2200 then
        return 
    end
    if Sea3 and CheckInvItem("Tushita") and CheckInvItem("Yama")  and not CheckInvItem("Cursed Dual Katana") then
        --[[
        if not DataSave["LockedMas"].Tushita or not DataSave["LockedMas"].Yama then 
            return true
        end]]
        local CurrentProgress = CDKProgress()

        if  CurrentProgress.Good == 4 and (CurrentProgress.Evil == 3 or CurrentProgress.Evil == 4) then
            return true 
        end
        if CurrentProgress.Good <= 3 and CurrentProgress.Good ~= -2 and CurrentProgress.Good ~= 4 then
            CDKIntilize.Good()
            if CurrentProgress.Good == -3 then
                return true 
            elseif CurrentProgress.Good == -4 and FuncsRequirement["Pirate Raid"]()  then
                return true
            elseif CurrentProgress.Good == -5 then
                return true
            end
        else
            
            CDKIntilize.Evil()
            return CurrentProgress.Evil == -3 or CurrentProgress.Evil == -4  or (CurrentProgress.Evil == -5 and (game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper")) or CheckItem("Hallow Essence") or Dimensions.Hell())
        end
    end
end
local FuncPriories = {
    ["Winter Event"] = 1,
    ["Sea 2"] = 3, 
    ["Tushita"] = 1,
    ["Rip Indra"] = 2,
    ["Black Beard"] = 2,
    ["Saber Puzzle"] = 2,
    ["Saber"] = 4,
    ["Elite"] = 3,
    ["Pirate Raid"] = 3,
    ["Multi Trial"] = 1,
    ["Factory"] = 3,
    ["Dough King"] = 2,
    ["Tushita Hop"] = 9,
    ["Swan Door Hop"] = 9,
    ["Sea 2 Key Hop"] = 10,
    ["EatFruit"] = 9,
    ["Yama"] = 9,
    ["Dough King Force"]= 3,
    ["Cake Prince"] = 4,
    ["GetFruit"] = 4,
    ["Sea 3"] = 4,
    ["Doflamingo"] = 3,
    ["Mirror Fractal Hop"] = 9,
    ["Valkyrie Helm Hop"] = 9,
    ["Open Pad"] = 4,
    ["Red Key"] = 3,
    ["Minimum Fragment"] = 6,--Because Have Working Farm Function Need to blackout
    ["Awaken Fruit"] = 6,--Because Have Working Farm Function Need to blackout
    ["God Human Material"] = 6,
    ["FullyRaceV4_Entrance"] = 2,
    ["Travel Sea3"] = 5,
    ["Library Key"] = 4,
    ["Water Key"] = 4,
    ["Bartilo"] = 5,
    ["Trade Sweet Chalice Force"] = 3, --Prevent Spawn Rip Indra
    ["Race Evolve"] = 5,
    ["Spawn Black Beard"] = 3,
    ["Spawn Rip Indra"] = 5,
    ["SnipeFruitOneClick"] = 5,
    ["Mirage Snipe Fruit"] = 3,
    ["Soul Guitar"] = 3,
    ["Material Soul Guitar"] = 7,
    ["God Human"] = 4,
    ["Spawn Soul Reaper"] = 4,
    ["Soul Reaper"] = 4,
    ["Greybeard"] = 1,
    ["CDK"] = 1,
    ["Get Ghoul"]= 6,--Because Have Casual Farm Function Need to blackout
    ["Unlock Electric Claw"] = 3,
    ["Pole"] = 5,
    ["BossSniper"] = 3,
    ["Shark Anchor"] = 3,
    ["Items Farm Force"]= 7,
}
local function GetCurrentFarmingState()
    
    if Sea3 then
        if  not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") and  CDKProgress().Evil == -5  then
            return "Bone"
        end
        if getgenv().OneClickSetting and GetLevel() >= 2000 and getgenv().OneClickSetting.HopHakiColor then
            if not X2Exp() and getgenv().GetServerData.ColorDealer  ~= 1 then
                if not HaveAllHaki() then 
                    
                        if LP.Data.Fragments.Value >= 7500 then 
                            local Cache = getgenv().GetServerData.ColorDealer
                            if  Cache then
                                if OnlyLegendaryHaki and table.find({"Snow White","Pure Red","Winter Sky"},Cache) then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","2")    
                                end
                            end
                            TrueServerHop(1,6)
                        end
                    end
                
            end
        end
        if not X2Exp() then
            if not DataSave.Unlocked.Dragontailon  then
                if CheckRandomBone() then 
                    local Condition = function()
                        return not DataSave.Unlocked.Dragontailon and not X2Exp()
                    end
                    return "Bone", Condition
                end
            end
        end
    end
    if GetLevel() < 2000 then 
        return "Level"
    end

    if Sea3 and not X2Exp() then

        if not CanAwakenDough() then
            if GetMaterial("Conjured Cocoa") < 10 then
                local EnoughCocoa
                local Task = task.spawn(function()
                    while task.wait(1) do 
                        EnoughCocoa = GetMaterial("Conjured Cocoa") >= 10
                    end
                end)
                local Condition = function()
                    if EnoughCocoa then
                        if Task then
                            task.cancel(Task)
                        end
                    end
                    return not EnoughCocoa
                end
                return "Material", Condition, {Material="Conjured Cocoa"}
            end
        end
    end
    if GetLevel() < CurrentMaxLv then 
        return "Level"
    end

    local Fruit = GetCurrentTool("Blox Fruit")
    if  Fruit and Fruit:FindFirstChild("Level") and (getgenv().OneClickSetting and getgenv().OneClickSetting.Mastery or not getgenv().OneClickSetting) then 
        if GetMaxMastery(Fruit) > Fruit.Level.Value  then 
            local Condition = function()
                return Fruit.Parent ~= nil and Fruit and Fruit:FindFirstChild("Level") and GetMaxMastery(Fruit)   > Fruit.Level.Value 
            end
            return "Katakuri", Condition, {Mastery =true, FarmMastery=true}
        --elseif not CheckInvItem("Shark Anchor") and getgenv().OneClickFarms and table.find(ListSettingableOneClick,v) and getgenv().OneClickFarms[v]  then
        --    return "Shark Anchor"
        end
    end
    return "Katakuri"
end



function GetValidFruitRaid()
    local MaxP = 1000000
    local MinP = 0
    if AutoChip[LP.Data.DevilFruit.Value] == "Dough" then

        MinP = 1000000
        MaxP = 10000000
    end
    for i,v in pairs(FruitFunc.HaveFruitInv()) do
        if (FruitPrice[v:GetAttributes().OriginalName]>=MinP and FruitPrice[v:GetAttributes().OriginalName] <MaxP) then
            return true
        end
    end
    
end
function GetRealFruitStore()   
    if Sea3 and not CanAwakenDough() then
        return false
    end
    if AutoChip[LP.Data.DevilFruit.Value] == "Dough" then
        return FruitFunc.GetFruitAbove1M()
    else
        return FruitFunc.GetFruitBelow1M()
    end
end
local Farms = {
    ["Saber Puzzle"] = function ()
        while Sea1 and GetLevel() >= 200 and not ProgressChecker.Saber.UsedRelic and not CheckInvItem("Saber") and task.wait(0.1)  do
            StatusFarming = "Doing Saber Puzzle [Starting]"
            SaberProgress()
			if DataSave.Inventory.Saber then
                StatusFarming = "Doing Saber Puzzle [Finished]"
				return
			end
			
			---1180.0397949219, 22.599720001221, 187.29235839844
			
			if Plates ~= 5 then
                StatusFarming = "Doing Saber Puzzle [Start Plates]"
				Noclipping = RunS.Stepped:Connect(NoclipLoop)
				repeat wait()
					SaberProgress()
					for i=1,5 do
						local CurPlate = "Plate"..tostring(i)
                        Floating(true)
                        DoTween2(game:GetService("Workspace").Map.Jungle.QuestPlates[CurPlate].Button.CFrame)
                        Floating(true)
						--
						task.wait(0.5)
					end
				until Plates == 5
                StatusFarming = "Doing Saber Puzzle [End Plates]"
			end
			SaberProgress()
            task.wait(0.2)
			if Plates == 5 and not ProgressChecker.Saber.UsedTorch then
                StatusFarming = "Doing Saber Puzzle [Start Torch]"
				if CheckItem("Torch") then
					task.wait(0.5)
					Equip("Torch")
					wait(0.1)
					local args = {
						[1] = "ProQuestProgress",
						[2] = "DestroyTorch"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				else
					DoTween2(CFrame.new(-1610.1174316406, 12.890041351318, 162.84405517578))
				end
                StatusFarming = "Doing Saber Puzzle [End Torch]"
			end
			SaberProgress()
            task.wait(0.2)
			if not ProgressChecker.Saber.UsedCup and ProgressChecker.Saber.UsedTorch then
                StatusFarming = "Doing Saber Puzzle [Start Cup]"
				if CheckItem("Cup") then
					Equip("Cup")

					local args = {
						[1] = "ProQuestProgress",
						[2] = "FillCup",
						[3] = game:GetService("Players").LocalPlayer.Character.Cup
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "ProQuestProgress",
						[2] = "SickMan"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				else
					local args = {
						[1] = "ProQuestProgress",
						[2] = "GetCup"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
                StatusFarming = "Doing Saber Puzzle [End Cup]"
			end
			SaberProgress()
            task.wait(0.2)
			if not ProgressChecker.Saber.TalkedSon and ProgressChecker.Saber.UsedCup and ProgressChecker.Saber.UsedTorch then
                StatusFarming = "Doing Saber Puzzle [Start Talk]"
				local args = {
					[1] = "ProQuestProgress",
					[2] = "RichSon"
				}

				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                StatusFarming = "Doing Saber Puzzle [End Talk]"
			end
			SaberProgress()
			if ProgressChecker.Saber.TalkedSon and not ProgressChecker.Saber.KilledMob and ProgressChecker.Saber.UsedTorch and ProgressChecker.Saber.UsedCup then
                StatusFarming = "Doing Saber Puzzle [Start Mob Leader]"
				if game.Workspace.Enemies:FindFirstChild("Mob Leader") then
					local MobLeader = game.Workspace.Enemies:FindFirstChild("Mob Leader")
					repeat task.wait(0.1)
						if MobLeader then
                            pcall(Equip,GetCurrentTool("Melee",true))
							TP(MobLeader,Vector3.new(0,20,20))                            
							--ResizeHRP(MobLeader,false)
						end
					until  not IsAlive(MobLeader)
				end
                StatusFarming = "Doing Saber Puzzle [End Mob Leader]"
			end
			SaberProgress()
			if not ProgressChecker.Saber.UsedRelic and ProgressChecker.Saber.UsedTorch and ProgressChecker.Saber.UsedCup and ProgressChecker.Saber.KilledMob then
                StatusFarming = "Doing Saber Puzzle [Start Relic]"
				local args = {
					[1] = "ProQuestProgress",
					[2] = "RichSon"
				}

				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				DoTween2(CFrame.new(-1405.31445, 29.8519974, 4.34172916, 0.870163321, 2.4032718e-09, 0.49276346, 5.68156899e-09, 1, -1.49101247e-08, -0.49276346, 1.57739137e-08, 0.870163321))
				Equip("Relic")
				local SaberDoor = game:GetService("Workspace").Map.Jungle.Final.Invis
				SaberDoor.CanCollide = false
				SaberDoor.Size = Vector3.new(20,20,20)
			
				local args = {
					[1] = "ProQuestProgress",
					[2] = "PlaceRelic"
				}
			
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                StatusFarming = "Doing Saber Puzzle [End Relic]"
			end
			SaberProgress()
		end
    end,
    Yama = function()
        while not CheckInvItem("Yama") do
            StatusFarming = "Getting Yama"
            DoTween2(CFrame.new(5252.9560546875, 16.707324981689453, 462.70941162109375))

            fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Hitbox.ClickDetector)
            task.wait(0.5) 
        end
    end,
    Bartilo = LPH_JIT_MAX(function ()
        while FuncsRequirement.Bartilo() and task.wait(0.1) do 
            StatusFarming = "Doing Bartilo Quest"
            BartiloProgress()
            if not ProgressChecker.Bartilo.KilledBandits and not ProgressChecker.Bartilo.KilledSpring then
                if LP.PlayerGui.Main.Quest.Visible == false or not string.find(PG.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
                    DoTween2(CFrame.new(-461.533203, 72.3478546, 300.311096))
                    task.wait(0.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
                end
                if  PG.Main.Quest.Visible and Alive() then
                    local MobToFarm = GetNearMob("Swan Pirate")
                    if IsAlive(MobToFarm) then
                        SSS(GetNearSpawn(getRoot(MobToFarm).Position))
                        while IsAlive(MobToFarm) and task.wait(0.1) do 
                            AttackMob(MobToFarm)
                        end
                    else
                        SSS(GetNearSpawn(Vector3.new(964.2918090820312, 73.08502197265625, 1278.3035888671875)))
                        DoTween2(CFrame.new(964.2918090820312, 73.08502197265625, 1278.3035888671875))
                    end
                else 
                    repeat wait()
                    until Alive()
                end
            end
            BartiloProgress()
            if not ProgressChecker.Bartilo.KilledSpring and ProgressChecker.Bartilo.KilledBandits then
                DoTween2(CFrame.new(-461.533203, 72.3478546, 300.311096))
                wait(0.1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)                
                if  Alive() then
                    local MobToFarm = game.Workspace.Enemies:FindFirstChild("Jeremy")
                    if IsAlive(MobToFarm) then
                        SSS(GetNearSpawn(getRoot(MobToFarm).Position))
                        while IsAlive(MobToFarm) and task.wait(0.1) do 
                            AttackMob(MobToFarm)
                        end
                    end
                else 
                    repeat wait()
                    until Alive()
                end
                BartiloProgress()
                if not ProgressChecker.Bartilo.KilledSpring and ProgressChecker.Bartilo.KilledBandits and not game.Workspace.Enemies:FindFirstChild("Jeremy") then
                    MainServerHop(5,"Finding Jeremy [Bartilo Quest]")
                end
            end
            BartiloProgress()
            if not ProgressChecker.Bartilo.DidPlates and ProgressChecker.Bartilo.KilledSpring and ProgressChecker.Bartilo.KilledBandits then
                DoTween2(CFrame.new(-1837.6804199219, 11.032466888428, 1667.9600830078))
                for i=1,8 do

                    local Name = "Plate"..tostring(i)
                    local Plate = game:GetService("Workspace").Map.Dressrosa.BartiloPlates[Name]
                    wait()
                    getRoot(LP.Character).CFrame = Plate.CFrame
                    task.wait()
                    
                end         
            end
            BartiloProgress()
              

        end
    end),
    Saber =  LPH_JIT_MAX(function ()
        StatusFarming = "Killing Shank"
        while Sea1 and GetLevel() >= 200 and not CheckInvItem("Saber") and ProgressChecker.Saber.UsedRelic and not ProgressChecker.Saber.KilledShanks and wait() and CheckEnemySpawn("Saber Expert") do
            if not ProgressChecker.Saber.KilledShanks and ProgressChecker.Saber.UsedRelic and ProgressChecker.Saber.UsedTorch and ProgressChecker.Saber.UsedCup and ProgressChecker.Saber.KilledMob  then
                local NoClip = CreateSteppedLoop(NoclipLoop,"NoClipSaber")

                local Shank = GetMainEnemy("Saber Expert")
                
                repeat wait(0.2)
                    if IsAlive(Shank) then
                        pcall(Equip,GetCurrentTool("Melee",true))
                        TP(Shank,Vector3.new(0,20,20))                            
                        --ResizeHRP(Shank,false)
                    end
                until  not IsAlive(Shank)
                DisconnectLoop(NoClip)
            end
            
        end
        
    end),
    ["Sea 2"] = LPH_JIT_MAX(function ()
        while Sea1 and task.wait(0.1) do
            SecondSeaProgress()
            if  not UsedKey or not CheckItem(("Key")) then 
                repeat task.wait(0.1)
                    StatusFarming = "Talking To Detective"
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                until not Alive() or CheckItem(("Key")) or ProgressChecker.Sea2.UsedKey 
            end
            if not ProgressChecker.Sea2.UsedKey and ProgressChecker.Sea2.TalkedDetective and Alive() and CheckItem("Key")  then
                StatusFarming = "Using Key"
                Equip("Key")
                DoTween2(CFrame.new(1347.7124, 37.3751602, -1325.6488))
            end
            SecondSeaProgress()
            if not ProgressChecker.Sea2.KilledIceBoss and ProgressChecker.Sea2.UsedKey then
                local IceAdmiral = game.Workspace.Enemies:FindFirstChild("Ice Admiral")
                repeat wait()
                    if IceAdmiral and Alive() then
                        pcall(Equip,GetCurrentTool("Melee",true))
                        TP(IceAdmiral,Vector3.new(0,20,20))                            
                        --ResizeHRP(IceAdmiral,false)
                    end                
                until  not Alive() or not IsAlive(IceAdmiral)
            end
            if ProgressChecker.Sea2.KilledIceBoss and ProgressChecker.Sea2.UsedKey and ProgressChecker.Sea2.TalkedDetective then
    
               -- DoTween2(CFrame.new(-1165.95776, 7.65220022, 1728.58057, 0.473572224, 2.10676721e-09, -0.880755007, 6.13469986e-09, 1, 5.6905618e-09, 0.880755007, -8.09805911e-09, 0.473572224))
                --wait(0.5)
               -- if (getRoot(LP.Character).Position-Vector3.new(-1165.95776, 7.65220022, 1728.58057)).magnitude <30 then
                    MainTravel(3,"Finished Sea 1","Sea2")
                --end
            end
            SecondSeaProgress()
        end
    end),
}
local FarmCondition = function()
    return LP.PlayerGui.Main.Quest.Visible
end
Farms.SubmergedFarming = LPH_JIT_MAX(function (CurrentPlaceKey)
    local SubmergedPos = Vector3.new(11256, -2138.0, 9888)
    local MyLv = LP.Data.Level.Value
    local HighestI = 0
    for i,v in pairs(GameData.TripleQuest[CurrentPlaceKey]) do
        if i>= HighestI and i<= MyLv and i ~= nil then
            HighestI = i
        end
    end
    if not GameData.TripleQuest[CurrentPlaceKey][HighestI] then return end
    local QuestData = GameData.TripleQuest[CurrentPlaceKey][HighestI]
    local QuestCFrame = QuestData.QuestCFrame
    local QuestName = QuestData["Quest"]
    local Increment = 1
    if MyLv >= (QuestData[2] and QuestData[2].Requirement or math.huge) then
        Increment = 2
    end
    local QuestCheck = QuestData[Increment].QuestCheck
    while getgenv().Setting.OneClick.Enable and Alive() and LP.Data.Level.Value <= 2800 do
        if (getRoot(LP.Character).Position - SubmergedPos).magnitude > 1500 then
            local TikiPos = Vector3.new(-16269.0, 23, 1371)
            if (getRoot(LP.Character).Position - TikiPos).magnitude > 60 then
                DoTween2(CFrame.new(TikiPos))
            end
            local Net = require(game.ReplicatedStorage.Modules.Net)
            Net:RemoteFunction('SubmarineWorkerSpeak'):InvokeServer('AskKilledTikiBoss')
            Net:RemoteFunction('SubmarineWorkerSpeak'):InvokeServer('TravelToSubmergedIsland')
            task.wait(2)
            if (getRoot(LP.Character).Position - SubmergedPos).magnitude > 1500 then
                ImprovedTeleport(SubmergedPos + Vector3.new(0, 50, 0))
                task.wait(1)
            end
        end
        if not LP.PlayerGui.Main.Quest.Visible or not FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, QuestCheck) then
            if (QuestCFrame.Position - SubmergedPos).magnitude < 2000 then
                if (getRoot(LP.Character).Position - QuestCFrame.Position).magnitude > 10 then
                    DoTween2(QuestCFrame)
                end
            end
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QuestName, Increment)
            task.wait(1)
        end
        if LP.PlayerGui.Main.Quest.Visible then
            local MobToFarm = GetNearMob(QuestCheck)
            if IsAlive(MobToFarm) and (getRoot(MobToFarm).Position - SubmergedPos).magnitude < 2000 then
                FixTP(MobToFarm.Name)
                while Alive() and IsAlive(MobToFarm) and LP.PlayerGui.Main.Quest.Visible and (getRoot(MobToFarm).Position - SubmergedPos).magnitude < 2000 and task.wait(0.2) do
                    FixTP(MobToFarm.Name)
                    AttackMob(MobToFarm, nil, FarmCondition)
                end
            else
                task.wait(1)
            end
        end
        MyLv = LP.Data.Level.Value
        local NewHighest = 0
        for i,v in pairs(GameData.TripleQuest[CurrentPlaceKey]) do
            if i>= NewHighest and i<= MyLv and i ~= nil then
                NewHighest = i
            end
        end
        if NewHighest ~= HighestI then
            HighestI = NewHighest
            QuestData = GameData.TripleQuest[CurrentPlaceKey][HighestI]
            QuestCFrame = QuestData.QuestCFrame
            QuestName = QuestData["Quest"]
            if MyLv >= (QuestData[2] and QuestData[2].Requirement or math.huge) then
                Increment = 2
            end
            QuestCheck = QuestData[Increment].QuestCheck
        end
        task.wait(0.1)
    end
end)
Farms.IdleFarming = LPH_JIT_MAX(function (Name,Condition,Setting)
    local Setting = Setting or {}
    local Condition = Condition or function ()
        return true
    end
    if Name == "Level" then
        if not Increment then
            Increment = 1
        end
        local MyLv = LP.Data.Level.Value
        local Last
        local PlayerFind 
        local MinLevelQuestHunt = 300
        local MinJumpLevel = 150
        if  MyLv >= MinJumpLevel then
            local HighestI = 0
            for i,v in pairs(GameData.TripleQuest[CurrentPlaceKey]) do
                if i>= HighestI and i<= MyLv and i ~= nil then
                    HighestI = i
                end
            end
            if Sea3 and MyLv >= 2600 and GameData.TripleQuest[CurrentPlaceKey][2600] then
                Farms.SubmergedFarming(CurrentPlaceKey)
                return
            end
            if GameData.TripleQuest[CurrentPlaceKey][HighestI] ~= nil then
                
                local CheckBoss 
                for i=3,5 do
                    if GameData.TripleQuest[CurrentPlaceKey][HighestI][i] then
                        if MyLv >= GameData.TripleQuest[CurrentPlaceKey][HighestI][i].Requirement and CheckEnemySpawn(GameData.TripleQuest[CurrentPlaceKey][HighestI][i].QuestCheck) then
                            CheckBoss = GameData.TripleQuest[CurrentPlaceKey][HighestI][i]
                        end
                    end
                end
                if CheckBoss then
                    StatusFarming = "Farming Boss (Triple Quest Method)"

                    CancelQuest()
                    
                    FixTP(CheckBoss.QuestCheck)
                    if LP.PlayerGui.Main.Quest.Visible == false then
                        SSS(GetNearSpawn(CheckBoss.QuestCFrame.Position))
                        DoTween2(CheckBoss.QuestCFrame)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", CheckBoss["Quest"], CheckBoss.Index or 3)
                    end
                    local MyBoss = GetMainEnemy(CheckBoss.QuestCheck)
                    if IsAlive(MyBoss) then
                        --print(MyBoss.Name)
                        SSS(GetNearSpawn(getRoot(MyBoss).Position))
                        FixTP(MyBoss.Name)
                        while Alive() and IsAlive(MyBoss) and task.wait(0.2) do
                            if Alive() and IsAlive(MyBoss) then
                                local a,b = pcall(function()
                                    FixTP(MyBoss.Name)
                                    pcall(Equip,GetCurrentTool("Melee",true))
                                    -- HitBoxPlr()
                                    ResizeBoss(MyBoss,true)
                                    TP(MyBoss,Vector3.new(0, 20, 20))
                                end)
                                --print(a,b)
                            end
                        end
                    end
                else
                    if GetSettingHopExploiter() then 
                        HopNearExploiter()
                    end
                    if  (not LP.PlayerGui.Main.Quest.Visible or not FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)) then
                        --print("Starting Quest")
                        --print(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                        FixTP(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                        local QuestCheck = GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck
                        while not SafeGetQuest(GameData.TripleQuest[CurrentPlaceKey][HighestI].QuestCFrame,GameData.TripleQuest[CurrentPlaceKey][HighestI]["Quest"],Increment,nil,QuestCheck)  and task.wait(0.1) do
                            SSS(GetNearSpawn(GameData.TripleQuest[CurrentPlaceKey][HighestI].QuestCFrame.Position))
                            DoTween2(GameData.TripleQuest[CurrentPlaceKey][HighestI].QuestCFrame)
                        end
                    end
                    local CurrentMob = GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck
                    StatusFarming = "Farming Lv (Triple Quest Method)" --Farming Lv ["..CurrentMob.."]"
                    local ForceRemoveFloating = tick()
                    while task.wait(0.1) and LP.PlayerGui.Main.Quest.Visible and getgenv().Setting.OneClick.Enable and WorkingFarm:empty()  do
                        if tick()-ForceRemoveFloating>=5 then
                            Floating(false)
                            ForceRemoveFloating=tick()
                        end
                        local CurrentQuest = FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,CurrentMob)
                        if not CurrentQuest then
                            break
                        end
                        local MobToFarmABC = GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                        if IsAlive(MobToFarmABC) then
                            --print(MobToFarmABC.Name)
                            FixTP(MobToFarmABC.Name)
                            local FirstPosition = getRoot(MobToFarmABC).Position
                            
                            while  Alive() and IsAlive(MobToFarmABC) and LP.PlayerGui.Main.Quest.Visible and getgenv().Setting.OneClick.Enable and task.wait(0.2) do
                                AttackMob(MobToFarmABC,nil,FarmCondition)
                                if SetTimer(MobToFarmABC,FarmCondition) then
                                    break 
                                end
                            end
                        elseif not GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck) then
                            pcall(Equip,GetCurrentTool("Melee",true)) -- Sometimes the mob just kill you so equip
                            wait(1)
                                --[[ if TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck ~= 
                                "Pistol Billionaire [Lv. 1525]" and TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck ~= 
                                "Pirate Millionaire [Lv. 1500]" then]]
                                                                --end
                            --print(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                            FixTP(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                            for i,v in pairs(GameData.SpawnPosition[CurrentPlaceKey]) do
                                if not IsAlive(GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck))  then
                                    local CheckCurrentPosition = FindQuest(i,GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                                    if CheckCurrentPosition and (not LP.PlayerGui.Main.Quest.Visible  
                                        or not FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck) or not 
                                        IsAlive(GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck))) then
                                        for i2,v2 in pairs(v) do
                                            if IsAlive(GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)) then
                                                Floating(true)
                                                break
                                            end
                                            if Alive() then
                                                Floating(true)
                                                DoTween2(CFrame.new(ConvertStringToVector3(v2))*CFrame.new(0,20,20))
                                                Floating(false)
                                            end
                                        end
                                    end
                                end
                            end
                            
                        end
                    end 
                    MyLv = LP.Data.Level.Value
                    for i,v in pairs(GameData.TripleQuest[CurrentPlaceKey]) do
                        if i>= HighestI and i<= MyLv then
                            HighestI = i
                        end
                    end
                    if getgenv().Setting.OneClick.TripleQuest then
                        if Increment == 2 then
                            Increment = 1 
                        elseif MyLv >= GameData.TripleQuest[CurrentPlaceKey][HighestI][2].Requirement then 
                            Increment = 2
                        end
                    end
                end
            else
                print("Error: Farming Highest " ..HighestI)
            end
        else


            

            StatusFarming = "Jump Lv Farming"
        
            local Mid = CFrame.new(-4996.68505859375, 278.06683349609375, -2815.228515625)
            if MyLv > 30 then
                Mid = CFrame.new(-7743.29638671875, 5583.08154296875, -620.167236328125)
            end              
            if Alive() then
                if (getRoot(LP.Character).Position-Mid.Position).magnitude < 2500 then
                    local Check = 0
                    NearestMobAura = GetNearest(Enemies:GetChildren(), MyLv <= 30 and "Level30" or "Level60")
                    if NearestMobAura and IsAlive(NearestMobAura) and Alive() then
                        local FirstPos = getRoot(NearestMobAura).Position
                        pcall(Equip,GetCurrentTool("Melee",true))
                        local a,b = pcall(function()
                            if (getRoot(NearestMobAura).Position-getRoot(LP.Character).Position).magnitude <= 3000 then
                                while  Alive() and IsAlive(NearestMobAura) and task.wait(0.1) and getgenv().Setting.OneClick.Enable do
                                    BringMob("Near",NearestMobAura)
                                    pcall(Equip,GetCurrentTool("Melee",true))
                                    --ResizeHRP(NearestMob,true)
                                    TP(NearestMobAura,Vector3.new(0,40,0))
                                end
                            end
                        end)
                        if b then
                            print(b)
                        end
                    else
                        DoTween2(Mid)
                    end
                else
                    DoTween2(Mid)
                end
            end
        end

    else
        local function TotalCondition()
            return Condition() and WorkingFarmEmpty()
        end
        if Name == "Shark Anchor" then 
            --[[
            for i,v in pairs(WorkingFarm:list()) do 
                print(i,v) 
            end
            ]]
        end
        if Setting.Mastery then
            Farms[Name]("OneClick",TotalCondition,true,nil,Setting)
        elseif Name == "Material" then 
            Farms[Name](Setting.Material,"OneClick",TotalCondition)
        else
            Farms[Name]("OneClick",TotalCondition)
        end
        
    end
end)
Farms["Race Evolve"] = LPH_JIT_MAX(function (Force)
    Type = "Race Evolve"
    StatusFarming = "Ready To Evolve Race"
    if not LP.Data.Race:FindFirstChild("Evolved") then
        if ProgressChecker.RaceV2.DoneRace == nil then
            RaceV2Progress()
        end

        if not ProgressChecker.RaceV2.DoneRace then 
            RaceV2Progress()
            if not StartRace  then
                local args = {
                    [1] = "Alchemist",
                    [2] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
           -- print("Started")
            end
            if not CheckItem("Flower 2") then
                local Attempt = 0
                while not CheckItem("Flower 2") and task.wait(0.1)  do
                    StatusFarming =  "Getting Flower 2"
                    DoTween2(game.Workspace:FindFirstChild("Flower2").CFrame)
                    Attempt=Attempt+1
                    task.wait(2)
                    if Attempt>= 5 then
                        break 
                    end
                end
                if Attempt>= 5 and not CheckItem("Flower 2") then
                    MainServerHop(5,"Error Flower 2 [Race Evolve]")
                end
            end
            if not CheckItem("Flower 1") and game.Workspace:FindFirstChild("Flower1").Transparency ~= 1 then
                local Attempt = 0

                while not CheckItem("Flower 1") and game.Workspace:FindFirstChild("Flower1").Transparency ~= 1 and task.wait(0.1) do
                    StatusFarming =  "Getting Flower 1"
                    DoTween2(game.Workspace:FindFirstChild("Flower1").CFrame)
                    Attempt=Attempt+1
                    task.wait(2)
                    if Attempt>= 5 then
                        break 
                    end                
                end
                if Attempt>= 5 and not CheckItem("Flower 1") then
                    MainServerHop(5,"Error Flower 1 [Race Evolve]")
                end
            end
            if not CheckItem("Flower 3") then 
                local Condition = function ()
                    return not CheckItem("Flower 3") and not (not CheckItem("Flower 1") and game.Workspace:FindFirstChild("Flower1").Transparency ~= 1 )
                end
                while Condition() and task.wait(0.1) do 
                    Farms.Material("Ectoplasm",Force or Type,Condition)
                end
            end
            if CheckItem("Flower 3") and CheckItem("Flower 2") and CheckItem("Flower 1") then
                local args = {
                    [1] = "Alchemist",
                    [2] = "3"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
            end
        end
    else
        while FuncsRequirement["Race Evolve"]() and task.wait(0.1) do
            local Start = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1")
            if Start == 0 then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","2")
            end

            if Start == 1 and RaceV3Func[LP.Data.Race.Value] then
                print("Calling")
                RaceV3Func[LP.Data.Race.Value](Force == "OneClick")
            end
            if Start == 2 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
            end
        end
    end
end)
Farms["Doflamingo"] = function ()
    local Doflamingo = game.Workspace.Enemies:FindFirstChild("Don Swan")
    if IsAlive(Doflamingo) and SwanDoor.Check() then
        SSS(GetNearSpawn(getRoot(Doflamingo).Position))
        while IsAlive(Doflamingo) and task.wait(0.1) do
            StatusFarming = "Farming Doflamingo"
            AttackMob(Doflamingo,nil)
        end        
    end
end
Farms["Red Key"] = function ()

    while Alive() and CheckItem("Red Key") and not CanAwakenDough() and wait(0.5) do
        pcall(function()
            Equip("Red Key")
            pcall(function()
                workspace.Map.CakeLoaf.RedDoor.Part.Size = Vector3.new(20,20,20)
            end)
            pcall(function()
                workspace.Map.CakeLoaf.RedDoor.Size = Vector3.new(20,20,20)
            end)
            DoTween2(CFrame.new(-2681.85522, 64.5855331, -12851.9971, 0.0693147331, -8.22019004e-08, 0.997594833, -4.90588299e-08, 1, 8.58087859e-08, -0.997594833, -5.48886518e-08, 0.0693147331))
        end)
    end
end
Farms["Sea 3"] = function ()
    local args = {
        [1] = "ZQuestProgress",
        [2] = "Begin"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    wait(3)
    ThirdSeaProgress()
    local RipIndra = game.Workspace.Enemies:FindFirstChild("rip_indra")
    if IsAlive(RipIndra) and not ProgressChecker.Sea3.FakeRipIndra then
        StatusFarming = "Attacking Rip Indra"

        local Task = task.spawn(function()
            while task.wait(1) do 
                ThirdSeaProgress()
            end 
        end)
        local Condition = function ()
            return GetDistance(RipIndra,LP.Character) <= 1000 and not ProgressChecker.Sea3.FakeRipIndra 
        end
        while IsAlive(RipIndra) and Alive()  and task.wait(0.1) and Condition() do
            AttackMob(RipIndra,nil,Condition)
        end        
        if Task then
            task.cancel(Task)
            Task=nil 
        end
    end
    ThirdSeaProgress()
end
Farms["Awaken Fruit"] = function()
    if getgenv().Setting.OneClick.Enable and WorkingFarmEmpty() then
        Farms["Raid"]("OneClick")
    end
end
Farms["Minimum Fragment"] = function ()
    while MinFragment and LP.Data.Fragments.Value < MinFragment and  (FruitFunc.GetFruitBelow1M() or  #FruitFunc.HaveFruitInv() >= 1 ) and task.wait() and getgenv().Setting.OneClick.Enable and WorkingFarmEmpty() do
        Farms["Raid"]("OneClick")
    end
end
Farms["Spawn Rip Indra"] = function(Force,Condition)
    local Type = "Spawn Rip Indra"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if HakiFunc.CanOpenPad() and HakiFunc.CanOpenPad()[2] then 
        StatusFarming = "Spawning Rip Indra [Equip]"
        Equip("God's Chalice")
        StatusFarming = "Spawning Rip Indra [TP]"
        pcall(TpNearestEntrance,PlacesPosition.CenterCastle)


        task.wait(0.2)
        DoTween2(PlacesPosition.SpawnRipIndra)
        StatusFarming = "Spawning Rip Indra [Fire]"
        __FireTouchInterest(getRoot(LP.Character),game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection,0)
        task.wait()
        __FireTouchInterest(getRoot(LP.Character),game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection,1)
        task.wait(4) --Wait For Add Auto Rip Indra 
    end
end
Farms["Spawn Black Beard"] = function(Force,Condition)
    local Type = "Spawn Black Beard"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CheckItem("Fist of Darkness") then
        StatusFarming = "Spawning Black Beard"
        LP.Character.Humanoid.Sit = false
        while Alive() and (getRoot(LP.Character).Position-Vector3.new(3781.985107421875, 14.8506498336792, -3498.081298828125)).magnitude >= 10 and task.wait(0.1) do
            DoTween2(CFrame.new(3781.985107421875, 14.8506498336792, -3498.081298828125))
        end
        Equip("Fist of Darkness")
        task.wait(0.2)
        pcall(function()
            pcall(function()
                __FireTouchInterest(getRoot(LP.Character),game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,0)
                task.wait()
                __FireTouchInterest(getRoot(LP.Character),game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,1)
            end)
            task.wait()

            pcall(function()
                __FireTouchInterest(LP.Character["Fist of Darkness"].Handle,game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,0)
                task.wait()
                __FireTouchInterest(LP.Character["Fist of Darkness"].Handle,game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,1)
            end)
            
        end)
        task.wait(4) --Wait For Add Auto Black Beard
    end
end
Farms["Black Beard"] = function(Force,Condition)
    local Type = "Black Beard"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local BlackBeard = game.Workspace.Enemies:FindFirstChild("Darkbeard")
    if IsAlive(BlackBeard) then
        while IsAlive(BlackBeard) and task.wait(0.1) and CanFarm() do
            StatusFarming = "Attacking Black Beard"
            AttackMob(BlackBeard,nil)
        end        
    end
    Floating(false)
end
Farms["YoruV3"] = function(Force,Condition)
    local Type = "YoruV3"
    Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local Sea2Funcs = {"StartSeaEvents","SeaBeast","Ship"}
    for i,v in pairs(Sea2Funcs) do
        SeaEventsController[v] = "Race Evolve"
    end
    while Condition() and not CheckItem("Fist of Darkness") do
        task.wait(1)
    end
    for i,v in pairs(Sea2Funcs) do
        SeaEventsController[v] = nil
    end
    if CheckItem("Fist of Darkness") and Condition() then 
        DoTween2(CFrame.new(-384.03524780273, 73.020072937012, 353.2282409668))
    end
    while CheckItem("Fist of Darkness") and Condition and task.wait(0.1) do 
        if getgenv().Setting.YoruV3.Upgrade then 
            local Players = GetPlayers()
            local SP = Players[getgenv().Setting.YoruV3.SelectedPlayer]
            if SP then 
                local Found = false
                for i,v in pairs(SP.Backpack:GetChildren()) do 
                    if v.Name == "Fist of Darkness" then 
                        Found = true
                    end
                end
                for i,v in pairs(SP.Character:GetChildren()) do 
                    if v.Name == "Fist of Darkness" then 
                        Found = true
                    end
                end

                if Found then 
                    DoTween2(CFrame.new(-5725.2001953125, 48.4801139831543, -771.5950317382812))
                end
                local BlackBeard = game.Workspace.Enemies:FindFirstChild("Darkbeard")

                if BlackBeard then
                    fireclickdetector(game:GetService("Workspace").Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
                end
            end
        else
            local Players = GetPlayers()
            local SP = Players[getgenv().Setting.YoruV3.SelectedPlayer]
            if SP then 
                local Found = false
                for i,v in pairs(SP.Backpack:GetChildren()) do 
                    if v.Name == "Fist of Darkness" then 
                        Found = true
                    end
                end
                for i,v in pairs(SP.Character:GetChildren()) do 
                    if v.Name == "Fist of Darkness" then 
                        Found = true
                    end
                end

                if Found and GetDistance(SP.Character,Vector3.new(-5725.2001953125, 48.4801139831543, -771.5950317382812)) <= 100 then
                    Farms["Spawn Black Beard"](Force or Type,CanFarm)
                end
            end
        end
    end
end
Farms["Tushita"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "Tushita"
    Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local MyCondition = function()
        return IsAlive(game.Workspace.Enemies:FindFirstChild("rip_indra True Form")) and CanFarm()
    end
    
    if game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then 
        if MyCondition() then
            StatusFarming = "Doing Tushita Quest"
            --local DoorHitbox = game:GetService("Workspace").Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox
            --5712.98681640625, 18.041336059570312, 253.65997314453125
            repeat wait()
                StatusFarming = "Doing Tushita Quest [Wait Alive]"

            until Alive()
            for i=1,10 do
                pcall(function()
                    LP.Character.HumanoidRootPart.CFrame = CFrame.new(5712.98681640625, 18.041336059570312, 253.65997314453125)
                end)
                
                task.wait()
            end
            repeat wait()
                StatusFarming = "Doing Tushita Quest [Tweening To Door]"
                pcall(function()
                    SSS(GetNearSpawn(Vector3.new(5712.98681640625, 18.041336059570312, 253.65997314453125)))
                    DoTween2(Vector3.new(5712.98681640625, 18.041336059570312, 253.65997314453125))
                end)
            until CheckItem("Holy Torch") or not MyCondition()
            if CheckItem("Holy Torch") then
                repeat wait()
                    StatusFarming = "Doing Tushita Quest [Equipping]"
                    pcall(function()

                        Equip("Holy Torch")
                    end)
                until LP.Character and LP.Character:FindFirstChild("Holy Torch") and CheckItem("Holy Torch")
                local QuestTorches = false
                repeat wait()
                    StatusFarming = "Doing Tushita Quest [Doing Quest Torhces]"
                    --[[
                    for i,v in pairs(game:GetService("Workspace").Map.Turtle.QuestTorches:GetChildren()) do
                        wait()
                        if v:FindFirstChild("TouchInterest") then
                            pcall(function()
                                --DoTween2(v.CFrame)
                                wait()
                                LP.Character.HumanoidRootPart.CFrame = v.CFrame 
                                Click()
                                __FireTouchInterest(LP.Character["Holy Torch"].Handle, v, 0)
                                wait()
                                __FireTouchInterest(LP.Character["Holy Torch"].Handle, v, 1)
                            end)
                        end
                                        
                    end]]
                    
                    local TushitaQuest = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TushitaProgress")

                    for i,v in TushitaQuest.Torches do 
                        if not v then 
                            task.spawn(function()
                                game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("TushitaProgress", "Torch", i)
                            end)
                        end
                    end
                    QuestTorches = true
                until not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") or not CheckItem("Holy Torch") or not MyCondition()
                if QuestTorches then 
                    game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate"):Destroy()
                end
            end
        end
    elseif not CheckInvItem("Tushita") then
        local Longma = game.Workspace.Enemies:FindFirstChild("Longma")
        if IsAlive(Longma) then
            StatusFarming = "Killing Longma"
            SSS(GetNearSpawn(getRoot(Longma).Position))
            while IsAlive(Longma) and task.wait(0.1) and CanFarm() do
                AttackMob(Longma,nil)
            end        
            task.wait(2)
        end
    end
end)
Farms["Tushita Hop__1"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "Tushita Hop__1"
    Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if not Sea3 then
        Travel("Sea3")
    end
    if game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then 
        
        local MyCondition = function ()
            return not IsAlive(game.Workspace.Enemies:FindFirstChild("rip_indra True Form")) and CanFarm()
        end
        Farms.Elite(Force or Type)
        Farms["Collect Chest"](Force or Type,MyCondition,true)
        if CheckItem("God's Chalice") then
            Farms["Open Pad"](Force or Type,MyCondition)
            Farms["Spawn Rip Indra"](Force or Type,MyCondition)
            task.wait(1)
        end
    end
    Farms["Tushita"](Force or Type,CanFarm)
    task.wait(0.5)
    if not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") and not IsAlive(game.Workspace.Enemies:FindFirstChild("Longma")) then 
        MainServerHop(5,"Find New Server [Tushita Hop 1]")
    end
end)

Farms["Black Beard Hop"] = function(Force,Condition)
    local Type = "Black Beard Hop"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if not Sea2 then
        Travel("Sea2")
    end
    local MyCondition = function ()
        return not IsAlive(game.Workspace.Enemies:FindFirstChild("Darkbeard")) and CanFarm()
    end
    Farms["Collect Chest"](Force or Type,MyCondition,true)
    if CheckItem("Fist of Darkness") then
        Farms["Spawn Black Beard"](Force or Type,CanFarm)
        task.wait(1)
    end
    Farms["Black Beard"](Force or Type,CanFarm)
    if MyCondition() then
        MainServerHop(5,"Find New Server [Black Beard Hop]")
    end
end
Farms["Rip Indra"] = function(Force,Condition)
    local Type = "Rip Indra"
    StatusFarming = "Killing Rip Indra"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local RipIndra = game.Workspace.Enemies:FindFirstChild("rip_indra True Form")
    if IsAlive(RipIndra) then
        pcall(TpNearestEntrance,PlacesPosition.CenterCastle)

        while IsAlive(RipIndra) and task.wait(0.1) and CanFarm() do
            AttackMob(RipIndra,nil)
        end        
    end
end
Farms["Rip Indra Hop"] = function(Force,Condition)
    local Type = "Rip Indra Hop"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if not Sea3 then
        Travel("Sea3")
    end
    local MyCondition = function ()
        return not IsAlive(game.Workspace.Enemies:FindFirstChild("rip_indra True Form")) and CanFarm()
    end
    Farms.Elite(Force or Type)
    Farms["Collect Chest"](Force or Type,MyCondition,true)
    Farms.Elite(Force or Type)
    if CheckItem("God's Chalice") then
        Farms["Open Pad"](Force or Type,CanFarm)
        Farms["Spawn Rip Indra"](Force or Type,CanFarm)
        task.wait(1)
    end

    Farms["Rip Indra"](Force or Type,CanFarm)
    if MyCondition() then
        MainServerHop(5,"Find New Server [Rip Indra Hop]")
    end
end
Farms["Tushita Hop"] = LPH_JIT_MAX(function(Force,Condition)
    Farms["Tushita Hop__1"]("OneClick")
end)
Farms["GetFruit"] = LPH_JIT_MAX(function (Force,Condition)
    local Type = "GetFruit"
    print("Condition:",Force)
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        --print("Stopped ", Force)
        return false
    end

    local a,b = pcall(function ()
        local Attempt = {}
        while task.wait(0.1) and CanFarm() and GetNearestFruit()  do
            local Fruit = GetNearestFruit() 
            if Fruit then 
                --| -2424.95556640625, 0.1520378142595291, -10135.8408203125
                StatusFarming = "Getting Fruit"
                Notify({
                    Text = "Getting Fruit",
                    Type2 = nil,
                    Delay = 5
                })  
                local Condition = function ()
                    return CanFarm() and Fruit and Fruit.Parent ~= nil and (Fruit.Parent == game:GetService("Workspace") or Fruit.Parent.Parent == game:GetService("Workspace")) and not (game.Players.LocalPlayer.Character:FindFirstChild(Fruit) or game.Players.LocalPlayer.Backpack:FindFirstChild(Fruit) )
                end
                if not Attempt[Fruit] then
                    Attempt[Fruit]=0
                end
                local FruitPart = GetFruitPart(Fruit)
                if Condition() and FruitPart then
                    if Attempt[Fruit] then 
                        Attempt[Fruit]=Attempt[Fruit]+1 
                    end
                    SSS(GetNearSpawn(FruitPart.Position))

                    DoTween2(FruitPart.CFrame,Condition,nil,{IgnoreSafeY=true})
                    task.wait(2)
                    StopTween()
                    Floating(false)
                    if Attempt[Fruit]>=5 then
                        Fruit:Destroy()
                    end
                end
            end
        end
    end)
    print("End Getting Fruit")
    if b then
        print(b)
    end
end)
local AllMapPosition = {}
local LastCollectedIslandChest = {}
for i,v in pairs(workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren()) do 
    AllMapPosition[v.Name]=v:GetChildren()[1]
    LastCollectedIslandChest[v.Name] = 0
end
Farms["Collect Chest"] = LPH_NO_VIRTUALIZE(function (Force,Condition,Hop)
    
    local Type = "Collect Chest"
    local Condition = Condition or function ()
        return true
    end
    local function StopChestReq()
        if   (CheckItem("God's Chalice") or CheckItem("Fist of Darkness") or CheckItem("Sweet Chalice"))  and not getgenv().Setting["Collect Chest"].IgnoreItem then
            if not Force then
                getgenv().Setting["Collect Chest"].Enable = false
                ElementsCollection["Sub Farming"]["Auto Chest"]:SetValue(false)
            end
            if getgenv().Setting.loc.Enable then
                TPToSafeZone() 
            end
            return true
        end
        return false
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true and not StopChestReq()
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true and not StopChestReq()
            end
        end 
        --print("Stopped ", Force)
        return false
    end
    local Chests = {}

    local ChestTillReset = 0
    local CheckTimeReset = tick()
    while CanFarm() and task.wait(0.2) do
        StatusFarming = "Collecting Chest"
        if #Chests == 0 then
            Chests = GetChests()
            if #Chests == 0 then
                local SmallestDist,SmallestPos,IslandName
                for i2,v2 in pairs(AllMapPosition) do
                    if tick()-LastCollectedIslandChest[i2] < 180 then
                        continue
                    end
                    if GetDistance(LP.Character,v2) < SmallestDist then 
                        SmallestDist=GetDistance(LP.Character,v2) 
                        SmallestPos=v2.Position
                        IslandName=i2
                    end
                
                    
                end
                LastCollectedIslandChest[IslandName]=tick()
                DoTween2(CFrame.new(SmallestPos))
            end
            continue
        end
        local lowestdist = math.huge
        local chest = nil
        for i,v in pairs(Chests) do
            if v then
                local distance = (v.Position - getRoot(LP.Character).Position).magnitude
                if distance < lowestdist then
                    lowestdist = distance
                    chest = v
                end
            end
        end
        if not chest then
            task.wait(0.1)
            continue
        end
        local NearChestTick
        
        while chest and chest.Parent and not chest:GetAttribute("IsDisabled") and #chest:GetChildren() > 0 and task.wait() and CanFarm() do
            if GetDistance(chest,LP.Character) <= 10 and not NearChestTick then 
                NearChestTick = tick()
            end
            if NearChestTick and tick()-NearChestTick>=2 then
                
                break 
            end
            LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            if getgenv().Setting["Collect Chest"].InstaTP then
                pcall(function ()
                    game.Players.LocalPlayer.Character:PivotTo(chest:GetPivot())

                end)
            else
                DoTween2(chest.CFrame,CanFarm)
            end
            --
            if Alive() then
                --game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
                --__FireSignal(chest.Touched,getRoot(LP.Character))
            end
            --spawn(function()
                    
                pcall(function()
                --    LP.Character.Humanoid:MoveTo(chest.Position)
                end)
                --game:service("VirtualInputManager"):SendKeyEvent(true, "Space", false,game)
				--game:service("VirtualInputManager"):SendKeyEvent(false, "Space",false, game)
            --end)
        end
        --task.wait(2)
        if chest and table.find(Chests,chest) then
            table.remove(Chests,table.find(Chests,chest))
            ChestCount = ChestCount + 1
            chest:SetAttribute("LastCollect",tick())
        end
        if getgenv().Setting["Collect Chest"].InstaTP then
            ChestTillReset=ChestTillReset+1
            if ChestTillReset>=5  or (tick() - CheckTimeReset >= 10) then 
                CheckTimeReset = tick()
                task.wait(0.5)
                if CanFarm()  then 
                    pcall(function()
                        LP.Character:FindFirstChild("Head"):Destroy()
                    end)
                    ChestTillReset=0
                end
            end
        end
        if ((Force and CanFarm() and Hop) or (not Force and getgenv().Setting["Collect Chest"].Hop))  and (ChestCount >= (getgenv().Setting["Collect Chest"].LimitChest or 60))  and CanFarm() then 

            MainServerHop(5,"Limit Chest Hop [Collect Chest]",1,5)
            
        end
    end
end)
Farms["Pirate Raid"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "Pirate Raid"
    local Mob =  GetNearMob(Type)
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CanFarm() then
        if IsAlive(Mob) then
            StatusFarming = "Farming Pirate Raid [Intilizing]" 
            local CoolDown = function()
                if not GetNearMob(Type) then
                    local Timer = tick()
                    while not GetNearMob(Type) and tick()-Timer<4 and CanFarm() do
                        task.wait(0.1)
                    end
                end
            end
            while CanFarm() and task.wait(0.1) and GetNearMob(Type) do
                StatusFarming = "Farming Pirate Raid[Found Mob]"

                SSS(GetNearSpawn(Vector3.new(-5418.51904, 312.803192, -2828.00854)))
                while CanFarm() and task.wait(0.1) and IsAlive(Mob) do
                    StatusFarming = "Farming Pirate Raid[Attack Mob]"
                    AttackMob(Mob,nil)
                    
                end
                CoolDown()
                Mob = GetNearMob(Type)
            end
        end
        
    end
    Floating(false)
end)
Farms["Raid Fruit Hop"] = LPH_JIT_MAX(function (Force, Condition)
    local Type = "Raid Fruit Hop"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CanFarm() then
        Farms["Pirate Raid"](Force or Type,Condition)
        Farms["GetFruit"](Force or Type,Condition)
        Farms["Pirate Raid"](Force or Type,Condition)
        task.wait(5)
        while #FruitFunc.HaveFruitInv() >= 1 do
            task.wait(1) 
            Farms["Raid"](Force or Type,Condition)
        end
        Farms["GetFruit"](Force or Type,Condition)
        Farms["Pirate Raid"](Force or Type,Condition)
        MainServerHop(5,"Find New Server [Raid Fruit Hop]")
    end
end)
Farms["Swan Door Hop"] = LPH_JIT_MAX(function (Force, Condition)
    local Type = "Swan Door Hop"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CanFarm() then
        Farms["Factory"](Force or Type,Condition)
        Farms["GetFruit"](Force or Type,Condition)
        Farms["Factory"](Force or Type,Condition)
        MainServerHop(5,"Find New Server [Swan Fruit Hop]")
    end
end)
Farms["Hybrid Fruit Hop"] = LPH_JIT_MAX(function (Force, Condition)
    local Type = "Hybrid Fruit Hop"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CanFarm() then
        if Sea3 then
            Farms["Pirate Raid"](Force or Type,Condition)
        elseif Sea2 then
            Farms["Factory"](Force or Type,Condition)
        end
        Farms["GetFruit"](Force or Type,Condition)
        if Sea3 then
            Farms["Pirate Raid"](Force or Type,Condition)
        elseif Sea2 then
            Farms["Factory"](Force or Type,Condition)
        end
        task.wait(5)
        if CanFarm() then
            MainServerHop(5,"Find New Server [Hydrid Fruit Hop]")
        end
    end
end)

Farms["Water Key"] = LPH_JIT_MAX(function (Force, Condition)
    local Type = "Water Key"
    local Condition = Condition or function ()
        return true and not DataSave.Unlocked.Sharkman
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true and not DataSave.Unlocked.Sharkman
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true and not DataSave.Unlocked.Sharkman
            end
        end 
        return false
    end
    local TideKeeper = GetMainEnemy("Tide Keeper")
    if IsAlive(TideKeeper) then
        SSS(GetNearSpawn(getRoot(TideKeeper).Position))
        while IsAlive(TideKeeper) and task.wait(0.1) and CanFarm() do
            StatusFarming = "Farming Water Key"
            AttackMob(TideKeeper,nil,CanFarm)
        end        
    end
    task.wait(1)
    while CheckItem("Water Key") and not DataSave.Unlocked.Sharkman and task.wait(0.1) do
        StatusFarming = "Using Water Key"
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
    end
end)
Farms["Library Key"] = LPH_JIT_MAX(function (Force, Condition)
    local Type = "Library Key"    
    local Condition = Condition or function ()
        return true and not DataSave.Unlocked.Deathstep
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true and not DataSave.Unlocked.Deathstep
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true and not DataSave.Unlocked.Deathstep
            end
        end 
        return false
    end
    local IceAdmiral = GetMainEnemy("Awakened Ice Admiral")
    local a,b = pcall(function()
        if IsAlive(IceAdmiral) then
            SSS(GetNearSpawn(getRoot(IceAdmiral).Position))
            while IsAlive(IceAdmiral) and task.wait(0.1) and CanFarm() do
                StatusFarming = "Farming Library Key"
                AttackMob(IceAdmiral,nil,CanFarm)
            end        
        end
    end)
    if b then
        print(b)
    end
    task.wait(1)
    while CheckItem("Library Key") and not DataSave.Unlocked.Deathstep and task.wait(0.1) do
        StatusFarming = "Using Library Key"
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("OpenLibrary")
    end  
end) 
Farms.Elite = LPH_JIT_MAX(function (Force,Condition)
    local Type = "Elite"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable  then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CanFarm() then
        local Mob = GetNearMob(Type)
        if IsAlive(Mob) then
            StatusFarming = "Farming Elite [Start]"
            TPToEntrance("Castle")
            DoTween2(CFrame.new(-5418.51904, 312.803192, -2828.00854),CanFarm)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")

            if CanFarm() and IsAlive(Mob)  then
                SSS(GetNearSpawn(getRoot(Mob).Position))
                while CanFarm() and task.wait(0.1) and IsAlive(Mob) do
                    AttackMob(Mob,nil,CanFarm)
                end
            end
            StatusFarming = "Farming Elite [End]"
        end

    end
    Floating(false)
end)
Farms["Elite Hop"] = LPH_JIT_MAX(function (Force,Condition)
    local Type = "Elite Hop"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable  then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CanFarm() then
        Farms["Elite"](Force or Type)
    end
    task.wait(2)
    if CheckItem("God's Chalice") then 
        if getgenv().Setting.SafeMode_GetGoodItem.Enable then
            TPToSafeZone()
        end
        getgenv().Setting[Force or Type].Enable = false
    else
        TrueServerHop()
    end
    Floating(false)
end)
local TyrantSpawnPoints = {
    CFrame.new(-16332.526367188, 158.07200622559, 1440.3249511719),
    CFrame.new(-16288.609375, 158.16700744629, 1470.3680419922),
    CFrame.new(-16245.412109375, 158.43699645996, 1463.3659667969),
    CFrame.new(-16212.46875, 158.16700744629, 1466.3439941406),
    CFrame.new(-16211.946289062, 158.07200622559, 1322.3979492188),
    CFrame.new(-16260.921875, 154.92100524902, 1323.6159667969),
    CFrame.new(-16297.059570312, 159.32299804688, 1317.2239990234),
    CFrame.new(-16335.096679688, 159.33399963379, 1324.8859863281),
}
Farms["Tyrant Skies"] = LPH_JIT_MAX(function(Force, Condition)
    local Type = "Tyrant Skies"
    local Condition = Condition or function()
        return true
    end
    local CanFarm = function()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else
            if getgenv().Setting[Force].Enable and Condition() then
                return true
            end
        end
        return false
    end
    if not CanFarm() then return end
    if not Sea3 then return end

    local Root = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not Root then return end

    -- Conta Eyes ativos no TikiOutpost
    local CheckEyes = function()
        local count = 0
        local TikiModel = game:GetService("Workspace").Map:FindFirstChild("TikiOutpost")
        if TikiModel then
            local IslandModel = TikiModel:FindFirstChild("IslandModel")
            if IslandModel then
                local eyePaths = {
                    IslandModel:FindFirstChild("Eye1"),
                    IslandModel:FindFirstChild("Eye2"),
                    IslandModel:FindFirstChild("IslandChunks") and IslandModel.IslandChunks:FindFirstChild("E") and IslandModel.IslandChunks.E:FindFirstChild("Eye3"),
                    IslandModel:FindFirstChild("IslandChunks") and IslandModel.IslandChunks:FindFirstChild("E") and IslandModel.IslandChunks.E:FindFirstChild("Eye4"),
                }
                for _, eye in ipairs(eyePaths) do
                    if eye and eye.Transparency ~= 1 then
                        count += 1
                    end
                end
            end
        end
        return count
    end

    local SupportMobs = {
        "Serpent Hunter",
        "Skull Slayer",
        "Isle Champion",
        "Sun-kissed Warrior",
    }

    local function GetAllAliveSupportMobs()
        local list = {}
        for _, MobName in ipairs(SupportMobs) do
            for _, mob in ipairs(Enemies:GetChildren()) do
                if mob.Name == MobName and IsAlive(mob) then
                    table.insert(list, mob)
                end
            end
        end
        return list
    end

    if CheckEyes() < 4 then
        local mobList = GetAllAliveSupportMobs()

        if #mobList == 0 then
            -- nver
            StatusFarming = "Waiting Mobs - Eyes: " .. CheckEyes() .. "/4"
            local TyrantPos = Vector3.new(-16268.287, 152.616, 1390.773)
            if (Root.Position - TyrantPos).Magnitude > 100 then
                StatusFarming = "Going To Tyrant of the Skies Area"
                DoTween2(CFrame.new(TyrantPos), CanFarm)
            end
            return
        end

        -- stupid
        for _, Mob in ipairs(mobList) do
            if not CanFarm() then break end
            if not IsAlive(Mob) then continue end 

            StatusFarming = "Killing " .. Mob.Name .. " [Eyes: " .. CheckEyes() .. "/4]"
            SSS(GetNearSpawn(getRoot(Mob).Position), CanFarm)

            while CanFarm() and task.wait(0.1) and IsAlive(Mob) do
                AttackMob(Mob, nil, CanFarm)
            end

            if CheckEyes() >= 4 then break end
        end

        if CheckEyes() < 4 then
            return
        end
    end

    if not CanFarm() then Floating(false) return end

    StatusFarming = "Eyes Ready! Summoning Tyrant of the Skies..."

    local bossSpawned = false

    while CanFarm() and not bossSpawned do
        for _, SpawnCFrame in ipairs(TyrantSpawnPoints) do
            if not CanFarm() then break end
            if IsAlive(Enemies:FindFirstChild("Tyrant of the Skies")) then
                bossSpawned = true
                break
            end

            local HRP = getRoot(LP.Character)
            if HRP then
                HRP.CFrame = SpawnCFrame
            end

            local arrived = false
            local waitStart = tick()
            while tick() - waitStart < 12 and CanFarm() and not arrived do
                local hrp = getRoot(LP.Character)
                if not hrp then break end
                if (hrp.Position - SpawnCFrame.Position).Magnitude <= 3 then
                    arrived = true
                    break
                end
                hrp.CFrame = SpawnCFrame
                task.wait(0.1)
            end

            if CanFarm() and arrived then
                for _, WeaponType in ipairs({"Melee", "Sword", "Gun"}) do
                    if not CanFarm() then break end
                    if IsAlive(Enemies:FindFirstChild("Tyrant of the Skies")) then
                        bossSpawned = true
                        break
                    end
                    local Tool = GetCurrentTool(WeaponType)
                    if Tool then
                        Equip(Tool.Name)
                        task.wait(0.1)
                        local Keys = WeaponType == "Melee" and {"Z","X","C"} or {"Z","X"}
                        for _, k in ipairs(Keys) do
                            if not CanFarm() then break end
                            if IsAlive(Enemies:FindFirstChild("Tyrant of the Skies")) then
                                bossSpawned = true
                                break
                            end
                            Press(k)
                            task.wait(0.3)
                        end
                    end
                    if bossSpawned then break end
                end
            end

            task.wait(0.1)
        end

        if IsAlive(Enemies:FindFirstChild("Tyrant of the Skies")) then
            bossSpawned = true
        end
    end

    VoidSkillController()

    if bossSpawned then
        local TyrantBoss = Enemies:FindFirstChild("Tyrant of the Skies")
        if IsAlive(TyrantBoss) then
            StatusFarming = "Farming Tyrant of the Skies"
            SSS(GetNearSpawn(getRoot(TyrantBoss).Position), CanFarm)
            while CanFarm() and task.wait(0.1) and IsAlive(TyrantBoss) do
                AttackMob(TyrantBoss, nil, CanFarm)
            end
            StatusFarming = "Tyrant of the Skies Killed"
        end
    end

    Floating(false)
end)
Farms["EatFruit"] = LPH_JIT_MAX(function()
    local Fruit = CheckEatAble()
    if Fruit then
        EatCurrentFruit(Fruit)
    end
end)
Farms["SnipeFruitOneClick"] = LPH_JIT_MAX(function()
    local __SnipeFruit,Type = CheckSnipeFruit()
    if Type == "Mirage" then
        if not IsPremium then
            return 
        end
        StatusFarming = 'Buying Fruit In Mirage'
        if MirageFunctions.GetMirageIsland() then
            MirageFunctions.TweenFruitDealer()
            if __SnipeFruit then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",__SnipeFruit,true)
            end
        end
    end
    if Type == "Normal" then 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",__SnipeFruit)

    end
end)
Farms["Cake Prince"] = LPH_JIT_MAX(function (Force,Condition,Mastery) 
    local Type = "Cake Prince"
    local Condition = Condition or function ()
        return true
    end
    local Katakuri = game.Workspace.Enemies:FindFirstChild("Cake Prince")
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if IsAlive(Katakuri) then
        
        local increment = 0
        local DISTANCE = 40
        getRoot(LP.Character).Size = Vector3.new(2,1,2)

        local NoClip = CreateSteppedLoop(NoclipLoop,"NoClipKatakuri")
        
        StatusFarming = "Start Killing Katakuri"
       -- SSS(GetNearSpawn(getRoot(Katakuri).Position))
        
        while IsAlive(Katakuri) and task.wait(0.1) and CanFarm() do
            TPKatakuriGate(Katakuri)
            StatusFarming = "Farming Katakuri"
            increment = increment + 18
            AttackMob(Katakuri,nil,nil,nil,nil,nil,{ForceNotMastery=true,Spin=increment})
            --pcall(AttackNoCD,Katakuri)
            
        end
        StatusFarming = "Killed Katakuri"
        DisconnectLoop(NoClip)
        getRoot(LP.Character).Size = Vector3.new(2,2,1)
    end 
    Floating(false)
end)

Farms["Dough King"] = LPH_JIT_MAX(function (Force,Condition,Mastery)
    local Katakuri = game.Workspace.Enemies:FindFirstChild("Dough King")
    local Type = "Dough King"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if IsAlive(Katakuri) then
        local increment = 0
        local DISTANCE = 40
        getRoot(LP.Character).Size = Vector3.new(2,1,2)
        
        while IsAlive(Katakuri) and task.wait(0.1) and CanFarm() do
            TPKatakuriGate(Katakuri)
            StatusFarming = "Farming Katakuri"
            increment = increment + 18
            --pcall(AttackNoCD,Katakuri)
            AttackMob(Katakuri,nil,nil,nil,nil,nil,{ForceNotMastery=true,Spin=increment})
        end
        getRoot(LP.Character).Size = Vector3.new(2,2,1)
    end 
    Floating(false)
end)
Farms["Trade Sweet Chalice Force"] = LPH_JIT_MAX(function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc")

end)
Farms["Dough King Force"] = LPH_JIT_MAX(function (Force,Condition,Mastery)
    local Type = "Dough King Force"
    StatusFarming = "Seting Things Up For Dough King"
    local function RemainKatakuriKills()
        local ok, result = pcall(function()
            return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",true)
        end)
        return (ok and result) or "0"
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local ConditionMust = function()
        local Katakuri = game.Workspace.Enemies:FindFirstChild("Cake Prince") or game.Workspace.Enemies:FindFirstChild("Dough King")
        return not IsAlive(Katakuri)
    end
    local Katakuri = game.Workspace.Enemies:FindFirstChild("Cake Prince") or game.Workspace.Enemies:FindFirstChild("Dough King")
    if IsAlive(Katakuri) then
        Farms[Katakuri.Name](Force or Type)
    end
    task.wait(1)
    local Remain = string.gsub(RemainKatakuriKills(), "%D", "")

    local Task = task.spawn(function()
        while task.wait(0.5) do
            Remain = string.gsub(RemainKatakuriKills(), "%D", "")
        end
    end)
    local Condition = function()
        return tonumber(Remain) and CheckItem("Sweet Chalice")
    end
    Farms.Katakuri(Force or Type,Condition)

    if  not tonumber(Remain) or tonumber(Remain) < 1 then
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CakePrinceSpawner")

    end
    Katakuri = game.Workspace.Enemies:FindFirstChild("Cake Prince") or game.Workspace.Enemies:FindFirstChild("Dough King")
    if IsAlive(Katakuri) then
        Farms[Katakuri.Name](Force or Type)

    end
    task.cancel(Task)



end)
Farms["Winter Event"] = LPH_JIT_MAX(function (Force, Condition, Mastery)
    if  Sea3 and IsPresentTime() then
        local Condition = Condition or function ()
            return true
        end
        local Type = "Winter Event"
        local CanFarm = function ()
            if not Force then
                if getgenv().Setting[Type].Enable then
                    return true
                end
            else 

                if getgenv().Setting[Force].Enable and Condition()  then
                    return true
                end
            end 
            return false
        end
        while task.wait(0.1) and IsPresentTime() and CanFarm() do
            StatusFarming = "Waiting Loot"
            pcall(function()

                SSS(GetNearSpawn(Vector3.new(-1080.3126220703125, 16.614643096923828, -14477.8828125)))
                repeat wait()
                until Alive() or not CanFarm() 
                DoTween2(CFrame.new(-1080.3126220703125, 16.614643096923828, -14477.8828125))
                if Alive() then
                    LP.Character.Humanoid:UnequipTools()
                end     

                for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
                    pcall(function()
                        if v.Name == "Present" then
                            pcall(function()
                                DoTween2(v.Root.CFrame)
                                wait(0.1)
                                fireproximityprompt(v:FindFirstChild("Box"):FindFirstChild("ProximityPrompt"),2,true)
                                spawn(function()
                                    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
                                        if v.Name == "Present" then 
                                            for i2,v2 in pairs(v:GetDescendants()) do
                                                pcall(function()
                                                    fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                end)
                                            end
                                        end
                                    end
                                end)
                                wait(1)
                            end)
                        end
                    end)
                end
            end)
        end
        --[[
        wait(2)
        local startpresent =  tick()

        repeat wait()
            StatusFarming = "Waiting Loot 2"
            if Alive() then
                LP.Character.Humanoid:UnequipTools()
            end
            for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
                pcall(function()
                    if v.Name == "Present" then
                        pcall(function()
                            DoTween(v.Root.CFrame)
                            wait(0.1)
                            fireproximityprompt(v:FindFirstChild("Box"):FindFirstChild("ProximityPrompt"),2,true)
                            spawn(function()
                                for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
                                    if v.Name == "Present" then 
                                        LPH_NO_VIRTUALIZE(function()
                                            for i2,v2 in pairs(v:GetDescendants()) do
                                                pcall(function()
                                                    fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                end)
                                            end
                                        end)()
                                    end
                                end
                            end)
                            wait(1)
                        end)
                    end
                end)
            end
        until tick() - startpresent  > 25]]
    end
end)
Farms["Multi Trial"] = LPH_JIT_MAX(function (Force,Condition,Mastery)
    MultiTrial_SetAccount()
    StatusFarming = "Multi Account Trial [Start]"
    
    getgenv().Setting.FullyAutoTrial.OneClick = true
    if LP.Name ~= MultiTrialManager.Main then 
        TrialManager.AutoReset = "OneClick" 
    end
    while MultiTrial_AllSet() and getgenv().Setting.OneClick.Enable do 
        task.wait()
    end
    StatusFarming = "Multi Account Trial [End]"
    ResetTrialManager()
    getgenv().Setting.FullyAutoTrial.OneClick = false
end)
Farms.Katakuri = LPH_JIT_MAX(function (Force,Condition,Mastery,TweenSetting,AttackSetting)
    local Type = "Katakuri"
    local Mob =  GetNearMob(Type)
    local AttackSetting = AttackSetting or {}
    local function RemainKatakuriKills()
        local ok, result = pcall(function()
            return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",true)
        end)
        return (ok and result) or "0"
    end
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return Condition()
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local SettingMastery = AttackSetting.Mastery or getgenv().Setting.Mastery.Enable
    if Mastery  then 
        
        MakeMasterySkill()
        SkillsController.Condition = function()
            if (AttackSetting.Mastery or getgenv().Setting.Mastery.Enable) and IsAlive(Mob) then
                
                local H = Mob:FindFirstChild("Humanoid")
                return H and H.Health <= H.MaxHealth* ( getgenv().Setting.Mastery.Health and (getgenv().Setting.Mastery.Health/100)  or (50/100)) and (AttackSetting.Mastery or getgenv().Setting.Mastery.Enable)
            end
            return false, Mob
        end
    end
    local ForceRemoveFloating = tick()

    while CanFarm() and task.wait(0.1) do
        if SettingMastery then
            getgenv().MasteringWeapon = true
        end
        if GetSettingHopExploiter() then 
            HopNearExploiter()
        end
        local Katakuri = game.Workspace.Enemies:FindFirstChild("Cake Prince") or game.Workspace.Enemies:FindFirstChild("Dough King")
        local Remain = string.gsub(RemainKatakuriKills(), "%D", "")
        if IsAlive(Katakuri) then
            Farms[Katakuri.Name](Force or Type)

        elseif  not tonumber(Remain) or tonumber(Remain) < 1 then
            if Alive() and CheckItem("Sweet Chalice") then
                Equip("Sweet Chalice")
            end
            if  Alive() and (CheckItem("Sweet Chalice") and LP.Character:FindFirstChild("Sweet Chalice")) or not CheckItem("Sweet Chalice") then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CakePrinceSpawner")
            end
            
        else
            if tick()-ForceRemoveFloating>=5 then
                Floating(false)
                ForceRemoveFloating=tick()
            end
            if getgenv().Setting.AcceptQuest_Bone_Katakuri.Enable and LP.Data.Level.Value >= 2275 and (not LP.PlayerGui.Main.Quest.Visible or not string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Head Baker")) then
                local QuestCFrame = CFrame.new(-1927.91602, 37.7981339, -12842.5391)
                if Alive() then
                    StatusFarming = "[Katakuri] Getting Quest"
                    SSS(GetNearSpawn(QuestCFrame.Position), CanFarm)
                    while getgenv().Setting.AcceptQuest_Bone_Katakuri.Enable and not SafeGetQuest(QuestCFrame,"CakeQuest2",2,true) and CanFarm()  and task.wait(0.5) do
                        DoTween2(QuestCFrame,CanFarm)
                    end
                    Floating(false)
                end
            end
            if IsAlive(Mob) then
                SSS(GetNearSpawn(Vector3.new(-2138.746826171875, 69.98304748535156, -12322.69140625)), CanFarm)
                local _ , err= pcall(function()
                    while IsAlive(Mob) and task.wait(0.1) and CanFarm() do
                        StatusFarming = "Farming Dimension Mob " .. tostring(IsAlive(Mob)) .. " " .. tostring(Mob.Parent.Name)
                        AttackMob(Mob,Mastery,nil,nil,nil,TweenSetting,AttackSetting)
                        
                        if not Mastery then
                            if SetTimer(Mob,CanFarm) then
                                
                                break 
                            end
                        end
                    end
                    StatusFarming = "Done Attack Dimension Mob"
                end)
                if err then 
                    print("Error Farming Dimension ", err)
                end
            else
                Floating(false)
            end
            if Mastery then
                getgenv().PosToHook = nil 
                getgenv().SilentAimPos = false
            end

            Mob = GetNearMob(Type)
            if not IsAlive(Mob) then
                StatusFarming = "[Katakuri] TP To Middle"
                SSS(GetNearSpawn(Vector3.new(-2138.746826171875, 69.98304748535156, -12322.69140625)), CanFarm)
                DoTween2(CFrame.new(-2138.746826171875, 69.98304748535156, -12322.69140625),CanFarm)
            end
        
        end
        
    end
    if Mastery then 
        getgenv().MasteringWeapon = false
        VoidSkillController()
    end
    if LP.CameraMaxZoomDistance <= 1 then 
        LP.CameraMaxZoomDistance = 200
        LP.CameraMinZoomDistance = 100
        LP.CameraMinZoomDistance = 0
    end
    Floating(false)
end)
Farms["Kill Aura"] = LPH_JIT_MAX(function (Name,Force,Condition)
    local Type = "Kill Aura"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable and CasualFarmEmpty() then
                return Condition()
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local Mob = GetNearest(Enemies:GetChildren())
    while not Alive() and task.wait(0.1) do 
    end
    if not getgenv().Setting["Kill Aura"].AnchorPosition then 
        getgenv().Setting["Kill Aura"].AnchorPosition = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
    end
    while CanFarm() and task.wait(0.1) do
        local AnchorPosition = ConvertStringToVector3(getgenv().Setting["Kill Aura"].AnchorPosition)
        local DistanceAnchor = getgenv().Setting["Kill Aura"].DistanceFromAnchor
        local Condition = function ()
            if not getgenv().Setting['Kill Aura'].AnchorTPBack or ( getgenv().Setting['Kill Aura'].AnchorTPBack and IsAlive(Mob) and GetDistance(Mob,AnchorPosition) <= DistanceAnchor) then
                return true 
            end
            return false
        end
        while not Alive() and task.wait(0.1) do 
        end
        
        if getgenv().Setting['Kill Aura'].AnchorTPBack and GetDistance(LP.Character,AnchorPosition) > DistanceAnchor then 
            DoTween2(CFrame.new(AnchorPosition))
        end
        while IsAlive(Mob) and Condition() and task.wait(0.1) and CanFarm() do
            
            StatusFarming = "Kill Aura Mob"
            AttackMob(Mob,nil,Condition)
            if SetTimer(Mob,CanFarm,Condition) then
                break 
            end
        end 
        Mob = GetNearest(Enemies:GetChildren())
        if not Condition() then 
            for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do 
                if not Condition() then 
                    if GetDistance(v,AnchorPosition) <= DistanceAnchor then
                        DoTween2(v.CFrame)
                        task.wait()
                        Mob = GetNearest(Enemies:GetChildren())
                    end
                else 
                    break
                end
            end
        end
    end
    Floating(false)
end)
Farms["Material"] = LPH_JIT_MAX(function (Name,Force,Condition)
    local Type = "Material"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable and CasualFarmEmpty() then
                return true
            end
        else 
  
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end 
    local CheckMob = Name or getgenv().Setting.Material.Select
    if not CheckMob then 
        return 
    end
    while CanFarm() and task.wait(0.3) do 
        StatusFarming = "Farming Material: ".. CheckMob
        if table.find(GameData.MaterialFarm.CheckBoss,CheckMob) then
            if Alive() then
                MyMaterialMob = GameData.MaterialFarm.CheckBoss[CheckMob]["IsBoss"]()
                if CurrentPlaceKey~= GameData.MaterialSeaChecker[CheckMob] then
                    MainTravel(5,"Farm Material Sea 2","Sea2")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                end
                while CanFarm() and task.wait(0.1) and IsAlive(MyMaterialMob) and Alive() do
                    AttackMob(MyMaterialMob,nil)
                end
            end
        else
            if CurrentPlaceKey~=GameData.MaterialSeaChecker[CheckMob] then
                return Travel(GameData.MaterialSeaChecker[CheckMob])
            end
            if Alive() then
                MyMaterialMob = GetNearMob("Material",CheckMob)
                if  IsAlive(MyMaterialMob) then
                    while CanFarm() and task.wait(0.1) and IsAlive(MyMaterialMob) and Alive() do
                        AttackMob(MyMaterialMob,nil)
                    end

                else
                    local CurThing = GameData.MaterialFarm.CheckMob[CheckMob].Pos
                    local Pos = (typeof(CurThing) == "table" and CurThing[math.random(1,#CurThing)] or CurThing) 
                    DoTween2(Pos)
                end
            end
        end
    end
    Floating(false)
end)
Farms["Mirror Fractal Hop"] = LPH_JIT_MAX(function (Force,Condition)
    local Type = "Mirror Fractal Hop"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local MyCondition = function ()
        return not CheckItem("God's Chalice") and not CheckItem("Sweet Chalice")  and CanFarm() and not IsAlive(game.Workspace.Enemies:FindFirstChild("Dough King"))
    end
    if not CheckItem("God's Chalice") and not CheckItem("Sweet Chalice")  then
        Farms.Elite(Force or Type)
        Farms["Collect Chest"](Force or Type,MyCondition)
        Farms.Elite(Force or Type)
    end
    task.wait(1)
    if not CheckItem("God's Chalice") and not CheckItem("Sweet Chalice")  and  MyCondition() and not IsAlive(game.Workspace.Enemies:FindFirstChild("Dough King")) then
        MainServerHop(5,"Find New Server [Mirror Fractal Hop]",1,5)
    end
end)
Farms["Valkyrie Helm Hop"] = LPH_JIT_MAX(function (Force,Condition)
    local Type = "Valkyrie Helm Hop"
    Farms["Rip Indra Hop"](Force or Type)
end)
Farms["Mirage Snipe Fruit"] = LPH_JIT_MAX(function ()
    if not IsPremium then
        return 
    end
    StatusFarming = 'Buying Fruit In Mirage'
    if MirageFunctions.GetMirageIsland() then
        MirageFunctions.TweenFruitDealer()
        __SnipeFruit = GetMirageSnipeFruit()
        if __SnipeFruit then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",__SnipeFruit,true)
        end
    end
end)
Farms["CDK"] = LPH_JIT_MAX(function(Force, Condition)
    local Type = "CDK"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
  
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end 
    print("Called")
    if Sea3 and not CheckInvItem("Cursed Dual Katana") then
        --[[
        if not (DataSave["LockedMas"].Tushita and DataSave["LockedMas"].Yama) then 
            if not DataSave["LockedMas"].Tushita then 
                print("Tushita CDK")
                local Tushita = LP.Backpack:FindFirstChild("Tushita") or LP.Character:FindFirstChild("Tushita")
                if not Tushita then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
                    task.wait(0.5)
                end
                Tushita = LP.Backpack:FindFirstChild("Tushita") or LP.Character:FindFirstChild("Tushita")
                local function TushitaCondition()
                    if Tushita and Tushita:FindFirstChild("Level") then
                        StatusFarming = "CDK: Farm Tushita Mas To 350"
                        
                        if Tushita.Level.Value <= 349 then
                            
                        else
                            DataSave.LockedMas.Tushita = true
                        end
                        return not DataSave.LockedMas.Tushita
                    end
                end

                Farms["Bone"](Force or Type,TushitaCondition)
                    
                
            elseif not DataSave["LockedMas"].Yama then 
                print("Yama CDK")
                local Yama = LP.Backpack:FindFirstChild("Yama") or LP.Character:FindFirstChild("Yama")
                if not Yama then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Yama")
                    task.wait(0.5)
                end
                Yama = LP.Backpack:FindFirstChild("Yama") or LP.Character:FindFirstChild("Yama")
                local function YamaCondition()
                    if Yama and Yama:FindFirstChild("Level") then
                        StatusFarming = "CDK: Farm Yama Mas To 350"
                        
                        if Yama.Level.Value <= 349 then
                        else
                            DataSave.LockedMas.Yama = true
                        end
                        return not DataSave.LockedMas.Yama
                    end
                end
                Farms["Bone"](Force or Type,YamaCondition)
                print("Finished")
            end
        else --Copy Paste From Old Script ]]
            local CurrentProgress = CDKProgress()
            print(CurrentProgress)
            if  CurrentProgress.Good == 4 and (CurrentProgress.Evil == 3 or CurrentProgress.Evil == 4) then
                while not CheckInvItem("Cursed Dual Katana") and task.wait() do
                    StatusFarming = "Doing CDK Quest"
                    local BossCheck = game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss")

                    if not IsAlive(BossCheck) then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Boss")
                        task.wait(1)
                        DoTween2(CFrame.new(-12341.874, 603.320435, -6550.25439, -0.0560340174, 0.391986638, 0.918262839, 0.0466610044, 0.919731021, -0.389766037, -0.997337937, 0.021006912, -0.0698267147))
                        for i,v in pairs(game:GetService("Workspace").Map.Turtle.Cursed:GetChildren()) do
                        if v:FindFirstChild("ProximityPrompt") then
                                DoTween2(CFrame.new(-12396.498046875, 603.3455810546875, -6502.42529296875))
                                task.wait()
                                Click()
                                fireproximityprompt(v:FindFirstChild("ProximityPrompt"))

                                task.wait(0.5)
                            end
                        end
                    end
                    BossCheck = game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss")
                    local HaveCDK = false
                    local TaskCheck = task.spawn(function()
                        while task.wait(1) do 
                            HaveCDK = CheckInvItem("Cursed Dual Katana")
                        end
                    end)
                    while IsAlive(BossCheck) and task.wait(0.1) and not CheckInvItem("Cursed Dual Katana") and not HaveCDK do
                        pcall(function()
                            local RequiredSword = LP.Character:FindFirstChild("Yama") or LP.Character:FindFirstChild("Tushita") or LP.Backpack:FindFirstChild("Tushita") or LP.Backpack:FindFirstChild("Yama")
                            if RequiredSword then
                                Equip(RequiredSword.Name)
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
                            end 
                            AttackMob(BossCheck,nil,nil,nil,nil,nil,{IgnoreEquip=true})
                        end)
                    end
                    if TaskCheck then
                        task.cancel(TaskCheck)
                    end
                end
            else
                if CurrentProgress.Good <= 3 and CurrentProgress.Good ~= -2 and CurrentProgress.Good ~= 4 then
                    CDKIntilize.Good()
                    if CurrentProgress.Good == -3 then
                        while CDKProgress().Good == -3 and task.wait(0.1) do
                            StatusFarming = "Doing Good Scroll Quest 1"
                            VipBoatSeller =  {
                                Vector3.new(-369.5069885253906, 6.72995138168335, 5190.7490234375),
                                Vector3.new(-9530.9677734375, 7.219417095184326, -8375.255859375),
                                Vector3.new(-6126.13427734375, 16.507905960083008, -2251.77294921875),
                                Vector3.new(3234.83349609375, 9.432059288024902, 1602.18212890625),
                                Vector3.new(-9549.828125, 21.1048641204834, 4685.52099609375),
                                Vector3.new(-963.3128662109375, 7.767618179321289, -10813.1796875),
                                Vector3.new(-1933.908447265625, 8.048836708068848, -11475.19921875),
                                Vector3.new(-1933.908447265625, 8.048836708068848, -11475.19921875),
                                Vector3.new(2222.73291015625, 5.336240768432617, -6261.203125),
                            }
                            for i,v in pairs(VipBoatSeller) do
                                if CDKProgress().Good ~= -3 then
                                    break
                                end
                                while Alive() and (getRoot(LP.Character).Position-v).magnitude > 10 and task.wait(0.2) do
                                    
                                    DoTween2(CFrame.new(v))
                                end
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                            end
                        end                
                    elseif CurrentProgress.Good == -4 then
                        Farms["Pirate Raid"](Force or Type)
                    elseif CurrentProgress.Good == -5 then
                        StatusFarming = "Doing Good Scroll Quest 3"
                        StopTween()
                        if not Dimensions.Heaven() then
                            local BossToFarm = GetMainEnemy("Cake Queen")
                            if IsAlive(BossToFarm) then
                                StatusFarming = "Doing Good Scroll Quest 3"

                                SSS(GetNearSpawn(getRoot(BossToFarm).Position))
                                pcall(Equip,GetCurrentTool("Melee",true))
                                while IsAlive(BossToFarm) and task.wait(0.1) do
                                    AttackMob(BossToFarm)
                                end
                                local lancuoi = tick()
                                repeat wait()
                                until Dimensions.Heaven() or tick() - lancuoi > 5
                                while Dimensions.Heaven() and task.wait() do
                                    pcall(function()

                                        if Dimensions.Heaven() then
                                            StopTween()
                                            if (getRoot(LP.Character).Position-game:GetService("Workspace").Map.HeavenlyDimension:FindFirstChild("Exit").Position).magnitude>2000 then
                                                wait(5)
                                            end
                                            if game:GetService("Workspace").Map["HeavenlyDimension"]:FindFirstChild("Exit") and #game:GetService("Workspace").Map.HeavenlyDimension:FindFirstChild("Exit"):GetChildren() >= 2 then
                                                DoTween2(game:GetService("Workspace").Map["HeavenlyDimension"]:FindFirstChild("Exit").CFrame)
                                            else
                                                local MobCDK = CDKIntilize.GetMob()
                                                if IsAlive(MobCDK) then
                                                    while IsAlive(MobCDK) and Alive() and task.wait(0.1) do 
                                                        AttackMob(MobCDK)
                                                    end
                                                elseif Dimensions.Heaven() then
                                                    for i,v in pairs(game:GetService("Workspace").Map.HeavenlyDimension:GetChildren()) do
                                                        if string.find(v.Name,"Torch") and v:FindFirstChild("Particles") and v:FindFirstChild("Particles"):FindFirstChild("Main") and not v:FindFirstChild("Particles"):FindFirstChild("Main").Enabled then
                                                            if CDKIntilize.GetMob() then
                                                                break
                                                            end
                                                            DoTween2(v.CFrame)
                                                            Click()
                                                            task.wait(0.5)
                                                            fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                            task.wait(2)
                                                            fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                            task.wait(2)
                                                            pcall(Equip,GetCurrentTool("Melee",true))
                                                        end
                                                    end
                                                end
                                                if game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                                                    pcall(DoTween2,game:GetService("Workspace").Map["HeavenlyDimension"]:FindFirstChild("Exit").CFrame)
                                                end
                                            end
                                        end
                                    end)
                                end
                            else
                                MainServerHop(5,"Find Cake Boss [Auto CDK]")
                            end
                        end

                            
                        if Dimensions.Heaven() and (getRoot(LP.Character).Position-game:GetService("Workspace").Map.HeavenlyDimension:FindFirstChild("Exit").Position).magnitude>2000 then
                            wait(5)
                        end

                        while Dimensions.Heaven() and task.wait() do
                            pcall(function()
                                if game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                                    StopTween()
                                    if (getRoot(LP.Character).Position-game:GetService("Workspace").Map.HeavenlyDimension:FindFirstChild("Exit").Position).magnitude>2000 then
                                        wait(5)
                                    end
                                    if game:GetService("Workspace").Map["HeavenlyDimension"]:FindFirstChild("Exit") and #game:GetService("Workspace").Map.HeavenlyDimension.Exit:GetChildren() >= 2 then
                                        DoTween2(game:GetService("Workspace").Map["HeavenlyDimension"]:FindFirstChild("Exit").CFrame)
                                    else
                                        local MobCDK = CDKIntilize.GetMob()
                                        if IsAlive(MobCDK) then
                                            while IsAlive() and Alive() and task.wait(0.1) do
                                                AttackMob(MobCDK)
                                            end
                                        elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                                            for i,v in pairs(game:GetService("Workspace").Map.HeavenlyDimension:GetChildren()) do
                                                if string.find(v.Name,"Torch") and v:FindFirstChild("Particles") and v:FindFirstChild("Particles"):FindFirstChild("Main") and not v:FindFirstChild("Particles"):FindFirstChild("Main").Enabled then
                                                    if CDKIntilize.GetMob() then
                                                        break
                                                    end
                                                    DoTween2(v.CFrame)
                                                    Click()
                                                    task.wait(0.5)
                                                    fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                    task.wait(2)
                                                    fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                    task.wait(2)
                                                    pcall(Equip,GetCurrentTool("Melee",true))

                                                end
                                            end
                                        end
                                        pcall(DoTween2,game:GetService("Workspace").Map["HeavenlyDimension"]:FindFirstChild("Exit").CFrame)

                                    end
                                end
                            end)
                        end
            
                    end
                else
                    CDKIntilize.Evil()
                    while CDKProgress().Evil == -3 or CDKProgress().Evil == -4 do
                        if CDKProgress().Evil == -3 then
                            StatusFarming = "Doing Evill Scroll Quest 1"
                            SSS(GetNearSpawn(Vector3.new(-2138.746826171875, 69.98304748535156, -12322.69140625)))
                            DoTween2(CFrame.new(-2138.746826171875, 69.98304748535156, -12322.69140625))
                            while CDKProgress().Evil == -3 and task.wait(1) do
                                local NearMob = GetNearest(Enemies:GetChildren())
                                if IsAlive(NearMob)  then
                                    if Alive() then
                                        --ResizeHRP(NearestMob,true)
                                        LP.Character.Humanoid:UnequipTools()
                                        TP(NearMob,Vector3.new(0,0,-3))
                                    end
                                else 
                                    SSS(GetNearSpawn(Vector3.new(-2138.746826171875, 69.98304748535156, -12322.69140625)))
                                    DoTween2(CFrame.new(-2138.746826171875, 69.98304748535156, -12322.69140625))
                                end
                            end
                        end
                        while CDKProgress().Evil == -4 and task.wait(1) do
                            repeat wait()
                            until LP.QuestHaze
                            if Alive()  then
                                for i,v in pairs(LP.QuestHaze:GetChildren()) do
                                    --print(v.Name,v.Value)
                                    if v.Value ~= 0 then
                                        print("Selected "..v.Name,v.Value)     
                                        while not (v.Value == 0 or v.Value == "0" ) and CDKProgress().Evil == -4 and task.wait(0.2) do
                                            local HazeMob = GetNearMob(v.Name)
                                            print("Can CDK " .. v.Name, v.Value == 0 or v.Value == "0" )
                                            if IsAlive(HazeMob) then
                                                print("dang Kill Haze Mob "..HazeMob.Name)
                                                SSS(GetNearSpawn(getRoot(HazeMob).Position))
                                                while IsAlive(HazeMob) and task.wait(0.1) do
                                                    AttackMob(HazeMob,nil,nil,nil,true)
                                                end
                                            else
                                                print("Finding Enemy Spawns: ", v.Name)
                                                for i3,v3 in pairs(GameData.SpawnPosition[CurrentPlaceKey]) do
                                                    if IsAlive(GetNearMob(v.Name)) then
                                                        break 
                                                    end
                                                    if v.Value == 0 or v.Value == "0" then
                                                        break
                                                    end
                                                    if string.find(i3,v.Name) then 
                                                        print("Found " .. i3)
                                                        for i2,v2 in pairs(v3) do
                                                            SSS(GetNearSpawn(ConvertStringToVector3(v2)))
                                                            DoTween2(CFrame.new(ConvertStringToVector3(v2))*CFrame.new(0,40,0))
                                                            print("Tweening ",GetNearMob(v.Name))
                                                            Floating(true)
                                                            if GetNearMob(v.Name) then
                                                                break 
                                                            end
                                                            if v.Value == 0 or v.Value == "0" then
                                                                break
                                                            end
                                                        end

                                                    end

                                                end
                                                for i2,v2 in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                                                    if v.Value == 0 or v.Value == "0" then
                                                        break
                                                    end
                                                    if IsAlive(GetNearMob(v.Name))  then
                                                        break 
                                                    end
                                                    if string.find(v2.Name,v.Name)  then
                                                        SSS(GetNearSpawn(v2.Position))
                                                        print("Dang Tween Toi Point")
                                                        DoTween2(v2.CFrame*CFrame.new(0,40,0))  
                                                        Floating(true)
                                                    end

                                                end
                                            end    
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if CDKProgress().Evil == -5 then
                        
                        local ConditionFarmBone = function() 
                            return CanFarm() and (IsAlive(game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper")) or CheckItem("Hallow Essence") or Dimensions.Hell()) and (Force and WorkingFarmEmpty() or not Force)
                        end
                        if not ConditionFarmBone() then 
                            Farms["Bone"](Force or Type,ConditionFarmBone)
                        end
                        while (IsAlive(game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper")) or CheckItem("Hallow Essence") or Dimensions.Hell()) and CDKProgress().Evil == -5 and task.wait() do

                            StatusFarming = "Doing Evil Scroll Quest 3"

                                pcall(function()
                                if Alive() then
                                    if Dimensions.Hell() then
                                        StopTween()
                                        if not game:GetService("Workspace").Map.HellDimension:FindFirstChild("Exit") then
                                            wait(3)
                                        end
                                        if (getRoot(LP.Character).Position-game:GetService("Workspace").Map.HellDimension:FindFirstChild("Exit").Position).magnitude>2000 then
                                            wait(5)
                                        end
                                        pcall(Equip,GetCurrentTool("Melee",true))
                                        if game:GetService("Workspace").Map.HellDimension and game:GetService("Workspace").Map.HellDimension:FindFirstChild("Exit") and #game:GetService("Workspace").Map.HellDimension:FindFirstChild("Exit"):GetChildren() >= 2
                                        and CDKProgress().Evil == -5 then
                                            DoTween2(game:GetService("Workspace").Map.HellDimension:FindFirstChild("Exit").CFrame)
                                            wait(3)
                                        else
                                            local MobCDK = CDKIntilize.GetMob()
                                            if IsAlive(MobCDK) then

                                                while IsAlive(MobCDK) and Alive() and task.wait(0.1) do 
                                                    AttackMob(MobCDK)
                                                end
                                            elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                                                for i,v in pairs(game:GetService("Workspace").Map.HellDimension:GetChildren()) do
                                                    if string.find(v.Name,"Torch") and v:FindFirstChild("Particles") and v:FindFirstChild("Particles"):FindFirstChild("Main") and not v:FindFirstChild("Particles"):FindFirstChild("Main").Enabled then
                                                        if CDKIntilize.GetMob() then
                                                            break
                                                        end
                                                        
                                                        DoTween2(v.CFrame)
                                                        Click()
                                                        task.wait(0.5)
                                                        fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                        task.wait(2)
                                                        fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                        task.wait(2)
                                                        pcall(Equip,GetCurrentTool("Melee",true))
                                                    end
                                                end
                                                if game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                                                    pcall(DoTween2,game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
                                                end
                                            end


                                        end

                                    else
                                        local SoulReaper = game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper")
                                        if  IsAlive(SoulReaper) and not game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                                            repeat wait()
                                                if Alive() and not game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                                                    Floating(true)
                                                    -- HitBoxPlr()
                                                    LP.Character.Humanoid:UnequipTools()
                                                    TP(SoulReaper,Vector3.new(0, 0, -3))
                                                end
                                            until not IsAlive(SoulReaper) or not Alive() or  CDKProgress().Evil ~= -5
                                            or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                            repeat wait()
                                            until Dimensions.Hell() or tick() - lancuoi > 5
                                            while Dimensions.Hell() and task.wait() and CDKProgress().Evil == -5 do
                                                if game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                                                    StopTween()
                                                    if (getRoot(LP.Character).Position-game:GetService("Workspace").Map.HellDimension:FindFirstChild("Exit").Position).magnitude>2000 then
                                                        wait(5)
                                                    end
                                                    if game:GetService("Workspace").Map["HellDimension"]:FindFirstChild("Exit") and #game:GetService("Workspace").Map.HellDimension:FindFirstChild("Exit"):GetChildren() >= 2 and CDKProgress().Evil == -5 then
                                                        DoTween2(game:GetService("Workspace").Map["HellDimension"]:FindFirstChild("Exit").CFrame)
                                                    else
                                                        local MobCDK = CDKIntilize.GetMob()
                                                        if IsAlive(MobCDK) then

                                                            while IsAlive(MobCDK) and Alive() and task.wait(0.1) do 
                                                                AttackMob(MobCDK)
                                                            end
                                                        elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                                                            for i,v in pairs(game:GetService("Workspace").Map.HellDimension:GetChildren()) do
                                                                if string.find(v.Name,"Torch") and v:FindFirstChild("Particles") and v:FindFirstChild("Particles"):FindFirstChild("Main") and not v:FindFirstChild("Particles"):FindFirstChild("Main").Enabled then
                                                                    if CDKIntilize.GetMob() then
                                                                        break
                                                                    end
                                                                    
                                                                    DoTween2(v.CFrame)
                                                                    Click()
                                                                    task.wait(0.5)
                                                                    fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                                    task.wait(2)
                                                                    fireproximityprompt(v:FindFirstChild("ProximityPrompt"),2,true)
                                                                    task.wait(2)
                                                                    pcall(Equip,GetCurrentTool("Melee",true))

                                                                end
                                                            end
                                                            if game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                                                                pcall(DoTween2,game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        elseif CheckItem("Hallow Essence") then
                                            repeat
                                                wait() 
                                                DoTween2(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) 
                                            until
                                                (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 
                                                or game:GetService("Workspace").Map:FindFirstChild("HellDimension")                
                                            Equip("Hallow Essence") 
                                            wait(4)
                                        end
                                    end
                                else repeat wait()
                                    until Alive() 
                                end 
                                
                            end)
                        end
                    end
                end
            end
        --end
    end
end)
Farms["Open Pad"] = LPH_JIT_MAX(function ()
    OpenPad()
end)
Farms["Full Dough King"] = LPH_JIT_MAX(function (Force,Condition)
    local Type = "Full Dough King"
    local Mob =  GetNearMob(Type)
    local function RemainKatakuriKills()
        local ok, result = pcall(function()
            return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",true)
        end)
        return (ok and result) or "0"
    end
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable and CasualFarmEmpty() then
                return true
            end
        else 
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CheckItem("Sweet Chalice") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then 
        Farms.Katakuri(Force or Type)
    else
        local Cocoa = GetMaterial("Conjured Cocoa") 
        if Cocoa < 10 then 
            Farms.Material("Conjured Cocoa",Force or Type)
        elseif GetNearMob("Elite") then
            Farms.Elite(Force or Type)
        elseif not CheckItem("Sweet Chalice") and CheckItem("God's Chalice") and Cocoa >= 10 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc") 
        else
            local Con = function ()
                return not CheckItem("God's Chalice")
            end
            Farms.Katakuri(Force or Type,Con)
        end
    end
    Floating(false)
end)
Farms["Factory"] = LPH_JIT_MAX(function(Force,Condition)
    local Core = game.Workspace.Enemies:FindFirstChild("Core")
    local Type = "Factory"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if IsAlive(Core) then
        SSS(GetNearSpawn(getRoot(Core).Position))
        while IsAlive(Core) and task.wait(0.1) and CanFarm() do
            StatusFarming = "Farming Factory"
            AttackMob(Core,nil,nil)
            --pcall(AttackNoCD,Core)
        end
        task.wait(2)
    end 
    Floating(false)
end)
Farms["Sea 2 Key Hop"] = LPH_JIT_MAX(function(Force,Condition)
    MainServerHop(5,"Find New Server [Sea 2 Key Hop]")
end)
Farms["Material Soul Guitar"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "Material Soul Guitar"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if DataSave.Unlocked.SoulGuitar  and not CheckInvItem("Skull Guitar") then
        if  (not RequirementGuitar["1"] or not RequirementGuitar["2"])  then 
            StatusFarming = "Farming Skull Guitar Material"
            print("In Skull Guitar Material")
            if Sea2 or (RequirementGuitar["1"] or GetMaterial("Ectoplasm") >= 250)then
                if RequirementGuitar["1"] or  GetMaterial("Ectoplasm") >= 250 then
                    RequirementGuitar["1"] = true
                    if RequirementGuitar["2"] or GetMaterial("Bones") >= 500 then
                        RequirementGuitar["2"] = true
                    else
                        if Sea3 then
                            MaterialToFarm = "Bones"
                        else
                            Travel("Sea3")
                        end
                    end

                else
                    MaterialToFarm = "Ectoplasm"
                end
            else
                MainTravel(5,"Farm Material Soul Guitar Sea 2","Sea2")
            end
            repeat wait()
            until (MaterialToFarm and RequirementGuitar[MaterialToFarm]) or (RequirementGuitar["1"] and RequirementGuitar["2"]) or CheckInvItem("Skull Guitar")
            print(MaterialToFarm)
            local MyCondition = function ()
                return MaterialToFarm and  (GetMaterial(MaterialToFarm) < RequirementGuitar[MaterialToFarm]) and CanFarm()
            end
            print("Start Farming Skull Guitar Material")
            if RequirementGuitar[MaterialToFarm] then
                Farms["Material"](MaterialToFarm,Force or Type,MyCondition)
            end
        end
        if RequirementGuitar["1"] and RequirementGuitar["2"] and GetMaterial("Dark Fragment") == 0 then
            StatusFarming = "Farming Dark Fragment Hop"
            print("Skull Guitar Dark Fragment Hop")
            Farms["Black Beard Hop"](Force or Type)
        end
        if RequirementGuitar["1"] and RequirementGuitar["2"] and GetMaterial("Dark Fragment") >=1 then 
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy")
        end
    end
    Floating(false)
end)
Farms["Citizen Quest"] = LPH_JIT_MAX(function(Force, Condition, Hop)
    local Type = "Citizen Quest"
    local Condition = Condition or function ()
        return true
    end  
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    CitizenQuest()
    if ProgressChecker["Citizen Quest"].Hat then
        if not Force then 
            getgenv().Setting["Citizen Quest"].Enable = false
        end
        return 
    end
    if LP.Data.Level.Value >= 1800 then 
        if CanFarm() then

            if not ProgressChecker["Citizen Quest"].Bandit then
                if  not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Forest Pirate") then
                    Statusfarming = "Citizen Quest: Getting Quest"
                    while not SafeGetQuest(CFrame.new(-12445.064453125, 332.37817382812, -7672.3803710938),"CitizenQuest",1,true) and CanFarm() and task.wait(0.1) do 
                        DoTween2(CFrame.new(-12445.064453125, 332.37817382812, -7672.3803710938))
                    end
                elseif  Alive() then
                    local MobToFarm = GetNearMob("Forest Pirate")
                    if IsAlive(MobToFarm) then
                        Statusfarming = "Citizen Quest: Bandit"
                        SSS(GetNearSpawn(getRoot(MobToFarm).Position))
                        while IsAlive(MobToFarm) and task.wait(0.1) and CanFarm() do 
                            AttackMob(MobToFarm)
                        end
                    else
                        SSS(GetNearSpawn(Vector3.new(-13353.8974609375, 331.95819091796875, -7789.15283203125)))
                        DoTween2(CFrame.new(-13353.8974609375, 331.95819091796875, -7789.15283203125))
                    end
                end
            end
            CitizenQuest()
            if ProgressChecker["Citizen Quest"].Bandit and not ProgressChecker["Citizen Quest"].ElephantBoss then 
                local CE =  game.Workspace.Enemies:FindFirstChild("Captain Elephant")
                if IsAlive(CE) then
                    Statusfarming = "Citizen Quest: Elephant"
                    SSS(GetNearSpawn(getRoot(CE).Position))
                    while IsAlive(CE) and CanFarm() and task.wait(0.1) do
                        AttackMob(CE)
                    end

                elseif getgenv().Setting["Citizen Quest"].Hop then
                    MainServerHop(5,"Find Saber Mob [Citizen Quest Hop]")
                end
            end
            CitizenQuest()
            if ProgressChecker["Citizen Quest"].ElephantBoss and not ProgressChecker["Citizen Quest"].Hat then 
                Statusfarming = "Citizen Quest: Getting Hat"
                DoTween2(CFrame.new(-12513.0078125, 336.3670654296875, -9871.84765625))
            end
        end
    end
    Floating(false)
end)
Farms["Soul Guitar"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "Soul Guitar"
    local Condition = Condition or function ()
        return true
    end  
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CheckInvItem("Skull Guitar") then
        DataSave.Unlocked.SoulGuitar = true 
        return
    end
    while Sea3 and game:GetService("Lighting"):GetAttribute("MoonPhase") and 
    game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 and IsNight() and GetLevel() >= 2300 and not DataSave.Unlocked.SoulGuitar and CanFarm() do 
        local MyGuitar = {
            "Swamp","Gravestones","Ghost","Pipes","Trophies"
        }   
        repeat wait()
        until Alive()
        SSS(GetNearSpawn(Vector3.new(-8652.076171875, 141.28460693359375, 6169.19091796875)))

        DoTween2(CFrame.new(-8652.076171875, 141.28460693359375, 6169.19091796875))
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2)

        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)

        if Alive() then
            LP.Character.Humanoid:UnequipTools()
        end
        local function GetZombie()
            local c=0
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Living Zombie" then
                    c=c+1 
                end
            end
            return c
        end
        GuitarProgress()
        local GuitarCheck = ProgressChecker.SoulGuitar
        if GuitarCheck then
            if  GuitarCheck.Swamp then
                if GuitarCheck.Gravestones then
                    if GuitarCheck.Ghost then
                        if GuitarCheck.Pipes then
                            if GuitarCheck.Trophies then
                                DataSave["Unlocked"].SoulGuitar = true
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Trophies")
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Pipes")
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Ghost")
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Gravestones")
                end
            else
                local BonePos = {
                    CFrame.new(-8736.5771484375, 143.10482788085938, 6034.9375),
                    CFrame.new(-9563.5947265625, 5.976134777069092, 6219.35546875),
                    CFrame.new(-10139.5380859375, 139.62667846679688, 5954.1865234375),
                }
                if game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") then
                    if Alive() then
                    LP.Character.Humanoid:UnequipTools()
                    end
                    while task.wait(1) and not GuitarCheck.Swamp and game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") and CanFarm() do
                        GuitarProgress()
                        if Alive() and not GuitarCheck.Swamp then
                            if GetZombie() >= 6  then
                                if (getRoot(LP.Character).Position-Vector3.new(BonePos[3])).magnitude < 50 then
                                    Floating(true)
                                    getRoot(LP.Character).CFrame = BonePos[3] * CFrame.new(0,20,0) 
                                else
                                    DoTween2(BonePos[3] * CFrame.new(0,20,0))
                                    Floating(true)
                                end        
                                BringCFrame = BonePos[3]
                                BringPos = BonePos[3].Position
                                BringMob("Specific","Living Zombie",nil,500)
                                task.wait(0.5)
                                pcall(Equip,GetCurrentTool("Melee",true))
                            else 
                                DoTween2(BonePos[3] * CFrame.new(0,100,0))
                            end 
                            wait(0.5)
                        end
                    end
                    if GuitarCheck.Swamp then
                    else
                        LP.Character.Humanoid:UnequipTools()
                        DoTween2(BonePos[3] * CFrame.new(0,100,0))
                    end
                else
                    LP.Character.Humanoid:UnequipTools()
                    DoTween2(BonePos[3] * CFrame.new(0,100,0))
                end
            end
        end
    end

end)

Farms['FullyRaceV4_Entrance'] = LPH_JIT_MAX(function(Force,Condition,Chip)
    local Type = "FullyRaceV4_Entrance" 
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local CurrentState = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Check") 
    local RaceV4Thing = {
        [1] = function ()
            StatusFarming ="Begin Race V4 Progrees"
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
        end,
        [2] = function ()
            StatusFarming ="Tweening To Big Tree"
            DoTween2(CFrame.new(3034.69921875, 2281.371826171875, -7323.568359375))
            wait(0.5)
            for i=1,5 do
                local args = {
                    [1] = "RaceV4Progress",
                    [2] = "Teleport"
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                wait()
            end
        end,
        [3] = function ()
            StatusFarming ="Continue Race V4"
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue") 
        end,
        
    }
    print("Calling")
    if CurrentState >=1 and CurrentState <4 then 
        for i=CurrentState,3 do 
            RaceV4Thing[i]()
            task.wait()
        end

        task.wait(0.5)
        CurrentState = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Check") 
        task.wait(1)
    end
    if CurrentState == 4 and MirageFunctions.GetMirageIsland() and GetMaterial("Mirror Fractal") >= 1 and CheckInvItem("Valkyrie Helm")
    and not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then 
        StatusFarming ="Getting Highest Mirage Place"
        
        if  MirageFunctions.GetMirageIsland() then
            local LookatMoonState = false
            local LookAtMoonThread = spawn(function()
            end)
            if not MirageFunctions.IsRendered() then 
                DoTween2(MirageFunctions.GetMirageIsland().WorldPivot.Position)
            end
            while CanFarm() and task.wait(0.5) and MirageFunctions.GetMirageIsland() and
             not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") do
                if MirageFunctions.GetGear() then 
                    StatusFarming = "Tweening To Gear"
                    MirageFunctions.TweenGear()
                    task.wait(0.5)
                    
                else
                    local GetHighestPlace = MirageFunctions.GetHighestPlace()

                    if  GetHighestPlace and GetDistance(GetHighestPlace.WorldPivot.Position+Vector3.new(0, 210, 0),LP.Character) >= 20 then

                    StatusFarming = "Tweening To Highest Mirage Place"
                        MirageFunctions.TweenHighestPlace()
                    else
                        --[[
                        while not IsNight() and CanFarm() and MirageFunctions.GetMirageIsland() do
                            StatusFarming = "Waiting For Night"
                            task.wait(0.1)
                        end]]
                        --IsNight() and

                        if  CanFarm() and MirageFunctions.GetMirageIsland() then
                            StatusFarming = "Looking At Moon + Using Skills"
                            MirageFunctions.LookAtMoon()
                            task.wait()
                            game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                            task.wait()
                            game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                            task.wait()
                        end
                        LP.CameraMaxZoomDistance = 200
                        LP.CameraMinZoomDistance = 100
                        LP.CameraMinZoomDistance = 0
                    end
                end
            end
        end
    else
        print("vai ca lon ?")
    end
end)
Farms["Law"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "Law"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end

    while CanFarm() and not CheckItem("Core Brain") and task.wait(0.1)  do
        local a,b = pcall(function()
            if not game.Workspace.Enemies:FindFirstChild("Order") then
                print("In not  Law")
                if not LP.Character:FindFirstChild("Microchip") then
                    SSS(GetNearSpawn(Vector3.new(-5570.052734375, 332.41363525391, -5965.91015625)))
                    repeat wait()
                    until Alive()
                else
                    DoTween2(CFrame.new(-5570.052734375, 332.41363525391, -5965.91015625))
                end

                if LP.Backpack:FindFirstChild("Microchip") or LP.Character:FindFirstChild("Microchip") then 
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector,1)
                    task.wait(3)
                elseif not LP.Backpack:FindFirstChild("Microchip") or not LP.Character:FindFirstChild("Microchip") then
                    
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "Microchip",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            else
                print("Found Law")
                local Law = game:GetService("Workspace").Enemies:WaitForChild("Order") 
                local Animationhit = {
                    "rbxassetid://4868943717","rbxassetid://4827018132","rbxassetid://4827008125","rbxassetid://4826993463"
                }
                local Dodge
                if Law:FindFirstChild("Humanoid") then
                    if  Law:FindFirstChild("Humanoid"):FindFirstChild("Animator") then
                        Dodge = Law.Humanoid.Animator.AnimationPlayed:Connect(function(v2)
                            if table.find(Animationhit,v2.Animation.AnimationId) then
                                if table.find(Animationhit,v2.Animation.AnimationId) == 1 then
                                    task.wait(0.5)
                                    spinninglaw = true
                                    task.wait(0.5)
                                    spinninglaw = false
                                else
                                    DodgingLaw = true
                                
                                    task.wait(0.5)
                                    if not DodgingLaw then
                                    else
                                        task.wait(0.5)
                                        DodgingLaw = false
                                    end
                                end
                                
                            end
                        end)
                    else
                        Dodge = Law:FindFirstChild("Humanoid").ChildAdded:Connect(function(v3)
                            if v3.Name == "Animator" then
                                v3.AnimationPlayed:Connect(function(v2)
                                    if table.find(Animationhit,v2.Animation.AnimationId) then
                                        if table.find(Animationhit,v2.Animation.AnimationId) == 1 then
                                            task.wait(0.5)
                                            spinninglaw = true
                                            task.wait(0.5)
                                            spinninglaw = false
                                        else
                                            DodgingLaw = true
                                        
                                            task.wait(0.5)
                                            if not DodgingLaw then
                                            else
                                                task.wait(0.5)
                                                DodgingLaw = false
                                            end
                                        end
                                        
                                    end
                                end)
                            end
                        end)

                    end 
                end
                local increment = 0
                local DISTANCE=40
                local trueOffset = 360 * 1
                while CanFarm() and task.wait(0.1) and IsAlive(Law) do
                    AttackMob(Law,nil,nil)
                    
                    while CanFarm() and DodgingLaw  and IsAlive(Law) and task.wait(0.1)do 
                        if spinninglaw then
                            increment = increment + 18
                            DoTween2(CFrame.new(getRoot(Law).Position.X + math.sin(math.rad(increment+trueOffset)) *DISTANCE
                            ,getRoot(Law).Position.Y + 100
                            ,getRoot(Law).Position.Z + math.cos(math.rad(increment+trueOffset)) * DISTANCE))  
                        elseif DodgingLaw then
                            TP(Law,Vector3.new(0, 100,0))
                        else
                            TP(Law,Vector3.new(0, 40,40))
                        end
                    end
                end
                --[[
                if Funcs.AutoLaw.AutoTPBack4 then
                    DoTween(CFrame.new(-5574.3642578125, 330.3705139160156, -5879.1630859375))
                elseif Funcs.AutoLaw.AutoTPBack3 then
                    DoTween(CFrame.new(-5582.32568359375, 330.3703918457031, -5892.3037109375))
                elseif Funcs.AutoLaw.AutoTPBack2 then 
                    DoTween(CFrame.new(-5582.89697265625, 330.3045349121094, -5909.03759765625))
                elseif Funcs.AutoLaw.AutoTPBack1 then
                    DoTween(CFrame.new(-5588.1884765625, 330.3704528808594, -5917.451171875))
                end]]
                if Dodge then
                    Dodge:Disconnect()
                    Dodge=nil
                end
                Floating(false)
                task.wait(1)
            end
        end)
        if b then
            print(b)
        end
    end
end)

Farms["Greybeard"] = function()
    local Greybeard = GetMainEnemy("Greybeard") 
    if IsAlive(Greybeard) then
        SSS(GetNearSpawn(getRoot(Greybeard).Position))
        while IsAlive(Greybeard) do
            AttackMob(Greybeard,nil)
        end     
        Floating(false)
    end
end
Farms["Pole"] = function()
    local ThunderGod = game.Workspace.Enemies:FindFirstChild("Thunder God")
    if IsAlive(ThunderGod) then
        SSS(GetNearSpawn(getRoot(ThunderGod).Position))
        while IsAlive(ThunderGod) do
            AttackMob(ThunderGod,nil)
        end     
        Floating(false)
    end
end
Farms["Fully Cyborg"] = LPH_JIT_MAX(function(Force, Condition)
    local Type = "Fully Cyborg"

    local Condition = Condition or function ()
        return true
    end
    local checkcyborg = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer","Check")
    if checkcyborg == true or checkcyborg == 2 then
        if not Force then 

            return
        end
    end
    if not Sea2 then
        Travel("Sea2")
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true and not FoundCyborg
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true and not FoundCyborg
            end
        end 
        return false
    end
    if not cyborgcheck then
        cyborgcheck = game:GetService("ReplicatedStorage").Remotes.CommE.OnClientEvent:Connect(function(p1,...)
            if p1=="Notify" then
                if string.find(...,"supply") then
                    print("Triggered")
                    UnlockedRaidLaw = true
                end
            end
        end)
    end
    local checkrunner = RunS.Stepped:Connect(function()
        local checkcyborg = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer","Check")
        if checkcyborg == true or checkcyborg == 2 then
            FoundCyborg = true 
        end
        task.wait(1)
    end)
    while CanFarm() and task.wait(0.1) do 
        local checkcyborg = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer","Check")
        if checkcyborg == true or checkcyborg == 2 then
            if cyborgcheck then
                cyborgcheck:Disconnect()
                cyborgcheck = nil
            end
            return
            --return Library:Notify("Auto Cyborg","You Already Have Cyborg Race")
        end
        task.wait()
        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector,1)
        task.wait(1)
        if CheckItem("Core Brain") and UnlockedRaidLaw then
            Equip("Core Brain")

            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        elseif UnlockedRaidLaw then
            local MyCondition = function ()
                return not CheckItem("Core Brain") and CanFarm()
            end
            Farms["Law"](Force or Type,MyCondition)
        elseif CheckItem("Fist of Darkness") and not UnlockedRaidLaw then
            Click()
            Equip("Fist of Darkness")
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector,1)
        elseif not UnlockedRaidLaw then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector,1)
            task.wait(1)
            if not UnlockedRaidLaw then
                local MyCondition = function ()
                    return not UnlockedRaidLaw and CanFarm()
                end
                Farms["Collect Chest"](Force or Type,MyCondition,true)
            end
        end
    end
    if checkrunner then
        checkrunner:Disconnect()
        checkrunner=nil 
    end
end)
Farms["Spawn Soul Reaper"] = LPH_JIT_MAX(function()
    if Sea3 and CheckItem("Hallow Essence") and not IsAlive(game.Workspace.Enemies:FindFirstChild("Soul Reaper")) then
        repeat wait()
        until Alive()
        StatusFarming = "Spawning Hallow Reaper"
        while Alive() and CheckItem("Hallow Essence") and task.wait(0.1) and (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - LP.Character.HumanoidRootPart.Position).Magnitude > 8 do
            wait() 
            DoTween2(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) 
        end
        Equip("Hallow Essence") 
        
        wait(2.5)
    end 
end)
Farms["Soul Reaper"] = LPH_JIT_MAX(function()
    local Type = "Soul Reaper"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local SoulReaper = game.Workspace.Enemies:FindFirstChild("Soul Reaper")
    if IsAlive(SoulReaper) then
        while IsAlive(SoulReaper) and task.wait(0.1) do
            --pcall(AttackNoCD,SoulReaper)
            AttackMob(SoulReaper,nil)
        end        
    end
end)
Farms["Travel Sea3"] = function()
    local State, Message, DebugMessage = FuncsRequirement["Travel Sea3"]()
    if State then
        MainTravel(10,"Sea3" .. DebugMessage or "None","Sea3")
    end
end
Farms["Raid"] = LPH_JIT_MAX(function (Force,Condition,Chip)
    
    if LP.Data.Level.Value >= 1100 then
        local Type = "Raid"
        StatusFarming = "Auto Raid Is Turned On"
        local PositionTween
        local NewIsland = false
        local DelayIsland = false
        local function NextIsland()
            
            local function GetNearestIsland()
                local IslandName = {
                    'Island 1',
                    'Island 2',
                    'Island 3',
                    'Island 4',
                    'Island 5',        
                }
                local Target 
                
                for i,v in pairs(IslandName) do 
                    for i2,v2 in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                        if v2.Name == v then 
                            local HRP = getRoot(LP.Character)
                            if (HRP.Position - v2.Position).Magnitude < 2500 then 

                                if Target then --//get nearest island
                                    if (HRP.Position - Target.Position).Magnitude > (HRP.Position - v2.Position).Magnitude then
                                        if v2.Name ~= Target then
                                            if i == 1 then
                                                NewIsland = true
                                            else
                                                NewIsland = false
                                            end
                                            DelayIsland = true

                                            Target = v2
                                        end
                                    end
                                else
                                    DelayIsland = true

                                    if i == 1 then
                                        NewIsland = true
                                    else
                                        NewIsland = false
                                    end
                                    Target = v2
                                end
                            end
                        end 
                    end
                end
                if Target then
                    if (getRoot(LP.Character).Position - Target.Position).Magnitude < 3000 then --//gioi han, phong truong hop lay nham island kk
                        if Target.Name == IslandName[1] then --neu island 1 thi tween cham hon ti neu ko la se bi loi~ kk
                            wait(1)
                        end                         
                        wait(0.1)
                        PositionTween = Target.CFrame
                        Target.Name = Target.Name..'Pass' --//doi ten de get nearest island deo check nua kk
                    end
                end
            end
            GetNearestIsland()
            if Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible then --//check enabled
                if not getgenv().Setting.Raid.NoDelay and DelayIsland and not NewIsland then
                    DelayIsland = false
                    task.wait(20)
                end
                if PositionTween then
                    DoTween2(PositionTween*CFrame.new(0,60,0))
                    Floating(true)
                end
            end
            
        end
        local Condition = Condition or function ()
            return true
        end
        local FruitAwaken = getgenv().Setting.OneClick.Enable and CanAwaken() and AutoChip[LP.Data.DevilFruit.Value]
        local CanFarm = function ()
            if not Force then
                if getgenv().Setting[Type].Enable then
                    return true
                end
            else 

                if getgenv().Setting[Force].Enable and Condition()  then
                    return true
                end
            end 
            return false
        end
        if CanFarm() then 
            local CanGetFruitUnder1m = getgenv().Setting.OneClick.Enable or getgenv().Setting.Raid.GetFruitUnder1M
            if #FruitFunc.HaveFruitInv() == 0 and (CanGetFruitUnder1m or Force == "OneClick") and FruitFunc.GetFruitBelow1M() then 
                print("Getting Fruit", FruitFunc.GetFruitBelow1M())
                StatusFarming = "Getting Fruit For Raid "..tostring(FruitFunc.GetFruitBelow1M())
                FruitFunc.IgnoreStoreFruit = FruitFunc.GetFruitBelow1M()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",FruitFunc.IgnoreStoreFruit)
                
                task.wait(0.5)
            end
            if getgenv().Setting.Raid.Awaken or getgenv().Setting.OneClick.Enable then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
            end
            if #FruitFunc.HaveFruitInv() >= 1 and not CheckItem("Special Microchip") then          
                print("Buy Chip")
                wait()
                local args = {
                    [1] = "RaidsNpc",
                    [2] = "Select",
                    [3] = FruitAwaken or (getgenv().Setting.Raid.Select == "" and  "Ice") or getgenv().Setting.Raid.Select or "Ice"
                    }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                task.wait(1)
            end
            FruitFunc.IgnoreStoreFruit= nil
            if CheckItem("Special Microchip") then
                pcall(function ()
                    LP.Character.Humanoid:UnequipTools()

                end)

                print("Click")
                local PartToClick, PositionPart
                local SuccessFound,Err
                if Sea3 then
                    TPToEntrance("Castle")
                    DoTween2(CFrame.new(-5034.16309, 314.9664, -2948.1499))
                    PositionPart = Vector3.new(-5039.41845703125, 315.0871887207031, -2946.552978515625)
                    task.wait(3)
                    SuccessFound,Err = pcall(function()
                        PartToClick = game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main

                        fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    end)
                    
                elseif Sea2 then
                    PositionPart = Vector3.new(-6438.73535, 250.645355, -4501.50684)
                    DoTween2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                    
                    --ClickOnPart(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main)
                    task.wait(3)
                    SuccessFound,Err= pcall(function()
                        PartToClick = game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main

                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    end)
                end
                if SuccessFound or  LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                    print("Clicked")
                    --[[
                    if not FixedFireClickDetector then
                        SSS(GetNearSpawn(PositionPart))
                        while GetDistance(LP.Character,PositionPart) >= 10 and task.wait(0.1) do

                            DoTween2(CFrame.new(PositionPart))
                        end
                    end
                    
                    local startanraid = tick()

                    while CanFarm() and CheckItem("Special Microchip") and task.wait(0.1) and not LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and tick() - startanraid < 15 do
                        StatusFarming = "Click Raid Button"
                        if not FixedFireClickDetector then
                            if GetDistance(LP.Character,PositionPart) >= 10 then
                                DoTween2(CFrame.new(PositionPart))
                            else
                                ClickOnPart(PartToClick)
                                pcall(function ()
                                    LP.Character.Humanoid:UnequipTools()
                
                                end)
                            end
                        else
                            fireclickdetector(PartToClick.ClickDetector)
                        end
                    end
                    task.wait(0.5)
                    if tick() - startanraid >= 15 then
                        startanraid = tick()
                        SSS(GetNearSpawn(PositionPart))
                        while GetDistance(LP.Character,PositionPart) >= 10 and task.wait(0.1) do

                            DoTween2(CFrame.new(PositionPart))
                        end
                    
                        SSS(GetNearSpawn(PositionPart))
                        while GetDistance(LP.Character,PositionPart) >= 10 and task.wait(0.1) do

                            DoTween2(CFrame.new(PositionPart))
                        end
                        while CanFarm() and CheckItem("Special Microchip") and task.wait(0.1) and not LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and tick() - startanraid < 15 do
                            StatusFarming = "Click Raid Button"
                            if GetDistance(LP.Character,PositionPart) >= 10 then
                                DoTween2(CFrame.new(PositionPart))
                            else
                                ClickOnPart(PartToClick)
                                pcall(function ()
                                    LP.Character.Humanoid:UnequipTools()
                
                                end)
                            end
                        end
                        if tick() - startanraid >= 15 then

                            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",game.JobId)
                        end
                    end
                    ]]
                    if CanFarm() then
                        wait(5.5) 
                    end
                    local Last = tick()
                    StatusFarming = "Wait Raid Timer"
                    print("Wait Timer")
                    while CanFarm() and not (tick() - Last > 15 or LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible) and task.wait(0.1) do
                    end
                    task.wait(0.5)
                    LastPositionI  = nil
                    print("TP")
                    while CanFarm() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible  and task.wait(0.1) do
                        StatusFarming = "Farm Raid"
                        pcall(Equip,GetCurrentTool("Melee",true))

                            local NearestMob;
                            local NearestDist = math.huge
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if IsAlive(v) and Alive() then
                                        if GetDistance(v,LP.Character) <= 2000 then
                                            NearestDist = GetDistance(v,LP.Character)
                                            NearestMob = v
                                        
                                        end
                                    end
                                end
                            
                            if not NearestMob then
                                local a,b = pcall(NextIsland)
                                if b then
                                    print(b) 
                                end
                            else
                                while Alive() and IsAlive(NearestMob) and GetDistance(NearestMob,LP.Character) <= 2000 and task.wait() do
                                    -- HitBoxPlr()
                                    pcall(function()

                                        pcall(Equip,GetCurrentTool("Melee",true))

                                        AttackMob(NearestMob,nil,nil,nil,true)
                                    end)
                                end
                            end
                    end
                    if getgenv().Setting.Raid.Awaken or (getgenv().Setting.OneClick.Enable and CanAwaken()) then 
                        task.wait(3)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
                    end
                    task.wait(10)
                    print("Finished Raid")
                end
            end
        end
    end
end)
Farms["Rainbow Haki"] = LPH_JIT_MAX(function(Force,Condition,Hop)
    local Type = "Rainbow Haki"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 

            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local RainbowQuest = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan")
    if RainbowQuest then
        if string.find(RainbowQuest,"1") then
            if not Force then
                getgenv().Setting[Type].Enable = false
            end
            return Notify({
                Text = "You Already Have Rainbow Haki",
                Type2 = nil,
                Delay = 5
            })   
        end
        function startrainbowquest()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
        end
        local ListBoss = {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate"}
        for i,v in pairs(ListBoss) do 
            if string.find(RainbowQuest,v) then 
                --DoTween(CFrame.new(-11888.973632812, 930.55096435547, -8759.3916015625))
                startrainbowquest()
                local BossToFarm = game:GetService("Workspace").Enemies:FindFirstChild(v) 
                if IsAlive(BossToFarm) then
                    while task.wait(0.2) and IsAlive(BossToFarm) and CanFarm() do
                        AttackMob(BossToFarm)
                    end
                elseif (getgenv().Setting["Rainbow Haki"].Enable and getgenv().Setting["Rainbow Haki"].Hop) or (CanFarm() and Hop) then
                    MainServerHop(5,"Find New Server [Rainbow Haki Hop]")
                end
                
                Floating(false)
                
            end
        end
    end
end)
Farms["God Human Material"] = LPH_JIT_MAX(function(Force,Condition,Hop)--For One Click
    local Type = "God Human Material"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if CanFarm() then 
        StatusFarming = "Farming God Human Material"
        if Sea2 or ((RequirementGod["1"] or GetMaterial("Mystic Droplet") >= 10) and (RequirementGod["2"] or GetMaterial("Magma Ore") >= 20)) then
            if RequirementGod["1"] or  GetMaterial("Magma Ore") >= 20 then
                RequirementGod["1"] = true
                if GetMaterial("Mystic Droplet") >= 10 then
                    RequirementGod["2"] = true
                    if Sea3 then
                        if RequirementGod["3"] or GetMaterial("Fish Tail") >= 20 then
                            RequirementGod["3"] = true
                            if RequirementGod["4"] or GetMaterial("Dragon Scale") >= 10 then        
                                RequirementGod["4"] = true    
                            else
                                MaterialToFarm = "Dragon Scale"
                            end
                        else
                            MaterialToFarm = "Fish Tail"
                        end
                    else
                        MainTravel(10,"Traveling Sea 3 To Farm Material [God Human Material]","Sea3")
                    end
                else
                    MaterialToFarm = "Mystic Droplet"
                end
            else
                MaterialToFarm = "Magma Ore"
            end
        else
            MainTravel(10,"Traveling Sea 2 To Farm Material [God Human Material]","Sea2")
        end
        repeat wait()
        until MaterialToFarm or DataSave.Unlocked.GodHuman
        local MyCondition = function ()
            return MaterialToFarm and  GetMaterial(MaterialToFarm) < RequirementGod[MaterialToFarm] and CanFarm() and WorkingFarmEmpty()
        end
        Farms["Material"](MaterialToFarm,Force or Type,MyCondition)
        
    end
end)
Farms["Items Farm Force"]  =  LPH_JIT_MAX(function(Force,Condition,Hop)
    for i,v in pairs(ListItemsBoss) do 
        if not StateItems_Boss[v] then
            StatusFarming = "Farming Items From Boss ["..tostring(v).."]"

            local Boss = GetMainEnemy(v) 

            if IsAlive(Boss) then
                SSS(GetNearSpawn(getRoot(Boss).Position))
                while IsAlive(Boss) do
                    AttackMob(Boss,nil)
                    task.wait()
                end     
                Floating(false)
            end
        end
    end

end)
Farms["Level Observation"] =  LPH_JIT_MAX(function(Force,Condition,Hop)
    local Type = "Level Observation"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if not game:GetService("CollectionService"):HasTag(LP.Character,"Ken") then
        Notify({
            Text = "You Dont Have Ken Haki",
            Type2 = nil,
            Delay = 5
        })            
        if not Force then
            getgenv().Setting[Type].Enable = false
        end
        return
    end
    local a = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("KenTalk", "Status")
    if a then
        local Lv = string.gsub(a, "%D", "")
        Notify({
            Text = "Current Haki Level: "..tostring(Lv),
            Type2 = nil,
            Delay = 5
        })       
        if tonumber(Lv) >= 5000 then           
            Notify({
                Text = "Maxed Ken Haki",
                Type2 = nil,
                Delay = 5
            })  
            if not Force then
                getgenv().Setting[Type].Enable = false
            end             
            return 
        end
    end
    if Alive() and LP:FindFirstChild("VisionRadius") then
    else
        return
    end
    local MobObservation,PosObservation --Old Script
    if Sea1 then
        MobObservation = "Galley Captain"
        PosObservation = CFrame.new(5533.29785, 88.1079102, 4852.3916)
    elseif Sea2 then
        MobObservation = "Snow Lurker"
        PosObservation = CFrame.new(5587.1064453125, 57.5491943359375, -6607.7607421875)
    elseif Sea3 then
        MobObservation = "Marine Commodore"
        PosObservation = CFrame.new(2451.812255859375, 27.0358829498291, -6489.86767578125)
    end
    if not ObservationManager.IsActive() then
        VU:CaptureController()
        VU:SetKeyDown('0x65')
        wait()
        VU:SetKeyUp('0x65')
    end
    if MobObservation ~= nil and PosObservation ~= nil then
        LP.Character.Humanoid:UnequipTools()

        if not game.Workspace.Enemies:FindFirstChild(MobObservation) then
            SSS(GetNearSpawn(PosObservation.Position))
            DoTween2(PosObservation)
        end
        if game.Workspace.Enemies:FindFirstChild(MobObservation) then
            SSS(GetNearSpawn(PosObservation.Position))
            while task.wait(0.1) and not ObservationManager.IsActive() and CanFarm() do
                Floating(true)
                if (getRoot(LP.Character).Position-game.Workspace.Enemies:FindFirstChild(MobObservation).HumanoidRootPart.Position).magnitude < 300 then
                    getRoot(LP.Character).CFrame = game.Workspace.Enemies:FindFirstChild(MobObservation).HumanoidRootPart.CFrame * CFrame.new(30,30,30)
                else
                    DoTween2(game.Workspace.Enemies:FindFirstChild(MobObservation).HumanoidRootPart.CFrame* CFrame.new(30,30,30))
                end
                if not ObservationManager.IsActive() then
                    VU:CaptureController()
                    VU:SetKeyDown('0x65')
                    task.wait(1)
                    VU:SetKeyUp('0x65')
                end
                
            end  
            Floating(false)
            if ObservationManager.IsActive() then
                DoTween2(game.Workspace.Enemies:FindFirstChild(MobObservation).HumanoidRootPart.CFrame* CFrame.new(3,0,0))
                while ObservationManager.IsActive() and CanFarm() and task.wait(0.1) do
                    if (getRoot(LP.Character).Position-game.Workspace.Enemies:FindFirstChild(MobObservation).HumanoidRootPart.Position).magnitude < 300 then
                        getRoot(LP.Character).CFrame = game.Workspace.Enemies:FindFirstChild(MobObservation).HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                    else
                        DoTween2(game.Workspace.Enemies:FindFirstChild(MobObservation).HumanoidRootPart.CFrame* CFrame.new(3,0,0))
                    end
                end
                task.wait(0.1)
                if (getgenv().Setting["Level Observation"].Enable and getgenv().Setting["Level Observation"].Hop) or (CanFarm() and Hop) then
                    MainServerHop(5,"Find New Server [Level Observation Hop]")
                end
                
            end
        end
    end
end)
Farms["BlackSmith"] = LPH_JIT_MAX(function(Force,Condition,Hop)
    local Type = "BlackSmith"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end    
    if not getgenv().Setting.BlackSmith.WeaponType then
        TypeSmith = "Sword"
    else
        TypeSmith = "Gun"
    end
    local CurrenToolBlackSmith = GetCurrentTool(TypeSmith,true)
    if CurrenToolBlackSmith then
        for i,v in pairs(AutoBlackSmithv1[GetCurrentTool(TypeSmith,true)]) do
            if CanFarm() and CurrenToolBlackSmith == GetCurrentTool(TypeSmith,true) and GetCurrentTool(TypeSmith).Upgrades.Value == 0  then
                if GetMaterial(i) < v then
                    if CurrentPlaceKey == GameData.MaterialSeaChecker[i] then
                        local MyCondition = function()
                            return CanFarm() and GetMaterial(i) < v and CurrenToolBlackSmith == GetCurrentTool(TypeSmith,true) and GetCurrentTool(TypeSmith).Upgrades.Value == 0
                        end
                        Farms["Material"](i,Force or Type,MyCondition)
                        
                    else
                        if GameData.MaterialSeaChecker[i] == "7449423635" then
                            Travel("Sea3")
                        elseif GameData.MaterialSeaChecker[i] ~= "2753915549" then
                            MainTravel(5,"Blacksmith Material Sea 2","Sea2")
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
                        end
                    end
                end
            end
        end
        if CanFarm() then   
            if not DataSave["BlackSmith"][GetCurrentTool(TypeSmith,true)] then
                if GetCurrentTool(TypeSmith).Upgrades.Value == 0 then
                    local CheckUpgrade = true
                    for i,v in pairs(AutoBlackSmithv1[GetCurrentTool(TypeSmith,true)]) do
                        if GetMaterial(i) < v then
                            CheckUpgrade=false
                            break
                        end
                    end
                    if CheckUpgrade then
                        if Sea3 then
                            DoTween2(CFrame.new(-354.525390625, 43.79094314575195, 5545.2412109375),CanFarm)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeItem","Upgrade",GetCurrentTool(TypeSmith))
                        else
                            Travel("Sea3")
                        end
                    end 
                else
                    DataSave["BlackSmith"][GetCurrentTool(TypeSmith,true)] = true  
                    if CanFarm() then
                        SwitchWeaponSmith(TypeSmith)
                    end
                end
            end
        end
    end
end)
Farms["Evolve Observation"] =  LPH_JIT_MAX(function(Force,Condition,Hop)
    local returner = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
    local returner2 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("KenTalk", "Status")
    if LP.Data.Level.Value >= 1800 then
        if returner2 and returner then
            if tonumber(returner2) and returner2 < 5000 then
                getgenv().Setting["Evolve Observation"].Enable = false
                return
            end 
            if returner == 3 then
                local returner = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
                if returner and returner == 0 then
                    getgenv().Setting["Evolve Observation"].Enable = false
                    return
                end
                local CollectedFruit = {}
                local FindApple,FindBanana,FindPineapple
                function CheckFruitObservationv2()
                    local flag = false
                    if Alive() then
                        if LP.Character:FindFirstChild("Apple") or LP.Backpack:FindFirstChild("Apple") then
                            FindApple = true
                        else 
                            if not game:GetService("Workspace").AppleSpawner:FindFirstChild("Apple") then
                                flag = true
                            end
                            FindApple = false
                        end
                        if LP.Character:FindFirstChild("Banana") or LP.Backpack:FindFirstChild("Banana") then
                            FindBanana = true
                        else 
                            if not game:GetService("Workspace").BananaSpawner:FindFirstChild("Banana") then
                                flag = true
                            end
                            FindBanana = false
                        end
                        if LP.Character:FindFirstChild("Pineapple") or LP.Backpack:FindFirstChild("Pineapple") then
                            FindPineapple = true
                        else 
                            if not game:GetService("Workspace").PineappleSpawner:FindFirstChild("Pineapple") then
                                flag = true
                            end
                            FindPineapple = false
                        end
                    end
                    return flag
                end
                if CheckFruitObservationv2() and getgenv().Setting["Evolve Observation"].Hop then
                    MainServerHop(5,"Find New Server [Evolve Observation Hop]")
                end
                pcall(function()
                    if not CheckItem("Fruit Bowl") then
                        if not FindApple and not DoingTweenObservationV2 then
                            local Apple = game:GetService("Workspace").AppleSpawner:FindFirstChild("Apple")
                            DoingTweenObservationV2 = true
                            if Apple then
                                DoTween2(Apple.Handle.CFrame)
                            end
                            DoingTweenObservationV2 = false
                        end
                        if not FindBanana and not DoingTweenObservationV2  then
                            local Banana = game:GetService("Workspace").BananaSpawner:FindFirstChild("Banana")
                            DoingTweenObservationV2 = true
                            if Banana then
                                DoTween2(Banana.Handle.CFrame)
                            end
                            DoingTweenObservationV2 = false
                        end
                        if not FindPineapple and not DoingTweenObservationV2  then
                            local Pineapple = game:GetService("Workspace").PineappleSpawner:FindFirstChild("Pineapple")
                            DoingTweenObservationV2 = true
                            if Pineapple then
                                DoTween2(Pineapple.Handle.CFrame)
                            end
                            DoingTweenObservationV2 = false
                        end
                        if FindPineapple and FindApple and FindBanana then
                            DoTween2(CFrame.new(-12445.064453125, 332.37817382812, -7672.3803710938))
                            local args = {
                            [1] = "CitizenQuestProgress",
                            [2] = "Citizen"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))                            
                        end
                    else
                        DoTween2(CFrame.new(-10922.568359375, 624.1769409179688, -10265.767578125))
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
                        
                    end
                end)
            else
                getgenv().Setting["Evolve Observation"].Enable = false 
                return
            end
        end
    else
        getgenv().Setting["Evolve Observation"].Enable = false
        return
    end
end)

local function CraftItem(Type,Name)
    if Type == "Check" then
        local args = {
            [1] = "CraftItem",
            [2] = "Check",
            [3] = Name
        }
        local Res = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        if not Res or not Res.Result then return false end
        return Res.Result.Could
    end
    if Type == "Craft" then
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = Name
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    
    end
end
Farms["Shark Anchor"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "Shark Anchor"
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
                
            end
        end 
        return false
    end
    
    local Sea3Funcs = {"StartSeaEvents","TerrorShark","Ship","Piranha","SeaBeast","Shark","RepairShip"}
    for i,v in pairs(Sea3Funcs) do
        SeaEventsController[v] = Force or Type
    end
    local SharkAnchor = CheckInvItem("Shark Anchor")
    
    while not SharkAnchor and task.wait(2) and CanFarm() do
        if CheckInvItem("Shark Tooth Necklace") and CheckInvItem("Terror Jaw") then 
            if  GetMaterial("Monster Magnet") == 0  then
                if CraftItem("Check","SharkAnchor") then 
                    CraftItem("Craft","SharkAnchor")
                end
            end
            SharkAnchor = CheckInvItem("Shark Anchor")

        else
            if not CheckInvItem("Shark Tooth Necklace") then
                if CraftItem("Check","ToothNecklace") then 
                    CraftItem("Craft","ToothNecklace")
                end

            end
            if not CheckInvItem("Terror Jaw") then
                if CraftItem("Check","TerrorJaw") then 
                    CraftItem("Craft","TerrorJaw")
                end
                
            end
        end
    end
    for i,v in pairs(Sea3Funcs) do
        SeaEventsController[v] = nil
    end
    --[[
    local args = {
    [1] = "CraftItem",
    [2] = "Craft",
    [3] = "ToothNecklace"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

]]
end)
Farms["__KatakuriHop"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "__KatakuriHop"
    local function RemainKatakuriKills()
        local ok, result = pcall(function()
            return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",true)
        end)
        return (ok and result) or "0"
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local ConditionMust = function()
        local Katakuri = game.Workspace.Enemies:FindFirstChild("Cake Prince") or game.Workspace.Enemies:FindFirstChild("Dough King")
        return not IsAlive(Katakuri)
    end
    local Katakuri = game.Workspace.Enemies:FindFirstChild("Cake Prince") or game.Workspace.Enemies:FindFirstChild("Dough King")
    if IsAlive(Katakuri) then
        Farms[Katakuri.Name](Force or Type)
    else
        local Remain = string.gsub(RemainKatakuriKills(), "%D", "")

        local Task = task.spawn(function()
            while task.wait(0.5) do
                Remain = string.gsub(RemainKatakuriKills(), "%D", "")
            end
        end)
        local Condition = function()
            return tonumber(Remain) and math.abs(tonumber(Remain)-500) >= 300 
        end
        Farms.Katakuri(Force or Type,Condition)

        if  not tonumber(Remain) or tonumber(Remain) < 1 then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CakePrinceSpawner")

        end
        Katakuri = game.Workspace.Enemies:FindFirstChild("Cake Prince") or game.Workspace.Enemies:FindFirstChild("Dough King")
        if IsAlive(Katakuri) then
            Farms[Katakuri.Name](Force or Type)

        end
        task.cancel(Task)
    end
    if CanFarm() then
        MainServerHop(5,"Find New Server [Katakuri Hop]")
    end

        

end)
Farms["BossSniper"] = LPH_JIT_MAX(function (Force,Condition)
    local flag = false
    for i,v in pairs (getgenv().Setting.BossSniper.SelectedBoss) do
        local CurrentBoss =  game.Workspace.Enemies:FindFirstChild(v)
        if IsAlive(CurrentBoss) then
            flag = true
            if BossQuest[CurrentPlaceKey][v] and LP.Data.Level.Value >= BossQuest[CurrentPlaceKey][v].Require then
                local Pos =BossQuest[CurrentPlaceKey][v].Pos
                while not SafeGetQuest(Pos,BossQuest[CurrentPlaceKey][v].Quest, BossQuest[CurrentPlaceKey][v].LvQuest,true)   and task.wait() do
                    SSS(GetNearSpawn(BossQuest[CurrentPlaceKey][v].Pos.Position))
                    DoTween2(BossQuest[CurrentPlaceKey][v].Pos)
                end

            end
            while IsAlive(CurrentBoss) and task.wait(0.1) do
               -- pcall(AttackNoCD,v.Character,true)
                AttackMob(CurrentBoss)
            end
        end
        Floating(false)                
        
    end
    if not flag and getgenv().Setting.BossSniper.Hop then 
        MainServerHop(5,"Find New Server [Boss Sniper Hop]")
    end
end)
Farms["__PoleHop"] = LPH_JIT_MAX(function(Force,Condition)
    if not Sea1 then
        Travel("Sea1")
    else
        Farms["Pole"]()
        MainServerHop(5,"Find New Server [Pole Hop]")
    end
end)
Farms["__SaberHop"] = LPH_JIT_MAX(function(Force,Condition)
    local Type = "__SaberHop"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if DataSave["Inventory"].Saber then
        getgenv().Setting["__SaberHop"].Enable = false
        return 
    end
    if CheckInvItem("Saber") then
        getgenv().Setting["__SaberHop"].Enable = false
        return 
    end
    if not Sea1 then
        Travel("Sea1")
    end
    if Sea1 and  LP.Data.Level.Value >= 200 and not CheckInvItem("Saber") and not ProgressChecker.Saber.UsedRelic then
        Farms["Saber Puzzle"](Force or Type)
    end
    if Sea1 and GetLevel() >= 200 and not ProgressChecker.Saber.KilledShanks and not CheckInvItem("Saber") and ProgressChecker.Saber.UsedRelic then
        if GetMainEnemy("Saber Expert") then 
            Farms["Saber"](Force or Type)
        else
            MainServerHop(5,"Find Saber Mob [Saber Hop]")
        end
    end
end)
Farms["Get Ghoul"]= LPH_JIT_MAX(function(Force,Condition,CanStack) 
    local Type = "Get Ghoul"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if DataSave.Unlocked.Ghoul then
        getgenv().Setting["Get Ghoul"].Enable = false
        return
    end
    if LP.Data.Race.Value == "Ghoul" or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4) == 1 then
        getgenv().Setting["Get Ghoul"].Enable = false
        return
    end
    if not Sea2 then
        print("OK")
        Travel("Sea2")
    end
    if Sea2 and LP.Data.Level.Value  then
        pcall(function()
            local CurrentBoss =  game.Workspace.Enemies:FindFirstChild("Cursed Captain")
            if IsAlive(CurrentBoss) then
                while IsAlive(CurrentBoss) and CanFarm() and task.wait(0.1) do
                    AttackMob(CurrentBoss)
                end
                task.wait(3)
            end
            local CurrentEctoplasm = GetMaterial("Ectoplasm")
            if CurrentEctoplasm < 100 then
                local Enough = false
                CheckEctoplasm = RunS.Stepped:Connect(function()
                    if GetMaterial("Ectoplasm") >= 100 then
                        Enough = true 
                    end
                end)
                local Condition = function()
                    return not Enough and not IsAlive(game.Workspace.Enemies:FindFirstChild("Cursed Captain")) and (not force and CasualFarmEmpty() or CanFarm())
                end
                Farms.Material("Ectoplasm",Force or Type, Condition)
                if CheckEctoplasm then
                    CheckEctoplasm:Disconnect()
                    CheckEctoplasm = nil 
                end
            end
            if  CheckItem("Hellfire Torch") then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
            end
            
            
        end)
    end
end)
Farms["Unlock Electric Claw"] = LPH_JIT_MAX(function()
    local returned  = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true)
    if  returned and (returned == 1 or returned == 0 or returned == 3 or returned == 2) then
        DataSave.Unlocked.Electricclaw  = true
        return
    end
    while Sea3 and GetLevel() >= 2000 and not DataSave.Unlocked.Electricclaw and wait() do
        TPToEntrance("Mansion")
        DoTween2(CFrame.new(-12547.1396484375, 337.16827392578125, -7471.8818359375))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
        StatusFarming = "Getting Electric Claw"
        
    end
end)
Farms["Fully Ghoul"] = LPH_JIT_MAX(function(Force,Condition,CanStack)
    local Type = "Fully Ghoul"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if DataSave.Unlocked.Ghoul then
        getgenv().Setting["Fully Ghoul"].Enable = false
        return
    end
    if LP.Data.Race.Value == "Ghoul" or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4) == 1 then
        getgenv().Setting["Fully Ghoul"].Enable = false
        return
    end
    if not Sea2 then
        print("OK")
        Travel("Sea2")
    end
    if Sea2 and LP.Data.Level.Value  then
        pcall(function()
            while CanFarm() and task.wait(0.1) do 
                local CurrentBoss =  game.Workspace.Enemies:FindFirstChild("Cursed Captain")
                if IsAlive(CurrentBoss) then
                    while IsAlive(CurrentBoss) and CanFarm() and task.wait(0.1) do
                        AttackMob(CurrentBoss)
                    end
                    Floating(false)

                    task.wait(3)
                    
                end
                local CurrentEctoplasm = GetMaterial("Ectoplasm")
                if CurrentEctoplasm < 100 then
                    local Enough = false
                    CheckEctoplasm = RunS.Stepped:Connect(function()
                        if GetMaterial("Ectoplasm") >= 100 then
                            Enough = true 
                        end
                    end)
                    local Condition = function()
                        return not Enough
                    end
                    Farms.Material("Ectoplasm",Force or Type, Condition)
                    if CheckEctoplasm then
                        CheckEctoplasm:Disconnect()
                        CheckEctoplasm = nil 
                    end
                    Floating(false)
                else
                    if not CheckItem("Hellfire Torch") then
                        CurrentBoss =  game.Workspace.Enemies:FindFirstChild("Cursed Captain")
                        if not IsAlive(CurrentBoss) then
                            MainServerHop(5,"Finding Cursed Captain [Fully Ghoul]",1,3)
                        end
                    else
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
                    end
                end
            end
        end)
    end
end)
Farms.Level = LPH_JIT_MAX(function(Force,Condition,Mastery)
    local Type = "Level"
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable and CasualFarmEmpty() then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    if not Increment then
        Increment = 1
    end
    local MyLv = LP.Data.Level.Value
    local Last
    local PlayerFind 
    local MinJumpLevel = 150
    if  MyLv >= MinJumpLevel then
        local HighestI = 0
        for i,v in pairs(GameData.TripleQuest[CurrentPlaceKey]) do
            if i>= HighestI and i<= MyLv and i ~= nil then
                HighestI = i
            end
        end
        if GameData.TripleQuest[CurrentPlaceKey][HighestI] ~= nil then
            
            local CheckBoss = GameData.TripleQuest[CurrentPlaceKey][HighestI][3]
            if CheckBoss and MyLv >= CheckBoss.Requirement and CheckEnemySpawn(CheckBoss.QuestCheck) then
                StatusFarming = "Farming Boss (Triple Quest Method)"

                CancelQuest()
                
                FixTP(CheckBoss.QuestCheck)
                if LP.PlayerGui.Main.Quest.Visible == false then
                    SSS(GetNearSpawn(GameData.TripleQuest[CurrentPlaceKey][HighestI][3].QuestCFrame.Position), CanFarm)
                    DoTween2(GameData.TripleQuest[CurrentPlaceKey][HighestI][3].QuestCFrame, CanFarm)
                    if not CanFarm() then return end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", GameData.TripleQuest[CurrentPlaceKey][HighestI][3]["Quest"], 3)
                end
                local MyBoss = GetMainEnemy(CheckBoss.QuestCheck)
                if IsAlive(MyBoss) then
                    --print(MyBoss.Name)
                    SSS(GetNearSpawn(getRoot(MyBoss).Position), CanFarm)
                    FixTP(MyBoss.Name)
                    while Alive() and IsAlive(MyBoss) and CanFarm() and task.wait(0.2) do
                        if Alive() and IsAlive(MyBoss) then
                            local a,b = pcall(function()
                                FixTP(MyBoss.Name)
                                pcall(Equip,GetCurrentTool("Melee",true))
                                -- HitBoxPlr()
                                ResizeBoss(MyBoss,true)
                                TP(MyBoss,Vector3.new(0, 20, 20))
                            end)
                            --print(a,b)
                        end
                    end
                end
            else
                if GetSettingHopExploiter() then 
                    HopNearExploiter()
                end
                if  (not LP.PlayerGui.Main.Quest.Visible or not FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)) then
                    --print("Starting Quest")
                    --print(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                    FixTP(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                    local QuestCheck = GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck
                    while not SafeGetQuest(GameData.TripleQuest[CurrentPlaceKey][HighestI].QuestCFrame,GameData.TripleQuest[CurrentPlaceKey][HighestI]["Quest"],Increment,nil,QuestCheck) and CanFarm() and task.wait(0.1) do
                        SSS(GetNearSpawn(GameData.TripleQuest[CurrentPlaceKey][HighestI].QuestCFrame.Position), CanFarm)
                        DoTween2(GameData.TripleQuest[CurrentPlaceKey][HighestI].QuestCFrame, CanFarm)
                    end
                    if not CanFarm() then return end
                end
                local CurrentMob = GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck
                StatusFarming = "Farming Lv (Triple Quest Method)" --Farming Lv ["..CurrentMob.."]"
                local ForceRemoveFloating = tick()
                local LevelFarmCondition = function()
                    return CanFarm() and LP.PlayerGui.Main.Quest.Visible
                end
                while task.wait(0.1) and LP.PlayerGui.Main.Quest.Visible and CanFarm() do
                    if tick()-ForceRemoveFloating>=5 then
                        Floating(false)
                        ForceRemoveFloating=tick()
                    end
                    local CurrentQuest = FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,CurrentMob)
                    if not CurrentQuest then
                        break
                    end
                    local MobToFarmABC = GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                    if IsAlive(MobToFarmABC) then
                        --print(MobToFarmABC.Name)
                        FixTP(MobToFarmABC.Name)
                        local FirstPosition = getRoot(MobToFarmABC).Position
                        
                        while Alive() and IsAlive(MobToFarmABC) and CanFarm() and LP.PlayerGui.Main.Quest.Visible and task.wait(0.2) do
                            AttackMob(MobToFarmABC,nil,LevelFarmCondition)
                            if SetTimer(MobToFarmABC,LevelFarmCondition) then
                                break 
                            end
                        end
                    elseif not GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck) then
                        if not CanFarm() then return end
                        task.wait(1)
                            --[[ if TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck ~= 
                            "Pistol Billionaire [Lv. 1525]" and TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck ~= 
                            "Pirate Millionaire [Lv. 1500]" then]]
                                                            --end
                        --print(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                        if not CanFarm() then return end
                        FixTP(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                        for i,v in pairs(GameData.SpawnPosition[CurrentPlaceKey]) do
                            if not IsAlive(GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck))  then
                                local CheckCurrentPosition = FindQuest(i,GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)
                                if CheckCurrentPosition and (not LP.PlayerGui.Main.Quest.Visible  
                                    or not FindQuest(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck) or not 
                                    IsAlive(GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck))) then
                                    for i2,v2 in pairs(v) do
                                        if IsAlive(GetNearMob(GameData.TripleQuest[CurrentPlaceKey][HighestI][Increment].QuestCheck)) then
                                            Floating(true)
                                            break
                                        end
                                        if Alive() and CanFarm() then
                                            Floating(true)
                                            DoTween2(CFrame.new(ConvertStringToVector3(v2))*CFrame.new(0,20,0), CanFarm)
                                            Floating(false)
                                        end
                                    end
                                end
                            end
                        end
                        
                    end
                end 
                MyLv = LP.Data.Level.Value
                for i,v in pairs(GameData.TripleQuest[CurrentPlaceKey]) do
                    if i>= HighestI and i<= MyLv then
                        HighestI = i
                    end
                end
                if true then
                    if Increment == 2 then
                        Increment = 1 
                    elseif MyLv >= GameData.TripleQuest[CurrentPlaceKey][HighestI][2].Requirement then 
                        Increment = 2
                    end
                end
            end
        else
            print("Error: Farming Highest " ..HighestI)
        end
    else


        

        StatusFarming = "Jump Lv Farming"
    
        local Mid = CFrame.new(-4996.68505859375, 278.06683349609375, -2815.228515625)
        if MyLv > 30 then
            Mid = CFrame.new(-7743.29638671875, 5583.08154296875, -620.167236328125)
        end              
        if Alive() then
            if (getRoot(LP.Character).Position-Mid.Position).magnitude < 1000 then
                local Check = 0
                NearestMobAura = GetNearest(Enemies:GetChildren(), MyLv <= 30 and "Level30" or "Level60")
                if NearestMobAura and IsAlive(NearestMobAura) and Alive() then
                    local FirstPos = getRoot(NearestMobAura).Position
                    pcall(Equip,GetCurrentTool("Melee",true))
                    local a,b = pcall(function()
                        if (getRoot(NearestMobAura).Position-getRoot(LP.Character).Position).magnitude <= 3000 then
                            while  Alive() and IsAlive(NearestMobAura) and task.wait(0.1) and CanFarm() do
                                BringMob("Near",NearestMobAura)
                                pcall(Equip,GetCurrentTool("Melee",true))
                                --ResizeHRP(NearestMob,true)
                                TP(NearestMobAura,Vector3.new(0,20,20))
                            end
                        end
                    end)
                    if b then
                        print(b)
                    end
                else
                    DoTween2(Mid, CanFarm)
                    local _t = tick()
                    while tick()-_t < 5 and CanFarm() do task.wait(0.1) end
                end
            else
                DoTween2(Mid, CanFarm)
                local _t = tick()
                while tick()-_t < 5 and CanFarm() do task.wait(0.1) end
            end
        end
    end

    
end)
Farms.Bone = LPH_JIT_MAX(function(Force,Condition,Mastery)
    local Type = "Bone"
    local Mob =  GetNearMob(Type)
    local BonePosition = Vector3.new(-9501.3447265625, 172.1398468017578, 6036.0341796875)
    local Condition = Condition or function ()
        return true
    end
    local CanFarm = function ()
        if not Force then
            if getgenv().Setting[Type].Enable then
                return true
            end
        else 
            
            if getgenv().Setting[Force].Enable and Condition()  then
                return true
            end
        end 
        return false
    end
    local ForceRemoveFloating = tick()
    local QuestCFrame = CFrame.new(-9506.95313, 172.104858, 6074.63086)

    StatusFarming = "Ready To Farm Bone"
    local SettingMastery = getgenv().Setting.Mastery.Enable
    if Mastery then 
        MakeMasterySkill()
        SkillsController.Condition = function()
            if SettingMastery and IsAlive(Mob) then
                local H = Mob:FindFirstChild("Humanoid")
                return H and H.Health <= H.MaxHealth* ( getgenv().Setting.Mastery.Health and (getgenv().Setting.Mastery.Health/100)  or (50/100)) and SettingMastery
            end
            return false
        end
    end
    local MobCondition = function()
        return IsAlive(Mob) and GetDistance(Mob,BonePosition) <= 2000 and math.abs(getRoot(Mob).Position.Y-BonePosition.Y) <= 200
    end
    while CanFarm() and task.wait(0.1) do
        if SettingMastery then
            getgenv().MasteringWeapon = true
        end
        StatusFarming = "Farming Bone"
        SSS(GetNearSpawn(QuestCFrame.Position))

        if getgenv().Setting.AcceptQuest_Bone_Katakuri.Enable and LP.Data.Level.Value >= 2050 and (LP.PlayerGui.Main.Quest.Visible == false or not string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Posessed Mummy")) then
            if Alive() then

                while getgenv().Setting.AcceptQuest_Bone_Katakuri.Enable and not SafeGetQuest(QuestCFrame,"HauntedQuest2",2,true)  and task.wait(0.5) do

                    DoTween2(QuestCFrame) 
                end
                Floating(false)
            end
        end
        if GetSettingHopExploiter() then 
            HopNearExploiter()
        end
        if tick()-ForceRemoveFloating>=5 then
            Floating(false)
            ForceRemoveFloating=tick()
        end
        if IsAlive(Mob) then
            AttackMob(Mob,Mastery,MobCondition)
            if not Mastery then
                if SetTimer(Mob,CanFarm) then
                    Floating(false)
                    break 
                end
            end
        else 
            Floating(false)
            Mob = GetNearMob(Type)
            if not IsAlive(Mob) then
                SSS(GetNearSpawn(BonePosition))
                DoTween2(CFrame.new(BonePosition))
                Floating(false)
            end
        end
    end

    if Mastery then
        getgenv().MasteringWeapon = false
        VoidSkillController()
    end
    if LP.CameraMaxZoomDistance <= 1 then 
        LP.CameraMaxZoomDistance = 200
        LP.CameraMinZoomDistance = 100
        LP.CameraMinZoomDistance = 0
    end
    Floating(false)
end)
local function AddToPriorityQueue()
    while task.wait(0.7) do
        for i,v in pairs(AllFuncs) do
            if getgenv().OneClickSetting then 
                if v == "Pole" and not getgenv().OneClickSetting.FarmPole then 
                    continue
                end
                if v == "Items Farm Force" and not getgenv().OneClickSetting.FarmItems then 
                    continue
                end
                if v == "Tushita Hop" and not getgenv().OneClickSetting.HopTushita then 
                    continue
                end
                if (v == "Soul Guitar" or v == "Material Soul Guitar") and getgenv().OneClickSetting.DisableSoulGuitar then 
                    continue
                end
                if (v == "CDK") and getgenv().OneClickSetting.DisableCDK then 
                    continue
                end
                if (v == "Race Evolve") and getgenv().OneClickSetting.DisableRaceEvolve then 
                    continue
                end
            end
            if not FuncsRequirement[v] then
                continue
            end
            if not StateAdded[v] then
                local State = FuncsRequirement[v]() 
                --print(v,State)
                if State then
                    print("Added state: ",v)
                    StateAdded[v] = true
                    WorkingFarm:put(v,FuncPriories[v])
                end
            end
        end
    end
end
task.spawn(function() -- This Thing Is Recursive So Put It Another Loop
    while task.wait(1) do 
        local MyLv= LP.Data.Level.Value
        if not DataSave.Unlocked.SoulGuitar and MyLv >= 2300 and not Sea1 then
            if not DataSave.Unlocked.SoulGuitar then
                GuitarProgress()
            end
        end
    end
end)

local _MeleeRS = game:GetService("ReplicatedStorage")
local _MeleeHTTPS = game:GetService("HttpService")
local _MeleeDataFolder = "True W-azure V2_Beta/MeleeData"
local _MeleeDataFile   = _MeleeDataFolder .. "/" .. LP.Name .. ".json"

local _MeleeNPCMap = {
    ["Black Leg"]       = { NPC = "Dark Step Teacher",     Remote = "BuyBlackLeg",      ToolName = "Black Leg" },
    ["Electro"]         = { NPC = "Mad Scientist",         Remote = "BuyElectro",        ToolName = "Electro" },
    ["Fishman Karate"]  = { NPC = "Water Kung Fu Teacher", Remote = "BuyFishmanKarate",  ToolName = "Fishman Karate" },
    ["Superhuman"]      = { NPC = "Martial Arts Master",   Remote = "BuySuperhuman",     ToolName = "Superhuman" },
    ["Death Step"]      = { NPC = "Phoeyu, the Reformed",  Remote = "BuyDeathStep",      ToolName = "Death Step" },
    ["Sharkman Karate"] = { NPC = "Sharkman Teacher",      Remote = "BuySharkmanKarate", ToolName = "Sharkman Karate" },
    ["Electric Claw"]   = { NPC = "Previous Hero",         Remote = "BuyElectricClaw",   ToolName = "Electric Claw" },
    ["Dragon Tailon"]   = { NPC = "Uzoth",                 Remote = "BuyDragonTalon",    ToolName = "Dragon Talon" },
    ["God Human"]       = { NPC = "Ancient Monk",          Remote = "BuyGodhuman",       ToolName = "Godhuman" },
}

local _MeleeBuyReqs = {
    ["Black Leg"]       = { MinLevel = 1,    MinBeli = 150000 },
    ["Electro"]         = { MinLevel = 1,    MinBeli = 500000 },
    ["Fishman Karate"]  = { MinLevel = 1,    MinBeli = 750000 },
    ["Superhuman"]      = { MinLevel = 1100, MinBeli = 3000000 },
    ["Death Step"]      = { MinLevel = 700,  MinBeli = 2500000, MinFragments = 5000, NeedUnlock = "Deathstep" },
    ["Sharkman Karate"] = { MinLevel = 700,  MinBeli = 2500000, MinFragments = 5000, NeedUnlock = "Sharkman" },
    ["Electric Claw"]   = { MinLevel = 2000, MinBeli = 3000000, MinFragments = 5000, NeedUnlock = "Electricclaw" },
    ["Dragon Tailon"]   = { MinLevel = 1500, MinBeli = 3000000, MinFragments = 5000, NeedUnlock = "Dragontailon" },
    ["God Human"]       = { MinLevel = 1500, MinBeli = 5000000, MinFragments = 5000 },
}

local _GodHumanRequired = {
    "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Tailon"
}

getgenv().MeleeNPCBusy = false

local function _MeleeSaveToDisk()
    pcall(function()
        if not isfolder(_MeleeDataFolder) then
            makefolder(_MeleeDataFolder)
        end
        local snapshot = {
            Melee    = DataSave.Melee,
            Unlocked = DataSave.Unlocked,
        }
        writefile(_MeleeDataFile, _MeleeHTTPS:JSONEncode(snapshot))
    end)
end

local function _MeleeLoadFromDisk()
    pcall(function()
        if isfile(_MeleeDataFile) then
            local ok, decoded = pcall(function()
                return _MeleeHTTPS:JSONDecode(readfile(_MeleeDataFile))
            end)
            if not ok or not decoded then return end
            if decoded.Melee then
                for k, v in pairs(decoded.Melee) do
                    if DataSave.Melee[k] then
                        for field, val in pairs(v) do
                            DataSave.Melee[k][field] = val
                        end
                    end
                end
            end
            if decoded.Unlocked then
                for k, v in pairs(decoded.Unlocked) do
                    DataSave.Unlocked[k] = v
                end
            end
            print("[MeleeV2] Dados carregados do disco.")
        end
    end)
end

local function _GetMeleeTool(toolName)
    return LP.Backpack:FindFirstChild(toolName)
        or (LP.Character and LP.Character:FindFirstChild(toolName))
end

local function _GetMasteryLevel(toolName)
    local tool = _GetMeleeTool(toolName)
    if tool and tool:FindFirstChild("Level") then
        return tool.Level.Value
    end
    return nil
end

local function _CanAffordStyle(meleeName)
    local req = _MeleeBuyReqs[meleeName]
    if not req then return true end
    if LP.Data.Level.Value < req.MinLevel then return false end
    if LP.Data.Beli.Value < req.MinBeli then return false end
    if req.MinFragments and LP.Data.Fragments.Value < req.MinFragments then return false end
    if req.NeedUnlock and not DataSave.Unlocked[req.NeedUnlock] then return false end
    return true
end

local function _TravelAndBuyMelee(meleeName)
    local info = _MeleeNPCMap[meleeName]
    if not info then return false end
    getgenv().MeleeNPCBusy = true
    StatusFarming2 = "Indo ao NPC: " .. info.NPC
    local npc = GetNPC(info.NPC)
    if not npc then
        getgenv().MeleeNPCBusy = false
        return false
    end
    local npcPos = AllToVector(npc)
    if not npcPos then
        getgenv().MeleeNPCBusy = false
        return false
    end
    DoTween2(CFrame.new(npcPos + Vector3.new(0, 2, 5)))
    task.wait(1)
    for attempt = 1, 6 do
        pcall(function()
            _MeleeRS.Remotes.CommF_:InvokeServer(info.Remote)
        end)
        if _GetMeleeTool(info.ToolName) then break end
        task.wait(0.6)
    end
    if _GetMeleeTool(info.ToolName) then
        DataSave.Melee[meleeName] = DataSave.Melee[meleeName] or {}
        DataSave.Melee[meleeName].Have = true
    end
    getgenv().MeleeNPCBusy = false
    _MeleeSaveToDisk()
    return _GetMeleeTool(info.ToolName) ~= nil
end

local function _DetectAllOwnedStyles()
    local remoteMap = {
        { remote = "BuyBlackLeg",       key = "Black Leg" },
        { remote = "BuyElectro",        key = "Electro" },
        { remote = "BuyFishmanKarate",  key = "Fishman Karate" },
        { remote = "BuySuperhuman",     key = "Superhuman" },
        { remote = "BuyDeathStep",      key = "Death Step" },
        { remote = "BuySharkmanKarate", key = "Sharkman Karate" },
        { remote = "BuyElectricClaw",   key = "Electric Claw" },
        { remote = "BuyDragonTalon",    key = "Dragon Tailon" },
        { remote = "BuyGodhuman",       key = "God Human" },
    }
    for _, entry in pairs(remoteMap) do
        local ok, result = pcall(function()
            return _MeleeRS.Remotes.CommF_:InvokeServer(entry.remote, true)
        end)
        if ok and result == 1 then
            if DataSave.Melee[entry.key] then
                DataSave.Melee[entry.key].Have = true
            end
            if entry.key == "God Human" then
                DataSave.Unlocked.GodHuman = true
                DataSave.Melee["God Human"].Mas400 = true
            end
        end
        task.wait(0.2)
    end
    local ok2, r2 = pcall(function()
        return _MeleeRS.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
    end)
    if ok2 and r2 == 1 then
        DataSave.Melee.DragonClaw.Have = true
    end
    _MeleeSaveToDisk()
    print("[MeleeV2] Deteccao de estilos concluida.")
end

local function _CheckAllGodHumanMastery()
    for _, name in pairs(_GodHumanRequired) do
        if not DataSave.Melee[name] or not DataSave.Melee[name].Mas400 then
            return false
        end
    end
    return true
end

spawn(function()
    task.wait(4)
    _MeleeLoadFromDisk()
    _DetectAllOwnedStyles()

    while true do
        task.wait(1)
        local MyLv = LP.Data.Level.Value

        if getgenv().Setting.OneClick.Enable and DataSave.Melee.Electro.Have then
            for i, v in pairs(GameData.Items[1]["Abilities"]) do
                if v.Price.Beli <= LP.Data.Beli.Value then
                    pcall(function()
                        if not game:GetService("CollectionService"):HasTag(LP.Character, v.Name) then
                            if (v.Name == "Ken" and MyLv >= 300 and CheckInvItem("Saber")) or true then
                                _MeleeRS.Remotes.CommF_:InvokeServer(unpack(v.Args))
                            end
                        end
                    end)
                end
            end
        end

        if MyLv >= 1100 then
            if not DataSave.Melee.DragonClaw.Have then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
                end)
                if ok and r == 1 then
                    DataSave.Melee.DragonClaw.Have = true
                    _MeleeSaveToDisk()
                end
            end
            if not DataSave.Melee["Superhuman"].Have then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuySuperhuman", true)
                end)
                if ok and r == 1 then
                    DataSave.Melee["Superhuman"].Have = true
                    _MeleeSaveToDisk()
                end
            end
            if not DataSave.Melee["Sharkman Karate"].Have then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                end)
                if ok and r == 1 then
                    DataSave.Melee["Sharkman Karate"].Have = true
                    _MeleeSaveToDisk()
                end
            end
            if not DataSave.Melee["Death Step"].Have then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuyDeathStep", true)
                end)
                if ok and r == 1 then
                    DataSave.Melee["Death Step"].Have = true
                    _MeleeSaveToDisk()
                end
            end
        end

        if MyLv >= 1500 then
            if not DataSave.Unlocked.Electricclaw then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuyElectricClaw", true)
                end)
                if ok and r and (r == 1 or r == 0 or r == 2 or r == 3) then
                    DataSave.Unlocked.Electricclaw = true
                    _MeleeSaveToDisk()
                end
            end
            if not DataSave.Melee["Electric Claw"].Have then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuyElectricClaw", true)
                end)
                if ok and r == 1 then
                    DataSave.Melee["Electric Claw"].Have = true
                    _MeleeSaveToDisk()
                end
            end
            if not DataSave.Unlocked.Dragontailon then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                end)
                if ok and r and r ~= "Set your heart ablaze." then
                    DataSave.Unlocked.Dragontailon = true
                    _MeleeSaveToDisk()
                end
            end
            if not DataSave.Melee["Dragon Tailon"].Have then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                end)
                if ok and r == 1 then
                    DataSave.Melee["Dragon Tailon"].Have = true
                    _MeleeSaveToDisk()
                end
            end
            if not DataSave.Unlocked.GodHuman then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
                end)
                if ok and r and (r == 0 or r == 1) then
                    DataSave.Unlocked.GodHuman = true
                    DataSave.Melee["God Human"].Have = true
                    DataSave.Melee["God Human"].Mas400 = true
                    _MeleeSaveToDisk()
                end
            end
        end

        if MyLv >= 700 then
            if not DataSave.Unlocked.Deathstep then
                local ok1, r1 = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("OpenLibrary")
                end)
                if (ok1 and r1 == true) or DataSave.Melee["Death Step"].Have then
                    DataSave.Unlocked.Deathstep = true
                end
                local ok2, r2 = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuyDeathStep", true)
                end)
                if ok2 and r2 and (r2 == 1 or r2 == 2) then
                    DataSave.Unlocked.Deathstep = true
                    _MeleeSaveToDisk()
                end
                if CheckItem("Library Key") then
                    pcall(function()
                        _MeleeRS.Remotes.CommF_:InvokeServer("OpenLibrary")
                    end)
                end
            end
            if not DataSave.Unlocked.Sharkman then
                local ok, r = pcall(function()
                    return _MeleeRS.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                end)
                if ok and r and (r == 0 or r == 1 or r == 2 or r == 3) then
                    DataSave.Unlocked.Sharkman = true
                    _MeleeSaveToDisk()
                end
                if CheckItem("Water Key") then
                    pcall(function()
                        _MeleeRS.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                    end)
                end
            end
        end

        if DataSave.Unlocked.SoulGuitar and not CheckInvItem("Skull Guitar") then
            if RequirementGuitar["1"] and RequirementGuitar["2"] and GetMaterial("Dark Fragment") >= 1 then
                pcall(function()
                    _MeleeRS.Remotes.CommF_:InvokeServer("soulGuitarBuy")
                end)
            end
        end

        if DataSave.TTK.Shisui and DataSave.TTK.Wando and DataSave.TTK.Saddi and LP.Data.Beli.Value >= 2000000 then
            pcall(function()
                _MeleeRS.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
            end)
        end

        if Sea2 then
            if CheckItem("Hidden Key") and not CheckInvItem("Rengoku") then
                pcall(function()
                    _MeleeRS.Remotes.CommF_:InvokeServer("OpenRengoku")
                end)
            end
        end
    end
end)

spawn(function()
    task.wait(7)
    _MeleeLoadFromDisk()

    while task.wait(0.2) do
        if not getgenv().Setting.OneClick.Enable then
            StatusFarming2 = nil
            continue
        end

        if getgenv().Setting.OneClick.DisableMeleeSwitcher then
            StatusFarming2 = nil
            continue
        end

        if getgenv().MeleeNPCBusy then
            task.wait(1)
            continue
        end

        if DataSave.Unlocked.GodHuman or DataSave.Melee["God Human"].Mas400 then
            StatusFarming2 = "Finished"
            continue
        end

        local MyLv = LP.Data.Level.Value

        local function _HandleStyle(meleeName, statusMsg)
            local info = _MeleeNPCMap[meleeName]
            if not info then return end
            if DataSave.Melee[meleeName].Have then
                local tool = _GetMeleeTool(info.ToolName)
                if not tool then
                    _TravelAndBuyMelee(meleeName)
                else
                    StatusFarming2 = statusMsg
                    local lvl = _GetMasteryLevel(info.ToolName)
                    if lvl and lvl >= 400 then
                        DataSave.Melee[meleeName].Mas400 = true
                        _MeleeSaveToDisk()
                    end
                end
            else
                if _CanAffordStyle(meleeName) then
                    _TravelAndBuyMelee(meleeName)
                else
                    local req = _MeleeBuyReqs[meleeName]
                    if req then
                        local missing = {}
                        if LP.Data.Beli.Value < req.MinBeli then
                            table.insert(missing, math.floor(req.MinBeli - LP.Data.Beli.Value) .. " Beli")
                        end
                        if req.MinFragments and LP.Data.Fragments.Value < req.MinFragments then
                            table.insert(missing, math.floor(req.MinFragments - LP.Data.Fragments.Value) .. " Fragments")
                        end
                        if LP.Data.Level.Value < req.MinLevel then
                            table.insert(missing, "Level " .. req.MinLevel)
                        end
                        if req.NeedUnlock and not DataSave.Unlocked[req.NeedUnlock] then
                            table.insert(missing, "unlock " .. meleeName)
                        end
                        StatusFarming2 = "Falta para " .. meleeName .. ": " .. table.concat(missing, ", ")
                    end
                end
            end
        end

        if not DataSave.Melee["Black Leg"].Mas400 then
            _HandleStyle("Black Leg", "Farm Black Leg To Mas 400")

        elseif not DataSave.Melee["Electro"].Mas400 then
            _HandleStyle("Electro", "Farm Electro To Mas 400")

        elseif not DataSave.Melee["Fishman Karate"].Mas400 then
            _HandleStyle("Fishman Karate", "Farm Fishman Karate To Mas 400")

        elseif MyLv >= 1100 then

            if not DataSave.Melee.DragonClaw.Have then
                if LP.Data.Fragments.Value >= 1500 then
                    pcall(function()
                        _MeleeRS.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                    end)
                else
                    StatusFarming2 = "Falta para Dragon Breath: " .. (1500 - LP.Data.Fragments.Value) .. " Fragments"
                end

            elseif not DataSave.Melee.DragonClaw.Mas400 then
                local tool = _GetMeleeTool("Dragon Claw")
                if not tool then
                    pcall(function()
                        _MeleeRS.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                    end)
                end
                StatusFarming2 = "Farm Dragon Claw To Mas 400"
                local lvl = _GetMasteryLevel("Dragon Claw")
                if lvl and lvl >= 400 then
                    DataSave.Melee.DragonClaw.Mas400 = true
                    _MeleeSaveToDisk()
                end

            elseif not DataSave.Melee["Superhuman"].Mas400 then
                _HandleStyle("Superhuman", "Farm Superhuman To Mas 400")

            elseif not DataSave.Melee["Death Step"].Mas400 then
                _HandleStyle("Death Step", "Farm Death Step To Mas 400")

            elseif not DataSave.Melee["Sharkman Karate"].Mas400 then
                _HandleStyle("Sharkman Karate", "Farm Sharkman Karate To Mas 400")

            elseif not DataSave.Melee["Electric Claw"].Mas400 then
                _HandleStyle("Electric Claw", "Farm Electric Claw To Mas 400")

            elseif not DataSave.Melee["Dragon Tailon"].Mas400 then
                _HandleStyle("Dragon Tailon", "Farm Dragon Talon To Mas 400")

            elseif not DataSave.Unlocked.GodHuman then
                if _CheckAllGodHumanMastery() then
                    if RequirementGod["1"] and RequirementGod["2"] and RequirementGod["3"] and RequirementGod["4"] then
                        getgenv().MeleeNPCBusy = true
                        StatusFarming2 = "Comprando God Human no Ancient Monk"
                        local npc = GetNPC("Ancient Monk")
                        if npc then
                            local npcPos = AllToVector(npc)
                            if npcPos then
                                DoTween2(CFrame.new(npcPos + Vector3.new(0, 2, 5)))
                                task.wait(1)
                                for attempt = 1, 5 do
                                    pcall(function()
                                        _MeleeRS.Remotes.CommF_:InvokeServer("BuyGodhuman")
                                    end)
                                    if _GetMeleeTool("Godhuman") then break end
                                    task.wait(0.6)
                                end
                                if _GetMeleeTool("Godhuman") then
                                    DataSave.Unlocked.GodHuman = true
                                    DataSave.Melee["God Human"].Have = true
                                    DataSave.Melee["God Human"].Mas400 = true
                                    _MeleeSaveToDisk()
                                end
                            end
                        end
                        getgenv().MeleeNPCBusy = false
                    else
                        StatusFarming2 = "Farmando materiais para God Human"
                    end
                else
                    StatusFarming2 = "Verificando maestria para God Human"
                    for _, reqName in pairs(_GodHumanRequired) do
                        if not DataSave.Melee[reqName] or not DataSave.Melee[reqName].Mas400 then
                            local info = _MeleeNPCMap[reqName]
                            if info then
                                if DataSave.Melee[reqName] and DataSave.Melee[reqName].Have then
                                    local toolInBag = _GetMeleeTool(info.ToolName)
                                    if not toolInBag then
                                        _TravelAndBuyMelee(reqName)
                                    else
                                        local lvl = _GetMasteryLevel(info.ToolName)
                                        if lvl and lvl >= 400 then
                                            DataSave.Melee[reqName].Mas400 = true
                                            _MeleeSaveToDisk()
                                        else
                                            StatusFarming2 = "Farm " .. reqName .. " To Mas 400 (God Human)"
                                        end
                                    end
                                else
                                    _HandleStyle(reqName, "Farm " .. reqName .. " To Mas 400 (God Human)")
                                end
                            end
                            break
                        end
                    end
                end

            else
                StatusFarming2 = "Finished"
            end

        else
            StatusFarming2 = nil
        end
    end
end)



--Get Client Event: Observation
do 
    u1 = 0
    local DisableObservation = false
    local l__DisableKen__6 = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DisableKen");
    l__DisableKen__6.OnClientEvent:Connect(function()
    u1 = tick() + 5;
    ObservationManager.SetActive(false)
    end)
end
if Sea2 or Sea3 then
    local DodgeSkill = {
        "WaterBeam","Angry","BiteAttack","SubMerge"--,"VisibleIdleRight","VisibleIdleLeft","Death"
    }                 
    game.Workspace.SeaBeasts.ChildAdded:Connect(function(SS)
        wait(2)
        if string.find(SS.Name,"SeaBeast") and getRoot(SS) and SS:FindFirstChild("Health") and  SS:FindFirstChild("Health").Value ~= nil and SS:FindFirstChild("Health").Value > 0 
        then
            print("add r")
            SS.Humanoid.Animator.AnimationPlayed:Connect(function(v2)
                spawn(function()
                    for i3,v3 in pairs(SS.Anims:GetChildren()) do
                        --print(v3.Name)
                        --if v2.Animation.AnimationId==v3.AnimationId then print(table.find(DodgeSkill,v3.Name),v3.Name) end
                        if SS:FindFirstChild("Health") and  SS:FindFirstChild("Health").Value ~= nil and SS:FindFirstChild("Health").Value > 0 and 
                        v2.Animation.AnimationId==v3.AnimationId and table.find(DodgeSkill,v3.Name) and (getRoot(SS).Position-getRoot(LP.Character).Position).magnitude < 500 and getgenv().Setting.SeaEvents.SeaBeast then
                            pcall(function()
                            getRoot(LP.Character).Size = Vector3.new(2,1,2)
                            end)
                            
                            if v3.Name == "WaterBeam" then
                                wait(v2.Length*5/10)
                                NeNe=true
                                wait(v2.Length*5/10)
                            else
                                NeNe=true
                                wait(v2.Length*7/10)
                            end
                            wait()
                        --  print(v2.Length)
                            NeNe=false
                            pcall(function()
                            getRoot(LP.Character).Size = Vector3.new(2,2,1)
                            end)
                        end
                    end
                end)
                
            end)
        end
    end)
end

getgenv().Esp = {
    Boss = {},Chest={}
}


if game.Workspace:FindFirstChild('ESPManager') then
    game.Workspace:FindFirstChild('ESPManager'):Destroy()
end

ESPManager = Instance.new('Folder')
ESPManager.Name = 'ESPManager'
ESPManager.Parent = game.Workspace
for i,v in pairs(GameData.Places[CurrentPlaceKey]) do
    if not ESPManager:FindFirstChild(tostring(i)) then
        local partPlace = Instance.new('Part')
        partPlace.Parent = ESPManager
        partPlace.Name = tostring(i)
        partPlace.CFrame = v
        partPlace.Size = Vector3.new(10,10,10)
        partPlace.Transparency = 1
    end
end
print("Loading ESP")

local function IsFullyTrialEnable() 
    return (getgenv().Setting.FullyAutoTrial.OneClick and MultiTrial_AllSet() or getgenv().Setting.FullyAutoTrial.Enable) and Sea3
end
local IsTrialFunction = function(Name)

    return getgenv().Setting.Trial[Name] or (TrialManager[Name] and getgenv().Setting[TrialManager[Name]].Enable)
end
local AutoRaceV4Condition = function()
    return IsFullyTrialEnable() or getgenv().Setting.Trial.Enable
    
end
AutoRaceV4 = {
    ["Cyborg"] = function()
        while Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and game:GetService("Workspace").Map:FindFirstChild("CyborgTrial") 
        and (getRoot(LP.Character).Position-game:GetService("Workspace").Map.CyborgTrial.Roof.Position).magnitude< 1000 
        and task.wait() do
            InCyborgTrial = true
            getRoot(LP.Character).CFrame = game:GetService("Workspace").Map.CyborgTrial.Roof.CFrame*CFrame.new(0,50,0)
        end
        if Alive() and InCyborgTrial then
            InCyborgTrial = false
            LP.Character.Humanoid:UnequipTools()
        end
    end,
    ["Human"] = function()
        if Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and task.wait()
        and (getRoot(LP.Character).Position-Vector3.new(10044.150390625, 10019.369140625, 89.03580474853516)).magnitude<1000 then
            task.wait(0.5)
            while Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and task.wait()
            and (getRoot(LP.Character).Position-Vector3.new(10044.150390625, 10019.369140625, 89.03580474853516)).magnitude<1000 do
                AttackedHumanTrial = true
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if IsAlive(v) and (getRoot(v).Position - Vector3.new(10044.150390625, 10019.369140625, 89.03580474853516)).magnitude < 1000 then
                        
                        while IsAlive(v) and task.wait(0.1) and AutoRaceV4Condition() do
                            AttackMob(v,nil,nil,nil,nil,{DisableInstaTP=true})
                        end
                    end
                end
            end
            if Alive() and AttackedHumanTrial then
                AttackedHumanTrial = false
                LP.Character.Humanoid:UnequipTools()
            end
        end
    end,
    ["Ghoul"] = function()
        if Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and task.wait(0.1)
        and (getRoot(LP.Character).Position-Vector3.new(-11693.0156, 10011.2188, 85.3999176)).magnitude<1000 then
            while Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and task.wait(0.1)
            and (getRoot(LP.Character).Position-Vector3.new(-11693.0156, 10011.2188, 85.3999176)).magnitude<1000 do
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if IsAlive(v) then
                        local Condition = function()
                        end
                        if  (getRoot(v).Position - Vector3.new(-11693.0156, 10011.2188, 85.3999176)).magnitude < 1000 then
                            while Alive() and IsAlive(v) and task.wait(0.1) and AutoRaceV4Condition() 
                            and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and 
                            (getRoot(v).Position - Vector3.new(-11693.0156, 10011.2188, 85.3999176)).magnitude < 1000 do
                                AttackMob(v,nil,nil,nil,nil,{DisableInstaTP=true})                                
                                BringMob("Near",v)
                            end
                        end
                    end
                end
            end
            for i=1,5 do 
                StopTween()
            end
            if Alive() then
                LP.Character.Humanoid:UnequipTools()
            end
        end
    end,
    ["Mink"] = function()
        if Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and (getRoot(LP.Character).Position-game:GetService("Workspace").StartPoint.Position).magnitude < 1000  then
            while Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and (getRoot(LP.Character).Position-game:GetService("Workspace").StartPoint.Position).magnitude < 1000 and task.wait()
            and (getRoot(LP.Character).Position-Vector3.new(3348, 11011.6494140625, 15925)).magnitude<1000
            and game:GetService("Workspace").Map:FindFirstChild("MinkTrial") do
                task.wait(5)
                if not (Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and (getRoot(LP.Character).Position-game:GetService("Workspace").StartPoint.Position).magnitude <1000 and task.wait()
                and (getRoot(LP.Character).Position-Vector3.new(3348, 11011.6494140625, 15925)).magnitude<1000
                and game:GetService("Workspace").Map:FindFirstChild("MinkTrial")) then break
                end
                getRoot(LP.Character).CFrame = game:GetService("Workspace").StartPoint.CFrame
            end
            if Alive() then
                LP.Character.Humanoid:UnequipTools()
            end
        end
    end,
    ["Skypiea"] = function()
        if  Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and (getRoot(LP.Character).Position-Vector3.new(12003.994140625, 17013.396484375, 5525.26708984375)).magnitude < 500  then
            while Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and (getRoot(LP.Character).Position-Vector3.new(12003.994140625, 17013.396484375, 5525.26708984375)).magnitude < 500 
            and task.wait() and game:GetService("Workspace").Map:FindFirstChild("SkyTrial") do
                task.wait(5)
                getRoot(LP.Character).CFrame = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart.CFrame
                
            end
            if Alive() then
                LP.Character.Humanoid:UnequipTools()
            end
        end
    end,
    ["Fishman"] = function()
        if  AutoRaceV4Condition() and Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible  and (getRoot(LP.Character).Position-Vector3.new(25029.345703125, -4.25, 12478.9638671875)).magnitude < 1000 then
            local NearestSeaBeast = GetSeaBeastV4()
            getgenv().SilentAimPos = false
            if NearestSeaBeast then
                getgenv().SilentAimPos = true
                SeaBeastSpawned = true
                local increment = 0
                local DISTANCE = 150
                MakeSeaEventSkill()
                SkillsController.Condition = function ()
                    return Alive() and NearestSeaBeast and NearestSeaBeast.Parent and 
                    NearestSeaBeast:FindFirstChild("Health") and NearestSeaBeast:FindFirstChild("Health").Value ~= nil 
                    and NearestSeaBeast:FindFirstChild("HumanoidRootPart") and getRoot(NearestSeaBeast).Position.Y >= -179 
                end
                repeat task.wait(0.1)
                    
                    if Alive() and NearestSeaBeast.Parent and NearestSeaBeast and NearestSeaBeast:FindFirstChild("HumanoidRootPart")  and 
                    NearestSeaBeast:FindFirstChild("Health") and NearestSeaBeast:FindFirstChild("Health").Value ~= nil and NearestSeaBeast:FindFirstChild("Health").Value > 0 and
                    AutoRaceV4Condition() then
                        spawn(function()
                            getgenv().PosToHook = NearestSeaBeast.RootPart.body["body.010"].WorldPosition
                            
                            if  getRoot(NearestSeaBeast).Position.Y < -179 then
                                --print(getRoot(NearestSeaBeast).Position.Y)
                                Floating(true)
                            else
                                DoTween2(getRoot(NearestSeaBeast).CFrame * CFrame.new(0, 200,0))
                                Floating(true)
                            end
                        end)
                        spawn(function()
                            if not daxaiskillsea then
                                daxaiskillsea = true
                                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                                wait(5)
                                daxaiskillsea = false
                            end
                        end)
                    end
                until not NearestSeaBeast.Parent or not NearestSeaBeast or not NearestSeaBeast:FindFirstChild("HumanoidRootPart") 
                or not NearestSeaBeast:FindFirstChild("Health") or NearestSeaBeast:FindFirstChild("Health").Value == nil or  NearestSeaBeast:FindFirstChild("Health").Value <= 0
                or not Alive() or not AutoRaceV4Condition() or not LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible
                getgenv().SilentAimPos = false
                getgenv().PosToHook = nil
                VoidSkillController()
                for i=1,10 do
                    wait(0.2)
                    StopTween()
                end
                if Alive() then
                    LP.Character.Humanoid:UnequipTools()
                end
            end
        end
    end
}
function GetSeaBeastV4()
    local NearestSeaBeast;
    local NearestDistSeaBeast = math.huge
    for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
        if getRoot(v) and v:FindFirstChild("Health") and  v:FindFirstChild("Health").Value ~= nil and v:FindFirstChild("Health").Value > 0 -- OMG ERRROR
        and (getRoot(v).Position-Vector3.new(25029.345703125, -4.25, 12478.9638671875)).magnitude < 1000
        then
            if (getRoot(v).Position-getRoot(LP.Character).Position).magnitude < NearestDistSeaBeast then
                NearestSeaBeast = v
                NearestDistSeaBeast = (getRoot(v).Position-getRoot(LP.Character).Position).magnitude
            end
        end
    end
    return NearestSeaBeast
end
IsInTrial = {
    ["Cyborg"] = function()
        if Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and game:GetService("Workspace").Map:FindFirstChild("CyborgTrial") 
        and (getRoot(LP.Character).Position-game:GetService("Workspace").Map.CyborgTrial.Roof.Position).magnitude< 1000 
        and task.wait() then
            InTrial = true
        end
    end,
    ["Human"] = function()
        if Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and task.wait()
        and (getRoot(LP.Character).Position-Vector3.new(10044.150390625, 10019.369140625, 89.03580474853516)).magnitude<1000 then
            InTrial = true
        end
    end,
    ["Ghoul"] = function()
        if  Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and task.wait()  
        and (getRoot(LP.Character).Position-Vector3.new(-11706.3994140625, 10011.314453125, 14.088313102722168)).magnitude<1000 then
            InTrial = true
        end
    end,
    ["Mink"] = function()
        if Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and (getRoot(LP.Character).Position-game:GetService("Workspace").StartPoint.Position).magnitude < 1000 and task.wait()
        and (getRoot(LP.Character).Position-Vector3.new(3348, 11011.6494140625, 15925)).magnitude<1000
        and game:GetService("Workspace").Map:FindFirstChild("MinkTrial") then
            InTrial = true
        end
    end,
    ["Skypiea"] = function()
        if Alive() and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and (getRoot(LP.Character).Position-Vector3.new(12003.994140625, 17013.396484375, 5525.26708984375)).magnitude < 500 
        and task.wait() and game:GetService("Workspace").Map:FindFirstChild("SkyTrial") then
            InTrial = true
        end
    end,
    ["Fishman"] = function()
        if Alive() and (getRoot(LP.Character).Position-Vector3.new(25029.345703125, -4.25, 12478.9638671875)).magnitude < 1000 then
            InTrial = true
        end
    end
}

local function IsNearEntrance(Plr)
    local Flag = false
    local a = RaceEntrances[Plr.Data.Race.Value]
    if type(a) == 'table' then
        if IsAlive(Plr.Character) and (getRoot(Plr.Character).Position-a[2].Position).magnitude < 10 then
            Flag  = true;
        end
    else
        if IsAlive(Plr.Character) and (getRoot(Plr.Character).Position-a.Position).magnitude < 10 then
            Flag  = true;
        end
    end
    return Flag
end
--[[

mink: 
shark: 
angel: 
cyborg: 
ghoul: ]]
task.spawn(LPH_JIT_MAX(function()

    while task.wait() do
        if IsInTrial[LP.Data.Race.Value] then
            pcall(IsInTrial[LP.Data.Race.Value])
        end
        if InTrial then
            local start = tick()
            local PositionNeeded = Vector3.new(28700.875, 14889.65625, -154.111328125)
            print("started Trial")
            while LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and Alive() and (getRoot(LP.Character).Position-PositionNeeded).magnitude > 300 and tick()-start< 60 and task.wait() do
            end
            InTrial = false
            print("Passed InTrial")
            if tick()-start<60 then

                print("IN Main loop")
                local starttime2 = tick()
                local InTrialReal = false
                CheckTrial = game:GetService("ReplicatedStorage").Remotes.CommE.OnClientEvent:Connect(function(p1,...)
                    if p1=="Notify" then
                        if string.find(...,"But there can") then 
                            InTrialReal = true
                            if CheckTrial then
                                CheckTrial:Disconnect()
                                CheckTrial = nil
                            end
                        end
                        print(...,string.find(...,"But there can"))
                    end
                end)
                --[[
                Failed = game:GetService("ReplicatedStorage").Remotes.CommE.OnClientEvent:Connect(function(p1,...)
                    if p1=="Notify" then
                        if string.find(...,"Fail") then 
                            InTrialReal = true
                            if CheckTrial then
                                CheckTrial:Disconnect()
                                CheckTrial = nil
                            end
                        end
                        print(...,string.find(...,"Fail"))
                    end
                end)]]
                task.wait(6)

                repeat wait()
                until (LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible and InTrialReal) or tick() - starttime2 >= 15
                if CheckTrial then
                    CheckTrial:Disconnect()
                    CheckTrial = nil 
                end
                if tick() - starttime2 >= 15 then
                    print("Trial Time Limit Exceed")
                    continue
                end
                print("Found Time")

                print("Starting")
                if getgenv().Setting.Trial.AutoReset then 
                    pcall(function()
                        game.Players.LocalPlayer.Character.Head:Destroy()
                        game.Players.LocalPlayer.Character.Health= 0
                    end)
                end
                pcall(Equip,GetCurrentTool("Melee",true)) 

                local SkillCheck = function(v)
                    if not string.find(v.Name,"Swing") and not string.find(v.Name,"Melee") and not string.find(v.Name,"SlimeString") and not string.find(v.Name,"BodyVelocity") and not string.find(v.Name,"BodyPosition") and not string.find(v.Name,"BodyGyro") and not string.find(v.Name,"TouchInterest") and not string.find(v.Name,"Dodge") and not string.find(v.Name,"Lines1") and not string.find(v.Name,"Lines2")  and not string.find(v.Name,"InfoBBG") then
                        print(v.Name)
                        return true
                    end
                    return false
                end

                while Alive() and task.wait(0.1) and (getRoot(LP.Character).Position-PositionNeeded).magnitude < 350 and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible do       
                    pcall(function()
                        if getgenv().Setting.Trial.AutoKill or IsFullyTrialEnable() then
                            for i,v in pairs(Players:GetChildren()) do
                                if v~= LP  then
                                    if  Alive() then
                                        local NotInCoolDownSize =UDim2.new(0, 0, 1, -1) 
                                        if IsAlive(v.Character) and (getRoot(v.Character).Position-PositionNeeded).magnitude < 350 then
                                            if  Alive() and IsAlive(v.Character) then
                                                local function onToolEquipped(tool)
                                                    local mousePosValue = tool:FindFirstChild("MousePos")
                                                    if mousePosValue and mousePosValue:IsA("Vector3Value") then
                                                        local connection
                                                        connection = mousePosValue.Changed:Connect(function(newValue)
                                                            if not TickIgnore then 
                                                                TickIgnore = tick()
                                                                MouseFound = newValue
                                                            end
                                                            -- connection:Disconnect()
                                                        end)
                                                    end
                                                end
                                                local CurTool = v.Character:FindFirstChildOfClass("Tool")
                                                if CurTool then 
                                                    onToolEquipped(CurTool)
                                                end
                                                v.Character.ChildAdded:Connect(function(child)
                                                    if child:IsA("Tool") then
                                                        onToolEquipped(child)
                                                    end
                                                end)
                                                
                                            end
                                            local function EnemyUsedSkill()
                                                if TickIgnore then
                                                    return tick() - TickIgnore < 0.5
                                                end 
                                                return false
                                            end
                                            --[[
                                            local OldState = getgenv().Setting.LocalPlayer.AutoEnableObservation and true or false
                                            getgenv().Setting.LocalPlayer.AutoEnableObservation = true]]
                                            local Task = task.spawn(function()

                                                while true do
                                                    pcall(function()
                                                        getRoot(LP.Character).Size = Vector3.new(2,1,2) 

                                                    end)

                                                   -- game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
                                                    task.wait(1)
                                                end
                                            end)
                                            local FirstUseSkill = getgenv().Setting.Trial.UseWeapon
                                            local WeaponToUse = getgenv().Setting.Trial.WeaponToUse or "Gun"
                                            local LastUseSkill
                                            while Alive() and IsAlive(v.Character) and task.wait(0.1) and (getRoot(v.Character).Position-PositionNeeded).magnitude < 350 and (getgenv().Setting.Trial.AutoKill or IsFullyTrialEnable()  ) and LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible  do

                                                Floating(true)
                                                if FirstUseSkill then
                                                    TP(v.Character,Vector3.new( math.random(-30,30), math.random(-6,4), math.random(-30,30)),true)
                                                elseif LastUseSkill and tick()-LastUseSkill<=0.7 then 
                                                    TP(v.Character,Vector3.new(math.random(-50,50), math.random(-50,50), math.random(-50,50)),true)
                                                else

                                                    TP(v.Character,Vector3.new(0, 0, 3),true)
                                                end
                                                SmartAbilityUse()
                                                getgenv().PosToHook = getRoot(v.Character).Position
                                                getgenv().SilentAimPos = true
                                                if TickIgnore then
                                                    while EnemyUsedSkill() and task.wait() and Alive() and IsAlive(GetPlayer.Character) do
                                                        local a = GetPlayer.Character.HumanoidRootPart.Position
                                                        local b = MouseFound 
                                                        local direction = (b - a)
                                                        local unitDirection = direction.unit
                                                        local scaledVector = unitDirection * 60
                                                        local farthestPoint = a - scaledVector
                                                        LP.Character.HumanoidRootPart.CFrame = CFrame.new(farthestPoint)
                                                    end
                                                    TickIgnore = nil
                                                end
                                                if FirstUseSkill then 
                                                    pcall(Equip,GetCurrentTool(WeaponToUse,true)) 

                                                else
                                                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
                                                    pcall(Equip,GetCurrentTool("Melee",true)) 


                                                end
                                                spawn(function()
                                                    if FirstUseSkill then
                                                        local IST = LP.Character:FindFirstChildOfClass("Tool")
                                                        local WeaponData = require(IST.Data)                                  
                                
                                                        local Keys = ((getgenv().Setting.Trial.WeaponSkills and  #getgenv().Setting.Trial.WeaponSkills > 0) and  getgenv().Setting.Trial.WeaponSkills) or {"Z","X"}
                                                        for i,v in pairs(Keys) do
                                                            local LvRequire = WeaponData.Lvl[v]
                                                            if IST.ToolTip == WeaponToUse and LP.PlayerGui.Main.Skills[IST.Name][v].Cooldown.Size == NotInCoolDownSize then
                                                                if IST:FindFirstChild("Level") and (LvRequire and LvRequire <= IST.Level.Value) or not LvRequire then
                                                                    Press(v)
                                                                    UsedSkill = true
                                                                    
                                                                    delay(0.4,function()
                                                                        UsedSkill = false
                                                                    end)
                                                                    task.wait(0.2)
                                                                end
                                                            end
                                                        end
                                                        local UsedAllSkill = true
                                                        for i,v in pairs(Keys) do
                                                            local LvRequire = WeaponData.Lvl[v]
                                                            if IST:FindFirstChild("Level") and (LvRequire and LvRequire <= IST.Level.Value)  then
                                                                if IST.ToolTip == WeaponToUse and LP.PlayerGui.Main.Skills[IST.Name][v].Cooldown.Size == NotInCoolDownSize then
                                                                    UsedAllSkill = false
                                                                end 
                                                            end
                                                        end 
                                                        if UsedAllSkill then 
                                                            FirstUseSkill = false
                                                            LastUseSkill = tick()
                                                        end
                                                    end
                                                end)
                                                
                                            end
                                            if Task then 
                                                task.cancel(Task)
                                                Task= nil 
                                            end
                                            pcall(function()
                                                getRoot(LP.Character).Size = Vector3.new(2,2,1) 

                                            end)

                                            getgenv().Setting.LocalPlayer.AutoEnableObservation = OldState
                                            getgenv().SilentAimPos = false
                                            Floating(false)
                                            getgenv().PosToHook = nil
                                            getgenv().SilentAimPos = false
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    end)
                end
                print("End")

            end 
        else
            if getgenv().Setting.TrialTeam.Enable or IsFullyTrialEnable()   then 
                local Count=0
                for i2,v2 in pairs(game.Players:GetChildren()) do
                    if (v2.Name == getgenv().Setting["TrialTeam"].TrialPlayer1 or v2.Name == getgenv().Setting["TrialTeam"].TrialPlayer2)  and IsAlive(v2.Character) then 
                        if IsNearEntrance(v2) then
                            Count= Count + 1
                        end

                    end
                end
                if Count >= 2 and IsNearEntrance(LP) then
                    task.wait(0.2)
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                end
            end
            if IsFullyTrialEnable()  and StatusRace ~= "You Need To Train First" and StatusRace ~=  "Get Race V4 First" then
                if not IsNearEntrance(LP) then 
                    while not Alive() and task.wait() do 
                    end
                    local a = RaceEntrances[LP.Data.Race.Value]
                    if (getRoot(LP.Character).Position-Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875)).magnitude >= 4000 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14896.5078125, 102.62469482421875))

                    end
                    if type(a) == 'table' then
                        for i, v in pairs(a) do
                            getRoot(LP.Character).CFrame = v
                            task.wait(1.5)
                        end
                    else
                        getRoot(LP.Character).CFrame = a
                    end
                else
                    local Count = 0
                    local Mark = {}
                    for i,v in pairs(GetPlayers()) do 
                        local char = v.Character
                        if IsAlive(char) and v.Data.Race.Value  ~= LP.Data.Race.Value and IsNearEntrance(v)  then
                            local CurSkill = SkillsV3Name[v.Data.Race.Value]
                            if char.HumanoidRootPart:FindFirstChild(CurSkill) and not Mark[v.Data.Race.Value] then
                                Mark[v.Data.Race.Value]=true
                                Count=Count+1
                            end
                            
                        end
                    end
                    if Count >= 2 then 
                        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                        task.wait(5)
                    end
                end
            end
        end 
    end
end))
spawn(LPH_JIT_MAX(function()
    while task.wait(0.1) do
        if not IsPremium then 
            getgenv().Setting.FullyAutoTrial.Enable = false
        end
        if getgenv().Setting.Trial.ChooseGear or IsFullyTrialEnable() then 
            AutoChooseGear()
        end
        if (getgenv().Setting.Trial.Enable or IsFullyTrialEnable() ) and AutoRaceV4[LP.Data.Race.Value] then
            pcall(AutoRaceV4[LP.Data.Race.Value])
        end
    end
end))
spawn(LPH_JIT_MAX(function ()

    while task.wait(0.1) do 
        if getgenv().Setting.Pvp.AutoKillNear then 

            local GetPlayer = GetNearestPlayers()
            if GetPlayer and Alive() then
                local v = GetPlayer
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
                local NotInCoolDownSize =UDim2.new(0, 0, 1, -1) 
                local SkillCheck = function(v)
                    if not string.find(v.Name,"Swing") and not string.find(v.Name,"Melee") and not string.find(v.Name,"SlimeString") and not string.find(v.Name,"BodyVelocity") and not string.find(v.Name,"BodyPosition") and not string.find(v.Name,"BodyGyro") and not string.find(v.Name,"TouchInterest") and not string.find(v.Name,"Dodge") and not string.find(v.Name,"Lines1") and not string.find(v.Name,"Lines2")  and not string.find(v.Name,"InfoBBG") then
                        return true
                    end
                    return false
                end
                if  Alive() and IsAlive(GetPlayer.Character) then
                    local function onToolEquipped(tool)
                        local mousePosValue = tool:FindFirstChild("MousePos")
                        if mousePosValue and mousePosValue:IsA("Vector3Value") then
                            local connection
                            connection = mousePosValue.Changed:Connect(function(newValue)
                                if not TickIgnore then 
                                    TickIgnore = tick()
                                    MouseFound = newValue
                                end
                                -- connection:Disconnect()
                            end)
                        end
                    end
                    local CurTool = GetPlayer.Character:FindFirstChildOfClass("Tool")
                    if CurTool then 
                        onToolEquipped(CurTool)
                    end
                    GetPlayer.Character.ChildAdded:Connect(function(child)
                        if child:IsA("Tool") then
                            onToolEquipped(child)
                        end
                    end)
                    
                end
                local function EnemyUsedSkill()
                    if TickIgnore then
                        return tick() - TickIgnore < 0.5
                    end 
                    return false
                end
                getRoot(LP.Character).Size = Vector3.new(2,1,2) 
                while Alive() and task.wait() and getgenv().Setting.Pvp.AutoKillNear and IsAlive(GetPlayer.Character) do       
                        
                    pcall(Equip,GetCurrentTool("Melee",true)) 
                    SmartAbilityUse()
                    UseRaceV4()
                    Floating(true)
                    if UsedSkill then
                        TP(v.Character,Vector3.new(0, 0, 5),true)
                    else
                        TP(v.Character,Vector3.new(0, 0, 5),true)
                    end
                    spawn(function()
                        local IST = LP.Character:FindFirstChildOfClass("Tool")
                        if IST then
                            local WeaponData = require(IST.Data)                                  

                            local Keys = {"Z","X","C"}
                            for i,v in pairs(Keys) do
                                local LvRequire = WeaponData.Lvl[v]
                                if IST.ToolTip == "Melee" and LP.PlayerGui.Main.Skills[IST.Name][v].Cooldown.Size == NotInCoolDownSize then
                                    if IST:FindFirstChild("Level") and (LvRequire and LvRequire <= IST.Level.Value) or not LvRequire then
                                        Press(v)
                                        UsedSkill = true
                                        
                                        delay(0.5,function()
                                            UsedSkill = false
                                        end)
                                        task.wait(0.2)
                                    end
                                end
                            end
                        end
                    end)
                    getgenv().PosToHook = getRoot(v.Character).Position
                    getgenv().SilentAimPos = true
                    if TickIgnore then
                        while EnemyUsedSkill() and task.wait() and Alive() and IsAlive(GetPlayer.Character) do
                            local a = GetPlayer.Character.HumanoidRootPart.Position
                            local b = MouseFound 
                            local direction = (b - a)
                            local unitDirection = direction.unit
                            local scaledVector = unitDirection * 35
                            local farthestPoint = a - scaledVector
                            LP.Character.HumanoidRootPart.CFrame = CFrame.new(farthestPoint)
                           -- LP.Character.HumanoidRootPart.CFrame = CFrame.new(farthestPoint.X,a.Y+50,farthestPoint.Z)
                        end
                        TickIgnore = nil
                    end

                end
                pcall(function ()
                    getRoot(LP.Character).Size = Vector3.new(2,2,1) 
                end)  
                Floating(false)
                getgenv().PosToHook = nil
                getgenv().SilentAimPos = false
            end
        end
    end
end))

--Get Message From Azure Users
local NameAnim = Instance.new("Animation")
local TVKSend = function(Message) 
    NameAnim.AnimationId = "http://www.roblox.com/asset/?id=23134"..tostring(Message)
    local animationTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(NameAnim)
    animationTrack:Play()    
end

spawn(function()
    local function stringtonumber(str)
        local encoded = ""
        for i = 1, #str do
            local ascii = string.byte(str, i)
            encoded = encoded .. string.format("%03d", ascii)
        end
        return encoded
    end
    local function numbertostring(num)
        local str = tostring(num)
        local decoded = ""
        for i = 1, #str, 3 do
            local ascii = tonumber(str:sub(i, i+2))
            decoded = decoded .. safe_string_char(ascii)
        end
        return decoded
    end
    getgenv().AutoTrialPre = {
    }
    local Queue = {}
    local function OnCharAdded(__Char)
        if not __Char then return end
        local humanoid = __Char:WaitForChild("Humanoid", 5)
        if not humanoid then return end
        humanoid.AnimationPlayed:Connect(function(animation) 
            local ID = animation.Animation.AnimationId
            if string.match(ID,"23134") then 
                --print(ID)
                local Message = ID:match("23134(.-)$")
                print(Message,numbertostring(Message))
                if table.find(MultiTrialManager.Group,__Char.Name) then
                    if numbertostring(Message) == "Ready" then
                        MultiTrialManager.Ready[__Char.Name]=true
                    end
                    if numbertostring(Message) == "Not Ready" then
                        MultiTrialManager.Ready[__Char.Name]=false
                    end
                end
            end
        end)
    end
    local function OnPlayerAdded(__Plr)
        OnCharAdded(__Plr.Character)
        __Plr.CharacterAdded:Connect(OnCharAdded)
    end
    for i, v in pairs(game.Players:GetPlayers()) do
        OnPlayerAdded(v)
    end
    game.Players.PlayerAdded:Connect(OnPlayerAdded)
    while task.wait(5) do 
        if #MultiTrialManager.Group == 3 then 
            local args = {
                [1] = "UpgradeRace",
                [2] = "Check"
            }
            
            local a,b,c = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if a == 0 or a== 5 then
                TVKSend(stringtonumber("Ready"))
            else
                TVKSend(stringtonumber("Not Ready"))
            end
        end 
    end
end)
spawn(LPH_NO_VIRTUALIZE(function ()
    local LastUse = {}
    LastUse.RaceV4 = tick()
    while task.wait(0.1) do
        if Alive() then
            pcall(function ()
                if getgenv().Setting.LocalPlayer.AutoBuso and not LP.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
            end)
            pcall(function ()
                if getgenv().Setting.LocalPlayer.AutoUseV4 or IsFullyTrialEnable()  or getgenv().Setting.AutoTrainTrial.Enable then
                    UseRaceV4()
                end
            end)
            pcall(function ()
                if getgenv().Setting.LocalPlayer.AutoUseV3 then
                    SmartAbilityUse(true)
                end
            end)
            local _,err = pcall(function ()
                if Alive() and LP.Character and LP.Character:FindFirstChild("Stun") and LP.Character.Stun.Value == 0  and tick() -u1 >0.4  and not ObservationManager.IsActive() and (getgenv().Setting.LocalPlayer.AutoEnableObservation) then
                    ObservationManager.SetActive(true)

                end
            end)
            if err then 
                print(err)
            end
            pcall(function ()
                if getgenv().Setting.LocalPlayer.WaterWalker then
                    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,113,1000)
                else
                    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
                end
            end)
            pcall(function ()
                if getgenv().Setting.LocalPlayer.NoClip then 
                    NoclipLoop()
                end
            end)
            pcall(function ()
                if getgenv().Setting.LocalPlayer.NoClipShip then
                    ShipLoop()
                end
            end)
            pcall(function()
                if setscriptable then
                    setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
                end
                if sethiddenproperty then
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 9999999)
                end
            end)

            pcall(function ()
                if LP.Character.Humanoid.SeatPart and getgenv().Setting.SeaEvents.ShipSpeedModifier and tonumber(getgenv().Setting.SeaEvents.ShipSpeed) then
                
                    local boat = LP.Character.Humanoid.SeatPart
                    local vehicleSeat = boat
                    vehicleSeat.MaxSpeed = getgenv().Setting.SeaEvents.ShipSpeed
    
                end
            end)
        end
    end
end))

function CasualFarmEmpty()
    return CasualFarm:empty()
end
function WorkingFarmEmpty()
    return WorkingFarm:empty()
end
--Shop + Add Stats
function AddPoint(type,amount)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint",type,amount)
    --print(type,amount)
end
function TimeBone_ToSecond(time_string)
    local hours, minutes = time_string:match("(%d+):(%d+)")
    hours = tonumber(hours)
    minutes = tonumber(minutes)
    
    local total_seconds = (hours * 3600) + (minutes * 60)
    return total_seconds
end
local LastTickCantRandom, TimeBoneRandomTowait
function CheckRandomBone()
    if LastTickCantRandom and TimeBoneRandomTowait and tick()-LastTickCantRandom<=TimeBoneRandomTowait then
        return false
    end
    local v317, v318, v319, v320 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check");
    if v319 <= 0 then
        LastTickCantRandom = tick()
        TimeBoneRandomTowait = TimeBone_ToSecond(v320)
        return false
    end
    return true
end
function RandomBoneCondition()
    return (getgenv().Setting["CDK"].Enable and CDKProgress().Evil == 5) or getgenv().Setting.OneClick.Enable
end
spawn(LPH_NO_VIRTUALIZE(function ()
    while task.wait(1) do
        if getgenv().Setting.OneClick.AutoAddStats then
            local MaxLevelvPoint = CurrentMaxLv
            local MAP = workspace:GetAttribute("MAP")

            if MAP == "Sea1" then
                placesea = 1
            elseif MAP == "Sea2" then
                placesea = 2
            elseif MAP == "Sea3" then
                placesea = 3
            else return
            end
            --//////////////////////

            --//////////////////////
            StatsData = {
                ['Level'] = LP.Data['Level'].Value,
                ['Points'] = LP.Data['Points'].Value,
                ['Melee'] = LP.Data['Stats']['Melee']['Level'].Value,
                ['Defense'] = LP.Data['Stats']['Defense']['Level'].Value,
                ['Sword'] = LP.Data['Stats']['Sword']['Level'].Value,
                ['Fruit'] = LP.Data['Stats']['Demon Fruit']['Level'].Value,
                ['Gun'] = LP.Data['Stats']['Gun']['Level'].Value,
            }
            function CalcPoint(ctype)
                pcall(function()
                    if ctype then
                        if StatsData['Points'] >= MaxLevelvPoint - StatsData['Melee'] then
                            AddPoint('Melee',MaxLevelvPoint - StatsData['Melee'])
                        else
                            AddPoint('Melee',StatsData['Points'])
                        end
                    else
                        if StatsData['Defense'] < DefPoint then
                            if StatsData['Points'] >= DefPoint - StatsData['Defense'] then
                                AddPoint('Defense',DefPoint - StatsData['Defense'])
                            else 
                                AddPoint('Defense',StatsData['Points'])
                            end
                        elseif StatsData['Defense'] >= DefPoint then
                            if StatsData['Melee'] < MaxLevelvPoint then
                                if StatsData['Points'] >= MaxLevelvPoint - StatsData['Melee'] then
                                    AddPoint('Melee',MaxLevelvPoint - StatsData['Melee'])
                                else 
                                    AddPoint('Melee',StatsData['Points'])
                                end
                            elseif StatsData['Melee'] >= MaxLevelvPoint then
                                if StatsData['Defense'] < MaxLevelvPoint then
                                    if StatsData['Points'] >= MaxLevelvPoint - StatsData['Defense'] then
                                        AddPoint('Defense',MaxLevelvPoint - StatsData['Defense'])
                                    else 
                                        AddPoint('Defense',StatsData['Points'])
                                    end
                                elseif StatsData['Sword'] < SwordPoint then
                                    if StatsData['Points'] >= SwordPoint - StatsData['Sword'] then
                                        AddPoint('Sword',SwordPoint - StatsData['Sword'])
                                    else 
                                        AddPoint('Sword',StatsData['Points'])
                                    end
                                elseif StatsData['Defense'] >= MaxLevelvPoint then
                                    

                                    if StatsData['Fruit'] < DFPoint then
                                        if StatsData['Points'] >= DFPoint - StatsData['Fruit'] then
                                            AddPoint('Demon Fruit',DFPoint - StatsData['Fruit'])
                                        else 
                                            AddPoint('Demon Fruit',StatsData['Points'])
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
            if StatsData['Points'] > 0 then
                
                if StatsData['Level'] < 55 then
                    CalcPoint(true)
                elseif StatsData['Level'] >= 55 and StatsData['Level'] < 300 then
                    DefPoint = 15
                    MeleePoint = CurrentMaxLv
                    CalcPoint()
                elseif StatsData['Level'] >= 300 and StatsData['Level'] < 400 then
                    DefPoint = 100
                    MeleePoint = CurrentMaxLv
                    CalcPoint()
                elseif StatsData['Level'] >= 400 then
                    DefPoint = 100
                    MeleePoint = CurrentMaxLv
                    SwordPoint = 600
                    DFPoint = 1950
                    --  DFPoint = 1900
                    CalcPoint()
                end
    
            end

        end
        pcall(function ()
            if getgenv().Setting.Misc.__PreJoin then
                local a = getgenv().PreServerCode
                if a ~= "" then
                    --
                    a =a:gsub(" ", "")
                    a=a:gsub("`", "")
                    a=a:gsub("[ \n\r`]", "")
                    print(a)
                    local Check = Encryptor.Decrypt(decode(a), "Mi22wee33422d22@@")
                    if Check and #Check > 10 then
                        DangServerHop = true
                        task.wait(1)
                        if tick() - LastClick > 1 then
                            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", Check)
                            

                            LastClick = tick()
                        end
                        task.wait(1)
                        DangServerHop = false
                    end        
                end 
            end
        end)
        if getgenv().Setting.Fruit.EnableSnipeFruit and #getgenv().Setting.Fruit.FruitsToSnipe > 0 and not table.find(getgenv().Setting.Fruit.FruitsToSnipe,LP.Data.DevilFruit.Value) then
            local CurTable = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits",false)
            if CurTable then
                for i, v in pairs(CurTable) do
                    if v.OnSale and table.find(getgenv().Setting.Fruit.FruitsToSnipe ,v.Name) then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",v.Name)
                        
                    end
                end
            end
        end

        if Sea3 then 
            if getgenv().Setting.Shop.AutoBuyBribe then
                if tostring(game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan","1")) ~= "5" then
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan","2")
                end
            end
            if getgenv().Setting.Shop.AutoRandomBone or RandomBoneCondition() then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end
        if (Sea2 or Sea3) and (getgenv().Setting.Shop.HakiColor or getgenv().Setting.OneClick.Enable) then
            local Cache = getgenv().GetServerData.ColorDealer
            if  Cache then
                local OnlyLegendaryHaki = getgenv().Setting.OneClick.Enable or getgenv().Setting.Shop.LegendaryHakiColor
                if ( OnlyLegendaryHaki and table.find({"Snow White","Pure Red","Winter Sky"},Cache)) or not OnlyLegendaryHaki then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","2")    
                end
            end
        end
        if Sea2 and getgenv().Setting.Shop.AutoLegendarySword then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
        end
        if getgenv().Setting.Shop.AutoRandomFruit or getgenv().Setting.OneClick.Enable then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
        end
        if getgenv().OneClickSetting and getgenv().OneClickSetting.RollRace and getgenv().OneClickSetting.RollRace.Enable then 
            if not table.find(getgenv().OneClickSetting.RollRace.Races,LP.Data.Race.Value) then 
                if LP.Data.Fragments.Value >= 3000 then 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
                end
            end
        end
        if getgenv().Setting.Shop["Candy X2 EXP"] then
            local args = {
                [1] = "Candies",
                [2] = "Buy",
                [3] = 1,
                [4] = 1
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        end
        
        if getgenv().Setting.Shop["Candy 500 Fragments"] then 
            local args = {
                [1] = "Candies",
                [2] = "Buy",
                [3] = 2,
                [4] = 2
            }

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        if getgenv().Setting.Fruit.AutoStore or getgenv().Setting.OneClick.Enable then
            local CheckFruit = FruitFunc.IsValidFruit(FruitFunc.HaveFruitInv())
            if CheckFruit then
                
                
                for i,v in pairs(CheckFruit) do
                    if  i == 1 and #v > 0 then
                        print(v[1],v[2])
                        if (FruitFunc.IgnoreStoreFruit and v[1] ~= FruitFunc.IgnoreStoreFruit) or not FruitFunc.IgnoreStoreFruit then
                            WebhookCenter.SimpleSend("Stored Fruit",v[1])

                            local args = {
                                [1] = "StoreFruit",
                                [2] = v[1],
                                [3] = v[2]
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))        
                        end
                    end
                end
            end
        end
        pcall(function ()
            game.ReplicatedStorage.Assets.GUI.DamageCounter.Enabled = not getgenv().Setting.Misc.__RemoveDMGCounter
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = not getgenv().Setting.Misc.__RemoveNotification
            if  getgenv().Setting.Misc.DisableRender3D then 
                if not RenderIsOff  then
                    game:GetService("RunService"):Set3dRenderingEnabled(false)
                    RenderIsOff  = true
                end 
            else 
                if RenderIsOff  then
                    game:GetService("RunService"):Set3dRenderingEnabled(true)
                    RenderIsOff = false
                end
            end
            if getgenv().Setting.Misc.__RemoveEffects and not RemovedEffect then 
                RemovedEffect = true
                if isfluxus then
                    for i,v in pairs(getconnections(game.ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("FX").OnClientEvent)) do 
                        v:Disconnect()
                    end  
                end
            end
        end)
        if getgenv().Setting.Misc.__NoFog then 
            Lighting.FogEnd = 100000
            for i,v in pairs(Lighting:GetDescendants()) do
                if v:IsA("Atmosphere") then
                    v:Destroy()
                end
            end
        end
        if getgenv().Setting.AutoTradeSweetChalice then 
            if CheckItem("God's Chalice") then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc") 
            end
        end
        if getgenv().Setting.OneClick.Enable and Sea2 and LP.Data.Level.Value >= 1100 and not SwanDoor.Check() and SwanDoor.GetFruit() then
            local args = {
                [1] = "LoadFruit",
                [2] = SwanDoor.GetFruit() 
            }

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "TalkTrevor",
                [2] = "3"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end 
end))
local function GetMoonPhase()
    local MoonCheck = game:GetService("Lighting"):GetAttribute("MoonPhase")
    
        
    local LastDigit = tonumber(string.sub(tostring(MoonCheck),#tostring(MoonCheck)));
    return LastDigit
end
local function VinhuchiCalculate()
    local MoonCheck = game:GetService("Lighting"):GetAttribute("MoonPhase")
    
        
    local LastDigit = tonumber(string.sub(tostring(MoonCheck),#tostring(MoonCheck)));
    --print(LastDigit)
    if LastDigit == 5 then
        return 0
    end
    local TimeDayNeedCalculate = (function ()
        if game.Lighting.ClockTime <= 12 then
            return (12 - game.Lighting.ClockTime)/2
        else
            return (24 - game.Lighting.ClockTime)/2
        end
    end)()
    local DayNeededCalculate
    if LastDigit >= 6 then 
        -- 6-7-8-1-2-3-4-5  7 vân + 6 time định kì
        DayNeededCalculate = 13 - LastDigit 

    else
        DayNeededCalculate = 4 - LastDigit
    end
    return math.round(DayNeededCalculate*12+TimeDayNeedCalculate)
end
spawn(LPH_NO_VIRTUALIZE(function ()
    while task.wait(1) do
        SupportRetard()
        repeat wait()
        until ElementsCollection and ElementsCollection["Status"] ~= nil 
        if not getgenv().OneClickUi then 
            repeat wait()
            until ElementsCollection["Raid-Material"] ~= nil 
        end
        local function getcallstack()
            return debug.traceback()
        end
        local a,b = xpcall(function ()
            local a = "🟢"
            local b = "🔴"
            if ElementsCollection["Status"]["Farming Status"] then
                ElementsCollection["Status"]["Farming Status"]:SetDesc(StatusFarming or "Idle")
            end
            if ElementsCollection["Status"]["Weapon Status [One Click]"] then
                ElementsCollection["Status"]["Weapon Status [One Click]"]:SetDesc(StatusFarming2 or "Idle")
                
            end
            if not getgenv().OneClickUi then 
                if ElementsCollection["Raid-Material"]["Select Material"] then
                    ElementsCollection["Raid-Material"]["Select Material"]:SetTitle("Material: " ..getgenv().Setting.Material.Select)
                end
                if ElementsCollection["Raid-Material"]["Selected Chip"] then
                    ElementsCollection["Raid-Material"]["Selected Chip"]:SetDesc(getgenv().Setting.Raid.Select and (getgenv().Setting.Raid.Select == "" and "None" or getgenv().Setting.Raid.Select) or "None")  
                end
                if ElementsCollection["Sub Farming"]["Chest Count"] then
                    ElementsCollection["Sub Farming"]["Chest Count"]:SetTitle("Collected Chest: "..tostring(ChestCount))
                end
                if ElementsCollection["Main Farm"]["Anchor Position"] then
                    if getgenv().Setting["Kill Aura"].AnchorPosition then 
                        ElementsCollection["Main Farm"]["Anchor Position"]:SetDesc(getgenv().Setting["Kill Aura"].AnchorPosition)
                    end
                end
                if Sea3 then
                    if getgenv().Setting.RaceV4.CheckStatus or getgenv().Setting.AutoTrainTrial.Enable then
                    
                        local args = {
                            [1] = "UpgradeRace",
                            [2] = "Check"
                        }
                        
                        local a,b,c = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        if a == 0 then
                            StatusRace = "You Are Ready For Next Trial"
                        elseif a == 5 then
                            StatusRace = "Finished All Training Sessions"
                        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Awakening") or LP.Character:FindFirstChild("Awakening") then
    
                            
                            StatusRace = "You Need To Train First"
                        else 
                            StatusRace = "Get Race V4 First"
                        end
                        if ElementsCollection["RaceV4-Mirage"]["Trial Status"]  and StatusRace and StatusRace ~= OldStatus then
                            OldStatus = StatusRace
                            ElementsCollection["RaceV4-Mirage"]["Trial Status"]:SetDesc(OldStatus)
                        end
                        
                        if c then
                            
                            -- Script generated by SimpleSpy - credits to exx#9394
                        
                        local args = {
                            [1] = "UpgradeRace",
                            [2] = "Buy"
                        }
                        
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end
            end
            
            if ElementsCollection["Status"]["Client Time"] then 
                local stime = game.Workspace.DistributedGameTime
                local seconds = stime%60
                local minutes = math.floor(stime/60%60)
                local hours = math.floor(stime/3600)
                local tempo = string.format("%.0fh:%.0fm:%.0fs", hours ,minutes, seconds)
                ElementsCollection["Status"]["Client Time"]:SetDesc(tempo)
            end
            --if getgenv().NoCDFunc then
                --getgenv().NoCDFunc()
            --end
            if getgenv().Setting.OneClick.Enable then
                if ElementsCollection["One Click Debugger"]["Raid"] then 
                    
                    local State, Message = FuncsRequirement["Minimum Fragment"]()
                    ElementsCollection["One Click Debugger"]["Raid"]:SetDesc(Message)
                end
                if ElementsCollection["One Click Debugger"]["God Human Progress"] then 
                    local Material = "Dont Have Enough Melee"
                    if DataSave.Unlocked.GodHuman  then 
                        Material = "Unlocked God Human"
                    else
                        if DataSave.Melee["Dragon Tailon"].Mas400 then
                            Material = "Dragon Talon"
                            local Alls = {"Mystic Droplet","Magma Ore","Fish Tail","Dragon Scale"}
                            local CurrentMaterial = "None"
                            for i=1,4 do 
                                if not RequirementGod[tostring(i)] then
                                    CurrentMaterial=Alls[i]
                                    break
                                end
                                
                            end
                            Material=Material .. (" [%s]"):format(CurrentMaterial)
                        end

                    end
                    ElementsCollection["One Click Debugger"]["God Human Progress"]:SetDesc(Material)
                end
                if ElementsCollection["One Click Debugger"]["Spawn Rip Indra"] then 
                    local State, Message = FuncsRequirement["Spawn Rip Indra"]()
                    ElementsCollection["One Click Debugger"]["Spawn Rip Indra"]:SetDesc(Message)
                end
                if ElementsCollection["One Click Debugger"]["Unlock Sea 2"] then
                    local State, Message = FuncsRequirement["Sea 2"]()
                    ElementsCollection["One Click Debugger"]["Unlock Sea 2"]:SetDesc(Message)
                end
                if ElementsCollection["One Click Debugger"]["Unlock Sea 3"] then
                    local State, Message = FuncsRequirement["Sea 3"]()
                    ElementsCollection["One Click Debugger"]["Unlock Sea 3"]:SetDesc(Message)
                end
                if ElementsCollection["One Click Debugger"]["Travel Sea 3"] then
                    local State, Message = FuncsRequirement["Travel Sea3"]("Status")
                    ElementsCollection["One Click Debugger"]["Travel Sea 3"]:SetDesc(Message)
                end
            end
            if Sea3 then


                 
                if ElementsCollection["Status"]["Dimension Kill"] then
                    local GetStats = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",true) -- Anti Flag ???
                    if GetStats then
                        local NumberKill1 = string.gsub(GetStats, "%D", "")
                        if GetStats ~= nil and tonumber(NumberKill1) ~= nil then 
                            local NumberKill2 = tonumber(NumberKill1) -500
                            if NumberKill2 ~= nil then
                                ElementsCollection["Status"]["Dimension Kill"]:SetTitle("Dimension Kill: "..math.abs(NumberKill2))
                            end
                        else
                            ElementsCollection["Status"]["Dimension Kill"]:SetTitle("Dimension Kills: 500")
                        end      
                    end      
                end
                if ElementsCollection["Status"]["Bribe Status"] then 
                        
                    local GetStatus = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("InfoLeviathan","1")
                    if tostring(GetStatus) == "5" then
                        ElementsCollection["Status"]["Bribe Status"]:SetDesc("Leviathan Is Out There")
                    elseif tonumber(GetStatus) and tonumber(GetStatus)< 1 then
                        ElementsCollection["Status"]["Bribe Status"]:SetDesc("I Dont Know")
                    else 
                        ElementsCollection["Status"]["Bribe Status"]:SetDesc("Need To Buy Bribe")
                    end
                end
                if ElementsCollection["Status"]["Server Haki Color"] then  
                    local Cache = getgenv().GetServerData.ColorDealer
                    ElementsCollection["Status"]["Server Haki Color"]:SetDesc(tostring(Cache))
                end
                if ElementsCollection["Status"]["Mirage Status"] then
                    local found = false
                    for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                        if string.find(v.Name,"MysticIsland") then
                            found = true
                        end
                    end
                    ElementsCollection["Status"]["Mirage Status"] :SetTitle("Mirage Island: " .. (found and a or b))
                end
                if ElementsCollection["Status"]["PrehistoricIsland Status"] then
                    local found = false
                    for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                        if string.find(v.Name,"PrehistoricIsland") then

                            found = true
                        end
                    end
                    ElementsCollection["Status"]["PrehistoricIsland Status"] :SetTitle("Prehistoric Island: " .. (found and a or b))
                end

                if ElementsCollection["Status"]["Kitsune Status"] then
                    local found = false
                    for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                        if string.find(v.Name,"KitsuneIsland") then
                            found = true
                        end
                    end
                    ElementsCollection["Status"]["Kitsune Status"]:SetTitle("Kitsune Island: " .. (found and a or b))
                end
                if ElementsCollection["Status"]["FullMoon Status"] then
                    ElementsCollection["Status"]["FullMoon Status"]:SetTitle("Moon Phrase: " .. (CheckMoon() == "Full Moon OMG" and a or tostring(CheckMoon())))
                    ElementsCollection["Status"]["FullMoon Status"]:SetDesc("After Moon Phrase 5 Is Full Moon,Moon Have Cirle 1,2,3->8 then reset to 1")

                    -- ElementsCollection["Status"]["FullMoon Status"]:SetDesc("Moon Phase: " .. tostring( GetMoonPhase()) ..  " ".. tostring(VinhuchiCalculate()) .. " Minutes Till Full Moon")
                end
                if ElementsCollection["Status"]["Day/Night Time"] then
                    ElementsCollection["Status"]["Day/Night Time"]:SetTitle("Time: " .. game.Lighting.ClockTime)
                    ElementsCollection["Status"]["Day/Night Time"]:SetDesc("Is Night: " .. tostring(IsNight() and "True" or "False") )--..  " | ".. tostring(VinhuchiCalculate()) .. " Minutes Till Full Moon")
                end

                if ElementsCollection["Status"]["Elite Status"] then 
                    ElementsCollection["Status"]["Elite Status"]:SetTitle("Elite Status: " .. (GetNearMob("Elite") and a or b ))
                end

                if ElementsCollection["Status"]["Eyes"] then
                    local eyeCount = 0
                    local TikiModel = game:GetService("Workspace").Map:FindFirstChild("TikiOutpost")
                    if TikiModel then
                        local IslandModel = TikiModel:FindFirstChild("IslandModel")
                        if IslandModel then
                            local eyePaths = {
                                IslandModel:FindFirstChild("Eye1"),
                                IslandModel:FindFirstChild("Eye2"),
                                IslandModel:FindFirstChild("IslandChunks") and IslandModel.IslandChunks:FindFirstChild("E") and IslandModel.IslandChunks.E:FindFirstChild("Eye3"),
                                IslandModel:FindFirstChild("IslandChunks") and IslandModel.IslandChunks:FindFirstChild("E") and IslandModel.IslandChunks.E:FindFirstChild("Eye4"),
                            }
                            for _, eye in ipairs(eyePaths) do
                                if eye and eye.Transparency ~= 1 then
                                    eyeCount += 1
                                end
                            end
                        end
                    end
                    ElementsCollection["Status"]["Eyes"]:SetTitle("Eyes: " .. eyeCount .. "/4")
                    ElementsCollection["Status"]["Eyes"]:SetDesc(eyeCount == 4 and "All Eyes Active!" or (eyeCount == 0 and "No Eyes Found" or eyeCount .. " eye(s) remaining"))
                end
            end
        end,getcallstack)
        if b then
            print("Status UI" .. b,"Element Collection: " .. tostring(ElementsCollection))
        end
    end
end))


task.spawn(LPH_JIT_MAX(function()
    while task.wait(0.2) do
        if getgenv().Setting.GunSwitcher.Enable then 
            local MaxMastery = getgenv().Setting.GunSwitcher.MaxMastery
            local CheckS = GetCurrentWeaponSwitcher(MaxMastery,"Gun")
            for i=1,5 do
                if Weapon600Mas.Gun then
                    CheckS = Weapon600Mas.Gun 
                    -- print("Thay Check S La "..tostring(CheckS))

                end
                if CheckS and CheckInvItem(CheckS) and not ((MaxMastery and DataSave.FullMas[CheckS]) or (not MaxMastery and DataSave.FullSkill[CheckS])) then
                    local SwordFarm = LP.Backpack:FindFirstChild(CheckS) or LP.Character:FindFirstChild(CheckS)
                    if not SwordFarm then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",CheckS)
                    end
                    if SwordFarm and SwordFarm:FindFirstChild("Level") then
                        SelectedWeaponAlternative = CheckS
                        
                        MasteryCheck = MaxMastery and 600 or GetMaxMasteryWeapon(SwordFarm) 
                        StatusFarming2 = "Farm "..CheckS .. " To Mas "..tostring(MasteryCheck)

                        if SwordFarm.Level.Value <= MasteryCheck-1 then
                            --print(SwordFarm.Level.Value,MasteryCheck-1)
                            Weapon600Mas.Gun = CheckS
                        else
                            print("Gun Already Maxed")
                            Weapon600Mas.Gun = nil
                            StatusFarming2 = "None"
                            if MaxMastery then
                                DataSave.FullMas[CheckS] = true
                            else
                                DataSave.FullSkill[CheckS] = true                                   
                            end
                            SelectedWeaponAlternative = nil
                        end
                    end  
                end
            end
        end
        if getgenv().Setting.SwordSwitcher.Enable then
            local MaxMastery = getgenv().Setting.SwordSwitcher.MaxMastery
            local CheckS = GetCurrentWeaponSwitcher(MaxMastery,"Sword")
            if CheckS then
                --print("Check S La "..tostring(CheckS))
            end
            
            for i=1,5 do
                if Weapon600Mas.Sword then
                    CheckS = Weapon600Mas.Sword 
                    -- print("Thay Check S La "..tostring(CheckS))

                end
                if CheckS and CheckInvItem(CheckS) and not ((MaxMastery and DataSave.FullMas[CheckS]) or (not MaxMastery and DataSave.FullSkill[CheckS])) then
                    local SwordFarm = LP.Backpack:FindFirstChild(CheckS) or LP.Character:FindFirstChild(CheckS)
                    if not SwordFarm then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",CheckS)
                    end
                    if SwordFarm and SwordFarm:FindFirstChild("Level") then
                        SelectedWeaponAlternative = CheckS
                        
                        MasteryCheck = MaxMastery and 600 or GetMaxMasteryWeapon(SwordFarm) 
                        StatusFarming2 = "Farm "..CheckS .. " To Mas "..tostring(MasteryCheck)

                        if SwordFarm.Level.Value <= MasteryCheck-1 then
                            --print(SwordFarm.Level.Value,MasteryCheck-1)
                            Weapon600Mas.Sword = CheckS
                        else
                            print("Sword Already Maxed")
                            Weapon600Mas.Sword = nil
                            StatusFarming2 = "None"
                            if MaxMastery then
                                DataSave.FullMas[CheckS] = true
                            else
                                DataSave.FullSkill[CheckS] = true                                   
                            end
                            SelectedWeaponAlternative = nil
                        end
                    end  
                end
            end
        end
    end
end))
spawn(LPH_JIT_MAX(function()

    while task.wait(1) do
        if  getgenv().Setting.OneClick.Enable and workspace.DistributedGameTime >= 60*20 and StatusFarming == "Farming Lv (Triple Quest Method)" then
            task.wait(0.3)
            local Content = {5,"Find New Server [One Click]"}
            if Sea3 then
                if math.random(1,2)==1 then 
                    table.insert(Content,1)
                    table.insert(Content,4)
                end 
            end
            MainServerHop(unpack(Content))
        end
    end
end))
spawn(LPH_JIT_MAX(function()
    while task.wait(0.1) do 
        if SelectedPlayer and getgenv().Setting.TweenToPlayer and Players:FindFirstChild(SelectedPlayer) then
            local v = Players:FindFirstChild(SelectedPlayer)
            local char = v.Character
            local Condition = function()
                return IsAlive(char) and getgenv().Setting.TweenToPlayer
            end
            if IsAlive(char) then

                DoTween2(getRoot(char).CFrame,Condition,nil,{ForceTweenPause=true})
            end
        end
    end
end))
spawn(LPH_JIT_MAX(function ()
    local ShootDelay = 1
    local LastShoot = tick()
    local GunDistance = {
        ["Kabucha"] = 95,
        ["Serpent Bow"] = 125,
        ["Bizarre Rifle"] = 395,
        ["Acidum Rifle"] = 300,
        ["Dragonstorm"] = 400
    }
    while task.wait() do
        if getgenv().Setting.Pvp.SilentAimSelected and SelectedPlayer and Players:FindFirstChild(SelectedPlayer) then
            local v = Players:FindFirstChild(SelectedPlayer)
            local char = v.Character
            if IsAlive(char) and Alive() then

                getgenv().HitPosition = char.HumanoidRootPart.Position
            end
        
        elseif getgenv().Setting.Pvp.SilentAimNear then
            local Target = GetNearestPlayers()
            if Target and IsAlive(Target.Character) and Alive() then
                getgenv().HitPosition = Target.Character.HumanoidRootPart.Position
            end
        else
            getgenv().HitPosition = nil
        end
        if getgenv().Setting.Trial.LookAtMoon then 
            MirageFunctions.LookAtMoon()  
        end
        if getgenv().Setting.Pvp.AutoShootGun then

            local Target = GetNearestPlayers()
            if Target and IsAlive(Target.Character) and Alive() then
                local PassDistanceCheck = (function ()
                    local GetGun
                    for i,v in pairs(LP.Character:GetChildren()) do

                        if v:IsA("Tool") then
                            if v.ToolTip == "Gun" then
                                GetGun =  v
                            end
                        end
                    end
                    if GetGun then 
                        if GetGun.Name == "Dragonstorm" then
                            ShootDelay =0.2
                        else 
                            ShootDelay=1
                        end
                        if GunDistance[GetGun.Name] then
                            if getgenv().Setting.Pvp.GunDistanceCheck then
                                if  GetDistance(Target.Character,LP.Character) < GunDistance[GetGun.Name]  then
                                    return true
                                end 
                                return false
                            end
                            return true

                        end
                        return true
                    end

                    return false
                end)()
 
                if  PassDistanceCheck and tick()-LastShoot>ShootDelay then
                    LastShoot = tick()
                    if ShootDelay == 0 then
                        ShootGun(Target.Character)
                        
                    end
                end
                
            end
        end
    end
end))


local LastTradeTick = tick()
local LastFireTick = tick()
spawn(function ()
    while task.wait(0.2) do 
        if getgenv().Setting.SeaEvents.AutoStartKitsune then
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/TouchKitsuneStatue"):FireServer()
        end
        if getgenv().Setting.SeaEvents.AutoTradeKitsune then 
            if tick()-LastTradeTick >= 1 then
                LastTradeTick = tick()

                local Material = GetMaterial("Azure Ember")
                if  Material and (Material >= (getgenv().Setting.SeaEvents.AzureEmberLimit or 20)) then
                    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
                    
                end
            end
        end
        if getgenv().Setting.SeaEvents.AutoCollectKitsune then
            
            for i,v in pairs(game:GetService("Workspace").Terrain:GetChildren()) do 
               -- print(v:GetAttributes().PlayerWisp)
                if v.Name == "_AzureWispAttachment" and v:GetAttributes().PlayerWisp == nil then
                   -- print( v:GetAttributes().PlayerWisp)
                    getgenv().Setting.LocalPlayer.WaterWalker = true
                    if not NoclippingAzure then
                        NoclippingAzure =  RunS.Stepped:Connect(NoclipLoop)
                    end
                   DoTween2(v.CFrame)

                   pcall(function ()
                        task.wait(0.2)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                   end)

                    if tick()-LastFireTick >= 0.5 then
                        LastFireTick = tick()
                        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/CollectBlueEmber"):FireServer()
                    end
                    if NoclippingAzure then
                        NoclippingAzure:Disconnect()
                        NoclippingAzure=nil 
                    end
                end
                
            end
        end
    end
end)
local IsSeaEventAlive = function(v) 
    return v.Parent  and v:FindFirstChild("Health") and  v:FindFirstChild("Health").Value ~= nil and v:FindFirstChild("Health").Value > 0 
end
local IsSB = function (v)
    return getRoot(v) and string.find(v.Name,"SeaBeast")
end
local IsShip = function (v)
    if v.Name == "PirateBrigade" or v.Name == "PirateBasic" or v.Name == "FishBoat" or v.Name == "PirateGrandBrigade" then
        
        if v.Parent and v:FindFirstChild("Engine") then
            return true
        end
    end 
    
end
local GetNearSE = function (Tbl, Type) --Need Adition Check, Not Necessary TBH
    while not Alive() do
        task.wait(0.1)
    end
    if Type == "Ship" then 
        local Near, Dist = nil, 99999
        for i,v in pairs(Tbl) do
            if IsShip(v) and IsSeaEventAlive(v) then 
                if GetDistance(v,LP.Character)< Dist then
                    Near = v
                    Dist = GetDistance(v,LP.Character)
                end
            end
        end
        return Near
    elseif Type == "Sea Beast" then
        local Near, Dist = nil, 99999
        for i,v in pairs(Tbl) do
            if IsSeaEventAlive(v) then 
                if GetDistance(v,LP.Character)< Dist then
                    Near = v
                    Dist = GetDistance(v,LP.Character)
                end
            end
        end
        return Near
    end
end
local SeaEventCondition = function(Name)

    return getgenv().Setting.SeaEvents[Name] or (SeaEventsController[Name] and getgenv().Setting[SeaEventsController[Name]].Enable)
end
local CheckSeaEvent = {
    SeaBeast = function (Force, Distance)
        
        if not SeaEventCondition("SeaBeast") then
            return 
        end
        if not Alive() then
            return 
        end
        local NearestSeaBeast;
        local NearestDistSeaBeast = math.huge
        for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
            if Alive() and IsSeaEventAlive(v) and IsSB(v) and GetDistance(v,LP.Character) <= 1500 then --and (getgenv().Setting.SeaEvents.OnlyFarmNearMob and or not getgenv().Setting.SeaEvents.OnlyFarmNearMob ) 
                if (getRoot(v).Position-getRoot(LP.Character).Position).magnitude < NearestDistSeaBeast then
                    NearestSeaBeast = v
                    NearestDistSeaBeast = (getRoot(v).Position-getRoot(LP.Character).Position).magnitude
                end
            end
        end
        return NearestSeaBeast
    end,
    Ship = function (Force, Distance)
        if not SeaEventCondition("Ship") then
            return 
        end
        if not Alive() then
            return 
        end
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            
            if IsShip(v) then 
                if IsSeaEventAlive(v) then
                    if  GetDistance(v.Engine,LP.Character) <= (Distance or 3000) then   --(getgenv().Setting.SeaEvents.OnlyFarmNearMob and (v.Engine.Position-LP.Character.HumanoidRootPart.Position).magnitude < 1000 or not getgenv().Setting.SeaEvents.OnlyFarmNearMob)
                        return v
                    end
                end
            end
        end
    end,
    TerrorShark = function(Force)

        if not SeaEventCondition("TerrorShark") and not Force then
            return 
        end
        if not Alive() then
            return 
        end
        for i,v in pairs(Enemies:GetChildren()) do
            if v.Name == "Terrorshark" then
                --print("Found Terror Shark",IsAlive(v),GetDistance(v,LP.Character))
                if IsAlive(v) and GetDistance(v,LP.Character) <= 1000 then -- and (getgenv().Setting.SeaEvents.OnlyFarmNearMob and  or not getgenv().Setting.SeaEvents.OnlyFarmNearMob ) then
                    
                    return v
                end
            end
        end
    end,
    Piranha = function()
        if not SeaEventCondition("Piranha") then
            return 
        end
        if not Alive() then
            return 
        end
        for i,v in pairs(Enemies:GetChildren()) do
            if IsAlive(v) and v.Name == "Piranha" and GetDistance(v,LP.Character) <= 1000 then --(getgenv().Setting.SeaEvents.OnlyFarmNearMob and GetDistance(v,LP.Character) <= 400 or not getgenv().Setting.SeaEvents.OnlyFarmNearMob ) 
                return v
            end
        end
    end,
    Leviathan = function()
        if not SeaEventCondition("Leviathan") then
            return 
        end
        if not Alive() then
            return 
        end
        local Near;
        local Dist = math.huge
        for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
            if Alive() and getRoot(v) and IsSeaEventAlive(v)
            and GetDistance(v,LP.Character) <= 2000 and v.Name == "Leviathan"
            then
                if (getRoot(v).Position-getRoot(LP.Character).Position).magnitude < Dist then
                    Near = v
                    Dist = (getRoot(v).Position-getRoot(LP.Character).Position).magnitude
                end
            end
        end
        return Near
        
    end,
    Shark = function()
        if not SeaEventCondition("Shark") then
            return 
        end
        if not Alive() then
            return 
        end
        for i,v in pairs(Enemies:GetChildren()) do
            if Alive() and IsAlive(v) and (v.Name == "Shark" or v.Name == "Fish Crew Member")  and GetDistance(v,LP.Character) <= 400 then -- and (getgenv().Setting.SeaEvents.OnlyFarmNearMob  or not getgenv().Setting.SeaEvents.OnlyFarmNearMob ) then
                return v
            end
        end
    end,
}
local FarmSeaEvent = {
    ["Leviathan"] = function ()
        local Condition = Condition or function ()
            return SeaEventCondition("Leviathan")
        end
        local OldState = getgenv().Setting.LocalPlayer.WaterWalker
        getgenv().Setting.LocalPlayer.WaterWalker = true
        local MarkSegmentDMG = {}
        local SelectedSegment
        local __Segment_Check = game.ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("Combo").OnClientEvent:Connect(function(Dmg)
            if SelectedSegment then 
                if not MarkSegmentDMG[SelectedSegment] then
                    MarkSegmentDMG[SelectedSegment] = 0 
                end
            end
            MarkSegmentDMG[SelectedSegment] = MarkSegmentDMG[SelectedSegment] + Dmg
        end)
        local GetHeath = function (v)
            if getRoot(v) and v:FindFirstChild("Health") and  v:FindFirstChild("Health").Value ~= nil and v:FindFirstChild("Health").Value > 0 then
                return true
            end
            print("Died Part")
        end
        local function IsAllSegmentDmgED()
            local Part = game.Workspace.SeaBeasts:GetChildren()
            local Segments = {}
            for i,v in pairs(Part) do
                if string.find(v.Name,"Segment") then
                    table.insert(Segments,v)
                end
            end
            local C = 0
            for i,v in pairs(Segments) do 
                if MarkSegmentDMG[v] and MarkSegmentDMG[v] >= 20000 then
                    C=C+1 
                end
            end
            if C >= #Segments then
                return true 
            end
        end

        local function MultiSegmentCheck(Segment)
            if getgenv().Setting.SeaEvents.MultiSegmentAttack and string.find(Segment.Name,"Segment") then
                if IsAllSegmentDmgED() then
                    print("All Segment DMGed")
                    return true 
                end
                if MarkSegmentDMG[Segment] and MarkSegmentDMG[Segment] >= 20000 then 
                    print("Segment DMGed")
                    return false 
                end
            end
            return true
        end
        while CheckSeaEvent.Leviathan() and task.wait(0.1) and Condition() do
            local function GetPart()
                local Part = game.Workspace.SeaBeasts:GetChildren()
                for i,v in pairs(Part) do
                    if GetHeath(v) and string.find(v.Name,"Segment") and MultiSegmentCheck(v) then
                        print("Found Segment")
                        return v
                    end
                end
                for i,v in pairs(Part) do
                    if GetHeath(v) and string.find(v.Name,"Tail") then
                        print("Found Tail")
                        return v
                    end
                end
                for i,v in pairs(Part) do
                    if GetHeath(v) and string.find(v.Name,"Leviathan") then
                        print("Found Main")
                        return v
                    end
                end
    
            end
            
            local PartToFarm = GetPart()
            if PartToFarm then
                SelectedSegment = PartToFarm
               
                print("Farming Parts")
                local IsTail
                if string.find(PartToFarm.Name,"Tail") then
                    print("Farming Tail")
                    IsTail = true
                end
                SkillsController.Condition = function ()
                    return Condition() and Alive() and PartToFarm and PartToFarm.Parent and PartToFarm:FindFirstChild("HumanoidRootPart") and GetHeath(PartToFarm) and MultiSegmentCheck(PartToFarm)
                end 
                MakeSeaEventSkill()
                while task.wait(0.1) and Condition() and Alive() and PartToFarm and PartToFarm.Parent and PartToFarm:FindFirstChild("HumanoidRootPart") and GetHeath(PartToFarm) and MultiSegmentCheck(PartToFarm) do
                    getgenv().SilentAimPos = true
    
                    getgenv().PosToHook = PartToFarm:FindFirstChild("HumanoidRootPart").Position
    
                    local HRP = PartToFarm:FindFirstChild("HumanoidRootPart") 
                    Floating(true)
                    if HRP and HRP.Parent then
                        if IsTail then
                            Floating(true)

                            DoTween2(HRP.CFrame*CFrame.new(0,100,0))
                            Floating(true)
                        else
                            Floating(true)

                            DoTween2(HRP.CFrame*CFrame.new(0,70,0))
                            Floating(true)

                        end
                        
                        if  Alive() and Condition() and LP.Character.Humanoid.Health <= LP.Character.Humanoid.MaxHealth*40/100 then
                            while HRP and HRP.Parent and Condition() and task.wait(0.1) and Alive() and LP.Character.Humanoid.Health <= LP.Character.Humanoid.MaxHealth*80/100 do
                                getRoot(LP.Character).CFrame = HRP.CFrame + Vector3.new(0,2000,0)
                            end
                        end
                    end

                    Floating(true)
                    --game:GetService("Workspace").Map.TikiOutpost.HeartDropoff
                   -- workspace.Map.FrozenHeart
                   --[[
                    local args = {
    [1] = "FireHarpoon",
    [2] = 0.07,
    [3] = -0.03199305511078152,
    [4] = workspace:WaitForChild("Boats"):WaitForChild("Beast Hunter"):WaitForChild("Harpoon"),
    [5] = 1711376543.011423
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

                   ]]
                end 
                VoidSkillController()
                if Alive() then
                    print("TP UP")
                    DoTween2(getRoot(LP.Character).CFrame*CFrame.new(0,70,0))
                    Floating(true)
                end
                
                
                task.wait(1)
                print("Stopped")
                getgenv().PosToHook = nil
                getgenv().SilentAimPos = false
            end
        end
        if __Segment_Check then
            __Segment_Check:Disconnect()
            __Segment_Check = nil 
        end
        print("Finished Leviathan")
        getgenv().Setting.LocalPlayer.WaterWalker = OldState
        Floating(false)
    end,
    TerrorShark = function (Condition)
        local Condition = Condition or function ()
            return SeaEventCondition("TerrorShark")
        end
      --  print("Called")
        local Mob = CheckSeaEvent.TerrorShark()
        
        if IsAlive(Mob) then
            
            local DebugAlive = function(Object,HaveHRP,HaveHumanoid)
                if Object and Object.Parent then
                    --print("Is Valid Object")
                    if  getRoot(Object) and Object:FindFirstChild('Humanoid') then
                        --print("Has Good Parts")
                        if Object:FindFirstChild('Humanoid').Health and Object:FindFirstChild('Humanoid').Health > 0 then
                            --print("Pass")
                            return true
                        end
                    end
                end
                return false
            end
            local TerrorSharkDodge = game:GetService("Workspace")["_WorldOrigin"].ChildAdded:Connect(function (v)
                if Alive() then
                    if (v.Name == "SharkSplash" or v.name == "SpinSplash") and GetDistance(v.Position,LP.Character) < 350  then
                        --print("Ne Lv 1")
                        NeLv1 = tick()
                    end
                    if v.Name == "ChargeUp" and GetDistance(v.Position,LP.Character) < 350 then
                      ---  print("Ne Lv 2")
                        NeLv2 = tick()
                    end
                end
            end)
           -- print("Farming Teror Shark")
            while DebugAlive(Mob) and task.wait(0.2) and Condition()  do
                pcall(function ()
                    LP.Character.Humanoid.Sit = false

                    if  Alive() and Condition() and getgenv().Setting.SeaEvents.SafeMode and LP.Character.Humanoid.Health <= 3000 then
                        while DebugAlive(Mob) and Condition() and getgenv().Setting.SeaEvents.SafeMode and task.wait(0.1) and Alive() and LP.Character.Humanoid.Health <= 6000 do
                            TP(Mob,Vector3.new(0, 300, 20))
                        end
                    end
                    if NeLv1 then
                        while Alive() and DebugAlive(Mob) and Condition() and  tick()-NeLv1<0.6 and task.wait(0.1) do
                            TP(Mob,Vector3.new(0, 300, 20))
                        end
                        NeLv1 = nil
                        
                    end 
                    if NeLv2 then
                        while Alive() and DebugAlive(Mob) and Condition() and  tick()-NeLv2<1.1  and task.wait(0.1) do
                            TP(Mob,Vector3.new(0, 300, 20))
                        end
                        NeLv2 = nil
                        
                    end 
                    

                    Floating(true)
                                            DoTween2(Mob.HumanoidRootPart.CFrame*CFrame.new(0,getgenv().Setting.SeaEvents.TerrorSharkY or 50,0))
                        Floating(true)
                end)

                                    pcall(Equip, GetCurrentTool("Melee", true))
            end
            if TerrorSharkDodge then
                TerrorSharkDodge:Disconnect()
                TerrorSharkDodge = nil
            end
            Floating(false)
        end
    end,
    SeaBeast = function ()
        local NearestSeaBeast  = CheckSeaEvent.SeaBeast()
        SeaBeastSpawned = false
        getgenv().SilentAimPos = false
        if NearestSeaBeast then
            if getgenv().Setting.SeaEvents.IgnoreSeaBeast and Alive() then
                local LastPosition = getRoot(LP.Character).Position
                LP.Character.Humanoid.Sit = false
                while task.wait(0.1) and NearestSeaBeast and NearestSeaBeast.Parent and Alive() and getgenv().Setting.SeaEvents.IgnoreSeaBeast and SeaEventCondition("SeaBeast") do 
                    getRoot(LP.Character).CFrame = CFrame.new(LastPosition.X,LastPosition.Y+1000,LastPosition.Z)
                end 
                getRoot(LP.Character).CFrame = CFrame.new(LastPosition)
            else
                print("Farming Sea")
                getgenv().SilentAimPos = true
                SeaBeastSpawned = true
                local increment = 0
                local DISTANCE = 150
                                    MakeSeaEventSkill()
                SkillsController.Condition = function ()
                    return Alive() and NearestSeaBeast and NearestSeaBeast.Parent and 
                    NearestSeaBeast:FindFirstChild("Health") and NearestSeaBeast:FindFirstChild("Health").Value ~= nil 
                    and NearestSeaBeast:FindFirstChild("HumanoidRootPart") and getRoot(NearestSeaBeast).Position.Y >= -179 
                    and SeaEventCondition("SeaBeast")
                end
                SkillsController.Idle = function ()
                    return NeNe
                end
                repeat task.wait(0.1)
                    
                    if Alive() and NearestSeaBeast.Parent and NearestSeaBeast and NearestSeaBeast:FindFirstChild("HumanoidRootPart")  and 
                    NearestSeaBeast:FindFirstChild("Health") and NearestSeaBeast:FindFirstChild("Health").Value ~= nil and NearestSeaBeast:FindFirstChild("Health").Value > 0 and
                    (SeaEventCondition("SeaBeast") or Bypass)then
                        spawn(function()
                        LP.Character.Humanoid.Sit = false
                        getgenv().PosToHook = NearestSeaBeast.RootPart.body["body.010"].WorldPosition
                        
                        if  getRoot(NearestSeaBeast).Position.Y < -179 then
                            Floating(true)
                        else
                            increment = increment + 18
                            local trueOffset = 360 * 1
                            if not NeNe then
                                DoTween(getRoot(NearestSeaBeast).CFrame * CFrame.new(0, 400, -100))
                            else
                                DoTween2(CFrame.new(getRoot(NearestSeaBeast).Position.X + math.sin(math.rad(increment+trueOffset)) *DISTANCE
                                ,getRoot(NearestSeaBeast).Position.Y+800 
                                ,getRoot(NearestSeaBeast).Position.Z + math.cos(math.rad(increment+trueOffset)) * DISTANCE)* CFrame.new(0, 0, -40))  
                            end
                            Floating(true)
                        end
                        end)
                                                spawn(function()
                            if not daxaiskillsea then
                                daxaiskillsea = true
                                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                                wait(5)
                                daxaiskillsea = false
                            end
                        end)
                        --[[
                        if getgenv().Setting.SeaEvents.SpinShipAttack then
                            local MyBoat = GetBoat()
                            if MyBoat then
                                
                                increment = increment + 18
                                local trueOffset = 360 * 1
                                local DISTANCE = getgenv().Setting.SeaEvents.SpinDistance or 50
                                local BaseSpin = Vector3.new(-42471.0664, 50.709127069, 4914.55664)
                                MyBoat.VehicleSeat.CFrame =CFrame.new(BaseSpin.X + math.sin(math.rad(increment+trueOffset)) *DISTANCE,BaseSpin.Y,BaseSpin.Z + math.cos(math.rad(increment+trueOffset)) * DISTANCE)
                            end
                        end]]
                    end
                until not NearestSeaBeast.Parent or not NearestSeaBeast or not NearestSeaBeast:FindFirstChild("HumanoidRootPart") 
                or not NearestSeaBeast:FindFirstChild("Health") or NearestSeaBeast:FindFirstChild("Health").Value == nil or  NearestSeaBeast:FindFirstChild("Health").Value <= 0
                or not Alive() or (not SeaEventCondition("SeaBeast"))
                VoidSkillController()
                SeaBeastSpawned = false
                getgenv().SilentAimPos = false
                --[[
                if MyBoat and getgenv().Setting.SeaEvents.SpinShipAttack  then
                    MyBoat.VehicleSeat.CFrame = CFrame.new(-42471.0664, 0.709127069, 4914.55664)
                end]]
            end
        end
    end,
    Ship = function ()
        getgenv().SilentAimPos = false
        FarmingShip = false
        if CheckSeaEvent.Ship() and getgenv().Setting.SeaEvents.IgnoreShip  then
            if Alive() and LP.Character.Humanoid.SeatPart then
                local LastPosition = LP.Character.Humanoid.SeatPart.Position
                while Alive() and  CheckSeaEvent.Ship() and task.wait(0.1) and getgenv().Setting.SeaEvents.IgnoreShip and SeaEventCondition("Ship") do
                    LP.Character.Humanoid.Sit = false
                    
                    pcall(function ()
                        LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(-16256.5566, 9.06057358, 430.995422)
                    end) 
                end
                pcall(function ()
                    LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(LastPosition)
                end)
            end 
            
        else
            local DebugShip = function (Ship)
                if Ship and Ship.Parent then
                    if Ship:FindFirstChild("Engine") and Ship:FindFirstChild("Humanoid") and Ship:FindFirstChild("Health") and Ship:FindFirstChild("Health").Value ~= nil and Ship:FindFirstChild("Health").Value > 0 then
                        --print("Passed Ship Check")
                        return true
                    end
                    --print("Has Parents")
                end 
                return false
            end
            local v = CheckSeaEvent.Ship()
            local increment = 0
            while task.wait(0.1) and Alive() and DebugShip(v) and GetDistance(v.Engine,LP.Character) <= 3000 do
                MakeSeaEventSkill()
                SkillsController.Condition = function ()
                    return Alive() and DebugShip(v) and GetDistance(v.Engine,LP.Character) <= 3000
                end
                local _,err = pcall(function ()
                    LP.Character.Humanoid.Sit = false
                    getgenv().SilentAimPos = true
                    FarmingShip = true 
                    getgenv().PosToHook = v.Engine.Position
                    local Condition = function ()
                        return DebugShip(v)
                    end
                    DoTween2(CFrame.new(v.Engine.Position+Vector3.new(0,15,0)),Condition)
                    Floating(true)
                    --[[
                    if getgenv().Setting.SeaEvents.SpinShipAttack  then
                        local MyBoat = GetBoat()
                        if MyBoat then
                            increment = increment + 18
                            local trueOffset = 360 * 1
                            local DISTANCE =  getgenv().Setting.SeaEvents.SpinDistance or 50
                            local BaseSpin = Vector3.new(-42471.0664, 50.709127069, 4914.55664)
                            MyBoat.VehicleSeat.CFrame =CFrame.new(BaseSpin.X + math.sin(math.rad(increment+trueOffset)) *DISTANCE,BaseSpin.Y,BaseSpin.Z + math.cos(math.rad(increment+trueOffset)) * DISTANCE)
                        end
                    end]]
                end)
                if err then
                    print("Ship: "..err)
                end
            end
            VoidSkillController()
            --[[
            local MyBoat = GetBoat()
            if MyBoat and getgenv().Setting.SeaEvents.SpinShipAttack then
                MyBoat.VehicleSeat.CFrame = CFrame.new(-42471.0664, 0.709127069, 4914.55664)
            end]]
            getgenv().SilentAimPos = false
            getgenv().PosToHook = nil
            FarmingShip = false
        end
    end,
    Piranha = function(Condition)
        local Condition = Condition or function ()
            return SeaEventCondition("Piranha")
        end
        local Mob = CheckSeaEvent.Piranha()
        while task.wait(0.2) and IsAlive(Mob) and Alive() and Condition() do
            LP.Character.Humanoid.Sit = false
            Floating(true)
            local a,b = pcall(function ()
                DoTween(Mob.HumanoidRootPart.CFrame*CFrame.new(0,40,0),true)
                                    pcall(Equip,GetCurrentTool("Melee",true))
            end)
            Floating(true)
            if b then
                print("Piranha: " ..b)
            end
        end
        Floating(false)
    end,
    Shark = function ()
        local Condition = Condition or function ()
            return SeaEventCondition("Shark")
        end
        local Mob = CheckSeaEvent.Shark()
        while task.wait(0.2) and IsAlive(Mob) and Condition() and Alive() do
            LP.Character.Humanoid.Sit = false
            Floating(true)
            local a,b = pcall(function ()
                DoTween(Mob.HumanoidRootPart.CFrame*CFrame.new(0,40,0),true)
                                    pcall(Equip,GetCurrentTool("Melee",true))
            end)
            Floating(true)
            if b then
                print(b)
            end
        end
        Floating(false)
    end
}
local function GetBestSeaEvent()
    for i,v in pairs(AllSeaEvents) do 
        if CheckSeaEvent[v]() then
            return v
        end
    end
end
local function ShipFlyerNoNeed(state)
    while not Alive() do
        task.wait(0.1)
    end
    local MyBoat = GetBoat()
    if not MyBoat then
        return 
    end
    MyBoat = MyBoat.Parent
    if state then 
        local desiredHeight = 250
        for _, part in MyBoat:GetDescendants() do
            if part:IsA("BasePart") and not part.Anchored then

                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = Vector3.new(0, 300, 0) 
                bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyVelocity.Parent = part
                bodyVelocity.Name = "Vinhuchi"
                task.spawn(function()
                    while true do
                        task.wait(0.1)
                        currentHeight = part.Position.Y
                        if currentHeight >= desiredHeight - 50 then
                            local newVelocityY = (desiredHeight - currentHeight) * 4
                            bodyVelocity.Velocity = Vector3.new(0, newVelocityY, 0)
                        end

                        if currentHeight >= desiredHeight then
                            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                            break
                        end
                    end
                end)
            end
        end

    else
        for _, part in MyBoat:GetDescendants() do
            if part:IsA("BasePart") and not part.Anchored then
                if part:FindFirstChild("Vinhuchi") then 
                    part:FindFirstChild("Vinhuchi"):Destroy()
                end
            end
        end
    end
end
local function MakeShipFly()
    if LP.Character.Humanoid.SeatPart then
        local a = Instance.new("BodyGyro", LP.Character.Humanoid.SeatPart.Parent)
        a.P = 9e9
        a.Name = "_1"
        a.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        b = Instance.new("BodyVelocity",LP.Character.Humanoid.SeatPart.Parent)
        b.Name = "_2"
        b.P = 15000
        b.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        b.Velocity = Vector3.new(0,0,0) 

        --        a.cframe = LP.Character.Humanoid.SeatPart.Parent.VehicleSeat.CFrame

    end
end
local CurrentSea
local SeaEventVariable = {
    ["Sea 2"] = {
        ShipPosition = Vector3.new(-8243.55078125, 0.1520378142595291, 2916.398193359375),
        ShipDealer = Vector3.new(-5387.28369140625, 8.969104766845703, -716.620361328125)
    },
    ["Sea 3"] = {
        ShipPosition = Vector3.new(-44313.859375, 12.157660102844238, 4731.234375),
        ShipDealer = Vector3.new(-16256.5566, 9.06057358, 430.995422)
    }
} 
if Sea2 then
    CurrentSea = "Sea 2"
elseif Sea3 then 
    CurrentSea = "Sea 3"
end


local function StartSeaEvents()
    if not CurrentSea then
        return 
    end
    if GetBoat() and (GetBoat().Name == (getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"))  then
        MakeShipFly()
        local RequireTweening = function()
            return  SeaEventCondition("StartSeaEvents")
        end
        if not RequireTweening() then
            return 
        end
        local MyBoat = GetBoat()
        if IsNan(MyBoat.VehicleSeat.Position.X) then 
            print("Re Buy Ship")
            local args = {
                [1] = "BuyBoat",
                [2] = getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        elseif ShipController.IsValid(MyBoat) and 
        ((CurrentSea == "Sea 3" and GetDistance(MyBoat.VehicleSeat.Position,SeaEventVariable[CurrentSea].ShipPosition) >= 100)
        or (CurrentSea == "Sea 2" and GetDistance(MyBoat.VehicleSeat.Position,SeaEventVariable[CurrentSea].ShipPosition) >= 100)) then
            LP.Character.Humanoid.Sit = false
            print("TP")
            while SeaEventCondition("StartSeaEvents") and ShipController.IsValid(MyBoat) and not LP.Character.Humanoid.Sit and task.wait(0.1) do
                StatusFarming = "Tweening To Ship"
                DoTween2(MyBoat.VehicleSeat.CFrame,RequireTweening) 
            end
            if LP.Character.Humanoid.SeatPart then
                local RequireRunning = function()
                    return Alive() and ShipController.IsValid(MyBoat) and LP.Character.Humanoid.SeatPart and LP.Character.Humanoid.Sit and SeaEventCondition("StartSeaEvents")
                end
                StatusFarming = "Tweening To Sea"

                DoTween2(CFrame.new(SeaEventVariable[CurrentSea].ShipPosition),RequireRunning,LP.Character.Humanoid.SeatPart)
            end
        elseif SeaEventCondition("RepairShip") and LP.Data.Subclass.Value == "Shipwright" and ShipController.IsValid(MyBoat) and MyBoat:FindFirstChild("Humanoid") and  MyBoat:FindFirstChild("Humanoid").Value ~= nil and MyBoat:FindFirstChild("Humanoid").Value > 0 and MyBoat:FindFirstChild("Humanoid").Value  < MyBoat:GetAttribute("MaxHealth") and GetMaterial("Wooden Plank") > 0 then
            LP.Character.Humanoid.Sit = false
            Floating(true)
            local RequireTweening = function()
                return  SeaEventCondition("StartSeaEvents")
            end
            if  ShipController.IsValid(MyBoat) then
   
                if not LP.Character:FindFirstChild("_RepairHammer") then
                    DoTween2(MyBoat.VehicleSeat.CFrame+Vector3.new(0,5,5),RequireTweening)
                    Floating(true)
                    task.wait(0.1)
                    local args = {
                        [1] = {
                            ["Action"] = "RequestHammer"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SubclassNetwork"):WaitForChild("UseSubclass"):InvokeServer(unpack(args))
                    task.wait(0.5)
                end
                if LP.Character:FindFirstChild("_RepairHammer") then 
                    local Hammer = LP.Character:FindFirstChild("_RepairHammer")
                    if Hammer:GetAttribute("MiniGameCanBeEnabled") and Hammer:GetAttribute("MiniGameEnabled") then
                        if workspace._WorldOrigin:FindFirstChild("MiniGameMarker") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = workspace._WorldOrigin.MiniGameMarker.CFrame + Vector3.new(0,3,0)
                            task.wait(0.3)
                            getgenv().AddedM1Checker = true
                            pcall(function()
                                game:GetService("Players").LocalPlayer.Character._RepairHammer.M1Down:FireServer("Minigame")

                            end)
                            getgenv().StopM1Up = true
                            task.wait(0.5)
                            local args = {
                                [1] = {
                                    ["success"] = true
                                }
                            }
                            pcall(function()

                                game:GetService("Players").LocalPlayer.Character._RepairHammer.M1UP:FireServer(unpack(args))
                            end)
                            getgenv().StopM1Up = false
                        end
                    else
                        getgenv().StopM1Up = true
                        if  not LP.Character:FindFirstChild("_RepairHammer"):GetAttribute("Repairing")  then

                            DoTween2(MyBoat.VehicleSeat.CFrame+Vector3.new(0,5,5),RequireTweening)
                            Floating(true)
                            pcall(function()

                                game:GetService("Players").LocalPlayer.Character._RepairHammer.M1Down:FireServer("Default")
                            end)
                        end
                    end


                end
            end
        elseif not LP.Character.Humanoid.Sit then
           -- print("Not Seat")
            --[[if MyBoat.VehicleSeat.Position.Y > 100 then
                ShipFlyerNoNeed(false)
                print("Ship Too High Buying New Boat")
                local args = {
                    [1] = "BuyBoat",
                    [2] = getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            else]]

            print("Tweenin")
            local v = MyBoat.VehicleSeat
            if ShipController.IsValid(MyBoat) then
                if not v:FindFirstChild('ESPBOARD') then
                    local bill = Instance.new('BillboardGui')
                    local textcac = Instance.new('TextLabel')
                            
                    bill.Name = 'ESPBOARD'
                    bill.Parent = v
                    bill.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    bill.Active = true
                    bill.AlwaysOnTop = true
                    bill.LightInfluence = 1.000
                    bill.MaxDistance = 9e9
                    bill.Size = UDim2.new(0, 200, 0, 100)
                    
                    textcac.Name = 'ESPTEXT'
                    textcac.Parent = bill
                    textcac.RichText = true
                    textcac.Size = UDim2.new(1,0,1,0)
                    textcac.BackgroundTransparency = 1
                    textcac.Font = Enum.Font.GothamBold
                    textcac.TextColor3 = Color3.new(255,255,255)
                    textcac.TextStrokeTransparency = 0.5
                    textcac.TextSize = 15
                    textcac.Text = 'My Ship'
                end
                DoTween2(MyBoat.VehicleSeat.CFrame,RequireTweening)
            end
           -- end
        elseif getgenv().Setting.SeaEvents.AutoEscapeRoughSea then
            local RequireRunning = function ()
                return getgenv().Setting.SeaEvents.AutoEscapeRoughSea and game:GetService("Workspace")["_WorldOrigin"].Sounds.Locations:FindFirstChild("Rough Sea") and RequireTweening()
            end
            DoTween2(CFrame.new(Vector3.new(-17500.43359375, 0, 163.8368377685547) + Vector3.new(-60.09, 0, -60)*1000000),RequireRunning,LP.Character.Humanoid.SeatPart)
        elseif getgenv().Setting.SeaEvents.SpinShipIdle then
            --[[local MyBoat = GetBoat()
            if MyBoat then
               
                Idleincrement = Idleincrement + 18
                local trueOffset = 360 * 1
                local DISTANCE = getgenv().Setting.SeaEvents.SpinDistance or 50  
                local BaseSpin = Vector3.new(SeaEventVariable[CurrentSea].ShipPosition)
                MyBoat.VehicleSeat.CFrame =CFrame.new(BaseSpin.X + math.sin(math.rad(Idleincrement+trueOffset)) *DISTANCE,BaseSpin.Y,BaseSpin.Z + math.cos(math.rad(Idleincrement+trueOffset)) * DISTANCE)
            end]]
            
        end  

    else
        print("Buying Ship")
        SSS(GetNearSpawn(SeaEventVariable[CurrentSea].ShipDealer))
        DoTween2(CFrame.new(SeaEventVariable[CurrentSea].ShipDealer),RequireTweening)
        local args = {
            [1] = "BuyBoat",
            [2] = getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"
        }
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        print("Done Buying Ship")

    end
end
local function SubClassProgressMaker(State, Progress, SubProgress) -- Too Fucking Retarded LOL
    if Progress then 
        if SubProgress then 
            return State .. " [" .. tostring(Progress) .. "]" .. " [" .. tostring(SubProgress) .. "]"
        end
        return State .. " [" .. tostring(Progress) .. "]"
    else
        return State
    end
end
local function UpdateSubClassStatus(State,Progress,SubProgress)
    local StatusElement = ElementsCollection["Sub Class"] and ElementsCollection["Sub Class"]["Status"]
    if StatusElement then 
        StatusElement:SetDesc(SubClassProgressMaker(State,Progress,SubProgress))
    end
end
local function GetCurrentMaxUnlockOrder(LocalData, Data)
    local CurrentOrder = 1
    for i,v in pairs(LocalData) do
        CurrentOrder=math.max(Data[i].UnlockOrder,CurrentOrder)
    end
    return CurrentOrder
end
local function GetNextPassiveName()
    local SubClassLocalData = game:GetService("ReplicatedStorage").Remotes.SubclassNetwork.GetPlayerData:InvokeServer()
    local CurrentClassData = SubClassLocalData.Purchased[SubClassLocalData.Equipped]
    local ClassData = require(game:GetService("ReplicatedStorage").Modules.Data.Subclasses).Data[SubClassLocalData.Equipped]
    local Cur = GetCurrentMaxUnlockOrder(CurrentClassData.Passives,ClassData.Passives)
    for i,v in pairs(ClassData.Passives) do 
        if v.UnlockOrder == Cur + 1 then 
            return v.Index , v.DisplayName, v
        end
    end
    return "None"
end

local function CheckBuyPossible(Data)
    local Currents = {"Valor","Fragments"}
    for i,v in pairs(Currents) do  
        if game.Players.LocalPlayer.Data[v].Value < Data[v] then
            return false
        end 
    end
    return true
end
local function UpdateAllIfPossible()
    local SubClassLocalData = game:GetService("ReplicatedStorage").Remotes.SubclassNetwork.GetPlayerData:InvokeServer()
    local CurrentClassData = SubClassLocalData.Purchased[SubClassLocalData.Equipped]
    local ClassData = require(game:GetService("ReplicatedStorage").Modules.Data.Subclasses).Data[SubClassLocalData.Equipped]
    local MaxOrder = GetCurrentMaxUnlockOrder(CurrentClassData.Passives,ClassData.Passives) + 1
    for i,v in pairs(ClassData.Passives) do 
        if  CurrentClassData.Passives[i] then
            local CurrentPassiveLevel = CurrentClassData.Passives[i].Level
            local NextLevelData = v.Levels[CurrentPassiveLevel+1]
            if NextLevelData then 
                if CheckBuyPossible(NextLevelData.Cost) then 
                    print("Upgraded")
                    game:GetService("ReplicatedStorage").Remotes.SubclassNetwork.PurchasePassive:InvokeServer(SubClassLocalData.Equipped,v.Index)
                    task.wait(0.5)
                end
            end
        end
    end
    local Index, Display, Data = GetNextPassiveName()
    if Index ~= "None" then 
        if CurrentClassData.Level >= Data.LevelRequirement then 
            if CheckBuyPossible(Data.Levels[1].Cost) then 
                print("Bought New Passive")
                game:GetService("ReplicatedStorage").Remotes.SubclassNetwork.PurchasePassive:InvokeServer(SubClassLocalData.Equipped,Index)
            end
        end
    end
end
SubClassReq = {
    Shipwright = function()
        if not getgenv().Setting.SubClass.Enable then
            return "Stopped"
        end
        if LP.Data.Subclass.Value == "Shipwright" then
            local Material = GetMaterial("Wooden Plank")
            if (not GetBoat() and Material< 99) or Material <= 10  then
                return "Leveling", "Farming Wooden Plank", tostring(99 - Material) .. " Left"
            end
            local _, Display = GetNextPassiveName()
            return "Leveling", "Getting Next Passive", Display
        end
        local State, Progress =game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/InteractSubclassQuest"):InvokeServer("Shipwright")
        if State == 0 then
            return "You Need To Complete At Least 50 Sea Events"
        end
        if State == 1 then
            return "Not Unlocked"
        end
        if State == 2  then 
            return "Unlockable"
        end
        if  State == 3 then 
            return "In Progress Unlocking", Progress[1]
        end
    end
}

local function GetNearestIsland()
    local Dist, Obj = 9999999
    for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
        if v:IsA("Model")  then 
            CurDist = (v:GetModelCFrame().Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if Dist > CurDist then
                Dist = CurDist
                Obj = v
            end
        end
    end
    return Obj
end
GetBoat = function()
    for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do 
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v:FindFirstChild("VehicleSeat") then
            return v
        end
    end
    return false
end
if not getgenv().AddedM1Checker  then
    getgenv().StopM1Up = true
    local old = require(game:GetService("ReplicatedStorage"):WaitForChild("Controllers"):WaitForChild("UI").RepairShip).M1Up
    require(game:GetService("ReplicatedStorage"):WaitForChild("Controllers"):WaitForChild("UI").RepairShip).M1Up = function(...)
        if getgenv().StopM1Up or getgenv().Setting.SubClass.Enable then
            return 
        end
        return old(...)
    end
end
function GetDojoData()
    return game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/InteractDragonQuest"):InvokeServer({
        NPC = "Dojo Trainer", 
        Command = "RequestQuest"
    })
end
function ClaimDojoQuest() 
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/InteractDragonQuest"):InvokeServer({
        NPC = "Dojo Trainer", 
        Command = "ClaimQuest"
    })
end
function MoveToDojoQuest()
    SSS(GetNearSpawn(AllToVector(GetNPC("Dojo Trainer"))))

    DoTween2(CFrame.new(AllToVector(GetNPC("Dojo Trainer"))))
    task.wait(2)
end
function MoveToDragonHunter()
    local DragonHunterCF = CFrame.new(5862.44092, 1208.89709, 807.572998, -0.746293902, 0, -0.665617168, 0, 1, 0, 0.665617168, 0, -0.746293902)
    SSS(GetNearSpawn(DragonHunterCF.Position))
    DoTween2(DragonHunterCF)
    task.wait(2)
end
function GetDragonHunterQuest(Type)
    return game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer({Context = Type})

end

function AutoDragonHunterQuest() 
    MoveToDragonHunter()
    local CheckQuest=GetDragonHunterQuest("Check")
    if CheckQuest then
        Quest = CheckQuest.Text
        if not Quest  then
            Quest  = GetDragonHunterQuest("RequestQuest").Text  
        end
        FinishedTaskEmber=false
        ElementsCollection["Vocalnic"]["Auto Ember (Dragon Hunter)"]:SetDesc(Quest)
        local Condition = function()
            return not FinishedTaskEmber and getgenv().Setting.DragonHunterQuest.Enable
        end
        while Condition() do
            if string.find(Quest,"trees") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Cannon")
                local AllTrees = {}
                for i,v in pairs(GetNearestIsland():GetDescendants()) do
                    if v.Name == "Tree" then
                        table.insert(AllTrees,v)
                    end
                end
                local HydraPos = Vector3.new(5338.7578125, 1005.0444946289062, 356.2174987792969)
                table.sort(AllTrees,function(a,b)
                    return GetDistance(a:GetModelCFrame(),HydraPos) < GetDistance(b:GetModelCFrame(),HydraPos)
                end)
                for i,v in pairs(AllTrees) do
                    if not Condition() then 
                        break 
                    end
                    pcall(Equip,GetCurrentTool("Gun",true))
                    local Pos = v.PrimaryPart.Position
                    pcall(function()
                        Floating(true)
                        DoTween2(Pos+Vector3.new(0,0,10))
                        Floating(true)
                        task.wait(1)
                        ShootGun(Pos+Vector3.new(0,0,0))
                        task.wait(3)
                        Floating(false)
                    end)

                end
            end
            if string.find(Quest,"Hydra Enforcers") then
                local MobToFarm = GetNearMob("Hydra Enforcer")
                if IsAlive(MobToFarm) then
                    SSS(GetNearSpawn(getRoot(MobToFarm).Position))
                    while IsAlive(MobToFarm) and task.wait(0.1) and Condition() do 
                        AttackMob(MobToFarm)
                    end
                else
                    SSS(GetNearSpawn(Vector3.new(4609.6875, 1002.2792358398438, 539.6953125)))
                    DoTween2(CFrame.new(4609.6875, 1002.2792358398438, 539.6953125))
                end
            end
            if string.find(Quest,"Venomous Assailants") then
                local MobToFarm = GetNearMob("Venomous Assailant")
                if IsAlive(MobToFarm) then
                    SSS(GetNearSpawn(getRoot(MobToFarm).Position))
                    while IsAlive(MobToFarm) and task.wait(0.1) and Condition() do 
                        AttackMob(MobToFarm)
                    end
                else
                    SSS(GetNearSpawn(Vector3.new(4508.642578125, 1218.256103515625, 644.5357055664062)))
                    DoTween2(CFrame.new(4508.642578125, 1218.256103515625, 644.5357055664062))
                end
            end
            task.wait(1) 
        end
    end
end
game:GetService("ReplicatedStorage").Remotes.CommE.OnClientEvent:Connect(function(p1,...)
    if p1=="Notify" then

       
        if string.find(...,"Head back to the Dojo to complete more tasks") then
            FinishedTaskEmber=true
            ElementsCollection["Vocalnic"]["Auto Ember (Dragon Hunter)"]:SetDesc("Finished")
        end
    end
end)
pcall(function()
    game:GetService("ReplicatedStorage").InGameExplorer_Shared.InGameExplorer_RemoteEvent.OnClientEvent:Connect(function(v12, v13, ...) --[[ Line: 21 ]]
        print(v12,v13,...)
        Notify({
            Text = "Leave Now!!! "..v13,
            Type2 = nil,
            Delay = 100
        })  
    end);

end)

game:GetService("ReplicatedStorage").Modules.Net["RE/DragonDojoEmber"].OnClientEvent:Connect(function(v3)
    
    if v3.Context == "SpawnEmber" then
        for v6 = 1, #v3.Embers do
            game:GetService("ReplicatedStorage").Modules.Net["RE/DragonDojoEmber"]:FireServer();
            task.wait(0.5)
        end
    end
end)
DojoQuest = function()
    MoveToDojoQuest()
    local TBL = GetDojoData()
    if TBL then
        if TBL.Timeout then 
            Notify({
                Text = "Quest Limit Do It Tomorrow",
                Type2 = nil,
                Delay = 10
            })  
            ElementsCollection["Vocalnic"]["Auto Dojo Trainer"]:SetValue(false)
            getgenv().Setting.DojoQuest.Enable=false
            return
        end
        local Belt, Progress, Goal = TBL.Quest.BeltName, TBL.Quest.Progress, TBL.Quest.Goal
        print(Belt, Progress, Goal)
        ElementsCollection["Vocalnic"]["Auto Dojo Trainer"]:SetDesc(Belt.." ["..Progress.."/"..Goal.."]")

        local StartFarm = tick()

        if Belt == "White" then

            local Condition = function()
                return tick()-StartFarm<= 300 and getgenv().Setting.DojoQuest.Enable
            end
            if  Progress >= Goal then
                MoveToDojoQuest()
                ClaimDojoQuest()
            else
                Farms.Level("DojoQuest",Condition)

            end
        end
        if Belt == "Yellow" then 
            local Cur = game:GetService("Players").LocalPlayer.Data.SeaEventsCleared.Value
            local Condition= function()
                return game:GetService("Players").LocalPlayer.Data.SeaEventsCleared.Value - Cur + Progress < Goal and getgenv().Setting.DojoQuest.Enable
            end
            if  Progress >= Goal then
                MoveToDojoQuest()
                ClaimDojoQuest()
            else
                local Sea3Funcs = {"StartSeaEvents","TerrorShark","Ship","Piranha","SeaBeast","Shark","RepairShip"}
                for i,v in pairs(Sea3Funcs) do
                    SeaEventsController[v] = "DojoQuest"
                end
                while Condition()  do
                    task.wait(1)
                end
                for i,v in pairs(Sea3Funcs) do
                    SeaEventsController[v] = nil
                end
            end
        end
        if Belt == "Orange" then 
            if  Progress >= Goal then
                MoveToDojoQuest()
                ClaimDojoQuest()
            else
                Notify({
                    Text = "Orange Belt Do It Yourself",
                    Type2 = nil,
                    Delay = 10
                })  
                ElementsCollection["Vocalnic"]["Auto Dojo Trainer"]:SetValue(false)
                getgenv().Setting.DojoQuest.Enable=false
            end
        end
        if Belt == "Green" then 
            local TimerBelt = TBL.Quest.Progress
            local GoalBelt = TBL.Quest.Goal
            if TimerBelt < GoalBelt then
                local Task = task.spawn(function()
                    while task.wait(1) do
                        if LP:GetAttribute("DangerLevel") > 500 then 
                            TimerBelt=TimerBelt+1
                        end 
                    end
                end)
                while TimerBelt < GoalBelt do
                    print(TimerBelt,GoalBelt)
                    if GetBoat() and (GetBoat().Name == (getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"))  then
                        MakeShipFly()
                        local RequireTweening = function()
                            return  getgenv().Setting.DojoQuest.Enable
                        end
                        if not RequireTweening() then
                            return 
                        end
                        local MyBoat = GetBoat()
                        if IsNan(MyBoat.VehicleSeat.Position.X) then 
                            print("Re Buy Ship")
                            local args = {
                                [1] = "BuyBoat",
                                [2] = getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"
                            }
                            
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        elseif ShipController.IsValid(MyBoat) and  LP.Character.Humanoid.Sit then
                            local RequireRunning = function ()

                                return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.DojoQuest.Enable and game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge == 0 and TimerBelt <GoalBelt
                            end
                            if not ShipClip then
            
                                ShipClip =  RunS.Stepped:Connect(ShipLoop)
                            end
                            task.wait(0.1)
                            if Alive() and LP.Character.Humanoid.SeatPart then
                                if game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge ~= 0 then 
                                    print("Not Good")
                                end
                                LP.Character.Humanoid.SeatPart.CFrame = LP.Character.Humanoid.SeatPart.CFrame*CFrame.new(0,50,0)
                                if GetBoat() then
                                    for i,v in pairs(GetBoat():GetDescendants()) do 
                                        pcall(function()
                                            v.CanCollide = false 
                                        end)
                                    end 
                                end
                                
                            end
                            pcall(MakeShipFly)
                            --mobilefly()
            
                            --[[
                            print(Alive(), not LP.Character.Humanoid.Sit, getgenv().Setting.SeaEvents.AutoFindLeviathan, RequireRunning())
                            while task.wait(0.1) and Alive() and not LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindLeviathan and RequireRunning() do
                                DoTween2(MyBoat.VehicleSeat.CFrame)
                            end]]
                            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and LP.Character.Humanoid.SeatPart.Position.Y < 450 then
                                local a = LP.Character.Humanoid.SeatPart.Position
                                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,1000,a.Z)
                                local RequireRunning2 = function ()
                                    --  print(GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)))
                                    return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.DojoQuest.Enable and GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)) < 2000 and game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge == 0 and TimerBelt <GoalBelt
                                end
            
                                DoTween2(CFrame.new(-42471.0664,20, 4914.55664),RequireRunning2,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=250})
                            end
                            print("STopped")
                            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and (LP.Character.Humanoid.SeatPart.Position.Y < 120 or LP.Character.Humanoid.SeatPart.Position.Y > 200) then
                                local a = LP.Character.Humanoid.SeatPart.Position
                                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,125,a.Z)
                                print("set Seat")
                            end
                            if Alive() and LP.Character.Humanoid.SeatPart then
                            -- DoTween2(CFrame.new(-42471.0664, 20, 4914.55664),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=320}) --Do not fucking uncomment are you stupid
                                DoTween2(CFrame.new(Vector3.new(-17500.43359375, 20, 163.8368377685547) + Vector3.new(-60.09, 0, -60)*1000000),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=250})  
                            end
                            if ShipClip then
                                ShipClip:Disconnect()
                                ShipClip = nil
                            end 
                        elseif not LP.Character.Humanoid.Sit then
                        -- print("Not Seat")
                            --[[if MyBoat.VehicleSeat.Position.Y > 100 then
                                ShipFlyerNoNeed(false)
                                print("Ship Too High Buying New Boat")
                                local args = {
                                    [1] = "BuyBoat",
                                    [2] = getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"
                                }
                                
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            else]]
                
                            print("Tweenin")
                            local v = MyBoat.VehicleSeat
                            if ShipController.IsValid(MyBoat) then
                                if not v:FindFirstChild('ESPBOARD') then
                                    local bill = Instance.new('BillboardGui')
                                    local textcac = Instance.new('TextLabel')
                                            
                                    bill.Name = 'ESPBOARD'
                                    bill.Parent = v
                                    bill.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                    bill.Active = true
                                    bill.AlwaysOnTop = true
                                    bill.LightInfluence = 1.000
                                    bill.MaxDistance = 9e9
                                    bill.Size = UDim2.new(0, 200, 0, 100)
                                    
                                    textcac.Name = 'ESPTEXT'
                                    textcac.Parent = bill
                                    textcac.RichText = true
                                    textcac.Size = UDim2.new(1,0,1,0)
                                    textcac.BackgroundTransparency = 1
                                    textcac.Font = Enum.Font.GothamBold
                                    textcac.TextColor3 = Color3.new(255,255,255)
                                    textcac.TextStrokeTransparency = 0.5
                                    textcac.TextSize = 15
                                    textcac.Text = 'My Ship'
                                end
                                DoTween2(MyBoat.VehicleSeat.CFrame,RequireTweening)
                            end
                        -- end
                            
                        end  
                
                    else
                        print("Buying Ship")
                        SSS(GetNearSpawn(SeaEventVariable[CurrentSea].ShipDealer))
                        DoTween2(CFrame.new(SeaEventVariable[CurrentSea].ShipDealer),RequireTweening)
                        local args = {
                            [1] = "BuyBoat",
                            [2] = getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"
                        }
                        
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        print("Done Buying Ship")
                
                    end
                    task.wait(1)
                end
            else
                MoveToDojoQuest()
                ClaimDojoQuest()
            end
        end
        if Belt == "Blue" then 
            if  Progress >= Goal then
                MoveToDojoQuest()
                ClaimDojoQuest()
            else
                Notify({
                    Text = "Blue Belt Do It Yourself",
                    Type2 = nil,
                    Delay = 10
                })  
                ElementsCollection["Vocalnic"]["Auto Dojo Trainer"]:SetValue(false)
                getgenv().Setting.DojoQuest.Enable=false
            end
        end
        if Belt == "Purple" then 
            if  Progress >= Goal then
                MoveToDojoQuest()
                ClaimDojoQuest()
            else
                Farms["Elite Hop"]("DojoQuest")
            end
        end
    end
end
AutoCollectBerry = function()
    
    l_CollectionService_0 = game:GetService("CollectionService")
    for _, v21 in pairs(l_CollectionService_0:GetTagged("BerryBush")) do
        for v23, v24 in pairs(v21:GetAttributes()) do
            if v23:sub(1, 12) == "_BerryCFrame" then
                function GetBerry()
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/ClaimBerry"):InvokeServer(v21.Parent.Name,v23)
                end
                function GetDes()
                    if v21:GetAttribute(v23) then
                        return CFrame.new(v21.Parent:GetAttribute("CFrame"):ToWorldSpace(v21.Parent:GetAttribute(v23)).Position) 
                    end
                end
                if GetDes() then
                    SSS(GetNearSpawn(Vector3.new(GetDes())))

                    while v21:GetAttribute(v23) do



                        DoTween2(GetDes())
                        GetBerry()
                        
                    -- 
                        
                        

                        task.wait(0.1)
                    end 
                end
            end
        end
        
    end;
    if getgenv().Setting.CollectBerry.Hop then
        local Found = false
        for _, v21 in pairs(l_CollectionService_0:GetTagged("BerryBush")) do
            for v23, v24 in pairs(v21:GetAttributes()) do
                if v23:sub(1, 12) == "_BerryCFrame" then
                    Found = true
                end 
            end 
        end
        if not Found then 
            TrueServerHop()
        end
    end
end
SubClass = {
    Shipwright = function()
        local State, Progress, SubProgress = SubClassReq.Shipwright()
        if State == "Not Unlocked" then
            
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/StartSubclassQuest"):InvokeServer("Shipwright")
            
        end
        if State == "Leveling" then 
            UpdateSubClassStatus(State,Progress,SubProgress)
            while State == "Leveling" and Progress == "Farming Wooden Plank" do
                SSS(GetNearSpawn(Vector3.new(-16256.5566, 9.06057358, 430.995422)))
                local AllTrees = {}
                for i,v in pairs(GetNearestIsland():GetDescendants()) do
                    if v.Name == "Tree" then
                        table.insert(AllTrees,v)
                    end
                end
                for i,v in pairs(AllTrees) do
                    if not (State == "Leveling" and Progress == "Farming Wooden Plank") then
                        break 
                    end
                    pcall(Equip,GetCurrentTool("Gun",true))
                    local Pos = v:GetModelCFrame()
                    Floating(true)
                    DoTween2(Pos+Vector3.new(0,-5,10))
                    Floating(true)
                    task.wait(1)
                    ShootGun(Pos+Vector3.new(0,-2,0))
                    task.wait(3)
                    Floating(false)
                    UpdateSubClassStatus(State,Progress,SubProgress)
                    State, Progress, SubProgress = SubClassReq.Shipwright()
                end
                task.wait(1)

            end

            local Sea3Funcs = {"StartSeaEvents","TerrorShark","Ship","Piranha","SeaBeast","Shark","RepairShip"}
            for i,v in pairs(Sea3Funcs) do
                SeaEventsController[v] = "SubClass"
            end
            while State == "Leveling" and Progress == "Getting Next Passive" do
                UpdateSubClassStatus(State,Progress,SubProgress)
                State, Progress, SubProgress = SubClassReq.Shipwright()
                UpdateAllIfPossible()
                task.wait(1)
            end
            for i,v in pairs(Sea3Funcs) do
                SeaEventsController[v] = nil
            end
        end
        if State == "Unlockable" then 
            UpdateSubClassStatus(State,Progress)
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SubclassNetwork"):WaitForChild("PurchaseSubclass"):InvokeServer("Shipwright")
            task.wait(0.5)
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SubclassNetwork"):WaitForChild("EquipSubclass"):InvokeServer("Shipwright")

        end
        if State == "In Progress Unlocking" then
            
            local Sea3Funcs = {"StartSeaEvents","TerrorShark","Ship","Piranha","SeaBeast","Shark"}
            for i,v in pairs(Sea3Funcs) do
                SeaEventsController[v] = "SubClass"
            end
            while State == "In Progress Unlocking" and Progress > 1 do
                UpdateSubClassStatus(State,Progress,SubProgress)
                State, Progress, SubProgress = SubClassReq.Shipwright()
                task.wait(1)
            end
            for i,v in pairs(Sea3Funcs) do
                SeaEventsController[v] = nil
            end
        end
    end
}


task.spawn(function()
    task.wait(5)
    while task.wait(0.5) do 
        local SubClassTable = getgenv().Setting.SubClass
        if SubClassTable.Enable then 
            local Class = {"Shipwright"}
            for i,v in pairs(Class) do 
                if SubClassTable[v] then 
                    SubClass[v]()
                end
            end
        end

        local DojoQuestTable = getgenv().Setting.DojoQuest
        if DojoQuestTable.Enable then 
            DojoQuest()
        end

        local EmberTask = getgenv().Setting.DragonHunterQuest

        if EmberTask.Enable then
            AutoDragonHunterQuest() 
        end

        if getgenv().Setting.CollectBerry.Enable then
            AutoCollectBerry() 
        end
    end
end)
--[[
    local args = {
    [1] = "FireHarpoon",
    [2] = 0.02610182610652566,
    [3] = 0.05519724038280861,
    [4] = workspace:WaitForChild("Boats"):WaitForChild("Beast Hunter"):WaitForChild("Harpoon"),
    [5] = 1711376918.796623
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

]]
spawn(LPH_JIT_MAX(function ()
    Idleincrement = 0
    while task.wait(0.1) do

        if getgenv().Setting.SeaEvents.AutoFindPrehistoricIsland then
            if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then 
                task.wait(1)
                DoTween2(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt.Parent.CFrame)
                for bO, bP in pairs(workspace.Map.PrehistoricIsland:GetDescendants()) do
                    if bP.Name == 'TouchInterest' then
                        if not (bN and bP:IsDescendantOf(bN)) then
                            bP.Parent:Destroy()
                        end
                    end
                end
                print("Found Prehistoric Island")
                getgenv().Setting.SeaEvents.AutoFindPrehistoricIsland = false
            end

            if not workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true) then
                local boat = GetBoat()
                if not boat then
                    local buyPos = CFrame.new(-16927.451, 9.086, 433.864)
                    DoTween2(buyPos)
                    task.wait(1)
                    if LP:DistanceFromCharacter(buyPos.Position) <= 10 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", getgenv().Setting.SeaEvents.SelectShip or "PirateSloop")
                    end
                else
                    if not LP.Character.Humanoid.Sit then
                        DoTween2(boat.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                    end
                end
            end

            local RequireRunning = function ()
                local a = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
                return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindPrehistoricIsland and not a and game.Players.LocalPlayer.Character.Humanoid.SeatPart and game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge == 0
            end
            if not ShipClip then
                ShipClip = RunS.Stepped:Connect(ShipLoop)
            end
            task.wait(0.1)
            if Alive() and LP.Character.Humanoid.SeatPart then
                if game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge ~= 0 then 
                    print("Not Good")
                end
                LP.Character.Humanoid.SeatPart.CFrame = LP.Character.Humanoid.SeatPart.CFrame*CFrame.new(0,50,0)
                if GetBoat() then
                    for i,v in pairs(GetBoat():GetDescendants()) do 
                        pcall(function()
                            v.CanCollide = false 
                        end)
                    end 
                end
            end

            pcall(MakeShipFly)
            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and LP.Character.Humanoid.SeatPart.Position.Y < 450 then
                local a = LP.Character.Humanoid.SeatPart.Position
                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,1000,a.Z)
                local RequireRunning2 = function ()
                    local a = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
                    return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindPrehistoricIsland and not a and GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)) < 2000 and game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge == 0
                end
                DoTween2(CFrame.new(-42471.0664,20, 4914.55664),RequireRunning2,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=250})
            end
            print("STopped")
            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and (LP.Character.Humanoid.SeatPart.Position.Y < 120 or LP.Character.Humanoid.SeatPart.Position.Y > 200) then
                local a = LP.Character.Humanoid.SeatPart.Position
                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,120,a.Z)
                print("set Seat")
            end
            if Alive() and LP.Character.Humanoid.SeatPart then
                local function Danger6()
                    return RequireRunning() and LP:GetAttribute("DangerLevel") > 500 and not CheckSeaEvent.TerrorShark(true)
                end
                local function NotDanger6()
                    return RequireRunning() and (LP:GetAttribute("DangerLevel") <= 500 or CheckSeaEvent.TerrorShark(true))
                end
                DoTween2(CFrame.new(Vector3.new(-17500.43359375, 20, 163.8368377685547) + Vector3.new(-60.09, 0, -60)*1000000),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=250})
            end
            if ShipClip then
                ShipClip:Disconnect()
                ShipClip = nil
            end
        end
        if getgenv().Setting.SeaEvents.AutoFindLeviathan then
            local RequireRunning = function ()
                local a,b  = game:GetService("Workspace").Map:FindFirstChild("LeviathanGate")
                if a then
                    b = a:FindFirstChild("Teleporter")
                end
                return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindLeviathan and not b and game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge == 0
            end
            if not ShipClip then

                ShipClip =  RunS.Stepped:Connect(ShipLoop)
            end
            task.wait(0.1)
            if Alive() and LP.Character.Humanoid.SeatPart then
                if game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge ~= 0 then 
                    print("Not Good")
                end
                LP.Character.Humanoid.SeatPart.CFrame = LP.Character.Humanoid.SeatPart.CFrame*CFrame.new(0,50,0)
                if GetBoat() then
                    for i,v in pairs(GetBoat():GetDescendants()) do 
                        pcall(function()
                            v.CanCollide = false 
                        end)
                    end 
                end
                
            end

            pcall(MakeShipFly)
            --mobilefly()

            --[[
            print(Alive(), not LP.Character.Humanoid.Sit, getgenv().Setting.SeaEvents.AutoFindLeviathan, RequireRunning())
            while task.wait(0.1) and Alive() and not LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindLeviathan and RequireRunning() do
                DoTween2(MyBoat.VehicleSeat.CFrame)
            end]]
            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and LP.Character.Humanoid.SeatPart.Position.Y < 450 then
                local a = LP.Character.Humanoid.SeatPart.Position
                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,1000,a.Z)
                local RequireRunning2 = function ()
                    local a,b  = game:GetService("Workspace").Map:FindFirstChild("LeviathanGate")
                    if a then
                        b = a:FindFirstChild("Teleporter")
                    end
                    --  print(GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)))
                    return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindLeviathan and not b and GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)) < 2000 and game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge == 0
                end

                DoTween2(CFrame.new(-42471.0664,20, 4914.55664),RequireRunning2,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=250})
            end
            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and (LP.Character.Humanoid.SeatPart.Position.Y < 120 or LP.Character.Humanoid.SeatPart.Position.Y > 200) then
                local a = LP.Character.Humanoid.SeatPart.Position
                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,120,a.Z)
                print("set Seat")
            end
            if Alive() and LP.Character.Humanoid.SeatPart then
               -- DoTween2(CFrame.new(-42471.0664, 20, 4914.55664),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=320}) --Do not fucking uncomment are you stupid

                local function Danger6()
                    return RequireRunning() and LP:GetAttribute("DangerLevel") > 500 and not CheckSeaEvent.TerrorShark(true)
                end
                local function NotDanger6()
                    return RequireRunning() and (LP:GetAttribute("DangerLevel") <= 500 or  CheckSeaEvent.TerrorShark(true))
                end
                DoTween2(CFrame.new(Vector3.new(-17500.43359375, 20, 163.8368377685547) + Vector3.new(-60.09, 0, -60)*1000000),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=250})  

            end
            if ShipClip then
                ShipClip:Disconnect()
                ShipClip = nil
            end       
        end
        if getgenv().Setting.SeaEvents.AutoFindMirage then
            local RequireRunning = function ()
                local a  = game:GetService("Workspace").Map:FindFirstChild("MirageIsland")
                return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindMirage and not a and game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge == 0
            end
            if not ShipClip then

                ShipClip =  RunS.Stepped:Connect(ShipLoop)
            end
            task.wait(0.1)
            if Alive() and LP.Character.Humanoid.SeatPart then
                if game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge ~= 0 then 
                    print("Not Good")
                end
                LP.Character.Humanoid.SeatPart.CFrame = LP.Character.Humanoid.SeatPart.CFrame*CFrame.new(0,50,0)
                if GetBoat() then
                    for i,v in pairs(GetBoat():GetDescendants()) do 
                        pcall(function()
                            v.CanCollide = false 
                        end)
                    end 
                end
                
            end

            pcall(MakeShipFly)
            mobilefly()


            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and LP.Character.Humanoid.SeatPart.Position.Y < 450 then
                local a = LP.Character.Humanoid.SeatPart.Position
                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,1000,a.Z)
                local RequireRunning2 = function ()
                    local a,b  = game:GetService("Workspace").Map:FindFirstChild("MirageIsland")
                     print(GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)))
                    return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindMirage and not a and GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)) < 2000 and game.Players.LocalPlayer.Character.Humanoid.SeatPart.ReceiveAge == 0
                end

                DoTween2(CFrame.new(LP.Character.Humanoid.SeatPart:GetAttribute("seaNextMirageIslandPosition")),RequireRunning2,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=320})
            end


            print("STopped")
            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and (LP.Character.Humanoid.SeatPart.Position.Y < 120 or LP.Character.Humanoid.SeatPart.Position.Y > 200) then
                local a = LP.Character.Humanoid.SeatPart.Position
                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,125,a.Z)
                print("set Seat")
            end
            if Alive() and LP.Character.Humanoid.SeatPart then
               DoTween2(CFrame.new(-42471.0664, 20, 4914.55664),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=320}) --Do not fucking uncomment are you stupid
                DoTween2(CFrame.new(LP.Character.Humanoid.SeatPart:GetAttribute("seaNextMirageIslandPosition")),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true,Speed=320})  
            end
            if ShipClip then
                ShipClip:Disconnect()
                ShipClip = nil
            end       
        end
        if getgenv().Setting.SeaEvents.AutoFindKitsune then
            local RequireRunning = function ()
                local a,b  = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
                return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindKitsune and not a
            end
            local RequireRunning3 = function ()
                local a,b  = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
                return Alive() and not LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindKitsune and a
            end
            if not ShipClip then

                ShipClip =  RunS.Stepped:Connect(ShipLoop)
            end

            if Alive() and not LP.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                if not GetBoat() or not (GetBoat() and (GetBoat().Name == (getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"))) then 
                    print("Buying Ship")
                    SSS(GetNearSpawn(SeaEventVariable[CurrentSea].ShipDealer))
                    DoTween(CFrame.new(SeaEventVariable[CurrentSea].ShipDealer))
                    local args = {
                        [1] = "BuyBoat",
                        [2] = getgenv().Setting.SeaEvents.SelectShip or "PirateSloop"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if GetBoat() and (GetBoat().Name == (getgenv().Setting.SeaEvents.SelectShip or "PirateSloop")) and not LP.Character.Humanoid.Sit  then
                    local MyBoat = GetBoat() 
                    while MyBoat and MyBoat.VehicleSeat and not LP.Character.Humanoid.Sit and task.wait(0.1) do
                        DoTween2(MyBoat.VehicleSeat.CFrame) 
                    end
                end
            end
            task.wait(0.1)
            if Alive() and LP.Character.Humanoid.SeatPart then
                LP.Character.Humanoid.SeatPart.CFrame = LP.Character.Humanoid.SeatPart.CFrame*CFrame.new(0,50,0)
            end
            
            
            --[[
            print(Alive(), not LP.Character.Humanoid.Sit, getgenv().Setting.SeaEvents.AutoFindLeviathan, RequireRunning())
            while task.wait(0.1) and Alive() and not LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindLeviathan and RequireRunning() do
                DoTween2(MyBoat.VehicleSeat.CFrame)
            end]]
            if RequireRunning() then
                local IsFullMoon = (CheckMoon() == "Full Moon OMG")
                if IsFullMoon and IsNight() then
                    ShipFlyerNoNeed(false)
                    if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and LP.Character.Humanoid.SeatPart.Position.Y < 450 then
                        local a = LP.Character.Humanoid.SeatPart.Position
                        LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,500,a.Z)
                        local RequireRunning2 = function ()
                            local a,b  = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
                            --  print(GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)))
                            return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindKitsune and not a and GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)) < 2000
                        end
                        ShipFlyerNoNeed(false)

                        DoTween2(CFrame.new(Vector3.new(-17500.43359375, 5, 163.8368377685547) + Vector3.new(-60.09, 0, -60)*1000000),RequireRunning2,LP.Character.Humanoid.SeatPart,{NoTweenPause=true})  
                    end
                    if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart then
                        local a = LP.Character.Humanoid.SeatPart.Position
                        LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,20,a.Z)
                    end
                    ShipFlyerNoNeed(false)
                    if Alive() and LP.Character.Humanoid.SeatPart then
                        DoTween2(CFrame.new(-299321.9375, 5, -251679.5),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true})  
                    end


                else 
                    local Level5Pos = Vector3.new(-40484.52734375, 0.14203782379627228, 4234.39794921875)
                    if Alive() then
                        local RequireRunning2 = function ()
                            local a,b  = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
                            --  print(GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)))
                            return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindKitsune and not a and GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)) < 2000
                        end
                        if GetDistance2D(Level5Pos,getRoot(LP.Character).Position) <= 100 then
                            ShipFlyerNoNeed(true)
                            while getgenv().Setting.SeaEvents.AutoFindKitsune and GetDistance2D(Level5Pos,getRoot(LP.Character).Position) <= 100 and task.wait(0.1) and not (CheckMoon() == "Full Moon OMG" and  IsNight()) do 
                                pcall(function()
                                    local a = LP.Character.Humanoid.SeatPart.Position
                                    LP.Character.Humanoid.SeatPart.Position = CFrame.new(a.X,250,a.Z)
                                end)
                            end
                            print("Stopped Ship Flier")
                            ShipFlyerNoNeed(false)
                        else
                            if Alive() and RequireRunning() and LP.Character.Humanoid.SeatPart and LP.Character.Humanoid.SeatPart.Position.Y < 450 then
                                local a = LP.Character.Humanoid.SeatPart.Position
                                LP.Character.Humanoid.SeatPart.CFrame = CFrame.new(a.X,500,a.Z)
                                local RequireRunning2 = function ()
                                    local a,b  = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
                                    --  print(GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)))
                                    return Alive() and LP.Character.Humanoid.Sit and getgenv().Setting.SeaEvents.AutoFindKitsune and not a and GetDistance(getRoot(LP.Character),Vector3.new(-16256.5566, 9.06057358, 430.995422)) < 2000
                                end
                                DoTween2(CFrame.new(Level5Pos),RequireRunning2,LP.Character.Humanoid.SeatPart,{NoTweenPause=true})  
                            end
                            if Alive() and LP.Character.Humanoid.SeatPart then
                                DoTween2(CFrame.new(Level5Pos),RequireRunning,LP.Character.Humanoid.SeatPart,{NoTweenPause=true})  
                            end
                        end
                    end
                end
                if ShipClip then
                    ShipClip:Disconnect()
                    ShipClip = nil
                end  
            end
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and game:GetService("Workspace").Map.KitsuneIsland:FindFirstChild("ShrineDialogPart2") then
                LP.Character.Humanoid.Sit = false
                DoTween2(game:GetService("Workspace").Map.KitsuneIsland.ShrineDialogPart.CFrame,RequireRunning3)
            end 
        end
        if GetBestSeaEvent() then
            local v = GetBestSeaEvent()
            --print(v)
            if (getgenv().Setting.SeaEvents.FlyShipFarm or (getgenv().Setting.SeaEvents.IgnoreShip and v == "Ship" )) and GetBoat()then
                ShipFlyerNoNeed(true)
                task.wait(1)
                local MyBoat = GetBoat()
                BaseSpin = MyBoat.VehicleSeat.Position
                local Addition = (getgenv().Setting.SeaEvents.IgnoreShip and v == "Ship" ) and Vector3.new(0,1000,0) or   Vector3.new(0,0,0)
                if Alive() and LP.Character.Humanoid.SeatPart then
                    
                    local Idleincrement = 0
                    SpinShip = RunS.Stepped:Connect(function()
                        
                        if MyBoat then
                            Idleincrement = Idleincrement + 18
                            local trueOffset = 360 * 1
                            local DISTANCE = getgenv().Setting.SeaEvents.SpinDistance or 200
                            MyBoat.VehicleSeat.CFrame =CFrame.new(BaseSpin.X + math.sin(math.rad(Idleincrement+trueOffset)) *DISTANCE,BaseSpin.Y,BaseSpin.Z + math.cos(math.rad(Idleincrement+trueOffset)) * DISTANCE) + Addition
                        end
                    end)
                end
            end
            while CheckSeaEvent[v]() and task.wait(0.1) do 
                print(v)
                FarmSeaEvent[v]()

            end
            if getgenv().Setting.SeaEvents.FlyShipFarm  then
                ShipFlyerNoNeed(false)
                if SpinShip then
                    SpinShip:Disconnect()
                    local MyBoat = GetBoat()
                    if MyBoat and BaseSpin then
                        MyBoat.VehicleSeat.CFrame =CFrame.new(BaseSpin)
                    end
                end
            end
        elseif SeaEventCondition("StartSeaEvents") then
            StartSeaEvents()
            --print("IN")
        end
    end
end))
AllCasualFarm = {"Elite","Factory","Pirate Raid","Rip Indra","Cake Prince","Dough King","GetFruit","FullyRaceV4_Entrance","Bartilo","Race Evolve","Open Pad","Black Beard","Spawn Black Beard","Spawn Rip Indra","Mirage Snipe Fruit","Soul Guitar","Soul Reaper","Spawn Soul Reaper","CDK","Tushita","Get Ghoul","Unlock Electric Claw","BossSniper","Material Soul Guitar","Shark Anchor"}--,"Winter Event"
StateAdded2 = {}

local function AddToPriorityQueue2()
    while task.wait(0.5) do
        for _,v in pairs(AllCasualFarm) do
            if not StateAdded2[v] and getgenv().Setting[v].Enable then
                local State = FuncsRequirement[v]() 
               -- print(v,State)
                if State then
                    print("Casual State Added:",v)
                    StateAdded2[v] = true
                    CasualFarm:put(v,FuncPriories[v])
                end
            end
        end
    end
end

if getgenv().WhiteScreen then 
    pcall(function()
        SupportRetard()
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    end)

end
if getgenv().Setting.OneClick.Enable then
    getgenv().Setting.FullyAutoTrial.Enable = false
    Notify({
        Text = "Intilizing One Click Functions",
        Type2 = nil,
        Delay = 10
    })  
    print("Start Intilizing One Click Functions")
    repeat wait(0.1)
    until FinishLoadUi
    local Timer = tick()

    repeat wait(0.1)
        StatusFarming = "Intilizing One Click Functions"
    until (CheckDone and CheckDone >= 8) or tick()-Timer >= 10 -- For One click Some Farm Cross Sea Functions
    task.spawn(function()
        if getgenv().Setting.OneClick.RedeemCode then
            StatusFarming = "Attemping To Redeem All Codes"
            IslandCaller("RedeemAllCode")
        end
    end)

    StatusFarming = "Finished Intilizing One Click Functions"
    Notify({
        Text = "Finished Intilizing One Click Functions",
        Type2 = nil,
        Delay = 5
    })  
    if getgenv().SetFpsCap and type(getgenv().FpsCap) == 'number' then
        pcall(function()
            if setfpscap then
                setfpscap(getgenv().FpsCap)
            end
            setfflag("TaskSchedulerTargetFps", tostring(getgenv().FpsCap))
        end)
    end
end
spawn(function() 

    AddToPriorityQueue()
end)
spawn(function()
    if getgenv().UiCheckItems then
        local GetaUI = {}
        local DevMODE = false

        --//////////////////////////

        local SC_UI_Name = 'GetaUI'
        local Players = game.Players
        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character
        local Mouse = LocalPlayer:GetMouse()
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")
        local RunService = game:GetService("RunService")
        local MarketplaceService = game:GetService("MarketplaceService")
        local DefaultHideUIKey = Enum.KeyCode.RightControl
        local getasset = getsynasset or getcustomasset
        local req = http_request or request or HttpPost or syn.request
        local VU = game:GetService("VirtualUser")
        local VIM = game:GetService("VirtualInputManager")
        local RS = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        local UIS = game:GetService("UserInputService")
        local HTTPS = game:GetService("HttpService")
        local RunS = game:getService("RunService")
        local LP = Players.LocalPlayer
        local CG = game:GetService("CoreGui")
        local PG = LP.PlayerGui
        local ScreenGui = Instance.new("ScreenGui")

        --//////////////////////////

        local existingUI = CG:FindFirstChild(SC_UI_Name)

        if existingUI then
            existingUI:Destroy()
        end

        ScreenGui.Name = SC_UI_Name
        ScreenGui.Parent = CG
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        --//////////////////////////

        local function Bold(IPtext)
            return '<b>'..tostring(IPtext)..'</b>'
        end
        local function Italic(IPtext)
            return '<i>'..tostring(IPtext)..'</i>'
        end

        --//////////////////////////

        function GetaUI.Load(IPTitle)
            local GetaFuncs = {}

            local Main = Instance.new("Frame")
            local CONTENT = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Top = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            local Top_2 = Instance.new("Frame")
            local TextLabel = Instance.new("TextLabel")
            local UIGradient = Instance.new("UIGradient")
            local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
            local Frame = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
            local UICorner_4 = Instance.new("UICorner")
            local UIGradient_2 = Instance.new("UIGradient")
            local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
            local UIGradient_3 = Instance.new("UIGradient")
            local Line = Instance.new("Frame")
            local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
            local Line_2 = Instance.new("Frame")
            local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
            local Line_3 = Instance.new("Frame")
            local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
            local Container = Instance.new("Frame")
            local accountstats = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local Top_3 = Instance.new("Frame")
            local TextLabel_2 = Instance.new("TextLabel")
            local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
            local account_box = Instance.new("ImageButton")
            local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
            local atcontent = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
            local items = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            local Top_4 = Instance.new("Frame")
            local TextLabel_3 = Instance.new("TextLabel")
            local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
            local work = Instance.new("ImageButton")
            local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint")
            local itcontent = Instance.new("Frame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local UIAspectRatioConstraint_16 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_17 = Instance.new("UIAspectRatioConstraint")
            local TextLabel_4 = Instance.new("TextLabel")
            local UIAspectRatioConstraint_18 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_19 = Instance.new("UIAspectRatioConstraint")
            local ImageLabel = Instance.new("ImageLabel")
            local UIAspectRatioConstraint_20 = Instance.new("UIAspectRatioConstraint")
            local UIGradient_4 = Instance.new("UIGradient")
            local UIAspectRatioConstraint_21 = Instance.new("UIAspectRatioConstraint")
            local STATUS = Instance.new("Frame")
            local UICorner_7 = Instance.new("UICorner")
            local TextLabel_5 = Instance.new("TextLabel")
            local UIAspectRatioConstraint_22 = Instance.new("UIAspectRatioConstraint")
            local poll = Instance.new("ImageButton")
            local UIAspectRatioConstraint_23 = Instance.new("UIAspectRatioConstraint")
            local statuscontent = Instance.new("Frame")
            local UICorner_8 = Instance.new("UICorner")
            local statusFrame1 = Instance.new("Frame")
            local Frame_2 = Instance.new("Frame")
            local UICorner_9 = Instance.new("UICorner")
            local Frame_3 = Instance.new("Frame")
            local UICorner_10 = Instance.new("UICorner")
            local TextLabel_6 = Instance.new("TextLabel")
            local UIAspectRatioConstraint_24 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_25 = Instance.new("UIAspectRatioConstraint")
            local UIGradient_5 = Instance.new("UIGradient")
            local UIAspectRatioConstraint_26 = Instance.new("UIAspectRatioConstraint")
            local Top_5 = Instance.new("Frame")
            local TextLabel_7 = Instance.new("TextLabel")
            local UIAspectRatioConstraint_27 = Instance.new("UIAspectRatioConstraint")
            local UIGradient_6 = Instance.new("UIGradient")
            local UIAspectRatioConstraint_28 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_29 = Instance.new("UIAspectRatioConstraint")
            local statusFrame2 = Instance.new("Frame")
            local Frame_4 = Instance.new("Frame")
            local UICorner_11 = Instance.new("UICorner")
            local Frame_5 = Instance.new("Frame")
            local UICorner_12 = Instance.new("UICorner")
            local TextLabel_8 = Instance.new("TextLabel")
            local UIAspectRatioConstraint_30 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_31 = Instance.new("UIAspectRatioConstraint")
            local UIGradient_7 = Instance.new("UIGradient")
            local UIAspectRatioConstraint_32 = Instance.new("UIAspectRatioConstraint")
            local Top_6 = Instance.new("Frame")
            local TextLabel_9 = Instance.new("TextLabel")
            local UIAspectRatioConstraint_33 = Instance.new("UIAspectRatioConstraint")
            local UIGradient_8 = Instance.new("UIGradient")
            local UIAspectRatioConstraint_34 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_35 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_36 = Instance.new("UIAspectRatioConstraint")
            local UIGradient_9 = Instance.new("UIGradient")
            local ImageLabel_2 = Instance.new("ImageLabel")
            local UIAspectRatioConstraint_37 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_38 = Instance.new("UIAspectRatioConstraint")
            local BlackFrame = Instance.new("Frame")
            local UICorner_13 = Instance.new("UICorner")
            local UIAspectRatioConstraint_39 = Instance.new("UIAspectRatioConstraint")
            local BlackFrame_2 = Instance.new("Frame")
            local UICorner_14 = Instance.new("UICorner")
            local UIAspectRatioConstraint_40 = Instance.new("UIAspectRatioConstraint")
            local ImageLabel_3 = Instance.new("ImageLabel")
            local UIAspectRatioConstraint_41 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_42 = Instance.new("UIAspectRatioConstraint")

            TextLabel.RichText = true
            TextLabel_2.RichText = true
            TextLabel_3.RichText = true
            TextLabel_4.RichText = true
            TextLabel_5.RichText = true
            TextLabel_6.RichText = true
            TextLabel_7.RichText = true
            TextLabel_8.RichText = true
            TextLabel_9.RichText = true

            local UIStroke = Instance.new("UIStroke")
            local UIStroke2 = Instance.new("UIStroke")
            local UIStroke3 = Instance.new("UIStroke")
            local UIStroke4 = Instance.new("UIStroke")
            local UIStroke5 = Instance.new("UIStroke")
            local UIStroke6 = Instance.new("UIStroke")

            UIStroke.Parent = CONTENT
            UIStroke2.Parent = STATUS
            UIStroke3.Parent = accountstats
            UIStroke4.Parent = items
            UIStroke5.Parent = Frame_3
            UIStroke6.Parent = Frame_5

            UIStroke.Color = Color3.fromRGB(0,0,0)
            UIStroke2.Color = Color3.fromRGB(0,0,0)
            UIStroke3.Color = Color3.fromRGB(255,255,255)
            UIStroke4.Color = Color3.fromRGB(255,255,255)
            UIStroke5.Color = Color3.fromRGB(255,255,255)
            UIStroke6.Color = Color3.fromRGB(255,255,255)

            UIStroke.Thickness = 1.8
            UIStroke2.Thickness = 1.8
            UIStroke3.Thickness = 1.7
            UIStroke4.Thickness = 1.7
            UIStroke5.Thickness = 1.7
            UIStroke6.Thickness = 1.7

            local UIGradient1 = Instance.new("UIGradient")
            local UIGradient2 = Instance.new("UIGradient")
            local UIGradient3 = Instance.new("UIGradient")
            local UIGradient4 = Instance.new("UIGradient")

            UIGradient1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 156, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 245, 255))}
            UIGradient1.Rotation = 30
            UIGradient1.Parent = UIStroke3
            UIGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 156, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 245, 255))}
            UIGradient2.Rotation = -107
            UIGradient2.Parent = UIStroke4
            UIGradient3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 156, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 245, 255))}
            UIGradient3.Rotation = 136
            UIGradient3.Parent = UIStroke5
            UIGradient4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 156, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 245, 255))}
            UIGradient4.Rotation = 16
            UIGradient4.Parent = UIStroke6

            Main.Name = "Main"
            Main.Parent = ScreenGui
            Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Main.BackgroundTransparency = 1.000
            Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Main.BorderSizePixel = 0
            Main.Position = UDim2.new(0.18, 0, 0.216883719, 0)
            Main.Size = UDim2.new(0.613730907, 0, 0.679247916, 0)

            CONTENT.Name = "CONTENT"
            CONTENT.Parent = Main
            CONTENT.BackgroundColor3 = Color3.fromRGB(238, 238, 238)
            CONTENT.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CONTENT.BorderSizePixel = 0
            CONTENT.Position = UDim2.new(0.00179536117, 0, -0.166675016, 0)
            CONTENT.Size = UDim2.new(1.0414505, 0, 1.11524558, 0)
            CONTENT.ZIndex = -1

            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = CONTENT

            Top.Name = "Top"
            Top.Parent = CONTENT
            Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Top.BorderSizePixel = 0
            Top.Position = UDim2.new(0.0163055882, 0, 0.0221419986, 0)
            Top.Size = UDim2.new(0.699213922, 0, 0.0799217448, 0)

            UICorner_2.CornerRadius = UDim.new(0, 6)
            UICorner_2.Parent = Top

            Top_2.Name = "Top"
            Top_2.Parent = Top
            Top_2.BackgroundColor3 = Color3.fromRGB(238, 238, 238)
            Top_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Top_2.BorderSizePixel = 0
            Top_2.Position = UDim2.new(0.00319868466, 0, 8.39739278e-06, 0)
            Top_2.Size = UDim2.new(0.996800661, 0, 0.999998331, 0)

            TextLabel.Parent = Top_2
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel.BorderSizePixel = 0
            TextLabel.Position = UDim2.new(0.0156116281, 0, 0.0986113474, 0)
            TextLabel.Size = UDim2.new(0.982467353, 0, 0.797133565, 0)
            TextLabel.ZIndex = 3
            TextLabel.Font = Enum.Font.Gotham
            TextLabel.Text = Italic(Bold(IPTitle))
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 14.000
            TextLabel.TextStrokeColor3 = Color3.fromRGB(98, 98, 98)
            TextLabel.TextStrokeTransparency = 0.710
            TextLabel.TextWrapped = true
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left

            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 156, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 245, 255))}
            UIGradient.Rotation = -90
            UIGradient.Parent = TextLabel

            UIAspectRatioConstraint.Parent = TextLabel
            UIAspectRatioConstraint.AspectRatio = 16.771

            Frame.Parent = Top_2
            Frame.BackgroundColor3 = Color3.fromRGB(238, 238, 238)
            Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Frame.BorderSizePixel = 0
            Frame.Position = UDim2.new(0.873000205, 0, 1.10909104e-06, 0)
            Frame.Size = UDim2.new(0.176999971, 0, 0.999999583, 0)

            UICorner_3.CornerRadius = UDim.new(0, 2)
            UICorner_3.Parent = Frame

            UIAspectRatioConstraint_2.Parent = Frame
            UIAspectRatioConstraint_2.AspectRatio = 2.408

            UICorner_4.CornerRadius = UDim.new(0, 6)
            UICorner_4.Parent = Top_2

            UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(59, 148, 217)), ColorSequenceKeypoint.new(0.87, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
            UIGradient_2.Parent = Top_2

            UIAspectRatioConstraint_3.Parent = Top_2
            UIAspectRatioConstraint_3.AspectRatio = 13.607

            UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(8, 156, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 245, 255))}
            UIGradient_3.Rotation = -90
            UIGradient_3.Parent = Top

            Line.Name = "Line"
            Line.Parent = Top
            Line.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Line.BorderSizePixel = 0
            Line.Position = UDim2.new(1.04986787, 0, 0.0986185074, 0)
            Line.Size = UDim2.new(0.00358503219, 0, 0.797132552, 0)

            UIAspectRatioConstraint_4.Parent = Line
            UIAspectRatioConstraint_4.AspectRatio = 0.061

            Line_2.Name = "Line"
            Line_2.Parent = Top
            Line_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Line_2.BorderSizePixel = 0
            Line_2.Position = UDim2.new(1.2900722, 0, 0.467879444, 0)
            Line_2.Size = UDim2.new(0.0055, 0, 0.696792245, 0)

            UIAspectRatioConstraint_5.Parent = Line_2
            UIAspectRatioConstraint_5.AspectRatio = 0.070

            Line_3.Name = "Line"
            Line_3.Parent = Top
            Line_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Line_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Line_3.BorderSizePixel = 0
            Line_3.Position = UDim2.new(1.05345309, 0, 0.468151987, 0)
            Line_3.Size = UDim2.new(0.236999765, 0, 0.07, 0)

            UIAspectRatioConstraint_6.Parent = Line_3
            UIAspectRatioConstraint_6.AspectRatio = 53.921

            UIAspectRatioConstraint_7.Parent = Top
            UIAspectRatioConstraint_7.AspectRatio = 13.651

            Container.Name = "Container"
            Container.Parent = CONTENT
            Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Container.BackgroundTransparency = 1.000
            Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Container.BorderSizePixel = 0
            Container.Position = UDim2.new(0.0159931667, 0, 0.115600623, 0)
            Container.Size = UDim2.new(0.698742807, 0, 0.852313757, 0)

            accountstats.Name = "accountstats"
            accountstats.Parent = Container
            accountstats.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            accountstats.BackgroundTransparency = 0.700
            accountstats.BorderColor3 = Color3.fromRGB(0, 0, 0)
            accountstats.BorderSizePixel = 0
            accountstats.Position = UDim2.new(0.00378006487, 0, 0.092031382, 0)
            accountstats.Size = UDim2.new(0.412348688, 0, 0.916168928, 0)

            UICorner_5.CornerRadius = UDim.new(0, 5)
            UICorner_5.Parent = accountstats

            Top_3.Name = "Top"
            Top_3.Parent = accountstats
            Top_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top_3.BackgroundTransparency = 1.000
            Top_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Top_3.BorderSizePixel = 0
            Top_3.Position = UDim2.new(7.07451136e-07, 0, 4.21630517e-07, 0)
            Top_3.Size = UDim2.new(0.999999523, 0, 0.0765176415, 0)

            TextLabel_2.Parent = Top_3
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 1.000
            TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.Position = UDim2.new(0.142979428, 0, 0.2, 0)
            TextLabel_2.Size = UDim2.new(0.857020497, 0, 0.757585406, 0)
            TextLabel_2.Font = Enum.Font.Gotham
            TextLabel_2.Text = Bold("STATS")
            TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.TextScaled = true
            TextLabel_2.TextSize = 14.000
            TextLabel_2.TextWrapped = true
            TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

            UIAspectRatioConstraint_8.Parent = TextLabel_2
            UIAspectRatioConstraint_8.AspectRatio = 8.512

            account_box.Name = "account_box"
            account_box.Parent = Top_3
            account_box.BackgroundTransparency = 1.000
            account_box.LayoutOrder = 4
            account_box.Position = UDim2.new(0.0319427326, 0, 0.273387849, 0)
            account_box.Size = UDim2.new(0.0805550292, 0, 0.582868755, 0)
            account_box.ZIndex = 2
            account_box.Image = "rbxassetid://3926307971"
            account_box.ImageRectOffset = Vector2.new(124, 44)
            account_box.ImageRectSize = Vector2.new(36, 36)

            UIAspectRatioConstraint_9.Parent = account_box
            UIAspectRatioConstraint_9.AspectRatio = 1.040

            UIAspectRatioConstraint_10.Parent = Top_3
            UIAspectRatioConstraint_10.AspectRatio = 7.524

            atcontent.Name = "atcontent"
            atcontent.Parent = accountstats
            atcontent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            atcontent.BackgroundTransparency = 1.000
            atcontent.BorderColor3 = Color3.fromRGB(0, 0, 0)
            atcontent.BorderSizePixel = 0
            atcontent.Position = UDim2.new(0.0307687018, 0, 0.0766898319, 0)
            atcontent.Size = UDim2.new(0.93900001, 0, 0.907999992, 0)

            UIListLayout.Parent = atcontent
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

            UIAspectRatioConstraint_11.Parent = atcontent
            UIAspectRatioConstraint_11.AspectRatio = 0.595

            UIAspectRatioConstraint_12.Parent = accountstats
            UIAspectRatioConstraint_12.AspectRatio = 0.576

            items.Name = "items"
            items.Parent = Container
            items.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            items.BackgroundTransparency = 0.700
            items.BorderColor3 = Color3.fromRGB(0, 0, 0)
            items.BorderSizePixel = 0
            items.Position = UDim2.new(0.433999985, 0, 0.0920000002, 0)
            items.Size = UDim2.new(0.490775347, 0, 0.916168869, 0)

            UICorner_6.CornerRadius = UDim.new(0, 5)
            UICorner_6.Parent = items

            Top_4.Name = "Top"
            Top_4.Parent = items
            Top_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top_4.BackgroundTransparency = 1.000
            Top_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Top_4.BorderSizePixel = 0
            Top_4.Position = UDim2.new(1.69828425e-07, 0, 1.94598712e-07, 0)
            Top_4.Size = UDim2.new(0.999999642, 0, 0.0765177757, 0)

            TextLabel_3.Parent = Top_4
            TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.BackgroundTransparency = 1.000
            TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_3.BorderSizePixel = 0
            TextLabel_3.Position = UDim2.new(0.129045039, 0, 0.2, 0)
            TextLabel_3.Size = UDim2.new(0.845216751, 0, 0.725563765, 0)
            TextLabel_3.Font = Enum.Font.Gotham
            TextLabel_3.Text = Bold("ITEMS")
            TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.TextScaled = true
            TextLabel_3.TextSize = 14.000
            TextLabel_3.TextWrapped = true
            TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

            UIAspectRatioConstraint_13.Parent = TextLabel_3
            UIAspectRatioConstraint_13.AspectRatio = 10.432

            work.Name = "work"
            work.Parent = Top_4
            work.BackgroundTransparency = 1.000
            work.LayoutOrder = 4
            work.Position = UDim2.new(0.031999968, 0, 0.273008347, 0)
            work.Size = UDim2.new(0.0676821843, 0, 0.582867742, 0)
            work.ZIndex = 2
            work.Image = "rbxassetid://3926307971"
            work.ImageRectOffset = Vector2.new(924, 364)
            work.ImageRectSize = Vector2.new(36, 36)

            UIAspectRatioConstraint_14.Parent = work
            UIAspectRatioConstraint_14.AspectRatio = 1.040

            UIAspectRatioConstraint_15.Parent = Top_4
            UIAspectRatioConstraint_15.AspectRatio = 8.955

            itcontent.Name = "itcontent"
            itcontent.Parent = items
            itcontent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            itcontent.BackgroundTransparency = 1.000
            itcontent.BorderColor3 = Color3.fromRGB(0, 0, 0)
            itcontent.BorderSizePixel = 0
            itcontent.Position = UDim2.new(0.0307681486, 0, 0.077370055, 0)
            itcontent.Size = UDim2.new(0.946245968, 0, 0.908166885, 0)

            UIListLayout_2.Parent = itcontent
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

            UIAspectRatioConstraint_16.Parent = itcontent
            UIAspectRatioConstraint_16.AspectRatio = 0.714

            UIAspectRatioConstraint_17.Parent = items
            UIAspectRatioConstraint_17.AspectRatio = 0.685

            TextLabel_4.Parent = Container
            TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_4.BackgroundTransparency = 1.000
            TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_4.BorderSizePixel = 0
            TextLabel_4.Position = UDim2.new(2.08369073e-07, 0, 0.025905814, 0)
            TextLabel_4.Size = UDim2.new(0.915409386, 0, 0.0593366958, 0)
            TextLabel_4.Font = Enum.Font.Gotham
            TextLabel_4.Text = Bold("ACCOUNT INFORMATION")
            TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_4.TextScaled = true
            TextLabel_4.TextSize = 14.000
            TextLabel_4.TextWrapped = true

            UIAspectRatioConstraint_18.Parent = TextLabel_4
            UIAspectRatioConstraint_18.AspectRatio = 19.734

            UIAspectRatioConstraint_19.Parent = Container
            UIAspectRatioConstraint_19.AspectRatio = 1.279

            ImageLabel.Parent = CONTENT
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Position = UDim2.new(0, 0, -0.00083565223, 0)
            ImageLabel.Size = UDim2.new(1.0008204, 0, 1.0008204, 0)
            ImageLabel.Visible = false
            ImageLabel.ZIndex = 0
            ImageLabel.Image = "rbxassetid://19001920001"
            ImageLabel.ScaleType = Enum.ScaleType.Crop

            UIAspectRatioConstraint_20.Parent = ImageLabel
            UIAspectRatioConstraint_20.AspectRatio = 1.560

            UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(11, 190, 255)), ColorSequenceKeypoint.new(0.14, Color3.fromRGB(25, 155, 255)), ColorSequenceKeypoint.new(0.42, Color3.fromRGB(94, 239, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(97, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(205, 247, 255))}
            UIGradient_4.Rotation = -142
            UIGradient_4.Parent = CONTENT

            UIAspectRatioConstraint_21.Parent = CONTENT
            UIAspectRatioConstraint_21.AspectRatio = 1.560

            STATUS.Name = "STATUS"
            STATUS.Parent = Main
            STATUS.BackgroundColor3 = Color3.fromRGB(238, 238, 238)
            STATUS.BorderColor3 = Color3.fromRGB(0, 0, 0)
            STATUS.BorderSizePixel = 0
            STATUS.Position = UDim2.new(0.704762816, 0, -0.0334425941, 0)
            STATUS.Size = UDim2.new(0.497368574, 0, 0.413030028, 0)
            STATUS.ZIndex = 2

            UICorner_7.Parent = STATUS

            TextLabel_5.Parent = STATUS
            TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.BackgroundTransparency = 1.000
            TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_5.BorderSizePixel = 0
            TextLabel_5.Position = UDim2.new(0.0939999968, 0, 0.0489999987, 0)
            TextLabel_5.Size = UDim2.new(0.889999986, 0, 0.129814446, 0)
            TextLabel_5.Font = Enum.Font.Gotham
            TextLabel_5.LineHeight = 2.000
            TextLabel_5.Text = Bold("STATUS")
            TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.TextScaled = true
            TextLabel_5.TextSize = 14.000
            TextLabel_5.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.TextWrapped = true
            TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel_5.TextYAlignment = Enum.TextYAlignment.Bottom

            UIAspectRatioConstraint_22.Parent = TextLabel_5
            UIAspectRatioConstraint_22.AspectRatio = 13.795

            poll.Name = "poll"
            poll.Parent = STATUS
            poll.BackgroundTransparency = 1.000
            poll.LayoutOrder = 4
            poll.Position = UDim2.new(0.0218134131, 0, 0.0600000247, 0)
            poll.Size = UDim2.new(0.0500000007, 0, 0.100000001, 0)
            poll.ZIndex = 2
            poll.Image = "rbxassetid://3926305904"
            poll.ImageRectOffset = Vector2.new(484, 364)
            poll.ImageRectSize = Vector2.new(36, 36)
            poll.ScaleType = Enum.ScaleType.Fit

            UIAspectRatioConstraint_23.Parent = poll
            UIAspectRatioConstraint_23.AspectRatio = 1.006

            statuscontent.Name = "statuscontent"
            statuscontent.Parent = STATUS
            statuscontent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            statuscontent.BackgroundTransparency = 1.000
            statuscontent.BorderColor3 = Color3.fromRGB(0, 0, 0)
            statuscontent.BorderSizePixel = 0
            statuscontent.Position = UDim2.new(0.0216404758, 0, 0.114685468, 0)
            statuscontent.Size = UDim2.new(0.957680225, 0, 0.840347946, 0)

            UICorner_8.Parent = statuscontent

            statusFrame1.Name = "statusFrame1"
            statusFrame1.Parent = statuscontent
            statusFrame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            statusFrame1.BackgroundTransparency = 1.000
            statusFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            statusFrame1.BorderSizePixel = 0
            statusFrame1.Position = UDim2.new(0.00985425524, 0, 0.147183359, 0)
            statusFrame1.Size = UDim2.new(0.999954283, 0, 0.387610316, 0)

            Frame_2.Parent = statusFrame1
            Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame_2.BackgroundTransparency = 1.000
            Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Frame_2.BorderSizePixel = 0
            Frame_2.Position = UDim2.new(-2.54682988e-07, 0, 0.0648981407, 0)
            Frame_2.Size = UDim2.new(0.999999821, 0, 0.935102582, 0)

            UICorner_9.CornerRadius = UDim.new(0, 10)
            UICorner_9.Parent = Frame_2

            Frame_3.Parent = Frame_2
            Frame_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Frame_3.BackgroundTransparency = 0.550
            Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Frame_3.BorderSizePixel = 0
            Frame_3.Position = UDim2.new(-0.00306791207, 0, 0.101812124, 0)
            Frame_3.Size = UDim2.new(1.00281096, 0, 0.909765244, 0)

            UICorner_10.Parent = Frame_3

            TextLabel_6.Parent = Frame_3
            TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_6.BackgroundTransparency = 1.000
            TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_6.BorderSizePixel = 0
            TextLabel_6.Position = UDim2.new(0.0150672309, 0, 0.380430341, 0)
            TextLabel_6.Size = UDim2.new(0.980174065, 0, 0.41698125, 0)
            TextLabel_6.Font = Enum.Font.Gotham
            TextLabel_6.Text = ""
            TextLabel_6.TextColor3 = Color3.fromRGB(240, 240, 240)
            TextLabel_6.TextScaled = true
            TextLabel_6.TextSize = 14.000
            TextLabel_6.TextWrapped = true

            UIAspectRatioConstraint_24.Parent = TextLabel_6
            UIAspectRatioConstraint_24.AspectRatio = 16.391

            UIAspectRatioConstraint_25.Parent = Frame_3
            UIAspectRatioConstraint_25.AspectRatio = 6.973

            UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(11, 190, 255)), ColorSequenceKeypoint.new(0.14, Color3.fromRGB(25, 155, 255)), ColorSequenceKeypoint.new(0.42, Color3.fromRGB(94, 239, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(97, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(205, 247, 255))}
            UIGradient_5.Rotation = -142
            UIGradient_5.Parent = Frame_2

            UIAspectRatioConstraint_26.Parent = Frame_2
            UIAspectRatioConstraint_26.AspectRatio = 6.326

            Top_5.Name = "Top"
            Top_5.Parent = statusFrame1
            Top_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Top_5.BorderSizePixel = 0
            Top_5.Position = UDim2.new(-1.01873195e-06, 0, 1.88947274e-06, 0)
            Top_5.Size = UDim2.new(1.00982523, 0, 0.386985868, 0)

            TextLabel_7.Parent = Top_5
            TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_7.BackgroundTransparency = 1.000
            TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_7.BorderSizePixel = 0
            TextLabel_7.Position = UDim2.new(0, 0, 1.13925562e-05, 0)
            TextLabel_7.Size = UDim2.new(0.98553437, 0, 0.999997377, 0)
            TextLabel_7.Font = Enum.Font.Gotham
            TextLabel_7.Text = Bold("Status Farming 1")
            TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_7.TextScaled = true
            TextLabel_7.TextSize = 14.000
            TextLabel_7.TextWrapped = true

            UIAspectRatioConstraint_27.Parent = TextLabel_7
            UIAspectRatioConstraint_27.AspectRatio = 15.213

            UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
            UIGradient_6.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.85), NumberSequenceKeypoint.new(1.00, 0.85)}
            UIGradient_6.Parent = Top_5

            UIAspectRatioConstraint_28.Parent = Top_5
            UIAspectRatioConstraint_28.AspectRatio = 15.436

            UIAspectRatioConstraint_29.Parent = statusFrame1
            UIAspectRatioConstraint_29.AspectRatio = 5.915

            statusFrame2.Name = "statusFrame2"
            statusFrame2.Parent = statuscontent
            statusFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            statusFrame2.BackgroundTransparency = 1.000
            statusFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            statusFrame2.BorderSizePixel = 0
            statusFrame2.Position = UDim2.new(0.00985425524, 0, 0.62843293, 0)
            statusFrame2.Size = UDim2.new(0.999954283, 0, 0.387610316, 0)

            Frame_4.Parent = statusFrame2
            Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame_4.BackgroundTransparency = 1.000
            Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Frame_4.BorderSizePixel = 0
            Frame_4.Position = UDim2.new(0, 0, 0.064896822, 0)
            Frame_4.Size = UDim2.new(1, 0, 0.935103059, 0)

            UICorner_11.CornerRadius = UDim.new(0, 10)
            UICorner_11.Parent = Frame_4

            Frame_5.Parent = Frame_4
            Frame_5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Frame_5.BackgroundTransparency = 0.550
            Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Frame_5.BorderSizePixel = 0
            Frame_5.Position = UDim2.new(-0.00306745432, 0, 0.101808049, 0)
            Frame_5.Size = UDim2.new(1.00281084, 0, 0.909766138, 0)

            UICorner_12.Parent = Frame_5

            TextLabel_8.Parent = Frame_5
            TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_8.BackgroundTransparency = 1.000
            TextLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_8.BorderSizePixel = 0
            TextLabel_8.Position = UDim2.new(0.0150672859, 0, 0.380422711, 0)
            TextLabel_8.Size = UDim2.new(0.980173945, 0, 0.416982472, 0)
            TextLabel_8.Font = Enum.Font.Gotham
            TextLabel_8.Text = ""
            TextLabel_8.TextColor3 = Color3.fromRGB(240, 240, 240)
            TextLabel_8.TextScaled = true
            TextLabel_8.TextSize = 14.000
            TextLabel_8.TextWrapped = true

            UIAspectRatioConstraint_30.Parent = TextLabel_8
            UIAspectRatioConstraint_30.AspectRatio = 16.391

            UIAspectRatioConstraint_31.Parent = Frame_5
            UIAspectRatioConstraint_31.AspectRatio = 6.973

            UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(11, 190, 255)), ColorSequenceKeypoint.new(0.14, Color3.fromRGB(25, 155, 255)), ColorSequenceKeypoint.new(0.42, Color3.fromRGB(94, 239, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(97, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(205, 247, 255))}
            UIGradient_7.Rotation = -142
            UIGradient_7.Parent = Frame_4

            UIAspectRatioConstraint_32.Parent = Frame_4
            UIAspectRatioConstraint_32.AspectRatio = 6.326

            Top_6.Name = "Top"
            Top_6.Parent = statusFrame2
            Top_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Top_6.BorderSizePixel = 0
            Top_6.Position = UDim2.new(-4.42303559e-07, 0, 0, 0)
            Top_6.Size = UDim2.new(1.00982511, 0, 0.386986345, 0)

            TextLabel_9.Parent = Top_6
            TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_9.BackgroundTransparency = 1.000
            TextLabel_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_9.BorderSizePixel = 0
            TextLabel_9.Position = UDim2.new(1.45321806e-07, 0, 0, 0)
            TextLabel_9.Size = UDim2.new(0.98553437, 0, 1, 0)
            TextLabel_9.Font = Enum.Font.Gotham
            TextLabel_9.Text = Bold("Status Farming 2")
            TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_9.TextScaled = true
            TextLabel_9.TextSize = 14.000
            TextLabel_9.TextWrapped = true

            UIAspectRatioConstraint_33.Parent = TextLabel_9
            UIAspectRatioConstraint_33.AspectRatio = 15.213

            UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
            UIGradient_8.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.85), NumberSequenceKeypoint.new(1.00, 0.85)}
            UIGradient_8.Parent = Top_6

            UIAspectRatioConstraint_34.Parent = Top_6
            UIAspectRatioConstraint_34.AspectRatio = 15.436

            UIAspectRatioConstraint_35.Parent = statusFrame2
            UIAspectRatioConstraint_35.AspectRatio = 5.915

            UIAspectRatioConstraint_36.Parent = statuscontent
            UIAspectRatioConstraint_36.AspectRatio = 2.293

            UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(11, 190, 255)), ColorSequenceKeypoint.new(0.14, Color3.fromRGB(25, 155, 255)), ColorSequenceKeypoint.new(0.42, Color3.fromRGB(94, 239, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(97, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(205, 247, 255))}
            UIGradient_9.Rotation = 49
            UIGradient_9.Parent = STATUS

            ImageLabel_2.Parent = STATUS
            ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel_2.BorderSizePixel = 0
            ImageLabel_2.Position = UDim2.new(0.00115947227, 0, -0.00199147221, 0)
            ImageLabel_2.Size = UDim2.new(1.00082016, 0, 1.00082004, 0)
            ImageLabel_2.Visible = false
            ImageLabel_2.ZIndex = -1
            ImageLabel_2.Image = "rbxassetid://19001920001"
            ImageLabel_2.ScaleType = Enum.ScaleType.Crop

            UIAspectRatioConstraint_37.Parent = ImageLabel_2
            UIAspectRatioConstraint_37.AspectRatio = 2.012

            UIAspectRatioConstraint_38.Parent = STATUS
            UIAspectRatioConstraint_38.AspectRatio = 2.012

            BlackFrame.Name = "BlackFrame"
            BlackFrame.Parent = Main
            BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            BlackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            BlackFrame.BorderSizePixel = 0
            BlackFrame.Position = UDim2.new(0.0166894961, 0, -0.14067848, 0)
            BlackFrame.Size = UDim2.new(1.03562295, 0, 1.11004615, 0)
            BlackFrame.ZIndex = -2

            UICorner_13.CornerRadius = UDim.new(0, 10)
            UICorner_13.Parent = BlackFrame

            UIAspectRatioConstraint_39.Parent = BlackFrame
            UIAspectRatioConstraint_39.AspectRatio = 1.559

            BlackFrame_2.Name = "BlackFrame"
            BlackFrame_2.Parent = Main
            BlackFrame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            BlackFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            BlackFrame_2.BorderSizePixel = 0
            BlackFrame_2.Position = UDim2.new(0.715834975, 0, -0.0208567493, 0)
            BlackFrame_2.Size = UDim2.new(0.497368425, 0, 0.415774614, 0)

            UICorner_14.CornerRadius = UDim.new(0, 15)
            UICorner_14.Parent = BlackFrame_2

            UIAspectRatioConstraint_40.Parent = BlackFrame_2
            UIAspectRatioConstraint_40.AspectRatio = 1.999

            ImageLabel_3.Parent = Main
            ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel_3.BackgroundTransparency = 1.000
            ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel_3.BorderSizePixel = 0
            ImageLabel_3.Position = UDim2.new(0.704751194, 0, 0.423576921, 0)
            ImageLabel_3.Size = UDim2.new(0.326983601, 0, 0.509369135, 0)
            ImageLabel_3.Image = "rbxassetid://19006158175"
            ImageLabel_3.ScaleType = Enum.ScaleType.Fit

            UIAspectRatioConstraint_41.Parent = ImageLabel_3
            UIAspectRatioConstraint_41.AspectRatio = 1.073

            UIAspectRatioConstraint_42.Parent = Main
            UIAspectRatioConstraint_42.AspectRatio = 1.671

            function GetaFuncs.addUIitem(IPtext,existbool)
                local itemFuncs = {}

                local itemFrame = Instance.new("Frame")
                local item = Instance.new("Frame")
                local UICorneritem = Instance.new("UICorner")
                local itemname = Instance.new("TextLabel")

                
                itemFrame.Name = "itemFrame"
                itemFrame.Parent = itcontent
                itemFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                itemFrame.BackgroundTransparency = 1.000
                itemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                itemFrame.BorderSizePixel = 0
                itemFrame.Size = UDim2.new(1, 0, 0.1, 0)
                
                item.Name = "item"
                item.Parent = itemFrame
                item.BackgroundTransparency = 0.400
                item.BorderColor3 = Color3.fromRGB(0, 0, 0)
                item.BorderSizePixel = 0
                item.Position = UDim2.new(0, 0, 0.100000001, 0)
                item.Size = UDim2.new(1, 0, 0.800000012, 0)
                
                UICorneritem.CornerRadius = UDim.new(0, 5)
                UICorneritem.Parent = item
                
                itemname.Parent = item
                itemname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                itemname.BackgroundTransparency = 1.000
                itemname.BorderColor3 = Color3.fromRGB(0, 0, 0)
                itemname.BorderSizePixel = 0
                itemname.Position = UDim2.new(1.79476046e-07, 0, 0.1795, 0)
                itemname.Size = UDim2.new(1.00000036, 0, 0.64104265, 0)
                itemname.Font = Enum.Font.Gotham
                itemname.Text = Bold(IPtext)
                itemname.TextScaled = true
                itemname.TextSize = 14.000
                itemname.TextWrapped = true
                itemname.RichText = true

                if existbool then
                    item.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                    itemname.TextColor3 = Color3.fromRGB(255, 255, 255)
                else
                    item.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    itemname.TextColor3 = Color3.fromRGB(0, 0, 0)
                end

                function itemFuncs.updateText(IPtext2)
                    itemname.Text = Bold(IPtext2)
                end
                function itemFuncs.updateExist(existbool2)
                    if existbool2 then
                        item.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                        itemname.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        item.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        itemname.TextColor3 = Color3.fromRGB(0, 0, 0)
                    end
                end
                function itemFuncs.Destroy()
                    itemFrame:Destroy()
                end

                return itemFuncs
            end
            function GetaFuncs.addUItext(IPText)
                local atFuncs = {}

                local atFrame = Instance.new("Frame")
                local atText = Instance.new("TextLabel")

                atFrame.Name = "atFrame"
                atFrame.Parent = atcontent
                atFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                atFrame.BackgroundTransparency = 1.000
                atFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                atFrame.BorderSizePixel = 0
                atFrame.Size = UDim2.new(1, 0, 0.0900812298, 0)

                atText.Name = "atText"
                atText.Parent = atFrame
                atText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                atText.BackgroundTransparency = 1.000
                atText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                atText.BorderSizePixel = 0
                atText.Position = UDim2.new(0, 0, 0.35, 0)
                atText.Size = UDim2.new(1, 0, 0.6, 0)
                atText.Font = Enum.Font.Unknown
                atText.Text = Bold(IPText)
                atText.TextColor3 = Color3.fromRGB(247, 247, 247)
                atText.TextScaled = true
                atText.TextSize = 14.000
                atText.TextWrapped = true
                atText.RichText = true
                atText.TextXAlignment = Enum.TextXAlignment.Left

                function atFuncs.updateText1(IPText2)
                    atText.Text = Bold(IPText2)
                end
                function atFuncs.updateText2(IPText3)
                    indexS = string.find(atText.Text, ":")
                    spitS = string.sub(atText.Text, 4, indexS)
                    newS = spitS.." "..tostring(IPText3)
                    atText.Text = Bold(newS)
                end
                function atFuncs.Destroy()
                    atFrame:Destroy()
                end

                return atFuncs
            end
            function GetaFuncs.updateTextstatus1(IPtext)
                TextLabel_6.Text = tostring(IPtext)
            end
            function GetaFuncs.updateTextstatus2(IPtext)
                TextLabel_8.Text = tostring(IPtext)
            end
            return GetaFuncs
        end

        local loaded = GetaUI.Load("W-azure")

        local GH_Item = loaded.addUIitem("God Human",false)
        local CDK_Item = loaded.addUIitem("Cursed Dual Katana",false)
        local Tushita_Item = loaded.addUIitem("Tushita",false)
        local SharkAnchor_Item = loaded.addUIitem("Shark Anchor",false)
        local SG_Item = loaded.addUIitem("Skull Guitar",false)
        local VH_Item = loaded.addUIitem("Valkyrie Helm",false)
        local MF_Item = loaded.addUIitem("Mirror Fractal",false)


        local LevelText = loaded.addUItext("Level")
        local RaceText = loaded.addUItext("Race")
        local SwanDoorText = loaded.addUItext("Swan Door")
        local LegendColorText = loaded.addUItext("All Legend Colors")
        local LastUpdateItemTick = tick()
        while task.wait(0.1) do 
            loaded.updateTextstatus1(StatusFarming)
            loaded.updateTextstatus2(StatusFarming2)
            LevelText.updateText1("Level "..tostring(GetLevel()))
            RaceText.updateText1("Race "..tostring(LP.Data.Race.Value))
            
            if tick()-LastUpdateItemTick>=5 then
                SwanDoorText.updateText1("Swan Door:" ..( SwanDoor.Check() and "Unlocked" or "Locked"))
                LegendColorText.updateText1("All Legend Colors:" ..( HaveAllHaki() and "Unlocked" or "Locked"))
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true) == 1  then
                    GH_Item.updateExist(true)
                end
                if CheckInvItem("Cursed Dual Katana") then
                    CDK_Item.updateExist(true)
                end
                if CheckInvItem("Tushita") then
                    Tushita_Item.updateExist(true)
                end
                if CheckInvItem("Shark Anchor") then
                    SharkAnchor_Item.updateExist(true)
                end
                if CheckInvItem("Skull Guitar") then
                    SG_Item.updateExist(true)
                end
                if CheckInvItem("Valkyrie Helm") then
                    VH_Item.updateExist(true)
                end
                if GetMaterial("Mirror Fractal") >= 1 then
                    MF_Item.updateExist(true)
                end
                LastUpdateItemTick = tick()
            end
        end
    end
end)
getgenv().ExploitTime = {}
getgenv().IsExploiting = {}
getgenv().NearTime = {}
function SusExploit(PLR)
    repeat wait()
    until PLR.Character
    if not PLR or PLR.Name == game.Players.LocalPlayer.Character.Name then return end 

    local humanoid = PLR.Character and PLR.Character:WaitForChild("Humanoid")
    if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Freefall then            
        if not ExploitTime[PLR.Name] then 
            ExploitTime[PLR.Name] = tick()
            repeat
                task.wait()
            until humanoid:GetState() ~= Enum.HumanoidStateType.Freefall or tick()-ExploitTime[PLR.Name] >= 20 
            if tick()-ExploitTime[PLR.Name] >= 20 then 
                getgenv().IsExploiting[PLR.Name] = true 
            end
        end 
    elseif ExploitTime[PLR.Name] then 
        if tick()-ExploitTime[PLR.Name] > 20 then 
            getgenv().IsExploiting[PLR.Name] = true 
        end
    end
    humanoid.StateChanged:Connect(function(_oldState, newState)
        if humanoid:GetState() == Enum.HumanoidStateType.Freefall then            
            if not ExploitTime[PLR.Name] then 
                ExploitTime[PLR.Name] = tick()
            end 
        elseif ExploitTime[PLR.Name] then 
            if tick()-ExploitTime[PLR.Name] > 20 then 
                getgenv().IsExploiting[PLR.Name] = true 
                ExploitTime[PLR.Name] = nil
            else
                ExploitTime[PLR.Name] = tick()
            end
        end
    end)    
end
for i,v in game.Players:GetChildren() do 
    task.spawn(SusExploit,v)
end
task.spawn(function()
    while task.wait(1) do
        if getgenv().Setting.OneClick.Enable then 
            pcall(function()
                LP.Character.Humanoid.Sit = false
            end)
            if WorkingFarm:empty() then
                for i,v in game.Players:GetChildren() do 
                    if v ~= LP then
                        if v.Character and IsAlive(v.Character) and Alive() then 
                            if GetDistance(v.Character,LP.Character) < 600 then
                                
                                if not getgenv().NearTime[v] then
                                    getgenv().NearTime[v]=tick()
                                end
                                if tick()-getgenv().NearTime[v]>15 then 
                                    getgenv().IsExploiting[v.Name]=true
                                end
                            else
                                getgenv().NearTime[v]=tick()
                            end
                        end
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait(1) do
        if getgenv().AutoPrehistoricIslandFF then
            local prehistoricIsland = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIsland then
                pcall(function()
                    for _, obj in pairs(prehistoricIsland:GetDescendants()) do
                        if obj:IsA("Part") and obj.Name:lower():find("lava") then 
                            obj:Destroy() 
                        end
                        if obj:IsA("MeshPart") and obj.Name:lower():find("lava") then 
                            obj:Destroy() 
                        end
                    end
                    local lavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
                    if lavaModel and lavaModel:IsA("Model") then 
                        lavaModel:Destroy() 
                    end
                    local Island = workspace.Map:FindFirstChild("PrehistoricIsland")
                    if Island then   
                        local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")   
                        for _, v in pairs(Island:GetDescendants()) do
                            if v.Name == "TouchInterest" then
                                if not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
                                    v.Parent:Destroy()
                                end
                            end
                        end
                    end 
                end)
            end
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoPrehistoricIslandFF then
                if  workspace.Map:FindFirstChild("PrehistoricIsland") then
                    if workspace.Map.PrehistoricIsland.Core and workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt") and workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
                        local prompt = workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt
                        if LP:DistanceFromCharacter(prompt.Parent.CFrame.Position) <= 150 then
                            fireproximityprompt(prompt,2,true)
                        end
                        DoTween2(prompt.Parent.CFrame)
                    end
                    
                    for _, bone in pairs(workspace:GetChildren()) do
                        if bone.Name == "DinoBone" then
                            DoTween2(bone.CFrame)
                        end
                    end
                    local egg = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg")
                    if egg then
                        DoTween2(egg.Molten.CFrame)
                        fireproximityprompt(egg.Molten.ProximityPrompt, 2, true)
                    end
                    if workspace.Enemies:FindFirstChild("Lava Golem") then
                        local v = workspace.Enemies:FindFirstChild("Lava Golem")
                        if v then 
                            while getgenv().AutoPrehistoricIslandFF  and IsAlive(v) and task.wait(0.1) do 
                                AttackMob(v)
                            end
                        end
                    end
                    for i,v in pairs(game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks:GetChildren()) do
                        if v:FindFirstChild("VFXLayer") then
                            if v:FindFirstChild("VFXLayer").At0.Glow.Enabled or v.VFXLayer.At0.Glow.Enabled  then
                                getgenv().SilentAimPos = true

                                repeat wait()
                                    DoTween2(v.VFXLayer.CFrame + Vector3.new(0,5,0))

                                    if v.VFXLayer.At0.Glow.Enabled and LP:DistanceFromCharacter(v.VFXLayer.CFrame.Position) <= 150 then
                                        getgenv().PosToHook = v.VFXLayer.CFrame.Position
                                        pcall(Equip,GetCurrentTool("Melee",true))       
                                        Press("Z")
                                        Press("X")
                                        Press("C")
                                        pcall(Equip,GetCurrentTool("Blox Fruit",true))      
                                        Press("Z")
                                        Press("X")
                                        Press("C")
                                        Press("Z")
                                    end   
                                    

                                until not getgenv().AutoPrehistoricIslandFF or v:FindFirstChild("VFXLayer").At0.Glow.Enabled == false or v.VFXLayer.At0.Glow.Enabled == false or workspace.Enemies:FindFirstChild("Lava Golem")  
                                getgenv().SilentAimPos = false
                            end
                        end
                    end
                    Floating(false)
                end
            end
        end)
    end
end)
spawn(function()
    while wait(1) do
        if getgenv().Setting.PatchVolcanic.Enable then
            pcall(function()
                local Island = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
                if Island then
                    for _, obj in pairs(Island:GetDescendants()) do
                        if obj:IsA("Part") and obj.Name:lower():find("lava") then
                            obj:Destroy()
                        end
                        if obj:IsA("MeshPart") and obj.Name:lower():find("lava") then
                            obj:Destroy()
                        end
                    end
                    local lavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
                    if lavaModel and lavaModel:IsA("Model") then
                        lavaModel:Destroy()
                    end
                    local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
                    for _, v in pairs(Island:GetDescendants()) do
                        if v.Name == "TouchInterest" then
                            if not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
                                v.Parent:Destroy()
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if not getgenv().Setting.PatchVolcanic.Enable then return end

            if workspace.Enemies:FindFirstChild("Lava Golem") then
                local v = workspace.Enemies:FindFirstChild("Lava Golem")
                if v and IsAlive(v) then
                    local GolemCondition = function()
                        return getgenv().Setting.PatchVolcanic.Enable and IsAlive(v)
                    end
                    while GolemCondition() and task.wait(0.1) do
                        local HRP = v:FindFirstChild("HumanoidRootPart")
                        if HRP then
                            DoTween2(HRP.CFrame * CFrame.new(0, 0, 7))
                            pcall(function()
                                sethiddenproperty(LP, "SimulationRadius", math.huge)
                                HRP.CanCollide = false
                                v:BreakJoints()
                                v.Humanoid.Health = 0
                            end)
                            AttackMob(v, nil, GolemCondition)
                        end
                    end
                end
                return
            end

            if not workspace.Map:FindFirstChild("PrehistoricIsland") then return end
            local Island = workspace.Map.PrehistoricIsland
            local Core = Island:FindFirstChild("Core")
            if not Core then return end
            local VolcanoRocks = Core:FindFirstChild("VolcanoRocks")
            if not VolcanoRocks then return end

            for _, rock in pairs(VolcanoRocks:GetChildren()) do
                if not getgenv().Setting.PatchVolcanic.Enable then break end
                if not rock:FindFirstChild("VFXLayer") then continue end
                if not rock.VFXLayer.At0.Glow.Enabled then continue end

                getgenv().SilentAimPos = true
                while getgenv().Setting.PatchVolcanic.Enable and rock.VFXLayer.At0.Glow.Enabled and not workspace.Enemies:FindFirstChild("Lava Golem") and task.wait(0.1) do
                    DoTween2(rock.VFXLayer.CFrame + Vector3.new(0, 5, 0))
                    if LP:DistanceFromCharacter(rock.VFXLayer.CFrame.Position) <= 150 then
                        getgenv().PosToHook = rock.VFXLayer.CFrame.Position
                        pcall(Equip, GetCurrentTool("Melee", true))
                        Press("Z") task.wait(0.3)
                        Press("X") task.wait(0.3)
                        Press("C") task.wait(0.3)
                        pcall(Equip, GetCurrentTool("Blox Fruit", true))
                        Press("Z") task.wait(0.3)
                        Press("X") task.wait(0.3)
                        Press("C") task.wait(0.3)
                    end
                end
                getgenv().SilentAimPos = false

                if workspace.Enemies:FindFirstChild("Lava Golem") then break end
            end
        end)
    end
end)


spawn(function()
    while task.wait(1) do
        pcall(function()
            if not getgenv().Setting.ResetAfterVolcano.Enable then return end
            local Island = workspace.Map:FindFirstChild("PrehistoricIsland")
            if not Island then return end
            local TrialTeleport = Island:FindFirstChild("TrialTeleport")
            if not (TrialTeleport and TrialTeleport:FindFirstChild("TouchInterest")) then return end

            if getgenv().Setting.CollectDragonEggs.Enable then
                local SpawnedEggs = Island.Core:FindFirstChild("SpawnedDragonEggs")
                if SpawnedEggs and SpawnedEggs:FindFirstChild("DragonEgg") then
                    local egg = SpawnedEggs:FindFirstChild("DragonEgg")
                    if egg and egg:FindFirstChild("Molten") then
                        DoTween2(egg.Molten.CFrame)
                        task.wait(0.5)
                        fireproximityprompt(egg.Molten.ProximityPrompt, 30)
                        task.wait(1)
                    end
                end
            end

            if getgenv().Setting.CollectDinoBones.Enable then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name == "DinoBone" then
                        DoTween2(obj.CFrame)
                        task.wait(0.5)
                    end
                end
                task.wait(1)
            end

            -- Só reseta depois de coletar tudo
            LP.Character.Humanoid.Health = 0
        end)
    end
end)

spawn(function()
    while task.wait(1) do
        pcall(function()
            if not getgenv().Setting.CollectDinoBones.Enable then return end
            for _, obj in pairs(workspace:GetChildren()) do
                if obj.Name == "DinoBone" then
                    DoTween2(obj.CFrame)
                    task.wait(0.5)
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait(1) do
        pcall(function()
            if not getgenv().Setting.CollectDragonEggs.Enable then return end
            local SpawnedEggs = workspace.Map:FindFirstChild("PrehistoricIsland") and
                workspace.Map.PrehistoricIsland.Core:FindFirstChild("SpawnedDragonEggs")
            if not SpawnedEggs then return end
            local egg = SpawnedEggs:FindFirstChild("DragonEgg")
            if egg and egg:FindFirstChild("Molten") then
                DoTween2(egg.Molten.CFrame)
                task.wait(0.5)
                fireproximityprompt(egg.Molten.ProximityPrompt, 30)
            end
        end)
    end
end)

spawn(function()
    while task.wait(1) do
        pcall(function()
            if not getgenv().Setting.AutoStartPrehistoric.Enable then return end
            local Island = workspace.Map:FindFirstChild("PrehistoricIsland")
            if not Island then return end
            local ActivationPrompt = Island.Core:FindFirstChild("ActivationPrompt")
            if not ActivationPrompt then return end
            local Prompt = ActivationPrompt:FindFirstChildWhichIsA("ProximityPrompt", true)
            if not Prompt then return end
            DoTween2(ActivationPrompt.CFrame)
            task.wait(0.5)
            if LP:DistanceFromCharacter(ActivationPrompt.CFrame.Position) <= 150 then
                fireproximityprompt(Prompt, math.huge)
                local K = game:GetService("UserInputService")
                K:SendKeyEvent(true, "E", false, game)
                task.wait(1.5)
                K:SendKeyEvent(false, "E", false, game)
            end
        end)
    end
end)

spawn(function()
    while task.wait(2) do
        pcall(function()
            if not getgenv().Setting.CraftVolcanicMagnet.Enable then return end
            if getgenv().Setting.AutoFullVolcano.Enable then return end
            if GetMaterial("Volcanic Magnet") >= 1 then return end

            if GetMaterial("Blaze Ember") < 15 then
                getgenv().Setting.DragonHunterQuest.Enable = true
                AutoDragonHunterQuest()
                getgenv().Setting.DragonHunterQuest.Enable = false
                return
            end

            if GetMaterial("Scrap Metal") < 10 then
                local ScrapCondition = function()
                    return getgenv().Setting.CraftVolcanicMagnet.Enable and GetMaterial("Scrap Metal") < 10
                end
                Farms["Material"]("Scrap Metal", "CraftVolcanicMagnet", ScrapCondition)
                return
            end

            repeat
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft"):InvokeServer("Craft", "Volcanic Magnet", 1, {})
                task.wait(1)
            until GetMaterial("Volcanic Magnet") >= 1 or not getgenv().Setting.CraftVolcanicMagnet.Enable
        end)
    end
end)
spawn(function()
    while task.wait(1) do
        pcall(function()
            if not getgenv().Setting.AutoFullVolcano.Enable then return end
            local S = getgenv().Setting

            if GetMaterial("Volcanic Magnet") < 1 and not workspace.Map:FindFirstChild("PrehistoricIsland") then
                if GetMaterial("Blaze Ember") < 15 then
                    S.DragonHunterQuest.Enable = true
                    AutoDragonHunterQuest()
                    S.DragonHunterQuest.Enable = false
                    return
                end
                if GetMaterial("Scrap Metal") < 10 then
                    Farms["Material"]("Scrap Metal", "AutoFullVolcano", function()
                        return S.AutoFullVolcano.Enable and GetMaterial("Scrap Metal") < 10
                    end)
                    return
                end
                repeat
                    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft"):InvokeServer("Craft", "Volcanic Magnet", 1, {})
                    task.wait(1)
                until GetMaterial("Volcanic Magnet") >= 1 or not S.AutoFullVolcano.Enable
                return
            end

            if GetMaterial("Volcanic Magnet") >= 1 and not workspace.Map:FindFirstChild("PrehistoricIsland") then
                S.SeaEvents.AutoFindPrehistoricIsland = true
                repeat task.wait(1) until not S.AutoFullVolcano.Enable or workspace.Map:FindFirstChild("PrehistoricIsland")
                S.SeaEvents.AutoFindPrehistoricIsland = false
                return
            end

            local Island = workspace.Map.PrehistoricIsland

            local ActivationPrompt = Island.Core:FindFirstChild("ActivationPrompt")
            if ActivationPrompt then
                local Prompt = ActivationPrompt:FindFirstChildWhichIsA("ProximityPrompt", true)
                if Prompt then
                    DoTween2(ActivationPrompt.CFrame)
                    task.wait(0.5)
                    if LP:DistanceFromCharacter(ActivationPrompt.CFrame.Position) <= 150 then
                        fireproximityprompt(Prompt, math.huge)
                        local K = game:GetService("UserInputService")
                        K:SendKeyEvent(true, "E", false, game)
                        task.wait(1.5)
                        K:SendKeyEvent(false, "E", false, game)
                    end
                    return
                end
            end

            local TrialTeleport = Island:FindFirstChild("TrialTeleport")
            if not (TrialTeleport and TrialTeleport:FindFirstChild("TouchInterest")) then
                S.PatchVolcanic.Enable = true
                repeat task.wait(1) until not S.AutoFullVolcano.Enable or (Island:FindFirstChild("TrialTeleport") and Island:FindFirstChild("TrialTeleport"):FindFirstChild("TouchInterest"))
                S.PatchVolcanic.Enable = false
                return
            end

            local SpawnedEggs = Island.Core:FindFirstChild("SpawnedDragonEggs")
            if SpawnedEggs then
                local egg = SpawnedEggs:FindFirstChild("DragonEgg")
                if egg and egg:FindFirstChild("Molten") then
                    DoTween2(egg.Molten.CFrame)
                    task.wait(0.5)
                    fireproximityprompt(egg.Molten.ProximityPrompt, 30)
                    task.wait(1)
                    return
                end
            end

            local hasBones = false
            for _, obj in pairs(workspace:GetChildren()) do
                if obj.Name == "DinoBone" then
                    hasBones = true
                    DoTween2(obj.CFrame)
                    task.wait(0.5)
                end
            end
            if hasBones then return end

            LP.Character.Humanoid.Health = 0
            task.wait(3)
        end)
    end
end)
spawn(function()
    local RF = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft")
    local function CraftWeapon(name)
        RF:InvokeServer("Craft", name, 1, {})
    end
    local function HasBelt()
        return CheckInvItem("Dono Belt (Red)") or CheckInvItem("Dono Belt")
    end
    local function NeedFor(weapon)
        if weapon == "Dragonheart" then
            return {["Dragon Egg"]=1, ["Blaze Ember"]=15, ["Dinosaur Bone"]=6}
        elseif weapon == "Dragonstorm" then
            return {["Dragon Egg"]=2, ["Dragon Scale"]=5, ["Blaze Ember"]=30, ["Dinosaur Bone"]=10}
        end
    end
    local function HasMaterials(reqs)
        for mat, qty in pairs(reqs) do
            if GetMaterial(mat) < qty then return false end
        end
        return true
    end
    local function MissingMaterials(reqs)
        local missing = {}
        for mat, qty in pairs(reqs) do
            local have = GetMaterial(mat)
            if have < qty then missing[mat] = qty - have end
        end
        return missing
    end
    local function FarmMat(mat, needed)
        local condition = function()
            return getgenv().Setting.FullItemsPrehistoric.Enable and GetMaterial(mat) < needed
        end
        if mat == "Blaze Ember" then
            Notify({Text = "Farming Blaze Ember (Dragon Hunter)", Type2 = nil, Delay = 5})
            getgenv().Setting.DragonHunterQuest.Enable = true
            while condition() and task.wait(1) do
                AutoDragonHunterQuest()
            end
            getgenv().Setting.DragonHunterQuest.Enable = false
        elseif mat == "Dragon Scale" then
            Notify({Text = "Farming Dragon Scale", Type2 = nil, Delay = 5})
            Farms["Material"]("Dragon Scale", "FullItemsPrehistoric", condition)
        elseif mat == "Dragon Egg" or mat == "Dinosaur Bone" then
            Notify({Text = "Farming " .. mat .. " (Full Prehistoric)", Type2 = nil, Delay = 5})
            getgenv().Setting.AutoFullVolcano.Enable = true
            repeat task.wait(1) until not condition() or not getgenv().Setting.FullItemsPrehistoric.Enable
            getgenv().Setting.AutoFullVolcano.Enable = false
        end
    end
    local function FarmMissing(missing)
        local order = {"Blaze Ember", "Dragon Scale", "Dragon Egg", "Dinosaur Bone"}
        for _, mat in ipairs(order) do
            if not getgenv().Setting.FullItemsPrehistoric.Enable then return end
            if missing[mat] then
                FarmMat(mat, GetMaterial(mat) + missing[mat])
            end
        end
    end
    while task.wait(2) do
        if not getgenv().Setting.FullItemsPrehistoric.Enable then continue end
        pcall(function()
            if not HasBelt() then
                Notify({Text = "You don't have the necessary tracks, please Activate Dragon Trainer.", Type2 = nil, Delay = 10})
                return
            end
            for _, weapon in ipairs({"Dragonheart", "Dragonstorm"}) do
                if not getgenv().Setting.FullItemsPrehistoric.Enable then break end
                if CheckInvItem(weapon) then continue end
                local reqs = NeedFor(weapon)
                if GetMaterial("Volcanic Magnet") < 1 and not workspace.Map:FindFirstChild("PrehistoricIsland") then
                    reqs["Blaze Ember"] = (reqs["Blaze Ember"] or 0) + 15
                end
                if HasMaterials(reqs) then
                    Notify({Text = "Crafting " .. weapon .. "!", Type2 = nil, Delay = 5})
                    CraftWeapon(weapon)
                    task.wait(2)
                else
                    Notify({Text = "Missing materials for " .. weapon .. ", starting farm...", Type2 = nil, Delay = 5})
                    FarmMissing(MissingMaterials(reqs))
                end
            end
        end)
    end
end)
game.Players.ChildAdded:Connect(SusExploit)
spawn(AddToPriorityQueue2)
spawn(LPH_NO_VIRTUALIZE(function ()
    print("Wait For Intilizing First")
    task.wait(2.5)
    while task.wait(0.1) do
        if Sea3 and getgenv().Setting.SeaEvents.AutoFindLeviathan then
            StatusFarming = "Auto Find Leviathan Is On"
            continue
        end
        if getgenv().Setting.OneClick.Enable then
            if CheckPremium then
                if WorkingFarm:empty() then

                    local Idle, Condition, Setting = GetCurrentFarmingState()
                    print(Idle,Condition,Setting)
                    Farms.IdleFarming(Idle,Condition, Setting)
                    print("End Idle farming")
                else
                    local GetTop = WorkingFarm:pop()
                    
                    Farms[GetTop]("OneClick")
                    StateAdded[GetTop] = false
                end
            else
                Notify({
                    Text = "One Click Premium Only",
                    Type2 = nil,
                    Delay = 5
                })  
            end
        else
            if CasualFarm:empty() then
                if getgenv().Debugging then 
                  -- print(getgenv().Setting.Katakuri.Enable)
                end
                --if getgenv().Setting["Haki Color Hop"].Enable then 
                --end
                --if getgenv().Setting["Legendary Sword Hop"].Enable then 
                --end
                if getgenv().Setting.BossSniper.Hop and getgenv().Setting.BossSniper.Enable then
                    Farms["BossSniper"]()
                end
                if getgenv().Setting["__SaberHop"].Enable then
                    Farms["__SaberHop"]() 
                end
                if getgenv().Setting["Evolve Observation"].Enable then 
                    Farms["Evolve Observation"]()
                end
                if getgenv().Setting["Rip Indra Hop"].Enable then 
                    Farms["Rip Indra Hop"]()
                end
                if getgenv().Setting["Level Observation"].Enable then
                    Farms["Level Observation"]()
                end
                if getgenv().Setting["Rainbow Haki"].Enable then
                    Farms["Rainbow Haki"]()
                end
                if getgenv().Setting["Citizen Quest"].Enable then
                    Farms["Citizen Quest"]()
                end
                if getgenv().Setting["Fully Cyborg"].Enable then 
                    Farms["Fully Cyborg"]()
                end
                if getgenv().Setting["Fully Ghoul"].Enable then 
                    Farms["Fully Ghoul"]()
                end
                if getgenv().Setting["Law"].Enable then 
                    Farms["Law"]()
                end
                if getgenv().Setting["BlackSmith"].Enable then 
                    Farms["BlackSmith"]()
                end
                if getgenv().Setting["__KatakuriHop"].Enable then 
                    Farms["__KatakuriHop"]()
                end
                if getgenv().Setting["Hybrid Fruit Hop"].Enable then 
                    Farms["Hybrid Fruit Hop"]()
                end
                if getgenv().Setting["Raid Fruit Hop"].Enable then 
                    Farms["Raid Fruit Hop"]()
                end
                if getgenv().Setting["Elite Hop"].Enable then 
                    Farms["Elite Hop"]()
                end
                if getgenv().Setting["Tyrant Skies"].Enable then
                    Farms["Tyrant Skies"]()
                end
                if getgenv().Setting["Tushita Hop__1"].Enable then 
                    Farms["Tushita Hop__1"]()
                end
                if getgenv().Setting["Black Beard Hop"].Enable then
                    Farms["Black Beard Hop"]()
                end
                if getgenv().Setting["Collect Chest"].Enable then
                    Farms["Collect Chest"]()
                end
                if (IsFullyTrialEnable()  or getgenv().Setting.AutoTrainTrial.Enable) and StatusRace == "You Need To Train First" then
                    print("Started Farming Bone") 
                    local SelectedFarming =IsFullyTrialEnable()   and "FullyAutoTrial" or "AutoTrainTrial"
                    local MethodFarm = getgenv().Setting.AutoTrainTrial.TrainPlace or "Bone"
                    local Condition = function ()
                        return (IsFullyTrialEnable()  or getgenv().Setting.AutoTrainTrial.Enable) and StatusRace == "You Need To Train First"
                    end
                    Farms[MethodFarm](SelectedFarming,Condition,false)
                elseif getgenv().Setting.Raid.Enable then 
                    
                    Farms["Raid"]()
                elseif getgenv().Setting["Full Dough King"].Enable then 
                    Farms["Full Dough King"]()
                elseif getgenv().Setting["Kill Aura"].Enable then
                    Farms["Kill Aura"]()
                elseif getgenv().Setting.Material.Enable and getgenv().Setting.Material.Select then
                    Farms["Material"]()
                elseif getgenv().Setting.Bone.Enable and Sea3 then
                    Farms.Bone(nil,nil,true)
                elseif getgenv().Setting.Katakuri.Enable and Sea3 then

                    Farms.Katakuri(nil,nil,true)
                elseif getgenv().Setting.Level.Enable then
                    Farms.Level(nil,nil,true)
                else

                    StatusFarming = "Idle"
                end
            else
                if (IsFullyTrialEnable() or getgenv().Setting.AutoTrainTrial.Enable) and StatusRace == "You Need To Train First" then
                    local SelectedFarming = IsFullyTrialEnable() and "FullyAutoTrial" or "AutoTrainTrial"
                    local MethodFarm = getgenv().Setting.AutoTrainTrial.TrainPlace or "Bone"
                    local Condition = function()
                        return (IsFullyTrialEnable() or getgenv().Setting.AutoTrainTrial.Enable) and StatusRace == "You Need To Train First"
                    end
                    Farms[MethodFarm](SelectedFarming, Condition, false)
                elseif getgenv().Setting.Bone.Enable and Sea3 then
                    Farms.Bone(nil, nil, true)
                elseif getgenv().Setting.Katakuri.Enable and Sea3 then
                    Farms.Katakuri(nil, nil, true)
                else
                    local GetTop = CasualFarm:pop()
                    print("Casual Farming: ",GetTop)
                    Farms[GetTop]()
                    StateAdded2[GetTop] = false
                end
            end

        end
    end
end))
--[[

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local ship = workspace.Boats["Beast Hunter"].VehicleSeat
local target = workspace.NPCs["Boat Dealer"].Head

if not ship or not target then
    warn("Ship or Target not found. Exiting script.")
    return
end

local tweenInfo = TweenInfo.new(
    0.5, -- Duration of the tween in seconds
    Enum.EasingStyle.Quad, -- Easing style (e.g., Linear, Quad, Cubic)
    Enum.EasingDirection.Out, -- Easing direction (In, Out, InOut)
    0, -- Number of repeats (-1 for infinite)
    false, -- Reverse (true to tween back and forth)
    0 -- Delay before starting
)

local currentTween = nil
local lastTargetPosition = Vector3.new(0,0,0) -- To detect significant target movement

local heartbeatConnection

heartbeatConnection = RunService.Heartbeat:Connect(function()
    -- Only create a new tween if the target has moved significantly
    if (target.Position - lastTargetPosition).Magnitude > 0.5 then -- Threshold for new tween
        lastTargetPosition = target.Position

        local shipPosition = ship.Position
        local targetPosition = target.Position

        local direction = targetPosition - shipPosition
        local horizontalDirection = Vector3.new(direction.X, 0, direction.Z).Unit

        if horizontalDirection.Magnitude < 0.001 then
            horizontalDirection = ship.CFrame.LookVector
            horizontalDirection = Vector3.new(horizontalDirection.X, 0, horizontalDirection.Z).Unit
            if horizontalDirection.Magnitude < 0.001 then
                horizontalDirection = Vector3.new(0, 0, 1)
            end
        end

        local desiredCFrame = CFrame.lookAt(shipPosition, shipPosition + horizontalDirection)

        local currentY = ship.CFrame.Y
        desiredCFrame = CFrame.new(desiredCFrame.X, currentY, desiredCFrame.Z) * desiredCFrame.Rotation

        if currentTween then
            currentTween:Cancel()
        end
        currentTween = TweenService:Create(ship, tweenInfo, {CFrame = desiredCFrame})
        currentTween:Play()
    end
end)

ship.AncestryChanged:Connect(function()
    if not ship.Parent then
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
        if currentTween then
            currentTween:Cancel()
        end
    end
end)

target.AncestryChanged:Connect(function()
    if not target.Parent then
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
        if currentTween then
            currentTween:Cancel()
        end
    end
end)

print("Ship TweenService script started.")]]