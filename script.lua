loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
if shared.GuiLibrary then
    shared.GuiLibrary["SelfDestruct"]()
end

wait(0.5)

loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
 
wait(0.5)


repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local uis = game:GetService("UserInputService")
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local SMX = function(tab, argstable)
	return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end
function securefunc(func)
	task.spawn(function()
		spawn(function()
			pcall(function()
				loadstring(
					func()
				)()
			end)
		end)
	end)
end
function warnnotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "SWS | SanWare Warning", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(0, 27, 255)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "SanWareClientX Info", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(0, 27, 255)
end
function getstate()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.matchState
end
function iscustommatch()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.customMatch
end
function checklagback()
	local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	return isnetworkowner(hrp)
end

infonotify("SWS | SanWare", "has loaded successfully!", 3)

GuiLibrary.RemoveObject("XrayOptionsButton")
GuiLibrary.RemoveObject("SwimOptionsButton")


local function runcode(func)
	func()
end

runcode(function()
	local NoAnim = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		["Name"] = "NoAnim",
		["Function"] = function(callback)
			if callback then
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
			else
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
			end
		end
	})
end)

runcode(function()
	local MassReportChat = {Enabled = false}
	local AutoChatVal = false
	local MassReport = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		["Name"] = "MassReport",
		["Function"] = function()
			infonotify("MassReport", "Enabled! [Check F9 if you want]", 5)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/SmokeXDev/SmokeXPubblic/main/Resources/MassReport.lua", true))()
		end,
		["HoverText"] = "Can't be reversed"
	})
	MassReportChat = MassReport.CreateToggle({
		["Name"] = "AutoChat",
		["Function"] = function(callback)
			if callback and MassReport.Enabled == true then
				AutoChatVal = true
				while AutoChatVal and task.wait(1) do
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Server getting mass reported!", "All")
						wait(2)
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Reported Everyone Successfully", "All")
				end
			else
				AutoChatVal = false
			end
		end
	})
end)

 runcode(function()
        local Disabler = {Enabled = false}
          local Disabler = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
            Name = "DisablerV2",
            Function = function(callback)
                if callback then 
                    task.spawn(function()
                        repeat
                            task.wait(0.03)
                            local item = getItemNear("scythe")
                            if item and lplr.Character.HandInvItem.Value == item.tool then 
                                if bedwars.ClientHandler:Get("ScytheDash"):CallServer({direction = Vector3.new(math.huge, math.huge, math.huge)}) then 
                                    bedwarsStore.grapple = tick() + 1.5
                                end
                            end
                        until (not Disabler.Enabled)
                    end)
                end
            end
        })
    end)

		
runcode(function()
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local Crosshair = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		["Name"] = "Crosshair",
		["Function"] = function(callback)
			if callback then
				mouse.Icon = "rbxassetid://9943168532"
			else
				infonotify("Crosshair", "Removed!", 5)
				mouse.Icon = ""
			end
		end
	})
end)

runcode(function()
	local NightVal = false
	local Night = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		["Name"] = "Night",
		["Function"] = function(callback)
			if callback then
					NightVal = true
					while NightVal and task.wait(0.3) do
						game:GetService("Lighting").TimeOfDay = "00:00:00"
					end
				else
					infonotify("Night", "Night Removed!", 5)
					NightVal = false
					wait(0.3)
				game:GetService("Lighting").TimeOfDay = "13:00:00"
			end
		end
	})
end)
	
