-----------------------------------[ Erebus | Bizarre Lineage ]-----------------------------------

repeat task.wait() 
	local Players = cloneref(game:GetService("Players"))
	local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
	local Player = Players.LocalPlayer
	local PlayerGui = Player:FindFirstChild("PlayerGui")

	if PlayerGui then
		if PlayerGui:FindFirstChild("Main Menu") then 
			PlayerGui:FindFirstChild("Main Menu"):Destroy() 
		end
		if PlayerGui:FindFirstChild("Logo_Loader") then 
			PlayerGui:FindFirstChild("Logo_Loader"):Destroy() 
		end
	end

	local Requests = ReplicatedStorage:FindFirstChild("requests")
	if Requests and Requests:FindFirstChild("character") then
		local Requests_Character = Requests:FindFirstChild("character")
		if Requests_Character and Requests_Character:FindFirstChild("spawn") then
			local SpawnRemote = Requests_Character:FindFirstChild("spawn")
			SpawnRemote:FireServer()
		end
	end
until game:IsLoaded() and game:GetService("Players").LocalPlayer.Character

-----------------------------------[ Erebus | Global Functions ]-----------------------------------

function GetService(ServiceName)
	return (cloneref ~= nil and cloneref(game:GetService(ServiceName))) or game:GetService(ServiceName)
end

function GetChild(Parent, Child, Type)
	if Type == "First" then
		return Parent:FindFirstChild(Child)
	elseif Type == "Class" then
		return Parent:FindFirstChildWhichIsA(Child)
	else
		return Parent:WaitForChild(Child) or Parent:FindFirstChild(Child)
	end
end

function GetDescendant(Parent, Descendant, Class)
	if Class then
		return Parent:FindFirstChildWhichIsA(Descendant, true)
	else
		return Parent:FindFirstChild(Descendant, true)
	end
end

function GetDistance(Destination, PrimaryPart)
	if typeof(Destination) == "Instance" then
		Destination = Destination.CFrame
		Destination = Vector3.new(Destination.Position.X, PrimaryPart.Position.Y, Destination.Position.Z)
	elseif typeof(Destination) == "CFrame" then
		Destination = Vector3.new(Destination.Position.X, PrimaryPart.Position.Y, Destination.Position.Z)
	end
	local Magnitude = (Destination - PrimaryPart.Position).Magnitude
	return Magnitude
end

function Loadstring(Link)
	return loadstring(game:HttpGet(Link))()
end

function RemoveSpace(String)
	return String:gsub(" ", "")
end

function AddSpace(String)
	return String:gsub("(%l)(%u)", "%1 %2")
end

function AddComma(Number)
	local Formatted = tostring(Number)
	local IntegerPart, DecimalPart = Formatted:match("^(%-?%d+)(%.?%d*)$")

	IntegerPart = IntegerPart:reverse():gsub("(%d%d%d)", "%1,"):reverse()
	IntegerPart = IntegerPart:gsub("^,", ""):gsub(",$", "")

	return IntegerPart..(DecimalPart or "")
end

function Transfer(Instance, NewParent)
	Instance.Parent = NewParent
end

function CheckDuplicate(Table1, Table2)
	for i, table1 in pairs(Table1) do
		if table.find(Table2, table1.Name) then
			return true
		end
	end
end

function GetDictionaryIndex(Dictionary)
	local NewArray = {}

	for name, value in pairs(Dictionary) do
		if not table.find(NewArray, name) then
			table.insert(NewArray, name)
		end
	end

	table.sort(NewArray)
	return NewArray
end

function GetArray(Array)
	local NewArray = {}

	for index, value in pairs(Array) do
		if not table.find(NewArray, value) then
			table.insert(NewArray, value)
		end
	end

	table.sort(NewArray)
	return NewArray
end

function CheckTable(Table, Value)
	for _, v in ipairs(Table) do
		if v == Value then
			return true
		end
	end
	return false
end

-----------------------------------[ Erebus | Library ]-----------------------------------

local Starlight = Loadstring("https://raw.nebulasoftworks.xyz/starlight")
local NebulaIcons = Loadstring("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader")

Starlight.FileSystem.Folder = "Erebus"
Starlight.FileSystem.FileExtension = ".erebus"

getgenv().InterfaceName = "Erebus"

