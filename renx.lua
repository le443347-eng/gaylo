local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function safeDestroy(name)
    local g = playerGui:FindFirstChild(name)
    if g then g:Destroy() end
end
safeDestroy("AutoTypingOverlay")
safeDestroy("Renx")
safeDestroy("KeySystem")

local function LoadMainScript()
    local gui = Instance.new("ScreenGui")
    gui.Name = "AutoTypingOverlay"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 0
    bg.BorderSizePixel = 0
    bg.Parent = gui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1,0,1,0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(0,255,0)
    textLabel.Font = Enum.Font.Code
    textLabel.TextSize = 20
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
    textLabel.Text = "Renx LOADING..."
    textLabel.Parent = bg

    task.delay(0.5, function()
        TweenService:Create(bg, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
        TweenService:Create(textLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
        task.delay(0.35, function()
            if gui and gui.Parent then gui:Destroy() end
        end)
    end)

    local SupportedExecutors = {
        "Synapse X", "Krnl", "ProtoSmasher", "Fluxus", "Script-Ware",
        "EasyExploits", "Electron", "JJSploit", "Calamari", "SirHurt",
        "Sentinel", "WEAREDEVS", "Comet", "Cellery", "Wave",
        "CODex", "Delta", "Medium", "Solara", "Xeno", "Vega X",
        "Hydrogen", "Oxygen U", "Nova", "Astral", "Ronix", "Elysian",
        "Astra", "Eclipse", "Lunar", "Zenox", "Storm", "Vortex", "Phantom"
    }
    _G.SupportedExecutors = SupportedExecutors

    local identity = syn and "Synapse X" or krnl and "Krnl" or proto and "ProtoSmasher" or fluxus and "Fluxus" or
        scriptware and "Script-Ware" or easyexploits and "EasyExploits" or electron and "Electron" or jjsploit and "JJSploit" or
        calamari and "Calamari" or sirlapu and "SirHurt" or sentinel and "Sentinel" or wearedevs and "WEAREDEVS" or
        comet and "Comet" or celery and "Cellery" or wave and "Wave" or codex and "CODex" or delta and "Delta" or
        medium and "Medium" or solara and "Solara" or xeno and "Xeno" or "Unknown"
    _G.CurrentExecutor = identity

    local function AntiDisconnect267()
        pcall(function()
            local originalKick = Players.Kick
            local originalPlayerKick = player.Kick
            Players.Kick = function(plr, msg)
                if msg and (string.find(msg, "267") or string.find(msg, "Kicked") or string.find(msg, "disconnect")) then
                    return
                end
                if originalKick then return originalKick(plr, msg) end
            end
            player.Kick = function(plr, msg)
                if msg and (string.find(msg, "267") or string.find(msg, "Kicked") or string.find(msg, "disconnect")) then
                    return
                end
                if originalPlayerKick then return originalPlayerKick(plr, msg) end
            end
            task.spawn(function()
                while task.wait(10) do
                    pcall(function()
                        if not getgc then return end
                        for _, v in pairs(getgc(true)) do
                            if type(v) == "function" then
                                local info = debug and debug.info and debug.info(v, "S")
                                if info and (string.find(info, "Kick") or string.find(info, "267") or string.find(info, "disconnect")) then
                                    pcall(function()
                                        debug.setconstant(v, 1, "AntiDisconnectBlocked_267")
                                        debug.setconstant(v, 2, "AntiDisconnectBlocked_267")
                                    end)
                                end
                            end
                        end
                    end)
                end
            end)
            if game:GetService("NetworkClient") and game:GetService("NetworkClient").Kick then
                local oldNetworkKick = game:GetService("NetworkClient").Kick
                game:GetService("NetworkClient").Kick = function(self, msg)
                    if msg and (string.find(msg, "267") or string.find(msg, "Kicked")) then
                        return
                    end
                    return oldNetworkKick(self, msg)
                end
            end
            for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                    local oldFire = remote.FireServer
                    if oldFire then
                        remote.FireServer = function(self, ...)
                            local args = {...}
                            for _, arg in ipairs(args) do
                                if type(arg) == "string" and (string.find(arg, "267") or string.find(arg, "kick")) then
                                    return
                                end
                            end
                            return oldFire(self, ...)
                        end
                    end
                end
            end
            if game:GetService("TeleportService") and game:GetService("TeleportService").Teleport then
                local oldTeleport = game:GetService("TeleportService").Teleport
                game:GetService("TeleportService").Teleport = function(...)
                    return
                end
            end
        end)
    end
    pcall(AntiDisconnect267)

    local Blacklist = {
        ["Hungdocdao"] = true, ["ToiLaThanhTuan"] = true, ["BinTranDev"] = true, ["akatobi2"] = true,
        ["akatobi1"] = true, ["Yellowmeomeo"] = true, ["akatobi6"] = true, ["phanphuday1"] = true,
        ["Luyengmaxx"] = true, ["luyengmax"] = true, ["b1722b"] = true, ["Moonne0909"] = true,
        ["MiniBT71"] = true, ["kookoomy2"] = true, ["KOL_akadata"] = true
    }

    local function KickBlacklistedPlayers()
        for _, plr in ipairs(Players:GetPlayers()) do
            if Blacklist[plr.Name] then
                pcall(function() plr:Kick("Ban da bi kick khoi server vi nam trong blacklist") end)
            end
        end
    end
    pcall(KickBlacklistedPlayers)
    Players.PlayerAdded:Connect(function(plr)
        if Blacklist[plr.Name] then
            pcall(function() plr:Kick("Ban da bi kick khoi server vi nam trong blacklist") end)
        end
    end)

    repeat task.wait() until game:IsLoaded()

    local Library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/le443347-eng/gaylo/refs/heads/main/FluentCustom.luau.txt"))()
    local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/angeryy-tvy/Fluent-Port-Vxeze/refs/heads/main/Addons/SaveManager.luau"))()
    local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/angeryy-tvy/Fluent-Port-Vxeze/refs/heads/main/Addons/InterfaceManager.luau"))()

    local Window = Library:CreateWindow({
        Title = "Renx Hub",
        SubTitle = "Version 5.0",
        TabWidth = 170,
        Size = UDim2.fromOffset(700, 500),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.End
    })

    local HubScreenGui = Instance.new("ScreenGui")
    pcall(function() HubScreenGui.Parent = CoreGui end)
    HubScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Tabs = {
        Main1 = Window:CreateTab({Title = "Thong Tin & Main", Icon = "home"}),
        Main2 = Window:CreateTab({Title = "Farm Level", Icon = "trending-up"}),
        Main3 = Window:CreateTab({Title = "Farm Tien", Icon = "dollar-sign"}),
        Main4 = Window:CreateTab({Title = "Farm Su Kien", Icon = "star"}),
        Main5 = Window:CreateTab({Title = "Farm Boss", Icon = "swords"}),
        Main6 = Window:CreateTab({Title = "PVP", Icon = "target"}),
        Main7 = Window:CreateTab({Title = "Fix Lag", Icon = "cpu"}),
        Main8 = Window:CreateTab({Title = "Config", Icon = "settings"}),
        Main9 = Window:CreateTab({Title = "Auto Kick", Icon = "user-x"}),
        Main10 = Window:CreateTab({Title = "Auto Heal", Icon = "package"}),
        Main11 = Window:CreateTab({Title = "Xe Bay", Icon = "plane"})
    }

    _G.AutoFarmLevel = false
    _G.NpcDistance = 18.2
    _G.NpcSpeed = 0.05
    _G.AutoLootEnabled = false
    _G.AutoFarmChua = false
    _G.AntiAFKEnabled = false
    _G.AutoFarmBanhMi = false
    _G.AutoFarmBenhVien = false
    _G.AutoFarmCaoSu = false
    _G.AutoFarmChotCongAn = false
    _G.AutoFarmSuKien = false
    _G.AutoFarmMatOng = false
    _G.TeleportToBoss = false
    _G.BossMode = "A"
    _G.AutoFarmBossCircle = false
    _G.AutoAimBossNoCam = false
    _G.ShowHealthEnabled = false
    _G.PvpAutoAttack = false
    _G.AutoBandageEnabled = false
    _G.AutoBuyHeal = false
    _G.FreecamEnabled = false
    _G.PvpAimNoCamActive = false
    _G.PvpHitboxActive = false
    _G.PvpSpinActive = false
    _G.PvpSpeedActive = false
    _G.PvpJumpActive = false
    _G.PvpHealthActive = false
    _G.FPSBoostState = false
    _G.Reduce20State = false
    _G.Reduce40State = false
    _G.Reduce60State = false
    _G.Reduce100State = false
    _G.ClearEverythingState = false
    _G.AutoReviveEnabled = false
    _G.AutoTakeReviveEnabled = false
    _G.AutoKickEnabled = false
    _G.AutoKickDistance = 15
    _G.AutoKickCooldown = 5
    _G.AutoHealEnabled = false
    _G.AutoBuyHealEnabled = false
    _G.HealThreshold = 80
    _G.NhatVatPham = false
    _G.Settings = {TargetName = "CityNPC", DashDist = 18.2, Speed = 0.05}

    local REVIVE_TARGET_POS = Vector3.new(791.07, 19.51, -392.51)

    local function hasDeadAnim(character)
        for _, v in ipairs(character:GetDescendants()) do
            if string.lower(v.Name) == "deadanim" then return true end
        end
        return false
    end

    local function stepTeleport(targetPos)
        local char = player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local distance = (targetPos - hrp.Position).Magnitude
        while distance > 5 and (_G.AutoReviveEnabled or _G.AutoTakeReviveEnabled) do
            local currentChar = player.Character
            if not currentChar then break end
            local currentHRP = currentChar:FindFirstChild("HumanoidRootPart")
            if not currentHRP then break end
            local dir = (targetPos - currentHRP.Position).Unit
            currentHRP.CFrame = currentHRP.CFrame + dir * math.min(18, distance)
            task.wait(0.01)
            distance = (targetPos - currentHRP.Position).Magnitude
        end
        if (_G.AutoReviveEnabled or _G.AutoTakeReviveEnabled) and char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(targetPos)
        end
    end

    task.spawn(function()
        while task.wait(0.1) do
            if _G.AutoReviveEnabled then
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= player and plr.Character and hasDeadAnim(plr.Character) then
                        local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart")
                        if targetHRP then
                            stepTeleport(targetHRP.Position + Vector3.new(0, 2, 0))
                            break
                        end
                    end
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.3) do
            if _G.AutoTakeReviveEnabled then
                pcall(function()
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        stepTeleport(REVIVE_TARGET_POS)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.5) do
            if _G.AutoReviveEnabled then
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, obj in ipairs(Workspace:GetDescendants()) do
                        if obj:IsA("ProximityPrompt") and obj.Enabled then
                            local parent = obj.Parent
                            if parent and parent:IsA("BasePart") and (parent.Position - hrp.Position).Magnitude <= 500 then
                                pcall(function() fireproximityprompt(obj) end)
                            end
                        end
                    end
                end
            end
        end
    end)

    local freecamEnabled = false
    local freecamSpeed = 1.5
    local freecamPitch = 0
    local freecamYaw = 0
    local freecamCamera = Workspace.CurrentCamera
    local freecamKeys = {}
    local freecamMobile = {Forward = false, Backward = false, Left = false, Right = false, Up = false, Down = false}

    local FreecamScreenGui = Instance.new("ScreenGui")
    FreecamScreenGui.Name = "FreecamMobileUI"
    FreecamScreenGui.IgnoreGuiInset = true
    FreecamScreenGui.ResetOnSpawn = false
    local freecamGuiOk = pcall(function()
        FreecamScreenGui.Parent = CoreGui
    end)
    if not freecamGuiOk then
        FreecamScreenGui.Parent = player:WaitForChild("PlayerGui")
    end

    local function CreateFreecamButton(name, text, pos)
        local btn = Instance.new("TextButton")
        btn.Name = name
        btn.Size = UDim2.new(0, 65, 0, 65)
        btn.Position = pos
        btn.Text = text
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        btn.BackgroundTransparency = 0.2
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.TextSize = 24
        btn.Visible = false
        btn.Parent = FreecamScreenGui
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 15)
        corner.Parent = btn
        return btn
    end

    local BtnFwd = CreateFreecamButton("Forward", "↑", UDim2.new(0.5, -35, 0.7, 0))
    local BtnBack = CreateFreecamButton("Backward", "↓", UDim2.new(0.5, -35, 0.85, 0))
    local BtnLeft = CreateFreecamButton("Left", "←", UDim2.new(0.35, -35, 0.775, 0))
    local BtnRight = CreateFreecamButton("Right", "→", UDim2.new(0.65, -35, 0.775, 0))
    local BtnUp = CreateFreecamButton("Up", "▲", UDim2.new(0.82, -35, 0.7, 0))
    local BtnDown = CreateFreecamButton("Down", "▼", UDim2.new(0.82, -35, 0.85, 0))

    local ToggleFreecamBtn = Instance.new("TextButton")
    ToggleFreecamBtn.Size = UDim2.new(0, 100, 0, 45)
    ToggleFreecamBtn.Position = UDim2.new(0.02, 0, 0.02, 0)
    ToggleFreecamBtn.Text = "FREECAM OFF"
    ToggleFreecamBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    ToggleFreecamBtn.TextColor3 = Color3.new(1, 1, 1)
    ToggleFreecamBtn.TextSize = 14
    ToggleFreecamBtn.Font = Enum.Font.GothamBold
    ToggleFreecamBtn.Parent = FreecamScreenGui
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 10)
    toggleCorner.Parent = ToggleFreecamBtn

    local function BindMobileButton(btn, keyName)
        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                freecamMobile[keyName] = true
            end
        end)
        btn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                freecamMobile[keyName] = false
            end
        end)
    end
    BindMobileButton(BtnFwd, "Forward")
    BindMobileButton(BtnBack, "Backward")
    BindMobileButton(BtnLeft, "Left")
    BindMobileButton(BtnRight, "Right")
    BindMobileButton(BtnUp, "Up")
    BindMobileButton(BtnDown, "Down")

    UserInputService.InputBegan:Connect(function(input, gp)
        if not gp and input.UserInputType == Enum.UserInputType.Keyboard then
            freecamKeys[input.KeyCode] = true
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            freecamKeys[input.KeyCode] = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input, gp)
        if not freecamEnabled then return end
        local isTouch = input.UserInputType == Enum.UserInputType.Touch and not gp
        local isMouse = input.UserInputType == Enum.UserInputType.MouseMovement and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        if isTouch or isMouse then
            local delta = input.Delta
            if delta then
                freecamYaw = (freecamYaw or 0) - delta.X * 0.3
                freecamPitch = math.clamp((freecamPitch or 0) - delta.Y * 0.3, -89, 89)
            end
            if freecamCamera then
                freecamCamera.CFrame = CFrame.new(freecamCamera.CFrame.Position) * CFrame.Angles(0, math.rad(freecamYaw), 0) * CFrame.Angles(math.rad(freecamPitch), 0, 0)
            end
        end
    end)

    local function ToggleFreecam(state)
        freecamEnabled = state
        freecamCamera = Workspace.CurrentCamera or freecamCamera
        _G.FreecamEnabled = state
        if state then
            pcall(function()
                if freecamCamera then
                    local rx, ry, _ = freecamCamera.CFrame:ToOrientation()
                    freecamPitch = math.deg(rx)
                    freecamYaw = math.deg(ry)
                    freecamCamera.CameraType = Enum.CameraType.Scriptable
                end
                ToggleFreecamBtn.Text = "FREECAM ON"
                ToggleFreecamBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
                if UserInputService.TouchEnabled then
                    BtnFwd.Visible = true
                    BtnBack.Visible = true
                    BtnLeft.Visible = true
                    BtnRight.Visible = true
                    BtnUp.Visible = true
                    BtnDown.Visible = true
                end
            end)
        else
            pcall(function()
                if freecamCamera then freecamCamera.CameraType = Enum.CameraType.Custom end
                if player.Character and player.Character:FindFirstChild("Humanoid") and freecamCamera then
                    freecamCamera.CameraSubject = player.Character.Humanoid
                end
                ToggleFreecamBtn.Text = "FREECAM OFF"
                ToggleFreecamBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                BtnFwd.Visible = false
                BtnBack.Visible = false
                BtnLeft.Visible = false
                BtnRight.Visible = false
                BtnUp.Visible = false
                BtnDown.Visible = false
                for k in pairs(freecamKeys) do freecamKeys[k] = false end
                for k in pairs(freecamMobile) do freecamMobile[k] = false end
            end)
        end
    end
    ToggleFreecamBtn.MouseButton1Click:Connect(function() ToggleFreecam(not freecamEnabled) end)

    RunService.RenderStepped:Connect(function(dt)
        if not freecamEnabled then return end
        dt = dt or 0.016
        local moveDir = Vector3.new()
        if (freecamKeys[Enum.KeyCode.W] or freecamMobile.Forward) and freecamCamera then
            moveDir = moveDir + freecamCamera.CFrame.LookVector
        end
        if (freecamKeys[Enum.KeyCode.S] or freecamMobile.Backward) and freecamCamera then
            moveDir = moveDir - freecamCamera.CFrame.LookVector
        end
        if (freecamKeys[Enum.KeyCode.A] or freecamMobile.Left) and freecamCamera then
            moveDir = moveDir - freecamCamera.CFrame.RightVector
        end
        if (freecamKeys[Enum.KeyCode.D] or freecamMobile.Right) and freecamCamera then
            moveDir = moveDir + freecamCamera.CFrame.RightVector
        end
        if freecamKeys[Enum.KeyCode.Space] or freecamMobile.Up then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if freecamKeys[Enum.KeyCode.LeftControl] or freecamMobile.Down then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        if moveDir.Magnitude > 0 and freecamCamera then
            local speed = freecamSpeed * 50 * dt
            freecamCamera.CFrame = freecamCamera.CFrame + (moveDir.Unit * speed)
        end
    end)

    local originalMaterials = {}

    local function saveOriginalMaterials()
        if next(originalMaterials) == nil then
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    originalMaterials[v] = {Material = v.Material, Reflectance = v.Reflectance, CastShadow = v.CastShadow}
                end
            end
        end
    end

    local function toggleGraphicReduction(percent, enable)
        pcall(function()
            saveOriginalMaterials()
            local totalParts = 0
            for _ in pairs(originalMaterials) do totalParts = totalParts + 1 end
            if totalParts == 0 then return end
            local targetCount = math.floor(totalParts * (percent / 100))
            local currentCount = 0
            for part, data in pairs(originalMaterials) do
                if part and part.Parent then
                    currentCount = currentCount + 1
                    if currentCount <= targetCount then
                        if enable then
                            part.Material = Enum.Material.SmoothPlastic
                            part.Reflectance = 0
                            part.CastShadow = false
                        else
                            part.Material = data.Material
                            part.Reflectance = data.Reflectance
                            part.CastShadow = data.CastShadow
                        end
                    end
                end
            end
        end)
    end

    local function activateFPSBoost()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            Lighting.GlobalShadows = false
            Lighting.Brightness = 0
            Lighting.FogEnd = 1e9
        end)
    end

    local function deactivateFPSBoost()
        pcall(function()
            Lighting.GlobalShadows = true
            Lighting.Brightness = 2
            Lighting.FogEnd = 1000
        end)
    end

    local lastDash = 0
    local lockedTarget = nil

    task.spawn(function()
        while task.wait() do
            if not _G.AutoFarmLevel then
                lockedTarget = nil
                continue
            end
            pcall(function()
                local char = player.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                if not hrp or not hum then return end
                if not lockedTarget or not lockedTarget.Parent or not lockedTarget:FindFirstChild("Humanoid") or lockedTarget.Humanoid.Health <= 0 then
                    lockedTarget = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == _G.Settings.TargetName and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                            lockedTarget = obj
                            break
                        end
                    end
                end
                if not lockedTarget then return end
                local targetHrp = lockedTarget:FindFirstChild("HumanoidRootPart")
                local targetHum = lockedTarget:FindFirstChild("Humanoid")
                if not targetHrp or not targetHum then lockedTarget = nil return end
                targetHrp.CFrame = CFrame.new(targetHrp.Position)
                targetHum.WalkSpeed = 0
                targetHum.JumpPower = 0
                targetHum.PlatformStand = true
                if tick() - lastDash >= _G.Settings.Speed then
                    lastDash = tick()
                    local offsets = {
                        Vector3.new(_G.Settings.DashDist, 0, 0),
                        Vector3.new(-_G.Settings.DashDist, 0, 0),
                        Vector3.new(0, 0, _G.Settings.DashDist),
                        Vector3.new(0, 0, -_G.Settings.DashDist)
                    }
                    local randomOffset = offsets[math.random(1, #offsets)]
                    hrp.CFrame = CFrame.lookAt(targetHrp.Position + randomOffset, targetHrp.Position)
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                    else
                        pcall(function()
                            VirtualUser:CaptureController()
                            VirtualUser:Button1Down(Vector2.new(500, 500))
                            task.wait(0.03)
                            VirtualUser:Button1Up(Vector2.new(500, 500))
                        end)
                    end
                end
            end)
        end
    end)

    local function AutoLootNPC2()
        task.spawn(function()
            while task.wait(0.3) do
                if _G.NhatVatPham then
                    pcall(function()
                        local giangHo2 = Workspace:FindFirstChild("GiangHo2")
                        if giangHo2 then
                            local dropFolder = giangHo2:FindFirstChild("Drop")
                            if dropFolder then
                                local char = player.Character
                                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                                if hrp then
                                    for _, dropItem in pairs(dropFolder:GetChildren()) do
                                        if dropItem and dropItem:IsA("BasePart") then
                                            local distance = (dropItem.Position - hrp.Position).Magnitude
                                            if distance <= 500 then
                                                local prompt = dropItem:FindFirstChildOfClass("ProximityPrompt")
                                                if prompt then
                                                    pcall(function()
                                                        fireproximityprompt(prompt)
                                                    end)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
    AutoLootNPC2()

    task.spawn(function()
        while task.wait(0.5) do
            if _G.AutoLootEnabled then
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, v in ipairs(Workspace:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Parent and v.Parent:IsA("BasePart") and (hrp.Position - v.Parent.Position).Magnitude <= 20 then
                            pcall(function() fireproximityprompt(v) end)
                        end
                        if v:IsA("TouchInterest") and v.Parent:IsA("BasePart") and (hrp.Position - v.Parent.Position).Magnitude <= 20 then
                            pcall(function()
                                firetouchinterest(hrp, v.Parent, 0)
                                firetouchinterest(hrp, v.Parent, 1)
                            end)
                        end
                    end
                end
            end
        end
    end)

    local ToaDoChua1 = Vector3.new(1561, 133, -244)
    local ToaDoChua2 = Vector3.new(1547, 133, -245)
    local TDBanhMi = {Vector3.new(573, 21, -357), Vector3.new(563, 20, -386), Vector3.new(553, 20, -413), Vector3.new(531, 21, -449)}
    local TDBenhVien = {Vector3.new(790, 22, -403), Vector3.new(790, 22, -413)}
    local TDCaoSu = {Vector3.new(1681, 19, -456), Vector3.new(1723, 19, -388)}
    local TDChotCongAn = Vector3.new(734, 20, -812)
    local TDSuKien = Vector3.new(0, 0, 0)
    local TDMatOng = {Vector3.new(567, 19, -533), Vector3.new(626, 19, -511), Vector3.new(629, 19, -419)}
    local TDBoss = Vector3.new(-2823, 274, -1896)

    local function isAreaOccupied(targetPos)
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and (p.Character.HumanoidRootPart.Position - targetPos).Magnitude <= 7 then
                return true
            end
        end
        for _, v in ipairs(Workspace:GetDescendants()) do
            if (v:IsA("Seat") or v:IsA("VehicleSeat")) and v.Occupant and v.Occupant.Parent ~= player.Character and (v.Position - targetPos).Magnitude <= 7 then
                return true
            end
        end
        return false
    end

    local function interactWithSeatPrompt(targetPos)
        for _, prompt in ipairs(Workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") and (prompt.Parent.Position - targetPos).Magnitude <= 6 then
                pcall(function() fireproximityprompt(prompt) end)
                break
            end
        end
    end

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmChua then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and not hum.SeatPart then
                        local finalTarget = ToaDoChua1
                        if isAreaOccupied(ToaDoChua1) then finalTarget = ToaDoChua2 end
                        hrp.CFrame = CFrame.new(finalTarget + Vector3.new(0, 2, 0))
                        task.wait(0.1)
                        interactWithSeatPrompt(finalTarget)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmBanhMi then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and not hum.SeatPart then
                        local finalTarget = nil
                        for i = 1, #TDBanhMi do
                            if not isAreaOccupied(TDBanhMi[i]) then
                                finalTarget = TDBanhMi[i]
                                break
                            end
                        end
                        if not finalTarget then finalTarget = TDBanhMi[1] end
                        hrp.CFrame = CFrame.new(finalTarget + Vector3.new(0, 2, 0))
                        task.wait(0.1)
                        interactWithSeatPrompt(finalTarget)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmBenhVien then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and not hum.SeatPart then
                        local finalTarget = nil
                        for i = 1, #TDBenhVien do
                            if not isAreaOccupied(TDBenhVien[i]) then
                                finalTarget = TDBenhVien[i]
                                break
                            end
                        end
                        if not finalTarget then finalTarget = TDBenhVien[1] end
                        hrp.CFrame = CFrame.new(finalTarget + Vector3.new(0, 2, 0))
                        task.wait(0.1)
                        interactWithSeatPrompt(finalTarget)
                    end
                end)
            end
        end
    end)

    local currentCaoSuTarget = nil
    task.spawn(function()
        while true do
            task.wait(0.8)
            if _G.AutoFarmCaoSu then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if not currentCaoSuTarget or isAreaOccupied(currentCaoSuTarget) then
                            local chosen = nil
                            for i = 1, #TDCaoSu do
                                if not isAreaOccupied(TDCaoSu[i]) then
                                    chosen = TDCaoSu[i]
                                    break
                                end
                            end
                            currentCaoSuTarget = chosen or TDCaoSu[1]
                        end
                        hrp.CFrame = CFrame.new(currentCaoSuTarget + Vector3.new(0, 2, 0))
                    end
                end)
            else
                currentCaoSuTarget = nil
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.8)
            if _G.AutoFarmChotCongAn then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if not isAreaOccupied(TDChotCongAn) then
                            hrp.CFrame = CFrame.new(TDChotCongAn + Vector3.new(0, 2, 0))
                        end
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmSuKien then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum then
                        if (hrp.Position - TDSuKien).Magnitude > 5 then
                            hrp.CFrame = CFrame.new(TDSuKien + Vector3.new(0, 2, 0))
                        end
                        task.wait(0.1)
                        interactWithSeatPrompt(TDSuKien)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmMatOng then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and not hum.SeatPart then
                        local finalTarget = nil
                        for i = 1, #TDMatOng do
                            if not isAreaOccupied(TDMatOng[i]) then
                                finalTarget = TDMatOng[i]
                                break
                            end
                        end
                        if not finalTarget then finalTarget = TDMatOng[1] end
                        hrp.CFrame = CFrame.new(finalTarget + Vector3.new(0, 2, 0))
                        task.wait(0.1)
                        interactWithSeatPrompt(finalTarget)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.TeleportToBoss then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.Position - TDBoss).Magnitude > 3 then
                        hrp.CFrame = CFrame.new(TDBoss)
                    end
                end)
            end
        end
    end)

    local MethodAPoints = {
        Vector3.new(-2793.28, 238.63, -1784.05),
        Vector3.new(-2788.09, 238.84, -1733.05)
    }

    local MethodBPoints = {
        Vector3.new(-2793, 238, -1779),
        Vector3.new(-2811, 238, -1760),
        Vector3.new(-2771, 240, -1754)
    }

    local MethodCPoints = {
        Vector3.new(-2791.95, 238.70, -1786.11),
        Vector3.new(-2767.53, 238.63, -1762.08),
        Vector3.new(-2790.39, 238.63, -1734.33),
        Vector3.new(-2815.67, 238.63, -1763.27)
    }

    local bossAttackCooldown = 0
    local currentMethodBIndex = 1
    local currentMethodCIndex = 1
    local toggleTele = true

    task.spawn(function()
        while true do
            task.wait()
            if _G.BossMode == "A" and _G.AutoFarmBossCircle and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local hrp = player.Character.HumanoidRootPart
                    local target = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == "NPC2" and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                            target = obj.HumanoidRootPart
                            break
                        end
                    end
                    if target then
                        local targetPos = toggleTele and MethodAPoints[1] or MethodAPoints[2]
                        local bossPos = target.Position
                        hrp.CFrame = CFrame.lookAt(targetPos, Vector3.new(bossPos.X, targetPos.Y, bossPos.Z))
                        toggleTele = not toggleTele
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        if tick() - bossAttackCooldown > 0.14 then
                            bossAttackCooldown = tick()
                            local tool = player.Character:FindFirstChildOfClass("Tool")
                            if tool then
                                tool:Activate()
                            else
                                pcall(function()
                                    VirtualUser:CaptureController()
                                    VirtualUser:Button1Down(Vector2.new(0, 0))
                                    task.delay(0.02, function() VirtualUser:Button1Up(Vector2.new(0, 0)) end)
                                end)
                            end
                        end
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait()
            if _G.BossMode == "B" and _G.AutoFarmBossCircle and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local hrp = player.Character.HumanoidRootPart
                    local target = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == "NPC2" and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                            target = obj.HumanoidRootPart
                            break
                        end
                    end
                    if target then
                        local targetPos = MethodBPoints[currentMethodBIndex]
                        local bossPos = target.Position
                        hrp.CFrame = CFrame.lookAt(targetPos, Vector3.new(bossPos.X, targetPos.Y, bossPos.Z))
                        currentMethodBIndex = currentMethodBIndex + 1
                        if currentMethodBIndex > #MethodBPoints then currentMethodBIndex = 1 end
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        if tick() - bossAttackCooldown > 0.14 then
                            bossAttackCooldown = tick()
                            local tool = player.Character:FindFirstChildOfClass("Tool")
                            if tool then
                                tool:Activate()
                            else
                                pcall(function()
                                    VirtualUser:CaptureController()
                                    VirtualUser:Button1Down(Vector2.new(0, 0))
                                    task.delay(0.02, function() VirtualUser:Button1Up(Vector2.new(0, 0)) end)
                                end)
                            end
                        end
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait()
            if _G.BossMode == "C" and _G.AutoFarmBossCircle and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local hrp = player.Character.HumanoidRootPart
                    local target = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == "NPC2" and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                            target = obj.HumanoidRootPart
                            break
                        end
                    end
                    if target then
                        local targetPos = MethodCPoints[currentMethodCIndex]
                        local bossPos = target.Position
                        hrp.CFrame = CFrame.lookAt(targetPos, Vector3.new(bossPos.X, targetPos.Y, bossPos.Z))
                        currentMethodCIndex = currentMethodCIndex + 1
                        if currentMethodCIndex > #MethodCPoints then currentMethodCIndex = 1 end
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        if tick() - bossAttackCooldown > 0.14 then
                            bossAttackCooldown = tick()
                            local tool = player.Character:FindFirstChildOfClass("Tool")
                            if tool then
                                tool:Activate()
                            else
                                pcall(function()
                                    VirtualUser:CaptureController()
                                    VirtualUser:Button1Down(Vector2.new(0, 0))
                                    task.delay(0.02, function() VirtualUser:Button1Up(Vector2.new(0, 0)) end)
                                end)
                            end
                        end
                    end
                end)
            end
        end
    end)

    local customJumpForce = 85
    local attackDelay = 0.08
    local activeHitboxes = {}
    local activeHealthGuis = {}

    local function clearAllHitboxes()
        for _, a in pairs(activeHitboxes) do
            pcall(function() a:Destroy() end)
        end
        activeHitboxes = {}
    end

    local function clearAllHealthGuis()
        for _, g in pairs(activeHealthGuis) do
            pcall(function() g:Destroy() end)
        end
        activeHealthGuis = {}
    end

    local function getClosestPlayer()
        local closest, dist = nil, math.huge
        local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if myRoot then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                    local d = (myRoot.Position - p.Character.HumanoidRootPart.Position).Magnitude
                    if d < dist then dist = d
                        closest = p end
                end
            end
        end
        return closest
    end

    UserInputService.JumpRequest:Connect(function()
        if _G.PvpJumpActive then
            pcall(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum:GetState() ~= Enum.HumanoidStateType.Freefall then
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, customJumpForce, hrp.Velocity.Z)
                end
            end)
        end
    end)

    task.spawn(function()
        while true do
            if _G.PvpAutoAttack and not _G.FreecamEnabled then
                task.defer(function()
                    pcall(function()
                        VirtualUser:ClickButton1(Vector2.new(freecamCamera.ViewportSize.X / 2, freecamCamera.ViewportSize.Y / 2))
                    end)
                end)
            end
            task.wait(attackDelay)
        end
    end)

    RunService.RenderStepped:Connect(function()
        pcall(function()
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if _G.PvpSpeedActive and hrp and hum and hum.MoveDirection.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (hum.MoveDirection * 3)
            end
            if _G.PvpSpinActive and hrp then
                if not hrp:FindFirstChild("Renx_SpinVelocity") then
                    local spin = Instance.new("BodyAngularVelocity")
                    spin.Name = "Renx_SpinVelocity"
                    spin.MaxTorque = Vector3.new(0, math.huge, 0)
                    spin.AngularVelocity = Vector3.new(0, 40, 0)
                    spin.Parent = hrp
                end
            else
                if hrp and hrp:FindFirstChild("Renx_SpinVelocity") then
                    hrp["Renx_SpinVelocity"]:Destroy()
                end
            end
            if _G.PvpAimNoCamActive then
                local targetPlayer = getClosestPlayer()
                if targetPlayer and targetPlayer.Character and hrp then
                    local targetPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetPart then
                        hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(targetPart.Position.X, hrp.Position.Y, targetPart.Position.Z))
                    end
                end
            end
            if _G.PvpHitboxActive then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                        local root = p.Character.HumanoidRootPart
                        root.Size = Vector3.new(5, 5, 5)
                        root.CanCollide = false
                        if not activeHitboxes[p.Name] or not activeHitboxes[p.Name].Parent then
                            if activeHitboxes[p.Name] then activeHitboxes[p.Name]:Destroy() end
                            local box = Instance.new("BoxHandleAdornment")
                            box.Size = Vector3.new(5, 6, 5)
                            box.Color3 = Color3.fromRGB(255, 0, 0)
                            box.Transparency = 0.6
                            box.AlwaysOnTop = true
                            box.Adornee = root
                            box.Parent = HubScreenGui
                            activeHitboxes[p.Name] = box
                        end
                    else
                        if activeHitboxes[p.Name] then
                            pcall(function() p.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1) end)
                            activeHitboxes[p.Name]:Destroy()
                            activeHitboxes[p.Name] = nil
                        end
                    end
                end
            else
                if next(activeHitboxes) ~= nil then clearAllHitboxes() end
            end
            if _G.PvpHealthActive then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                        local healthStr = math.floor(p.Character.Humanoid.Health) .. "/" .. math.floor(p.Character.Humanoid.MaxHealth)
                        local cur = activeHealthGuis[p.Name]
                        if not cur or not cur.Parent then
                            local bg = Instance.new("BillboardGui")
                            bg.Name = "Renx_HealthGui"
                            bg.Size = UDim2.new(0, 200, 0, 50)
                            bg.StudsOffset = Vector3.new(0, 3.5, 0)
                            bg.AlwaysOnTop = true
                            local txt = Instance.new("TextLabel", bg)
                            txt.BackgroundTransparency = 1
                            txt.Size = UDim2.new(1, 0, 1, 0)
                            txt.Font = Enum.Font.GothamBold
                            txt.TextSize = 14
                            txt.TextColor3 = Color3.fromRGB(0, 255, 127)
                            txt.Text = healthStr
                            bg.Adornee = p.Character.Head
                            bg.Parent = HubScreenGui
                            activeHealthGuis[p.Name] = bg
                        else
                            local label = cur:FindFirstChildOfClass("TextLabel")
                            if label then label.Text = healthStr end
                        end
                    else
                        if activeHealthGuis[p.Name] then
                            activeHealthGuis[p.Name]:Destroy()
                            activeHealthGuis[p.Name] = nil
                        end
                    end
                end
            else
                if next(activeHealthGuis) ~= nil then clearAllHealthGuis() end
            end
        end)
    end)

    local PvpTab = Tabs.Main6

    PvpTab:CreateParagraph("Paragraph1", {
        Title = "PVP CAPPY",
        Content = "Tính năng bổ sung từ CAPPY: Speed Boost, Auto Hit, Lấy Ghế, Aimlock, ESP"
    })

    local CAPPYSpeedEnabled = false
    local CAPPYSpeedValue = 35

    PvpTab:CreateToggle("CAPPYSpeedToggle", {
        Title = "CAPPY Speed Boost",
        Default = false,
        Callback = function(Value)
            CAPPYSpeedEnabled = Value
        end
    })

    PvpTab:CreateSlider("CAPPYSpeedSlider", {
        Title = "CAPPY Speed Value",
        Min = 16,
        Max = 100,
        Default = 35,
        Rounding = 1,
        Callback = function(Value)
            CAPPYSpeedValue = Value
        end
    })

    local CAPPYAutoHit = false
    PvpTab:CreateToggle("CAPPYAutoHitToggle", {
        Title = "CAPPY Auto Hit",
        Default = false,
        Callback = function(Value)
            CAPPYAutoHit = Value
        end
    })

    local CAPPYAimlock = false
    PvpTab:CreateToggle("CAPPYAimlockToggle", {
        Title = "CAPPY Aimlock",
        Default = false,
        Callback = function(Value)
            CAPPYAimlock = Value
        end
    })

    local CAPPYHealthESP = false
    PvpTab:CreateToggle("CAPPYHealthESPToggle", {
        Title = "CAPPY Health ESP",
        Default = false,
        Callback = function(Value)
            CAPPYHealthESP = Value
            if not Value then
                for _, player in ipairs(Players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Head") then
                        local head = player.Character.Head
                        if head:FindFirstChild("CAPPYHealthESP") then
                            head.CAPPYHealthESP:Destroy()
                        end
                    end
                end
            end
        end
    })

    PvpTab:CreateButton({
        Title = "CAPPY Lấy Ghế",
        Callback = function()
            pcall(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if not hrp or not hum then return end

                local ghe = workspace:FindFirstChild("Ghe")
                if not ghe then return end

                local chairs = {}
                for _, v in pairs(ghe:GetChildren()) do
                    if v.Name == "Chair" then
                        local hitbox = v:FindFirstChild("hitbox")
                        if hitbox then
                            local cd = hitbox:FindFirstChild("ClickDetector")
                            if cd then
                                table.insert(chairs, {click = cd, part = hitbox})
                            end
                        end
                    end
                end

                if #chairs > 0 then
                    local randomChair = chairs[math.random(1, #chairs)]
                    local oldPos = hrp.CFrame

                    hum.Sit = false
                    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    local tween = TweenService:Create(hrp, TweenInfo.new(0.22, Enum.EasingStyle.Linear), {
                        CFrame = randomChair.part.CFrame + randomChair.part.CFrame.LookVector * -2 + Vector3.new(0, 2, 0)
                    })
                    tween:Play()
                    tween.Completed:Wait()

                    task.wait(0.12)

                    for i = 1, 5 do
                        randomChair.click.MaxActivationDistance = 20
                        fireclickdetector(randomChair.click)
                        task.wait(0.04)
                    end

                    task.wait(0.08)
                    hrp.CFrame = oldPos
                end
            end)
        end
    })

    RunService.RenderStepped:Connect(function(dt)
        if CAPPYSpeedEnabled then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                local dir = hum.MoveDirection
                if dir.Magnitude > 0 then
                    hrp.CFrame = hrp.CFrame + dir * ((CAPPYSpeedValue - 16) * dt)
                end
            end
        end

        if CAPPYAimlock then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest = nil
                local dist = math.huge
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local mag = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                        if mag < dist and mag <= 60 then
                            dist = mag
                            closest = plr
                        end
                    end
                end
                if closest and closest.Character and closest.Character:FindFirstChild("HumanoidRootPart") then
                    hrp.CFrame = CFrame.new(hrp.Position, closest.Character.HumanoidRootPart.Position)
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.15) do
            if CAPPYAutoHit then
                local char = player.Character
                if char then
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        pcall(function() tool:Activate() end)
                    end
                end
            end
        end
    end)

    local function createCAPPYESP(character)
        if not CAPPYHealthESP then return end
        local head = character:FindFirstChild("Head")
        local hum = character:FindFirstChildOfClass("Humanoid")
        if head and hum and not head:FindFirstChild("CAPPYHealthESP") then
            local bill = Instance.new("BillboardGui")
            bill.Name = "CAPPYHealthESP"
            bill.Parent = head
            bill.AlwaysOnTop = true
            bill.Size = UDim2.new(3.5, 0, 1.2, 0)
            bill.StudsOffset = Vector3.new(0, 2.6, 0)

            local bg = Instance.new("Frame")
            bg.Parent = bill
            bg.Size = UDim2.new(1, 0, 0.18, 0)
            bg.Position = UDim2.new(0, 0, 0.5, 0)
            bg.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
            bg.BackgroundTransparency = 0.2
            bg.BorderSizePixel = 0
            Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)

            local bar = Instance.new("Frame")
            bar.Parent = bg
            bar.Name = "HealthBar"
            bar.Size = UDim2.new(1, 0, 1, 0)
            bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            bar.BorderSizePixel = 0
            Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

            local txt = Instance.new("TextLabel")
            txt.Parent = bill
            txt.Name = "HPText"
            txt.Size = UDim2.new(1, 0, 0.4, 0)
            txt.Position = UDim2.new(0, 0, 0, -8)
            txt.BackgroundTransparency = 1
            txt.TextColor3 = Color3.new(1, 1, 1)
            txt.TextStrokeTransparency = 0
            txt.Font = Enum.Font.GothamBold
            txt.TextScaled = true
            txt.Text = math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
        end
    end

    RunService.RenderStepped:Connect(function()
        if CAPPYHealthESP then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    createCAPPYESP(plr.Character)
                    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                    local head = plr.Character:FindFirstChild("Head")
                    if hum and head and head:FindFirstChild("CAPPYHealthESP") then
                        local esp = head.CAPPYHealthESP
                        local bar = esp.Frame.HealthBar
                        local txt = esp.HPText
                        local percent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                        bar:TweenSize(UDim2.new(percent, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.08, true)
                        txt.Text = math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
                    end
                end
            end
        end
    end)

    local XeBayTab = Tabs.Main11

    XeBayTab:CreateParagraph("XeBayInfo", {
        Title = "XE BAY",
        Content = "Code Xe Bay mới từ Untitled 11.lua • PC: W/S + E/Q • Mobile: nút điều khiển."
    })

    local Player = player
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Camera = workspace.CurrentCamera

    local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
    ScreenGui.Name = "Renx_XeBay_Untitled11"
    ScreenGui.ResetOnSpawn = false

    local isFlying = false
    local flySpeed = 200
    local keys = {W = false, S = false, UP = false, DOWN = false}

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 140, 0, 50)
    MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", MainFrame)

    local FlyBtn = Instance.new("TextButton", MainFrame)
    FlyBtn.Size = UDim2.new(1, 0, 1, 0)
    FlyBtn.Text = "Bug Xe"
    FlyBtn.TextColor3 = Color3.new(1, 1, 1)
    FlyBtn.BackgroundTransparency = 1
    FlyBtn.Font = Enum.Font.GothamBold
    FlyBtn.TextSize = 14

    local MobileControls = Instance.new("Frame", ScreenGui)
    MobileControls.Size = UDim2.new(0, 220, 0, 150)
    MobileControls.Position = UDim2.new(0.65, 0, 0.5, 0)
    MobileControls.BackgroundTransparency = 1
    MobileControls.Visible = false

    local function CreateMobileBtn(txt, pos, keyName)
        local btn = Instance.new("TextButton", MobileControls)
        btn.Size = UDim2.new(0, 60, 0, 60)
        btn.Position = pos
        btn.Text = txt
        btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        btn.BackgroundTransparency = 0.5
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

        btn.MouseButton1Down:Connect(function() keys[keyName] = true end)
        btn.MouseButton1Up:Connect(function() keys[keyName] = false end)
    end

    CreateMobileBtn("⬆️", UDim2.new(0.35, 0, 0, 0), "W")
    CreateMobileBtn("⬇️", UDim2.new(0.35, 0, 0.6, 0), "S")
    CreateMobileBtn("Lên", UDim2.new(0.7, 0, 0.3, 0), "UP")
    CreateMobileBtn("Xuống", UDim2.new(0, 0, 0.3, 0), "DOWN")

    local function GetRoot()
        local char = Player.Character
        if not char then return nil end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.SeatPart then

            return hum.SeatPart.AssemblyRootPart or hum.SeatPart
        end
        return char:FindFirstChild("HumanoidRootPart")
    end

    local function TeleportToGround(root)
        local rayOrigin = root.Position
        local rayDirection = Vector3.new(0, -2000, 0)
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {Player.Character}
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude

        local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
        if raycastResult then
            root.CFrame = CFrame.new(raycastResult.Position + Vector3.new(0, 4, 0))
        end
    end

    local flyConnection = nil

    local function SetXeBayEnabled(Value)
        isFlying = Value
        MobileControls.Visible = isFlying
        FlyBtn.Text = isFlying and "Tắt" or "Bật"
        FlyBtn.TextColor3 = isFlying and Color3.new(1, 0, 0) or Color3.new(1, 1, 1)
        local char = Player.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = GetRoot()
        if not root then return end

        if isFlying then
            local camFix = char:FindFirstChild("CamFixPart") or Instance.new("Part", char)
            camFix.Name = "CamFixPart"
            camFix.Transparency = 1
            camFix.CanCollide = false
            camFix.Size = Vector3.new(1,1,1)

            local weld = camFix:FindFirstChildOfClass("Weld") or Instance.new("Weld", camFix)
            weld.Part0 = camFix
            weld.Part1 = root
            Camera.CameraSubject = camFix

            local bv = root:FindFirstChild("FlyVelocity") or Instance.new("BodyVelocity")
            bv.Name = "FlyVelocity"
            bv.Parent = root
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 0, 0)

            local bg = root:FindFirstChild("FlyGyro") or Instance.new("BodyGyro")
            bg.Name = "FlyGyro"
            bg.Parent = root
            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bg.P = 9e4
            bg.D = 500

            flyConnection = RunService.RenderStepped:Connect(function()
                if not isFlying then return end

                local currentRoot = GetRoot()
                if not currentRoot then return end

                if bv.Parent ~= currentRoot then bv.Parent = currentRoot end
                if bg.Parent ~= currentRoot then bg.Parent = currentRoot end
                root = currentRoot

                root.AssemblyLinearVelocity = Vector3.new(0, 0.01, 0)

                local camCFrame = Camera.CFrame
                bg.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z))

                local moveVec = Vector3.new(0, 0, 0)
                if keys.W then moveVec = moveVec + camCFrame.LookVector end
                if keys.S then moveVec = moveVec - camCFrame.LookVector end
                if keys.UP then moveVec = moveVec + Vector3.new(0, 1, 0) end
                if keys.DOWN then moveVec = moveVec - Vector3.new(0, 1, 0) end

                if moveVec.Magnitude > 0 then
                    bv.Velocity = moveVec.Unit * flySpeed
                else
                    bv.Velocity = Vector3.new(0, 0, 0)
                end
            end)
        else

            if flyConnection then
                flyConnection:Disconnect()
                flyConnection = nil
            end

            local currentRoot = GetRoot()
            if currentRoot then
                local bv = currentRoot:FindFirstChild("FlyVelocity")
                local bg = currentRoot:FindFirstChild("FlyGyro")
                if bv then bv:Destroy() end
                if bg then bg:Destroy() end
            end

            local camFix = char:FindFirstChild("CamFixPart")
            if camFix then camFix:Destroy() end

            if hum then
                Camera.CameraSubject = hum
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end

            if currentRoot then
                currentRoot.AssemblyLinearVelocity = Vector3.new(0,0,0)
                currentRoot.AssemblyAngularVelocity = Vector3.new(0,0,0)
                TeleportToGround(currentRoot)
                task.wait(0.1)
                currentRoot.AssemblyLinearVelocity = Vector3.new(0,0,0)
                currentRoot.AssemblyAngularVelocity = Vector3.new(0,0,0)
            end
        end
    end
    FlyBtn.Visible = false

    UserInputService.InputBegan:Connect(function(i, g)
        if g then return end
        if i.KeyCode == Enum.KeyCode.W then keys.W = true end
        if i.KeyCode == Enum.KeyCode.S then keys.S = true end
        if i.KeyCode == Enum.KeyCode.E then keys.UP = true end
        if i.KeyCode == Enum.KeyCode.Q then keys.DOWN = true end
    end)

    UserInputService.InputEnded:Connect(function(i)
        if i.KeyCode == Enum.KeyCode.W then keys.W = false end
        if i.KeyCode == Enum.KeyCode.S then keys.S = false end
        if i.KeyCode == Enum.KeyCode.E then keys.UP = false end
        if i.KeyCode == Enum.KeyCode.Q then keys.DOWN = false end
    end)
    _G.CAPPY_U11_SetXeBayEnabled = SetXeBayEnabled
    _G.CAPPY_U11_SetXeBaySpeed = function(v) flySpeed = v end

    XeBayTab:CreateToggle("BugXeToggle", {
        Title = "Bật Bug Xe",
        Default = false,
        Callback = function(Value)
            if _G.CAPPY_U11_SetXeBayEnabled then
                _G.CAPPY_U11_SetXeBayEnabled(Value)
            end
        end
    })

    XeBayTab:CreateSlider("XeBaySpeedSlider", {
        Title = "Tốc độ Bug Xe",
        Min = 50,
        Max = 500,
        Default = 200,
        Rounding = 1,
        Callback = function(Value)
            if _G.CAPPY_U11_SetXeBaySpeed then
                _G.CAPPY_U11_SetXeBaySpeed(Value)
            end
        end
    })

    XeBayTab:CreateParagraph("XeBayControls", {
        Title = "Điều khiển",
        Content = "PC: W/S tiến-lùi • E lên • Q xuống\nMobile: dùng 4 nút điều khiển."
    })

    local ConfigFolderName = "Renx_MultiConfigs"
    local GlobalSettingsFile = "Renx_System_Global.json"
    _G.SelectedConfigName = ""
    _G.UseConfigSystem = false

    if makefolder and not isfolder(ConfigFolderName) then makefolder(ConfigFolderName) end

    local RegisteredToggles = {
        AutoFarmLevelToggle = "AutoFarmLevel",
        AutoFarmChuaToggle = "AutoFarmChua",
        AntiAFKToggle = "AntiAFKEnabled",
        AutoFarmBanhMiToggle = "AutoFarmBanhMi",
        AutoFarmBenhVienToggle = "AutoFarmBenhVien",
        AutoFarmCaoSuToggle = "AutoFarmCaoSu",
        AutoFarmChotCongAnToggle = "AutoFarmChotCongAn",
        AutoFarmSuKienToggle = "AutoFarmSuKien",
        AutoFarmMatOngToggle = "AutoFarmMatOng",
        TeleportToBossToggle = "TeleportToBoss",
        AutoFarmBossCircleToggle = "AutoFarmBossCircle",
        AutoAimBossNoCamToggle = "AutoAimBossNoCam",
        FreecamToggle = "FreecamEnabled",
        PvpAutoAttackToggle = "PvpAutoAttack",
        PvpSpinToggle = "PvpSpinActive",
        PvpAimNoCamToggle = "PvpAimNoCamActive",
        PvpHitboxToggle = "PvpHitboxActive",
        PvpHealthToggle = "PvpHealthActive",
        AutoBandageToggle = "AutoBandageEnabled",
        AutoBuyHealToggle = "AutoBuyHeal",
        PvpSpeedToggle = "PvpSpeedActive",
        PvpJumpToggle = "PvpJumpActive",
        FPSBoostNewToggle = "FPSBoostState",
        Reduce20Toggle = "Reduce20State",
        Reduce40Toggle = "Reduce40State",
        Reduce60Toggle = "Reduce60State",
        Reduce100Toggle = "Reduce100State",
        ClearEverythingToggle = "ClearEverythingState",
        ShowHealthToggle = "ShowHealthEnabled",
        AutoReviveToggle = "AutoReviveEnabled",
        AutoTakeReviveToggle = "AutoTakeReviveEnabled",
        NhatVatPhamToggle = "NhatVatPham"
    }

    local function getAllConfigFiles()
        local list = {}
        if listfiles then
            for _, p in ipairs(listfiles(ConfigFolderName)) do
                local n = p:match("([^/\\]+)%.json$")
                if n then table.insert(list, n) end
            end
        end
        if #list == 0 then table.insert(list, "Chua co config nao") end
        return list
    end

    local function saveGlobalSystemSettings()
        writefile(GlobalSettingsFile, HttpService:JSONEncode({UseConfigSystem = _G.UseConfigSystem, SelectedConfigName = _G.SelectedConfigName}))
    end

    local function saveNewConfigWithName(customName)
        if customName == "" then
            Library:Notify({Title = "Loi", Content = "Vui long nhap ten!", Duration = 3})
            return
        end
        customName = tostring(customName):gsub('[^%w_%-%s]', ''):gsub('%s+', '_')
        if customName == '' then
            Library:Notify({Title = "Loi", Content = "Ten config khong hop le!", Duration = 3})
            return
        end
        local data = {}
        for ui, var in pairs(RegisteredToggles) do
            data[var] = _G[var] or false
        end
        local ok, err = pcall(function()
            writefile(ConfigFolderName .. "/" .. customName .. ".json", HttpService:JSONEncode(data))
        end)
        if not ok then
            Library:Notify({Title = "Config", Content = "Khong the luu config: " .. tostring(err), Duration = 4})
            return
        end
        _G.SelectedConfigName = customName
        saveGlobalSystemSettings()
        if ConfigDropdown and ConfigDropdown.SetValues then
            pcall(function() ConfigDropdown:SetValues(getAllConfigFiles()) end)
        end
        Library:Notify({Title = "Config", Content = "Da luu: " .. customName, Duration = 3})
    end

    local function loadSelectedConfig(customName)
        if customName == "Chua co config nao" then return end
        local path = ConfigFolderName .. "/" .. customName .. ".json"
        if isfile(path) then
            local suc, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
            if suc and data then
                for ui, var in pairs(RegisteredToggles) do
                    if data[var] ~= nil then
                        _G[var] = data[var]
                        if Library.Options and Library.Options[ui] then Library.Options[ui]:SetValue(data[var]) end
                        if var == "FPSBoostState" and data[var] then activateFPSBoost() end
                        if var == "Reduce20State" then toggleGraphicReduction(20, data[var]) end
                        if var == "Reduce40State" then toggleGraphicReduction(40, data[var]) end
                        if var == "Reduce60State" then toggleGraphicReduction(60, data[var]) end
                        if var == "Reduce100State" then toggleGraphicReduction(100, data[var]) end
                        if var == "ClearEverythingState" and data[var] then
                            activateFPSBoost()
                            for _, v in ipairs(Workspace:GetDescendants()) do
                                if v:IsA("Decal") or v:IsA("Texture") or v:IsA("Sound") then pcall(function() v:Destroy() end) end
                                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled = false end
                                if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic
                                    v.Reflectance = 0
                                    v.CastShadow = false end
                            end
                        end
                    end
                end
            end
        end
    end

    local function deleteSelectedConfig(customName)
        if customName == "Chua co config nao" then return end
        local path = ConfigFolderName .. "/" .. customName .. ".json"
        if isfile(path) then
            local ok, err = pcall(function() delfile(path) end)
            if not ok then
                Library:Notify({Title = "Config", Content = "Khong the xoa config: " .. tostring(err), Duration = 4})
                return
            end
            _G.SelectedConfigName = ""
            saveGlobalSystemSettings()
            if ConfigDropdown and ConfigDropdown.SetValues then
                pcall(function() ConfigDropdown:SetValues(getAllConfigFiles()) end)
            end
            Library:Notify({Title = "Config", Content = "Da xoa: " .. customName, Duration = 3})
        end
    end

    Tabs.Main1:CreateParagraph("Paragraph4", {Title = "THONG TIN TAI KHOAN", Content = "Ten: " .. player.DisplayName .. "\n@" .. player.Name})
    Tabs.Main1:CreateParagraph("Paragraph5", {Title = "EXECUTOR", Content = "Dang chay: " .. identity .. "\nHo tro " .. #SupportedExecutors .. " executor"})
    Tabs.Main1:CreateButton({Title = "Can ho tro ib tiktok", Callback = function()
        setclipboard("Renx")
        Library:Notify({Title = "Renx System", Content = "Da sao chep id Tiktok!", Duration = 3})
    end})
    Tabs.Main1:CreateButton({Title = "TikTok Ho Tro", Callback = function()
        setclipboard("https://www.tiktok.com/@trungkilabo")
        Library:Notify({Title = "Renx System", Content = "Da sao chep link TikTok!", Duration = 3})
    end})
    Tabs.Main1:CreateParagraph("Paragraph6", {Title = "HUONG DAN FREECAM", Content = "An nut Bat/Tat Freecam. Di chuyen bang WASD + Space/LeftControl. Keo chuot phai hoac vuot de xoay. Dieu chinh toc do ben duoi."})
    Tabs.Main1:CreateToggle("FreecamToggleMain", {Title = "BAT/TAT FREECAM", Default = false, Callback = function(Value) ToggleFreecam(Value) end})
    Tabs.Main1:CreateSlider("FreecamSpeedSliderMain", {Title = "TOC DO FREECAM", Min = 0.5, Max = 10, Default = 1.5, Rounding = 1, Callback = function(Value) freecamSpeed = Value end})
    Tabs.Main1:CreateToggle("AutoReviveToggle", {Title = "Auto Cứu (đến người chết)", Default = false, Callback = function(Value) _G.AutoReviveEnabled = Value end})
    Tabs.Main1:CreateToggle("AutoTakeReviveToggle", {Title = "Lấy Cứu (teleport điểm cứu)", Default = false, Callback = function(Value) _G.AutoTakeReviveEnabled = Value end})

    Tabs.Main2:CreateParagraph("Paragraph7", {Title = "FARM LEVEL", Content = "Cac chuc nang farm level cua ban."})
    Tabs.Main2:CreateToggle("AutoFarmLevelToggle", {Title = "Auto Farm NPC", Default = false, Callback = function(Value) _G.AutoFarmLevel = Value end})
    Tabs.Main2:CreateSlider("NpcDistanceSlider", {Title = "Khoang cach", Min = 10, Max = 25, Default = 18, Rounding = 1, Callback = function(Value) _G.Settings.DashDist = Value end})
    Tabs.Main2:CreateSlider("NpcSpeedSlider", {Title = "Toc do Dash", Min = 1, Max = 20, Default = 5, Rounding = 1, Callback = function(Value) _G.Settings.Speed = Value / 100 end})
    Tabs.Main2:CreateToggle("AutoLootToggle", {Title = "Auto Nhat Do", Default = false, Callback = function(Value) _G.AutoLootEnabled = Value end})
    Tabs.Main2:CreateToggle("AutoFarmChuaToggle", {Title = "Auto Farm O Chua", Default = false, Callback = function(Value) _G.AutoFarmChua = Value end})

    local antiAFKConnection = nil
    Tabs.Main2:CreateToggle("AntiAFKToggle", {Title = "Anti-AFK", Default = false, Callback = function(Value)
        _G.AntiAFKEnabled = Value
        if Value then
            if antiAFKConnection then antiAFKConnection:Disconnect() end
            antiAFKConnection = player.Idled:Connect(function()
                pcall(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end)
            end)
            Library:Notify({Title = "Anti AFK", Content = "Da bat Anti-AFK!", Duration = 3})
        else
            if antiAFKConnection then
                antiAFKConnection:Disconnect()
                antiAFKConnection = nil
            end
            Library:Notify({Title = "Anti AFK", Content = "Da tat Anti-AFK!", Duration = 3})
        end
    end})

    Tabs.Main2:CreateButton({Title = "admin", Callback = function()
        pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))() end)
    end})
    Tabs.Main2:CreateButton({Title = "vfly", Callback = function()
        pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-V-fly-20577"))() end)
    end})

    Tabs.Main3:CreateParagraph("Paragraph8", {Title = "FARM TIEN", Content = "Cac chuc nang farm tien cua ban."})
    Tabs.Main3:CreateToggle("AutoFarmBanhMiToggle", {Title = "Auto Farm Banh Mi", Default = false, Callback = function(Value) _G.AutoFarmBanhMi = Value end})
    Tabs.Main3:CreateToggle("AutoFarmBenhVienToggle", {Title = "Auto Farm Benh Vien", Default = false, Callback = function(Value) _G.AutoFarmBenhVien = Value end})
    Tabs.Main3:CreateToggle("AutoFarmCaoSuToggle", {Title = "Auto Farm Cao Su", Default = false, Callback = function(Value) _G.AutoFarmCaoSu = Value end})
    Tabs.Main3:CreateToggle("AutoFarmChotCongAnToggle", {Title = "Auto Farm Chot Cong An", Default = false, Callback = function(Value) _G.AutoFarmChotCongAn = Value end})

    Tabs.Main4:CreateParagraph("Paragraph9", {Title = "FARM SU KIEN", Content = "Cac chuc nang su kien cua ban."})
    Tabs.Main4:CreateToggle("AutoFarmSuKienToggle", {Title = "Auto Farm Su Kien", Default = false, Callback = function(Value) _G.AutoFarmSuKien = Value end})
    Tabs.Main4:CreateToggle("AutoFarmMatOngToggle", {Title = "Auto Farm Mat Ong", Default = false, Callback = function(Value) _G.AutoFarmMatOng = Value end})

    Tabs.Main5:CreateParagraph("Paragraph10", {Title = "FARM BOSS", Content = "Cac chuc nang Boss cua ban."})
    Tabs.Main5:CreateToggle("TeleportToBossToggle", {Title = "Dich Chuyen Den Boss", Default = false, Callback = function(Value) _G.TeleportToBoss = Value end})
    Tabs.Main5:CreateToggle("AutoFarmBossCircleToggle", {Title = "Auto Farm Boss", Default = false, Callback = function(Value) _G.AutoFarmBossCircle = Value end})
    Tabs.Main5:CreateDropdown("BossFarmModeDropdown", {Title = "Che Do Farm", Values = {"A", "B", "C"}, Default = "A", Callback = function(Value) _G.BossMode = Value end})
    Tabs.Main5:CreateToggle("NhatVatPhamToggle", {Title = "Auto Loot Boss", Default = false, Callback = function(Value)
        _G.NhatVatPham = Value
        if Value then
            Library:Notify({Title = "Auto Loot Boss", Content = "Da bat auto loot Boss!", Duration = 3})
        else
            Library:Notify({Title = "Auto Loot Boss", Content = "Da tat auto loot Boss!", Duration = 3})
        end
    end})
    Tabs.Main5:CreateToggle("AutoAimBossNoCamToggle", {Title = "Aim Huong Danh", Default = false, Callback = function(Value) _G.AutoAimBossNoCam = Value end})
    Tabs.Main5:CreateToggle("ShowHealthToggle", {Title = "Hien Mau Boss", Default = false, Callback = function(Value) _G.ShowHealthEnabled = Value end})

    Tabs.Main6:CreateParagraph("Paragraph11", {Title = "PVP COMBAT", Content = "Cac chuc nang PVP cua ban."})
    Tabs.Main6:CreateToggle("PvpAimNoCamToggle", {Title = "Aim Nhan Vat", Default = false, Callback = function(Value) _G.PvpAimNoCamActive = Value end})
    Tabs.Main6:CreateToggle("PvpAutoAttackToggle", {Title = "Auto Click", Default = false, Callback = function(Value) _G.PvpAutoAttack = Value end})
    Tabs.Main6:CreateToggle("PvpHitboxToggle", {Title = "Hitbox", Default = false, Callback = function(Value)
        _G.PvpHitboxActive = Value
        if not Value then clearAllHitboxes() end
    end})
    Tabs.Main6:CreateToggle("PvpHealthToggle", {Title = "Hien Mau", Default = false, Callback = function(Value)
        _G.PvpHealthActive = Value
        if not Value then clearAllHealthGuis() end
    end})
    Tabs.Main6:CreateToggle("PvpSpinToggle", {Title = "Spin", Default = false, Callback = function(Value) _G.PvpSpinActive = Value end})
    Tabs.Main6:CreateToggle("PvpSpeedToggle", {Title = "Sieu Toc", Default = false, Callback = function(Value) _G.PvpSpeedActive = Value end})
    Tabs.Main6:CreateToggle("PvpJumpToggle", {Title = "Sieu Nhay", Default = false, Callback = function(Value) _G.PvpJumpActive = Value end})

    Tabs.Main7:CreateParagraph("Paragraph12", {Title = "FIX LAG", Content = "Cac chuc nang toi uu hieu nang cua ban."})
    Tabs.Main7:CreateToggle("FPSBoostNewToggle", {Title = "FPS Boost", Default = false, Callback = function(Value)
        _G.FPSBoostState = Value
        if Value then activateFPSBoost() else deactivateFPSBoost() end
    end})
    Tabs.Main7:CreateToggle("Reduce20Toggle", {Title = "Giam 20% do hoa", Default = false, Callback = function(Value)
        _G.Reduce20State = Value
        toggleGraphicReduction(20, Value)
    end})
    Tabs.Main7:CreateToggle("Reduce40Toggle", {Title = "Giam 40%", Default = false, Callback = function(Value)
        _G.Reduce40State = Value
        toggleGraphicReduction(40, Value)
    end})
    Tabs.Main7:CreateToggle("Reduce60Toggle", {Title = "Giam 60%", Default = false, Callback = function(Value)
        _G.Reduce60State = Value
        toggleGraphicReduction(60, Value)
    end})
    Tabs.Main7:CreateToggle("Reduce100Toggle", {Title = "Giam 100%", Default = false, Callback = function(Value)
        _G.Reduce100State = Value
        toggleGraphicReduction(100, Value)
    end})
    Tabs.Main7:CreateToggle("ClearEverythingToggle", {Title = "Xoa toan bo hieu ung", Default = false, Callback = function(Value)
        _G.ClearEverythingState = Value
        if Value then
            activateFPSBoost()
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") or v:IsA("Sound") then pcall(function() v:Destroy() end) end
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled = false end
                if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                    v.CastShadow = false end
            end
        end
    end})

    Tabs.Main8:CreateParagraph("Paragraph13", {Title = "He thong Config", Content = "Luu trang thai tat ca toggle. Dat ten, tao, chon, xoa config."})
    local NewConfigNameInput = ""
    Tabs.Main8:CreateInput("ConfigNameInput", {Title = "Ten config moi", Placeholder = "Nhap ten khong dau", Finished = true, Callback = function(Value)
        NewConfigNameInput = Value:gsub("%s+", "")
    end})
    Tabs.Main8:CreateButton({Title = "Tao Config", Callback = function()
        if NewConfigNameInput == "" then
            Library:Notify({Title = "Loi", Content = "Nhap ten truoc!", Duration = 3})
        else
            saveNewConfigWithName(NewConfigNameInput)
        end
    end})
    ConfigDropdown = Tabs.Main8:CreateDropdown("SelectConfigDropdown", {Title = "Danh sach", Values = getAllConfigFiles(), Default = "Chua co config nao", Callback = function(Value)
        if Value ~= "Chua co config nao" then
            _G.SelectedConfigName = Value
            saveGlobalSystemSettings()
            if _G.UseConfigSystem then loadSelectedConfig(Value) end
        end
    end})
    Tabs.Main8:CreateToggle("UseConfigSystemToggle", {Title = "Su dung config dang chon", Default = false, Callback = function(Value)
        _G.UseConfigSystem = Value
        saveGlobalSystemSettings()
        if Value and _G.SelectedConfigName ~= "" and _G.SelectedConfigName ~= "Chua co config nao" then
            loadSelectedConfig(_G.SelectedConfigName)
        end
    end})
    Tabs.Main8:CreateButton({Title = "Xoa Config dang chon", Callback = function()
        if _G.SelectedConfigName ~= "" and _G.SelectedConfigName ~= "Chua co config nao" then
            deleteSelectedConfig(_G.SelectedConfigName)
        else
            Library:Notify({Title = "Loi", Content = "Chon config truoc!", Duration = 3})
        end
    end})

    Tabs.Main9:CreateParagraph("Paragraph14", {Title = "AUTO KICK", Content = "Tu dong tu da khi co nguoi choi khac den gan"})
    Tabs.Main9:CreateInput("AutoKickDistanceInput", {
        Title = "Khoang cach tu da (stud)",
        Placeholder = "15",
        Default = "15",
        Finished = true,
        Callback = function(value)
            local num = tonumber(value)
            if num then
                _G.AutoKickDistance = math.clamp(num, 1, 50)
            else
                _G.AutoKickDistance = 15
            end
        end
    })

    local kickConnection = nil
    local lastKickedPlayers = {}
    local kickCooldown = 5

    local function KickYourself(reason)
        pcall(function()
            game.Players.LocalPlayer:Kick(reason or "Nguoi choi khac den qua gan!")
        end)
    end

    local function CheckNearbyPlayers()
        if not _G.AutoKickEnabled then return end
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local currentTime = tick()
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local targetChar = player.Character
                if targetChar then
                    local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
                    if targetHrp then
                        local distance = (hrp.Position - targetHrp.Position).Magnitude
                        if distance <= _G.AutoKickDistance then
                            local lastKick = lastKickedPlayers[player.Name] or 0
                            if currentTime - lastKick >= kickCooldown then
                                lastKickedPlayers[player.Name] = currentTime
                                KickYourself(string.format("⚠️ %s den gan (%.1f stud)", player.Name, distance))
                                break
                            end
                        end
                    end
                end
            end
        end
    end

    Tabs.Main9:CreateToggle("AutoKickToggleMain", {
        Title = "Tu dong da khi nguoi choi den gan",
        Default = _G.AutoKickEnabled,
        Callback = function(state)
            _G.AutoKickEnabled = state
            if state then
                if kickConnection then kickConnection:Disconnect() end
                kickConnection = game:GetService("RunService").RenderStepped:Connect(CheckNearbyPlayers)
                Library:Notify({Title = "Auto Kick", Content = "Da bat tu dong da khi co nguoi den gan!", Duration = 3})
            else
                if kickConnection then kickConnection:Disconnect() end
                lastKickedPlayers = {}
                Library:Notify({Title = "Auto Kick", Content = "Da tat tu dong da!", Duration = 3})
            end
        end
    })

    Tabs.Main10:CreateParagraph("Paragraph15", {Title = "AUTO HEAL", Content = "Tu dong su dung bang gac khi HP thap"})
    Tabs.Main10:CreateSlider("HealHPSlider", {
        Title = "HP toi thieu de heal",
        Min = 10,
        Max = 100,
        Default = 80,
        Rounding = 1,
        Callback = function(value)
            _G.HealThreshold = tonumber(value) or 80
        end
    })
    Tabs.Main10:CreateToggle("AutoHealToggle", {
        Title = "Tu dong heal",
        Default = false,
        Callback = function(state)
            _G.AutoHealEnabled = state
        end
    })
    Tabs.Main10:CreateToggle("AutoBuyHealToggle", {
        Title = "Tu dong mua bang gac",
        Default = false,
        Callback = function(state)
            _G.AutoBuyHealEnabled = state
        end
    })

    task.spawn(function()
        while task.wait(1) do
            if _G.AutoHealEnabled then
                pcall(function()
                    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
                    if hum and hum.Health > 0 and hum.Health < _G.HealThreshold then
                        ReplicatedStorage.Remotes.Heal:FireServer()
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            if _G.AutoBuyHealEnabled then
                pcall(function()
                    local ShopRemote = ReplicatedStorage:WaitForChild("KnitPackages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ShopService"):WaitForChild("RE"):WaitForChild("buyItem")
                    ShopRemote:FireServer("băng gạc", 5)
                end)
            end
            task.wait(7)
        end
    end)

    local bossHealthGui = Instance.new("ScreenGui")
    bossHealthGui.Name = "BossHealthGUI"
    bossHealthGui.IgnoreGuiInset = true
    bossHealthGui.ResetOnSpawn = false
    bossHealthGui.Parent = player:WaitForChild("PlayerGui")

    local healthBarContainer = Instance.new("Frame")
    healthBarContainer.Name = "HealthBarContainer"
    healthBarContainer.Size = UDim2.new(0.3, 0, 0, 60)
    healthBarContainer.Position = UDim2.new(0.35, 0, 0.02, 0)
    healthBarContainer.BackgroundColor3 = Color3.new(0, 0, 0)
    healthBarContainer.BackgroundTransparency = 0.2
    healthBarContainer.BorderSizePixel = 2
    healthBarContainer.BorderColor3 = Color3.new(1, 1, 1)
    healthBarContainer.Visible = false
    healthBarContainer.Parent = bossHealthGui

    local bossNameLabel = Instance.new("TextLabel")
    bossNameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    bossNameLabel.BackgroundTransparency = 1
    bossNameLabel.TextColor3 = Color3.new(1, 1, 1)
    bossNameLabel.Text = "NPC2 HP: 0/0"
    bossNameLabel.Font = Enum.Font.GothamBold
    bossNameLabel.TextSize = 18
    bossNameLabel.Parent = healthBarContainer

    local healthBarBackground = Instance.new("Frame")
    healthBarBackground.Size = UDim2.new(0.9, 0, 0, 20)
    healthBarBackground.Position = UDim2.new(0.05, 0, 0.6, 0)
    healthBarBackground.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    healthBarBackground.BorderSizePixel = 1
    healthBarBackground.BorderColor3 = Color3.new(1, 1, 1)
    healthBarBackground.Parent = healthBarContainer

    local healthBarFill = Instance.new("Frame")
    healthBarFill.Size = UDim2.new(1, 0, 1, 0)
    healthBarFill.BackgroundColor3 = Color3.new(1, 0, 0)
    healthBarFill.BorderSizePixel = 0
    healthBarFill.Parent = healthBarBackground

    local function updateBossHealthBar(h, mx)
        if healthBarContainer and h and mx then
            local p = 0
            if tonumber(mx) and mx > 0 then
                p = math.clamp(h / mx, 0, 1)
            end
            healthBarFill.Size = UDim2.new(p, 0, 1, 0)
            if p > 0.7 then healthBarFill.BackgroundColor3 = Color3.new(0, 1, 0)
            elseif p > 0.3 then healthBarFill.BackgroundColor3 = Color3.new(1, 1, 0)
            else healthBarFill.BackgroundColor3 = Color3.new(1, 0, 0) end
            bossNameLabel.Text = string.format("NPC2 HP: %d / %d", math.floor(h), math.floor(mx))
        end
    end

    local function setBossHealthBarVisible(v)
        if healthBarContainer then healthBarContainer.Visible = v end
    end

    local BILLBOARD_NAME = "GH2HealthBillboard"

    local function getBoss2()
        local gh2 = Workspace:FindFirstChild("GiangHo2")
        if not gh2 then return nil end
        local npcs = gh2:FindFirstChild("NPCs")
        if not npcs then return nil end
        return npcs:FindFirstChild("NPC2")
    end

    local function getOrCreateSimpleBillboard(head)
        if not head then return nil end
        local billboard = head:FindFirstChild(BILLBOARD_NAME)
        if not billboard then
            billboard = Instance.new("BillboardGui")
            billboard.Name = BILLBOARD_NAME
            billboard.Size = UDim2.new(0, 120, 0, 35)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.AlwaysOnTop = true
            billboard.Adornee = head
            billboard.Parent = head
            local label = Instance.new("TextLabel")
            label.Name = "HealthLabel"
            label.Size = UDim2.new(1, 0, 0.6, 0)
            label.Position = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextStrokeTransparency = 0.2
            label.Font = Enum.Font.GothamBold
            label.TextScaled = true
            label.Text = ""
            label.Parent = billboard
            local bg = Instance.new("Frame")
            bg.Name = "HealthBarBackground"
            bg.Size = UDim2.new(1, 0, 0.3, 0)
            bg.Position = UDim2.new(0, 0, 0.65, 0)
            bg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            bg.BorderSizePixel = 1
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.Parent = billboard
            local fill = Instance.new("Frame")
            fill.Name = "HealthBar"
            fill.Size = UDim2.new(1, 0, 1, 0)
            fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            fill.BorderSizePixel = 0
            fill.Parent = bg
        end
        return billboard
    end

    local function removeBillboard(head)
        if head then
            local bb = head:FindFirstChild(BILLBOARD_NAME)
            if bb then bb:Destroy() end
        end
    end

    local lastHead = nil
    RunService.Heartbeat:Connect(function()
        pcall(function()
            local npc = getBoss2()
            if _G.ShowHealthEnabled and npc and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("Head") then
                local hum = npc.Humanoid
                local head = npc.Head
                setBossHealthBarVisible(true)
                if hum.Health and hum.MaxHealth then
                    updateBossHealthBar(hum.Health, hum.MaxHealth)
                end
                local bb = getOrCreateSimpleBillboard(head)
                lastHead = head
                if hum.Health and hum.Health > 0 then
                    bb.Enabled = true
                    local label = bb:FindFirstChild("HealthLabel")
                    local bg = bb:FindFirstChild("HealthBarBackground")
                    if bg then
                        local fill = bg:FindFirstChild("HealthBar")
                        if label then
                            label.Text = string.format("%d / %d", math.floor(hum.Health), math.floor(hum.MaxHealth))
                        end
                        if fill and hum.Health and hum.MaxHealth then
                            local percent = 0
                            if hum.MaxHealth > 0 then
                                percent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                            end
                            fill.Size = UDim2.new(percent, 0, 1, 0)
                            if percent > 0.7 then fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                            elseif percent > 0.3 then fill.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                            else fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0) end
                        end
                    end
                else
                    bb.Enabled = false
                end
            else
                if not _G.ShowHealthEnabled or not npc then
                    setBossHealthBarVisible(false)
                end
                if lastHead then
                    removeBillboard(lastHead)
                    lastHead = nil
                end
            end
        end)
    end)

    SaveManager:SetLibrary(Library)
    InterfaceManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("Renx_Hub")
    SaveManager:SetFolder("Renx_Hub/saves")
    InterfaceManager:BuildInterfaceSection(Tabs.Main8)
    SaveManager:BuildConfigSection(Tabs.Main8)

    pcall(function() Window:SelectTab(1) end)

    Library:Notify({Title = "Renx hub", Content = "Da tai thanh cong!", Duration = 5})
end

LoadMainScript()