runcode(function()
	local SanKillAura = {Enabled = false}
	local SanKillAura = GuiLibrary.ObjectsThatCanBeSaved.CombatWindow.Api.CreateOptionsButton({
		["Name"] = "SanKillAurua",
		["Function"] = function(callback)
			if callback then
					local player = game:GetService("Players")
        local lplr = player.LocalPlayer
        local cam = workspace.CurrentCamera
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local SwordCont = KnitClient.Controllers.SwordController
        
        local aura = false
        local DistVal = {["Value"] = 100}
        
        local connection
        
        function Aura()
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
                    local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
                        if v.Character.Humanoid.Health > 0 then
                            aura = true
                            SwordCont:swingSwordAtMouse()
                        end
                    end
                end
            end
        end
        
        connection = game:GetService("RunService").Stepped:connect(function()
            Aura()
        end)
							
else
	if connection then
								connection.Disonnect()
			end
		end
	})
end)
	
	
runcode(function()
	local DayVal = false
	local Day = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		["Name"] = "Day",
		["Function"] = function(callback)
			if callback then
				DayVal = true
				while DayVal and task.wait(0.3) do
					game:GetService("Lighting").TimeOfDay = "07:00:00"
				end
			else
				infonotify("Day", "Day Removed!", 5)
				DayVal = false
				wait(0.3)
				game:GetService("Lighting").TimeOfDay = ""
			end
		end
	})
end)

runcode(function()
	local ErrorTimeVal = false
	local ErrorTime = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		["Name"] = "ErrorTime",
		["Function"] = function(callback)
			if callback then
				ErrorTimeVal = true
				while ErrorTimeVal and task.wait(0.1) do
					game.Lighting.ClockTime = 1
						wait(0.1)
					game.Lighting.ClockTime = 13
				end
			else
				infonotify("ErrorTime", "Disabled!", 5)
				ErrorTimeVal = false
			end
		end
	})
end)

runcode(function()
	local GravityV2 = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		["Name"] = "GravityV2",
		["Function"] = function(callback)
		if callback then
				workspace.Gravity = GravitiyVal
			end
		end,
		["Hovertext"] = "Change your gravity"
	})
	GravityV2.CreateSlider({
		["Name"] = "GravityV2",
		["Min"] = 0,
		["Max"] = 192.2,
		["Function"] = function(GravitiyVal)
			if GravityV2.Enabled then
				workspace.Gravity = GravitiyVal
			end
		end,
		["Default"] = 192.2
	})
end)

runcode(function()
	local ChatDisabler = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		["Name"] = "ChatDisabler",
		["Function"] = function(callback)
			if callback then
				local succ, err = pcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false) end)
				if succ then
					infonotify('ChatDisabler', "Chat Disabled!", 5)
				elseif err then
					infonotify('ChatDisabler', "Error has occured while trying to disable the chat", 5)
				end
			else
				local succ, err = pcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true) end)
				if succ then
					infonotify('ChatDisabler', "Chat enabled!", 5)
				elseif err then
					infonotify('ChatDisabler', "Error has occured while trying to enable the chat", 5)
				end
			end
		end
	})
end)

runcode(function()
	local SpamVal = {""}
	local EnabledSpamV2 = false
	local DelaySpamV2 = 10
	local ChatSpammerV2 = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		["Name"] = "ChatSpammerV2",
		["Function"] = function(callback)
			if callback then
				EnabledSpamV2 = true
					while EnabledSpamV2 and task.wait(DelaySpamV2) do
					game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(SpamVal[math.random(1, #SpamVal)])
				end
			else
				EnabledSpamV2 = false
			end
		end
	})
	ChatSpammerV2.CreateTextList({
		["Name"] = "Message",
		["TempText"] = "You're message here.",
		["AddFunction"] = function(msg) table.insert(SpamVal, msg) end,
		["RemoveFunction"] = function(msg) table.remove(SpamVal, msg) end
	})
	ChatSpammerV2.CreateSlider({
		["Name"] = "Delay",
		["Min"] = 0,
		["Max"] = 10,
		["Function"] = function(DelaySpamV2Func) DelaySpamV2 = DelaySpamV2Func end,
		["Default"] = 10
	})
end)

runcode(function()
	local SuperPanic = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		["Name"] = "SuperPanic",
		["Function"] = function(callback)
			if callback then
				game.Players.LocalPlayer:Kick("You has been kicked from SuperPanic.")
					wait()
				game:Shutdown()
			end
		end
	})
end)