local ErebusWindow = Starlight:CreateWindow({
	Name = "Erebus",
	Subtitle = "v0.1.0 | Prime",
	Icon = NebulaIcons:GetIcon("eclipse", "Lucide"),
	NotifyOnCallbackError = true,

	LoadingEnabled = false,
	LoadingSettings = {
		Title = "Erebus",
		Subtitle = "Welcome.",
	},

	FileSettings = {
		ConfigFolder = "BizarreLineage"
	},
})

-----------------------------------[ Erebus | Library | Sections ]-----------------------------------

MainSection = ErebusWindow:CreateTabSection("Main")
MiscellaneousSection = ErebusWindow:CreateTabSection("Miscellaneous")

-----------------------------------[ Erebus | Library | Tabs ]-----------------------------------

MainTab = MainSection:CreateTab({
	Name = "Main",
	Icon = NebulaIcons:GetIcon("circle-slash-2", "Lucide"),
	Columns = 2,
}, "MainTab")

ShopTab = MainSection:CreateTab({
	Name = "Shop",
	Icon = NebulaIcons:GetIcon("circle-slash-2", "Lucide"),
	Columns = 2,
}, "ShopTab")

TeleportTab = MainSection:CreateTab({
	Name = "Teleport",
	Icon = NebulaIcons:GetIcon("circle-slash-2", "Lucide"),
	Columns = 2,
}, "TeleportTab")

DebugTab = MiscellaneousSection:CreateTab({
	Name = "Debug",
	Icon = NebulaIcons:GetIcon("wrench", "Lucide"),
	Columns = 2,
}, "DebugTab")

ConfigurationTab = MiscellaneousSection:CreateTab({
	Name = "Configuration",
	Icon = NebulaIcons:GetIcon("settings", "Lucide"),
	Columns = 2,
}, "ConfigurationTab")

-----------------------------------[ Erebus | System Variables ]-----------------------------------

local CollectionService = GetService("CollectionService")
local ContentProvider = GetService("ContentProvider")
local ContextActionService = GetService("ContextActionService")
local CoreGui = GetService("CoreGui")
local GuiService = GetService("GuiService")
local HttpService = GetService("HttpService")
local InputManager = GetService("VirtualInputManager")
local Lighting = GetService("Lighting")
local LocalizationService = GetService("LocalizationService")
local MarketplaceService = GetService("MarketplaceService")
local Players = GetService("Players")
local ReplicatedFirst = GetService("ReplicatedFirst")
local ReplicatedStorage = GetService("ReplicatedStorage")
local RunService = GetService("RunService")
local StarterGui = GetService("StarterGui")
local StatsService = GetService("Stats")
local Teams = GetService("Teams")
local TeleportService = GetService("TeleportService")
local TextService = GetService("TextService")
local TweenService = GetService("TweenService")
local UserInputService = GetService("UserInputService")
local VirtualInputManager = GetService("VirtualInputManager")
local VirtualUser = GetService("VirtualUser")

local Player = Players.LocalPlayer
local PlayerGui = GetChild(Player, "PlayerGui")
local Camera = workspace.CurrentCamera
local Mouse = Player:GetMouse()

repeat task.wait() until Player.Character

local Character = Player.Character
local Backpack = GetChild(Player, "Backpack")
local HumanoidRootPart = GetChild(Character, "HumanoidRootPart")
local Humanoid = GetChild(Character, "Humanoid")
local ClientCharacterController = GetChild(Character, "client_character_controller")
local M1 = GetChild(ClientCharacterController, "M1")
local M2 = GetChild(ClientCharacterController, "M2")
local Skill = GetChild(ClientCharacterController, "Skill")
local Awaken = GetChild(ClientCharacterController, "Awaken")
local SummonStand = GetChild(ClientCharacterController, "SummonStand")

Player.CharacterAdded:Connect(function()
	Character = Player.Character
	Backpack = GetChild(Player, "Backpack")
	HumanoidRootPart = GetChild(Character, "HumanoidRootPart")
	Humanoid = GetChild(Character, "Humanoid")
	ClientCharacterController = GetChild(Character, "client_character_controller")
	M1 = GetChild(ClientCharacterController, "M1")
	M2 = GetChild(ClientCharacterController, "M2")
	Skill = GetChild(ClientCharacterController, "Skill")
	Awaken = GetChild(ClientCharacterController, "Awaken")
	SummonStand = GetChild(ClientCharacterController, "SummonStand")
end)

-----------------------------------[ Erebus | Game Variables ]-----------------------------------

local MainID = 14890802310
local RaidID = 74747090658891

local PlayerData = GetChild(Player, "PlayerData")
local SlotData = GetChild(PlayerData, "SlotData")
local Inventory = GetChild(SlotData, "Inventory")