runcode(function()
	local FlyBetaVal = false
	local FlyGrav = 3
	local FlySpeed = 23
	local FlyGravDefault = 192
	local FlySpeedDefault = 16
	local FlyBeta = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		["Name"] = "FlyBeta",
		["Function"] = function(FlyFunc, DelayFlyVal)
			if FlyFunc then
				wait(DelayFlyVal)
				FlyBetaVal = true
				while FlyBetaVal do
					workspace.Gravity = FlyGrav
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = FlySpeed
					task.wait()
				end
			else
				FlyBetaVal = false
				workspace.Gravity = FlyGravDefault
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = FlySpeedDefault
			end
		end
	})
	FlyBeta.CreateSlider({
		["Name"] = "Delay",
		["Min"] = 0,
		["Max"] = 10,
		["Function"] = function(DelayFlyVal)
		end,
		["Default"] = 1
	})
end)

runcode(function()
	local AntiVoidV2 = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
		["Name"] = "AntiVoidV2",
		["Function"] = function(callback)
			if callback then
				infonotify("AntiVoidV2", "Loaded!", 5)
					gshared.AntiVoidV2 = true
					local part = Instance.new("Part")
					part.Name = "AntiVoidV2"
					part.Anchored = true
					part.Transparency = 1
					part.Size = Vector3.new(5000,2,5000)
					part.Parent = game:GetService("Workspace")
					part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
					shared.AntiVoidV2 = part
					part.Touched:Connect(function()
					game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
						task.wait(.20)
					game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
				end)
			else
				infonotify("AntiVoidV2", "Deleted Successfully!", 5)
				shared.AntiVoidV2 = false
				workspace.AntiVoidV2:Destroy()
			end
		end
	})
end)

runcode(function()
	local AFKFarm = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
		["Name"] = "AFKFarm",
		["Function"] = function(callback)
			if callback then
				infonotify("AFKFarm", "Enabled!", "5")
				local char = game:GetService("Players").LocalPlayer.Character
				char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,99,0)
				char:FindFirstChild("Head").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
			else
				infonotify("AFKFarm", "Disabled!", "5")
				local char = game:GetService("Players").LocalPlayer.Character
				char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,99,0)
				char:FindFirstChild("Head").Anchored = false
				char:FindFirstChild("UpperTorso").Anchored = false
				char:FindFirstChild("UpperTorso").Anchored = false
			end
		end
	})
end)

runcode(function()
	local BuyingVal = false
	local AutoWool = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		["Name"] = "AutoWool",
		["Function"] = function(callback)
			if callback then
				infonotify("AutoWool", "Enabled", 5)
				BuyingVal = true
				while BuyingVal and task.wait() do
			local args = {
				[1] = {
					["shopItem"] = {
						["currency"] = "iron",
						["itemType"] = "wool_white",
						["amount"] = 16,
						["price"] = 8,
						["category"] = "Blocks"
				}}}
				game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.BedwarsPurchaseItem:InvokeServer(unpack(args))
			end
		else
			BuyingVal = false
				infonotify("AutoWool", "Disabled", 5)
			end
		end
	})
end)

runcode(function()
	local BetterSpeedVal = false
	local BetterSpeed = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		["Name"] = "BetterSpeed",
		["Function"] = function(callback)
			if callback then
				BetterSpeedVal = true
				while BetterSpeedVal and task.wait() do
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
					wait(0.2)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
					wait(0.4)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
					wait(0.2)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
				end
			else
				infonotify("BetterSpeed", "Restoring your speed...")
				BetterSpeedVal = false
				wait(1)
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 6
			end
		end
	})
end)

runcode(function()
	local InvisibleVal = false
	local Invisible = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		["Name"] = "Invisible",
		["Function"] = function(callback)
			if callback then
				InvisibleVal = true
				while InvisibleVal and task.wait() do
					for _,part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if part:IsA("BasePart") then
							part.Transparency = 1
						end
					end
				end
			else
				InvisibleVal = false
				for _,part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.Transparency = 0
					end
				end
			end
		end
	})
end)

runcode(function()
	local Noclip = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		["Name"] = "Noclip",
		["Function"] = function(callback)
			if callback then
				infonotify("Noclip", "BETA Feature", 5)
				game:GetService("RunService").Stepped:connect(function()
					for _,part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
				end)
			else
				infonotify("Noclip", "Disabled!", 5)
				game:GetService("RunService").Stepped:connect(function()
					for _,part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = true
						end
					end
				end)
			end
		end
	})