local Requests = GetChild(ReplicatedStorage, "requests")
local Requests_Character = GetChild(Requests, "character")
local Dialogue = GetChild(Requests_Character, "dialogue")
local IncreaseStat = GetChild(Requests_Character, "increase_stat")
local UseItem = GetChild(Requests_Character, "use_item")

local Requests_Miscellaneous = GetChild(Requests, "miscellaneous")
local GetData = GetChild(Requests_Miscellaneous, "get_data")

local Requests_General = GetChild(Requests, "general")
local SellItem = GetChild(Requests_General, "SellItem")

local Live = GetChild(workspace, "Live")

local Npcs = GetChild(workspace, "Npcs")

local Map = GetChild(workspace, "Map")
local Meditation = GetChild(Map, "Meditation")

if game.PlaceId == MainID then
	BusStops = GetChild(Map, "Bus Stops")
end

if game.PlaceId == RaidID then
	RetryRaid = GetChild(Requests_Character, "retryraid")
end

-----------------------------------[ Erebus | Tables ]-----------------------------------

local LocationList = {
	["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
}

local NPCList = {
	["Gym Owner"] = CFrame.new(1104, 885, 147),
	["Dedequan"] = CFrame.new(),
	["Jotaro Kujo"] = CFrame.new(),
	["Koichi Hirose"] = CFrame.new(),
	["Shozuki"] = CFrame.new(),
	["Zuleima"] = CFrame.new(),
	["Gardner Gwen"] = CFrame.new(),
	["Kaiser"] = CFrame.new(),
	["Yoshikage Kira"] = CFrame.new(1035, 875, -652),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
}

local BusStopList = {
	["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
	--["Placeholder"] = CFrame.new(),
}

local RaidsList = {
	["Avdol"] = { 
		NPC = "Muhammad Avdol",
		Position = CFrame.new(349, 877, 1012),
	},
	["Dio"] = { 
		NPC = "???",
		Position = CFrame.new(349, 877, 1012),
	},
	["Kira"] = { 
		NPC = "Yoshikage Kira",
		Position = CFrame.new(1036, 875, -651),
	},
	["Jotaro"] = { 
		NPC = "Chumbo",
		Position = CFrame.new(1072, 885, 213),
	},
}

local PipsList = {
	["Health"] = "Health",
	["Defense"] = "Defense",
	["Power"] = "Power",
	["Penetration"] = "Penetration",
	["PvE Damage"] = "PvEDamage",
	["Power Regeneration"] = "PowerRegeneration",
	["Health Regeneration"] = "HealthRegeneration",
}

local ChestsList = {
	"Common Chest",
	"Rare Chest",
	"Legendary Chest",
}

local SkillsList = {
	"Z",
	"X",
	"C",
	"V",
	"E",
	"R",
}

local AttackMethodList = {
	"Behind",
	"Above",
	"Below",
}

-----------------------------------[ Erebus | Local Functions ]-----------------------------------

Player.Idled:connect(function()
	VirtualUser:Button2Down(Vector2.new(0,0),Camera.CFrame)
	task.wait(1)
	VirtualUser:Button2Up(Vector2.new(0,0),Camera.CFrame)
end)

local function Notify(Text)
	Starlight:Notification({
		Title = "[Erebus | Notification]",
		Icon = NebulaIcons:GetIcon("sparkles", "Lucide"),
		Content = Text,
	}, "Notify")
end

local function Alert(Text)
	warn("[Erebus | Alert] "..Text)
end

local function FireProximityPrompt(ProximityPrompt, Amount, Skip)
	assert(ProximityPrompt, "Argument #1 Missing or nil")
	assert(typeof(ProximityPrompt) == "Instance" and ProximityPrompt:IsA("ProximityPrompt"), "Attempted to fire a Value that is not a ProximityPrompt")

	local HoldDuration = ProximityPrompt.HoldDuration
	if Skip then
		ProximityPrompt.HoldDuration = 0
	end

	for i = 1, Amount or 1 do
		ProximityPrompt:InputHoldBegin()
		if Skip then
			local Start = time()
			repeat
				RunService.Heartbeat:Wait(0.1)
			until time() - Start > HoldDuration
		end
		ProximityPrompt:InputHoldEnd()
	end
	ProximityPrompt.HoldDuration = HoldDuration
end

local function GetInventory()
	return HttpService:JSONDecode(Inventory.Value)
end

local function CheckIgnoredPips(ItemPips, IgnoredPips)
	if not ItemPips then return false end

	for _, pip in ipairs(IgnoredPips) do
		local Pip = PipsList[pip]

		if Pip and CheckTable(ItemPips, Pip) then
			return true
		end
	end

	return false
end

local function GetVelocity()
	if not HumanoidRootPart:FindFirstChild("BodyVelocity") then
		Antifall = Instance.new("BodyVelocity", HumanoidRootPart)
		Antifall.MaxForce = Vector3.new(9e9,9e9,9e9)
		Antifall.Velocity = Vector3.new(0,0,0)

		return Antifall
	else
		return HumanoidRootPart:FindFirstChild("BodyVelocity")
	end
end

local function Tween(Endpoint)
	if typeof(Endpoint) == "Instance" then
		Endpoint = Endpoint.CFrame
	end
	local TweenFunc = {}
	local Distance = GetDistance(Endpoint, HumanoidRootPart)
	local TweenInfo = TweenService:Create(HumanoidRootPart, TweenInfo.new(Distance/120, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
	TweenInfo:Play()
	function TweenFunc:Cancel()
		TweenInfo:Cancel()
		return false
	end
	return TweenFunc
end

local function FindMob()
	local Largest = math.huge
	local Closest = nil
	for i, v in pairs(Live:GetChildren()) do
		if v:IsA("Model") and v:GetAttribute("DisplayName") and v:GetAttribute("DisplayName") ~= "Hostage" and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v.PrimaryPart then
			local Magnitude = (HumanoidRootPart.Position - v:GetPivot().Position)
				.Magnitude
			if Magnitude < Largest then
				Closest = v
				Largest = Magnitude
			end
		end
	end
	return Closest
end

local function FindRaidBoss()
	local Largest = math.huge
	local Closest = nil
	for i, v in pairs(Live:GetChildren()) do
		if v:IsA("Model") and (string.find(string.lower(v.Name), "jotaro") or string.find(string.lower(v.Name), "dio") or string.find(string.lower(v.Name), "kira")) and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v.PrimaryPart then
			local Magnitude = (HumanoidRootPart.Position - v:GetPivot().Position)
				.Magnitude
			if Magnitude < Largest then
				Closest = v
				Largest = Magnitude
			end
		end
	end
	return Closest
end

local function FindTheSelf()
	local Largest = math.huge
	local Closest = nil
	for i, v in pairs(Live:GetChildren()) do
		if v:IsA("Model") and v:GetAttribute("DisplayName") and v:GetAttribute("DisplayName") == Player.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v.PrimaryPart then
			local Magnitude = (HumanoidRootPart.Position - v:GetPivot().Position)
				.Magnitude
			if Magnitude < Largest then
				Closest = v
				Largest = Magnitude
			end
		end
	end
	return Closest
end

-----------------------------------[ Erebus | Farm ]-----------------------------------

FarmGroupbox = MainTab:CreateGroupbox({
	Name = "Farm",
	Column = 1,
}, "FarmGroupbox")

SelectedRaid = ""
Farm_Raids = FarmGroupbox:CreateLabel({
	Name = "Raids"
}, "Farm_Raids")
Farm_SelectedRaid = Farm_Raids:AddDropdown({
	Options = GetDictionaryIndex(RaidsList) or {},
	CurrentOptions = "",
	MultipleOptions = false,
	Callback = function(Options)
		SelectedRaid = Options[1] or ""
	end,
}, "Farm_SelectedRaid")

Farm_AutoRaid = FarmGroupbox:CreateToggle({
	Name = "Auto Raid",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoRaid = Value
		--/[task.spawn(function()
		while AutoRaid do task.wait()
			if game.PlaceId ~= RaidID then
				if SelectedRaid and SelectedRaid ~= "" then
					if GetDistance(RaidsList[SelectedRaid].Position, HumanoidRootPart) > 10 then
						HumanoidRootPart.CFrame = RaidsList[SelectedRaid].Position
					elseif GetChild(Npcs, RaidsList[SelectedRaid].NPC, "First") and GetChild(GetChild(Npcs, RaidsList[SelectedRaid].NPC, "First"), "HumanoidRootPart", "First") then
						Dialogue:FireServer(GetChild(Npcs, RaidsList[SelectedRaid].NPC, "First"), "Raid.")

						repeat task.wait(0.5)
							HumanoidRootPart.CFrame = RaidsList[SelectedRaid].Position
						until not AutoRaid or game.PlaceId == RaidID
					end
				end
			else
				if not HumanoidRootPart:FindFirstChild("LinearVelocity") then
					RaidFall = Instance.new("LinearVelocity",HumanoidRootPart)
					RaidFall.ForceLimitsEnabled = false
					RaidFall.Attachment0 = HumanoidRootPart:WaitForChild("RootAttachment")
				else
					local FoundMob = FindMob()
					local FoundRaidBoss = FindRaidBoss()

					if FoundRaidBoss then
						local VoidStart = nil
						local LastSkill = tick()
						local Voided = false
						local Voiding = false

						repeat task.wait()
							if FoundRaidBoss and FoundRaidBoss:FindFirstChild("Humanoid") then
								local BossHumanoid = FoundRaidBoss.Humanoid

								if not VoidStart then
									local IFrame = FoundRaidBoss:FindFirstChild("IFrame")
									if IFrame and IFrame:IsA("Folder") then
										VoidStart = tick()
									end
								end

								-- Fire the skill at 15.5 seconds (simulates the 0.5s wait)
								if VoidStart and not Voided and tick() - VoidStart > 10.5 then
									Voided = true
									Skill:FireServer("X", true)
								end

								-- Fire the skill at 15.5 seconds (simulates the 0.5s wait)
								if VoidStart and not Voided and tick() - VoidStart > 12.5 then
									Voided = true
									Skill:FireServer("X", true)
								end

								-- Trigger actual void drop at 17.5 seconds (simulates the 2s wait)
								if VoidStart and tick() - VoidStart > 13.5 then
									Voiding = true
								end

								-- CFrame Positioning Logic
								if Voiding then
									-- Phase 3: Dropping into the void
									NearestMob = false
									HumanoidRootPart.CFrame = CFrame.new(0, -477, 0)
								elseif VoidStart and tick() - VoidStart > 10 then
									-- Phase 2: The 2.5-second window where you TP behind the boss to cast
									NearestMob = false
									HumanoidRootPart.CFrame = FoundRaidBoss:GetPivot() * CFrame.new(0, 0, 7)
								else
									-- Phase 1: Normal combat positioning
									if BossHumanoid.Health > 0 or GetDistance(FoundRaidBoss:GetPivot() * AttackMode, HumanoidRootPart) < 20 then
										NearestMob = true
									else
										NearestMob = false
									end

									HumanoidRootPart.CFrame = FoundRaidBoss:GetPivot() * AttackMode 
								end
							end
						until not AutoRaid or not FoundRaidBoss or not FoundRaidBoss.Parent or not FoundRaidBoss:IsDescendantOf(workspace) or FoundRaidBoss.Humanoid.Health <= 0 or Humanoid.Health <= 0

						Voiding = false
						if RaidFall then RaidFall:Destroy() end

					elseif FoundMob then
						repeat task.wait()
							if FoundMob then
								if FoundMob.Humanoid.Health > 0 or GetDistance(FoundMob:GetPivot() * AttackMode, HumanoidRootPart) < 20 then
									NearestMob = true
								elseif not FoundMob or FoundMob.Humanoid.Health <= 0 or GetDistance(FoundMob:GetPivot() * AttackMode, HumanoidRootPart) > 20 then
									NearestMob = false
								end

								HumanoidRootPart.CFrame = FoundMob:GetPivot() * AttackMode
							end
						until not AutoRaid or not FoundMob or not FoundMob.Parent or not FoundMob:IsDescendantOf(workspace) or FoundMob.Humanoid.Health <= 0 or Humanoid.Health <= 0

						if RaidFall then RaidFall:Destroy() end
					end
				end
			end

			if AutoRaid == false then
				if RaidFall then
					RaidFall:Destroy()
				end
			end
		end
		--/[end)
	end,
}, "Farm_AutoRaid")

Farm_AutoRetryRaid = FarmGroupbox:CreateToggle({
	Name = "Auto Retry Raid",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoRetryRaid = Value
		--/[task.spawn(function()
		while AutoRetryRaid do task.wait()
			if GetChild(PlayerGui, "raidcomplete", "First") then
				repeat task.wait(5)
					RetryRaid:FireServer()
				until not AutoRetryRaid
			end 
		end
		--/[end)
	end,
}, "Farm_AutoRetryRaid")

-----------------------------------[ Erebus | Stand ]-----------------------------------

StandGroupbox = MainTab:CreateGroupbox({
	Name = "Stand",
	Column = 2,
}, "StandGroupbox")

Stand_AutoSummonStand = StandGroupbox:CreateToggle({
	Name = "Auto Summon Stand",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoSummonStand = Value
		--/[task.spawn(function()
		while AutoSummonStand do task.wait()
			if not Character:GetAttribute("SummonedStand") then
				SummonStand:FireServer()
			end
		end
		--/[end)
	end,
}, "Stand_AutoSummonStand")

Stand_AutoMeditation = StandGroupbox:CreateToggle({
	Name = "Auto Meditation",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoMeditation = Value
		--/[task.spawn(function()
		while AutoMeditation do task.wait()
			if not GetChild(Map, "MeditationArena", "First") then
				if #Meditation:GetChildren() == 0 then
					HumanoidRootPart.CFrame = CFrame.new(1087, 885, 89)
					task.wait(0.5)
				else
					local YogaMat = Meditation:GetChildren()[1]

					if GetDistance(YogaMat.CFrame, HumanoidRootPart) > 3 then
						HumanoidRootPart.CFrame = YogaMat.CFrame
					end

					repeat task.wait(0.1)
						FireProximityPrompt(GetChild(YogaMat, "ProximityPrompt"), 1, true)
					until GetChild(Map, "MeditationArena", "First") or not AutoMeditation
				end
			elseif GetChild(Map, "MeditationArena", "First") and not FindTheSelf() then
				if GetChild(Npcs, "The Self", "First") then
					local TheSelfNPC = GetChild(Npcs, "The Self", "First")

					HumanoidRootPart.CFrame = TheSelfNPC:GetPivot()

					repeat task.wait(0.5)
						Dialogue:FireServer(TheSelfNPC, "Yes.")
					until not GetChild(Npcs, "The Self", "First") or not AutoMeditation
				end
			elseif GetChild(Map, "MeditationArena", "First") and FindTheSelf() then
				if not HumanoidRootPart:FindFirstChild("LinearVelocity") then
					MeditationFall = Instance.new("LinearVelocity",HumanoidRootPart)
					MeditationFall.ForceLimitsEnabled = false
					MeditationFall.Attachment0 = HumanoidRootPart:WaitForChild("RootAttachment")
				else
					local FoundTheSelfMob = FindTheSelf()

					repeat task.wait()
						if FoundTheSelfMob then
							if FoundTheSelfMob.Humanoid.Health > 0 or GetDistance(FoundTheSelfMob:GetPivot() * AttackMode, HumanoidRootPart) < 20 then
								NearestMob = true
							elseif not FoundTheSelfMob or FoundTheSelfMob.Humanoid.Health <= 0 or GetDistance(FoundTheSelfMob:GetPivot() * AttackMode, HumanoidRootPart) > 20 then
								NearestMob = false
							end

							HumanoidRootPart.CFrame = FoundTheSelfMob:GetPivot() * AttackMode
						end
					until not AutoMeditation or not FoundTheSelfMob or not FoundTheSelfMob.Parent or not FoundTheSelfMob:IsDescendantOf(workspace) or FoundTheSelfMob.Humanoid.Health <= 0 or Humanoid.Health <= 0
					MeditationFall:Destroy()
				end
			end
			if AutoMeditation == false then
				if MeditationFall then
					MeditationFall:Destroy()
				end
			end
		end
		--/[end)
	end,
}, "Stand_AutoMeditation")

-----------------------------------[ Erebus | Settings ]-----------------------------------

SettingsGroupbox = MainTab:CreateGroupbox({
	Name = "Settings",
	Column = 1,
}, "SettingsGroupbox")

Settings_AutoM1 = SettingsGroupbox:CreateToggle({
	Name = "Auto M1",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoM1 = Value
		--/[task.spawn(function()
		while AutoM1 do task.wait()
			if NearestMob then
				M1:FireServer(true, true)
			end 
		end
		--/[end)
	end,
}, "Settings_AutoM1")

Settings_VoidRaid = SettingsGroupbox:CreateToggle({
	Name = "Void Raid",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		VoidRaid = Value
	end,
}, "Settings_VoidRaid")

Settings_AutoM2 = SettingsGroupbox:CreateToggle({
	Name = "Auto M2",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoM2 = Value
		--/[task.spawn(function()
		while AutoM2 do task.wait()
			if NearestMob then
				M2:FireServer(true, true)
			end 
		end
		--/[end)
	end,
}, "Settings_AutoM2")

SelectedSkills = {}
Settings_Skills = SettingsGroupbox:CreateLabel({
	Name = "Skills"
}, "Settings_Skills")
Settings_SelectedSkills = Settings_Skills:AddDropdown({
	Options = SkillsList or {},
	CurrentOptions = {},
	MultipleOptions = true,
	Callback = function(Options)
		SelectedSkills = Options or {}
	end,
}, "Settings_SelectedSkills")

Settings_AutoSkills = SettingsGroupbox:CreateToggle({
	Name = "Auto Skills",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoSkills = Value
		--/[task.spawn(function()
		while AutoSkills do task.wait()
			if NearestMob and not VoidRaid then
				for _, v in ipairs(SelectedSkills) do
					Skill:FireServer(v, true)
					task.wait(0.5)
				end
			end 
		end
		--/[end)
	end,
}, "Settings_AutoSkills")

Settings_AttackDistance = SettingsGroupbox:CreateSlider({
	Name = "Attack Distance",
	Icon = NebulaIcons:GetIcon('chart-no-axes-column-increasing', 'Lucide'),
	Range = {1,15},
	Increment = 1,
	Callback = function(Value)
		AttackDistance = Value
	end,
}, "Settings_AttackDistance")

AttackMethod = ""
Settings_AttackMethods = SettingsGroupbox:CreateLabel({
	Name = "Attack Methods"
}, "Settings_AttackMethods")
Settings_AttackMethod = Settings_AttackMethods:AddDropdown({
	Options = GetArray(AttackMethodList) or {},
	CurrentOptions = "",
	MultipleOptions = false,
	Callback = function(Options)
		AttackMethod = Options[1] or ""
	end,
}, "Settings_AttackMethod")

task.spawn(pcall, function()
	while task.wait() do
		if AttackMethod == "Above" then
			AttackMode = CFrame.new(0,AttackDistance,0) * CFrame.Angles(math.rad(-90),0,0)
		elseif AttackMethod == "Below" then
			AttackMode = CFrame.new(0,-AttackDistance,0) * CFrame.Angles(math.rad(90),0,0)
		elseif AttackMethod == "Behind" then
			AttackMode = CFrame.new(0,0,AttackDistance)
		end
	end
end)

-----------------------------------[ Erebus | Shop ]-----------------------------------

ShopGroupbox = ShopTab:CreateGroupbox({
	Name = "Shop",
	Column = 1,
}, "ShopGroupbox")

SelectedSellAccessories = {}
Shop_SellAccessories = ShopGroupbox:CreateLabel({
	Name = "Sell Accessories"
}, "Shop_SellAccessories")
Shop_SelectedSellAccessories = Shop_SellAccessories:AddDropdown({
	Options = GetDictionaryIndex(GetData:InvokeServer("accessory")) or {},
	CurrentOptions = {},
	MultipleOptions = true,
	Callback = function(Options)
		SelectedSellAccessories = Options or {}
	end,
}, "Shop_SelectedSellAccessories")

SelectedIgnoreWithPips = {}
Shop_IgnoreWithPips = ShopGroupbox:CreateLabel({
	Name = "Ignore with Pips"
}, "Shop_IgnoreWithPips")
Shop_SelectedIgnoreWithPips = Shop_IgnoreWithPips:AddDropdown({
	Options = GetDictionaryIndex(PipsList) or {},
	CurrentOptions = {},
	MultipleOptions = true,
	Callback = function(Options)
		SelectedIgnoreWithPips = Options or {}
	end,
}, "Shop_SelectedIgnoreWithPips")

Shop_AutoSellAccessories = ShopGroupbox:CreateToggle({
	Name = "Auto Sell Accessories",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoSellAccessories = Value
		--/[task.spawn(function()
		while AutoSellAccessories do task.wait()
			local LiveInventory = GetInventory()

			for _, item in ipairs(LiveInventory) do
				if item.ID and CheckTable(SelectedSellAccessories, item.Name) then
					if not CheckIgnoredPips(item.Pips, SelectedIgnoreWithPips) then
						local args = {
							{
								{
									ID = item.ID,
									Pips = item.Pips,
									Name = item.Name,
									duplicates = 1
								}
							}
						}
						SellItem:FireServer(unpack(args))
						task.wait(0.2) 
					end
				end
			end
		end
		--/[end)
	end,
}, "Shop_AutoSellAccessories")

ShopGroupbox:CreateDivider()

-----------------------------------[ Erebus | Items ]-----------------------------------

ItemGroupbox = ShopTab:CreateGroupbox({
	Name = "Item",
	Column = 2,
}, "ItemGroupbox")

SelectedChests = {}
Item_Chests = ItemGroupbox:CreateLabel({
	Name = "Chests"
}, "Item_Chests")
Item_SelectedChests = Item_Chests:AddDropdown({
	Options = GetArray(ChestsList) or {},
	CurrentOptions = {},
	MultipleOptions = true,
	Callback = function(Options)
		SelectedChests = Options or {}
	end,
}, "Item_SelectedChests")

Item_AutoOpenChests = ItemGroupbox:CreateToggle({
	Name = "Auto Open Chests",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		AutoOpenChests = Value
		--/[task.spawn(function()
		while AutoOpenChests do task.wait()
			for _, chest in ipairs(SelectedChests) do
				local args = {
					chest,
					{
						UseAll = true
					}
				}
				UseItem:FireServer(unpack(args))
				task.wait(0.5)
			end
		end
		--/[end)
	end,
}, "Item_AutoOpenChests")

-----------------------------------[ Erebus | Teleport NPCs ]-----------------------------------

TeleportNPCsGroupbox = TeleportTab:CreateGroupbox({
	Name = "NPCs",
	Column = 1,
}, "TeleportNPCsGroupbox")

SelectedNPC = ""
Teleport_NPCs = TeleportNPCsGroupbox:CreateLabel({
	Name = "NPCs"
}, "Teleport_NPCs")
Teleport_SelectedNPC = Teleport_NPCs:AddDropdown({
	Options = GetDictionaryIndex(NPCList) or {},
	CurrentOptions = "",
	MultipleOptions = false,
	Callback = function(Options)
		SelectedNPC = Options[1] or ""
	end,
}, "Teleport_SelectedNPC")

Teleport_TeleportNPC = TeleportNPCsGroupbox:CreateButton({
	Name = "Teleport | NPC",
	Callback = function()
		HumanoidRootPart.CFrame = NPCList[SelectedNPC]
	end,
}, "Teleport_TeleportNPC")

-----------------------------------[ Erebus | Teleport Locations ]-----------------------------------

TeleportLocationsGroupbox = TeleportTab:CreateGroupbox({
	Name = "Locations",
	Column = 2,
}, "TeleportLocationsGroupbox")

SelectedLocation = ""
Teleport_Locations = TeleportLocationsGroupbox:CreateLabel({
	Name = "Locations"
}, "Teleport_Locations")
Teleport_SelectedLocation = Teleport_Locations:AddDropdown({
	Options = GetDictionaryIndex(LocationList) or {},
	CurrentOptions = "",
	MultipleOptions = false,
	Callback = function(Options)
		SelectedLocation = Options[1] or ""
	end,
}, "Teleport_SelectedLocation")

Teleport_TeleportLocation = TeleportLocationsGroupbox:CreateButton({
	Name = "Teleport | Location",
	Callback = function()
		HumanoidRootPart.CFrame = LocationList[SelectedLocation]
	end,
}, "Teleport_TeleportLocation")

-----------------------------------[ Erebus | Teleport Items ]-----------------------------------

-----------------------------------[ Erebus | Teleport Puzzles ]-----------------------------------

-----------------------------------[ Erebus | Debug ]-----------------------------------

DebugGroupbox = DebugTab:CreateGroupbox({
	Name = "Debug",
	Column = 1,
}, "DebugGroupbox")

Debug_InfiniteYield = DebugGroupbox:CreateButton({
	Name = "Infinite Yield",
	Callback = function()
		Loadstring("https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source")
	end,
}, "Debug_InfiniteYield")

Debug_Cobalt = DebugGroupbox:CreateButton({
	Name = "Cobalt",
	Callback = function()
		Loadstring("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau")
	end,
}, "Debug_Cobalt")

Debug_Reload = DebugGroupbox:CreateButton({
	Name = "re",
	Callback = function()
		Loadstring("https://chimerical-bombolone-b8ff43.netlify.app")
	end,
}, "Debug_Reload")

Debug_CopyCurrentPosition = DebugGroupbox:CreateButton({
	Name = "Copy Current Position",
	Callback = function()
		setclipboard(tostring(math.ceil(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X))..", "..tostring(math.ceil(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y))..", "..tostring(math.ceil(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z)))
	end,
}, "Debug_CopyCurrentPosition")

-----------------------------------[ Erebus | Configuration ]-----------------------------------

ConfigurationTab:BuildConfigGroupbox(1)
Starlight:LoadAutoloadConfig()