end)

runcode(function()
	local SkyScytheVal = false
	local SkyScytheExploit = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		["Name"] = "SkyScytheExploit",
		["Function"] = function(callback)
			if callback then
				local success, err = pcall(function()
					game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SkyScytheSpin"):FireServer()
				end)
				if success then
					SkyScytheVal = true
					while SkyScytheVal and task.wait() do
						game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SkyScytheSpin"):FireServer()
					end
				else
					warnnotify("SkyScytheExploit", "Item not found 'sky_scythe'")
				end
			elseif not callback then
				SkyScytheVal = false
			end
		end
	})
end)

runcode(function()
	local roles = {"Junior Moderator", "Moderator", "Anticheat Mod", "Anticheat Manager", "Senior Moderator", "Lead Moderator", "Community Manager", "Engineer", "Engineer (devops)", "Full", "Owner"}
	local groupid = game.CreatorId
	local plrservice = game:GetService("Players")
	local minrank = 55
	local checkrank = true
	local function groupcheck(ranks, title, desc, time)
		for i,v in pairs(plrservice:GetPlayers()) do
			if v ~= plrservice.LocalPlayer then
				for _,c in pairs(roles) do
					if v:GetRoleInGroup(groupid) == roles[c] or v:GetRankInGroup(groupid) >= ranks then
						warnnotify("Smoke", "A Staff is here! Be careful! [BETA] If you think this is an error contact https://dsc.gg/smokex", 20)
						break
					end
				end
			end
		end
	end
	local StaffDetectorV2 = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		["Name"] = "StaffDetectorV2",
		["Function"] = function(callback)
			if callback then
				groupcheck(minrank, "Smoke", "A Staff is here! Be careful! [BETA] If you think this is an error contact https://dsc.gg/smokex", 20)
				plrservice.PlayerAdded:connect(function(plr)
					groupcheck(minrank)
				end)
			end
		end,
		["HoverText"] = "If AC Mod don't use their main account they can't get detected."
	})
	StaffDetectorV2.CreateSlider({
		["Name"] = "Rank check",
		["Min"] = 0,
		["Max"] = 255,
		["Default"] = 55,
		["Function"] = function(RankCheckFunc)
			minrank = RankCheckFunc
		end
	})
	StaffDetectorV2.CreateToggle({
		["Name"] = "Check Rank",
		["Function"] = function(checkRankValue)
			checkrank = checkRankValue
		end,
		["Default"] = checkrank
	})
end)

runcode(function()
	local AnnoyingVal = false
	local AnnoyingSoundAura = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		["Name"] = "AnnoyingSoundAura",
		["Function"] = function(callback)
			if callback then
				local success, err = pcall(function()
					game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(" ")
				end)
				if success then
					AnnoyingVal = true
					game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
					while AnnoyingVal and task.wait() do
						game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(" ")
					end
				else
					warnnotify("AnnoyingSoundAura", "Chat is not found!")
				end
			elseif not callback then
				AnnoyingVal = false
				game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
			end
		end
	})
end)

runcode(function()
	local ScytheDisablerVal = false
	local ScytheDisabler = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		["Name"] = "ScytheDisabler",
		["Function"] = function(callback)
			if callback then
				local success, err = pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("ScytheDash"):InvokeServer({["direction"] = Vector3.new(0, 0, 0)}) end)
				if success then
					infonotify("ScytheDisabler", "Enabled!", 5)
					ScytheDisablerVal = true
					while ScytheDisablerVal and task.wait(.2) do
						game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("ScytheDash"):InvokeServer({["direction"] = Vector3.new(0, 0, 0)})
					end
				elseif err then
					warnnotify("ScytheDisabler", "Code Error / Patched", 5)
				end
			else
				infonotify("ScytheDisabler", "Disabled!", 5)
				ScytheDisablerVal = false
			end
		end,
		["HoverText"] = "Needed an Scythe and you can Inf Fly with the normal Fly, remember to equip the Scythe"
	})
end)
