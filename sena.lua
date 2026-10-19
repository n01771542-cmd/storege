local function geniter(f, s, c)
	if type(f) ~= "function" then
		local mt = getmetatable(f)

		if type(mt) == "table" and mt.__iter then
			f, s, c = mt.__iter(f)
		elseif type(f) == "table" then
			f, s, c = next, f, nil
		end
	end

	return function()
		local r = table.pack(f(s, c))

		if r[1] == nil then
			return false
		end

		c = r[1]

		return true, table.unpack(r, 1, r.n)
	end
end

local CFrame_ = CFrame
local cFrameNew = CFrame_ and CFrame_.new
local lookAt = CFrame_ and CFrame_.lookAt
local Angles = CFrame_ and CFrame_.Angles
local fromMatrix = CFrame_ and CFrame_.fromMatrix
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

game:GetService("TweenService")

local TeleportService = game:GetService("TeleportService")
local v14, genv, v16, __SenaV4TweenRuntimeGeneration, t1, v19, v20, v21, v22, v23
local v24, v25, v26, v27, v28, v29, v30, v31, v32, v33

do
	local Workspace = game:GetService("Workspace")

	v14 = function()
		return Workspace:FindFirstChild("World") or Workspace:FindFirstChild("__OBJECTS")
	end
	genv = getgenv and getgenv() or _G

	if type(genv.__SenaV4HubShutdown) == "function" then
		pcall(genv.__SenaV4HubShutdown)
	end

	local t2 = {}

	genv.__SenaV4HubSession = t2
	v16 = function()
		return genv.__SenaV4HubSession == t2
	end
	genv.__SenaV4IdentityGetter = genv.getthreadidentity or genv.get_thread_identity or genv.getidentity or genv.getthreadcontext or genv.get_thread_context
	genv.__SenaV4IdentitySetter = genv.setthreadidentity or genv.set_thread_identity or genv.setidentity or genv.setthreadcontext or genv.set_thread_context

	local __SenaV4IdentitySetter = genv.__SenaV4IdentitySetter

	if type(__SenaV4IdentitySetter) == "function" then
		pcall(__SenaV4IdentitySetter, 8)
		genv.__SenaV4UICapabilityIdentity = 8
	end

	if not (rawget(_G, "setfpscap") or rawget(_G, "set_fps_cap")) and type(setfpscap) == "function" then
	end

	genv.__SenaV4SetCapFps = function(p1)
		local v37 = math.clamp(math.floor(tonumber(p1) or 240), 1, 999)
		local setfpscap_ = rawget(_G, "setfpscap") or rawget(_G, "set_fps_cap") or type(setfpscap) == "function" and setfpscap

		if type(setfpscap_) == "function" then
			return pcall(setfpscap_, v37)
		end

		return false
	end

	if type(genv.__SenaV4TweenRuntimeCleanup) == "function" then
		pcall(genv.__SenaV4TweenRuntimeCleanup)
	end

	if type(genv.__SenaV4EggRuntimeCleanup) == "function" then
		pcall(genv.__SenaV4EggRuntimeCleanup)
	end

	if type(genv.__SenaV4AntiGuardCleanup) == "function" then
		pcall(genv.__SenaV4AntiGuardCleanup)
	end

	genv.__SenaV4TweenRuntimeGeneration = (genv.__SenaV4TweenRuntimeGeneration or 0) + 1
	__SenaV4TweenRuntimeGeneration = genv.__SenaV4TweenRuntimeGeneration
	t1 = {
		KEY = "__SenaV4StealAnEggMovementSpoof",
		VERSION = 436,
		INTEGRITY_KEY = "__SenaV4StealAnEggIntegritySpoof",
		SIGNAL = "ClientCharacter: GetDebugSnapshot",
		HEADROOM = 1.35,
		CLAMP = 0.15,
		PADDING = 24,
		MULTIPLIER = 10,
		MIN_INPUT = 20,
		MAX_INPUT = 100,
		DEF_INPUT = 60,
		MIN_SPEED = 200,
		MAX_SPEED = 1000,
		DEF_SPEED = 600,
		FIELDS = {
			"LastObservedSample",
			"LastSample",
			"LastGoodSample",
			"LastGameplayTrustedSample",
			"LastValidatedSample",
			"LastValidatedGroundedSample",
			"LastConfirmedGroundSample",
			"CandidateGroundedSample"
		}
	}

	local KEY = t1.KEY
	local VERSION = t1.VERSION
	local INTEGRITY_KEY = t1.INTEGRITY_KEY
	local SIGNAL = t1.SIGNAL
	local HEADROOM = t1.HEADROOM
	local CLAMP = t1.CLAMP
	local PADDING = t1.PADDING
	local MIN_SPEED = t1.MIN_SPEED
	local MAX_SPEED = t1.MAX_SPEED
	local DEF_SPEED = t1.DEF_SPEED
	local FIELDS = t1.FIELDS
	local n1 = 60

	game:GetService("RunService").Heartbeat:Connect(function(dt)
		if dt and dt > 0 then
			n1 = n1 * 0.9 + 1 / dt * 0.1
		end
	end)
	v19 = function()
		return n1
	end

	local u51
	local v52 = tostring(math.random(100000, 999999))
	local connection
	local connection2
	local t3 = {}
	local u56

	v20 = nil

	local function v57()
		for _, child in ipairs(Workspace:GetChildren()) do
			if child:IsA("BasePart") and child.Name == "__SenaV4HoverPad" and child ~= u51 then
				pcall(child.Destroy, child)
			end
		end
	end

	v21 = function(p2)
		if not u51 or not u51.Parent then
			return false
		end

		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if not HumanoidRootPart or not Humanoid then
			return false
		end

		local v63 = typeof(p2) == "Vector3" and p2

		v63 = v63 or HumanoidRootPart.Position
		u51.CFrame = cFrameNew(v63.X, v63.Y - (Humanoid.RigType == Enum.HumanoidRigType.R15 and HumanoidRootPart.Size.Y * 0.5 + math.max(Humanoid.HipHeight, 0.5) or HumanoidRootPart.Size.Y * 0.5 + 2) - 0.5 - 0.05, v63.Z)

		return true
	end
	v22 = function()
		if not u51 or not u51.Parent or u51:GetAttribute("SenaV4RuntimeOwner") ~= v52 then
			v57()

			if u51 and u51.Parent then
				pcall(u51.Destroy, u51)
			end

			local Part = Instance.new("Part")

			Part.Name = "__SenaV4HoverPad"
			Part:SetAttribute("SenaV4RuntimeOwner", v52)
			Part.Anchored = true
			Part.CanCollide = true
			Part.CanQuery = true
			Part.CanTouch = false
			Part.CastShadow = false
			Part.Transparency = 1
			Part.Material = Enum.Material.SmoothPlastic
			Part.Size = Vector3.new(8, 1, 8)
			u51 = Part
			Part.Parent = Workspace
		end

		v21()

		if not connection then
			local function v65()
				if not v21() then
					v22()
				end
			end

			connection = RunService.PreSimulation:Connect(v65)
		end

		if not connection2 then
			connection2 = RunService.PostSimulation:Connect(function()
				v21()
			end)
		end
	end
	v23 = function()
		if connection then
			pcall(connection.Disconnect, connection)
			connection = nil
		end

		if connection2 then
			pcall(connection2.Disconnect, connection2)
			connection2 = nil
		end

		if u51 then
			pcall(u51.Destroy, u51)
			u51 = nil
		end

		v57()
	end
	v23()
	v24 = function()
		u56 = nil
	end
	v25 = function(p3, p4)
		if p3 and typeof(p4) == "CFrame" then
			u56 = {
				Character = LocalPlayer.Character,
				RootPart = p3,
				CFrame = p4
			}
		end
	end

	local function v66()
		local v67 = u56

		if type(v67) == "table" then
			if typeof(v67.CFrame) == "CFrame" then
				if LocalPlayer.Character == v67.Character then
					if v67.RootPart and v67.RootPart.Parent then
						v22()
						v67.RootPart.AssemblyLinearVelocity = Vector3.zero
						v67.RootPart.AssemblyAngularVelocity = Vector3.zero
						v21(v67.CFrame.Position)
						v67.RootPart.CFrame = v67.CFrame
						v21(v67.CFrame.Position)

						return true
					end
				end

				u56 = nil

				return false
			end
		end

		return false
	end
	local function v68()
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character

		HumanoidRootPart = HumanoidRootPart and Character:FindFirstChild("HumanoidRootPart")

		for _, v in pairs(t3) do
			if type(v) == "table" then
				v.cancelled = true
			end
		end

		table.clear(t3)

		if HumanoidRootPart then
			HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
		end

		v24()
		v23()
	end

	genv.__SenaV4TweenRuntimeCleanup = function()
		for _, v in pairs(t3) do
			if type(v) == "table" then
				v.cancelled = true
			end
		end

		table.clear(t3)
		v24()
		v23()
	end
	v26 = function()
		return getgenv and getgenv() or _G
	end

	local function v75()
		local v76 = v26()
		local v77 = v76[KEY]

		if type(v77) ~= "table" or v77.Version ~= VERSION then
			if type(v77) == "table" then
				v77.Enabled = false
			end

			v77 = {
				Version = VERSION,
				Installed = false,
				Enabled = false,
				Mode = "StateBaseline",
				Humanoid = nil,
				RootPart = nil,
				WalkSpeed = DEF_SPEED
			}
			v76[KEY] = v77
		end

		return v77
	end

	v27 = function(p5, p6)
		local v78 = v75()

		if not v78 then
			return false
		end

		local Humanoid = p5 and p5:FindFirstChildOfClass("Humanoid")
		local HumanoidRootPart = p5 and p5:FindFirstChild("HumanoidRootPart")

		v78.Humanoid = Humanoid
		v78.RootPart = HumanoidRootPart
		v78.WalkSpeed = math.clamp(tonumber(p6) or DEF_SPEED, MIN_SPEED, MAX_SPEED * HEADROOM)
		v78.Enabled = false

		return Humanoid ~= nil and HumanoidRootPart ~= nil
	end

	local function v81()
		local v82 = v26()[KEY]

		if type(v82) == "table" then
			v82.Enabled = false
			v82.Humanoid = nil
			v82.RootPart = nil
		end
	end
	local function v83(p7, p8, p9)
		local u84

		if type(getcallbackvalue) == "function" and type(debug) == "table" and type(debug.getupvalue) == "function" then
			local Signal = ReplicatedStorage:FindFirstChild("Packages") and ReplicatedStorage.Packages:FindFirstChild("Signal")

			if Signal then
				local ok, result = pcall(require, Signal)

				if ok and type(result) == "table" and type(result.Invoked) == "function" then
					local ok2, result2 = pcall(result.Invoked, SIGNAL)

					if ok2 and result2 then
						local ok3, result3 = pcall(getcallbackvalue, result2, "OnInvoke")

						if ok3 and type(result3) == "function" then
							local ok4, result4 = pcall(debug.getinfo, result3)

							if ok4 then
								local function v94(p10, p11, p12)
									if u84 or type(p10) ~= "table" or p11 > 3 or p12[p10] then
										return
									end

									p12[p10] = true

									if rawget(p10, "Player") == p7 and rawget(p10, "Character") == p7.Character then
										if rawget(p10, "Humanoid") == p8 and rawget(p10, "RootPart") == p9 and type(rawget(p10, "SampleHistory")) == "table" and type(rawget(p10, "Evidence")) == "table" then
											u84 = p10

											return
										end
									end

									local n2 = 0

									for _, v in pairs(p10) do
										n2 += 1

										if n2 > 128 then
											break
										end

										if type(v) == "table" then
											v94(v, p11 + 1, p12)
										end
									end
								end

								local n3 = 1
								local nups = result4.nups or 0

								for i = n3, nups do
									local ok5, result5 = pcall(debug.getupvalue, result3, i)

									if not ok5 or type(result5) ~= "table" then
										continue
									end

									v94(result5, 0, {})

									if u84 then
										break
									end
								end
							end
						end
					end
				end
			end
		end

		if not u84 and type(getgc) == "function" then
			local ok, result = pcall(getgc, true)

			if ok and type(result) == "table" then
				for _, v in ipairs(result) do
					if type(v) == "table" and rawget(v, "Player") == p7 and rawget(v, "Character") == p7.Character and rawget(v, "Humanoid") == p8 and rawget(v, "RootPart") == p9 and type(rawget(v, "SampleHistory")) == "table" and type(rawget(v, "Evidence")) == "table" then
						u84 = v

						break
					end
				end
			end
		end

		return u84
	end

	local t4 = {
		busy = false,
		nextAt = 0,
		misses = 0,
		found = nil
	}

	local function v108(p13, p14, p15)
		local found = t4.found

		if type(found) == "table" and rawget(found, "Player") == p13 then
			if rawget(found, "Character") == p13.Character and rawget(found, "Humanoid") == p14 and rawget(found, "RootPart") == p15 then
				return found
			end
		end

		if t4.busy or os.clock() < t4.nextAt then
			return nil
		end

		t4.busy = true
		task.spawn(function()
			task.wait()

			local ok, result = pcall(v83, p13, p14, p15)
			local v112 = ok and result or nil

			t4.found = v112
			t4.misses = v112 and 0 or t4.misses + 1
			t4.nextAt = os.clock() + (v112 and 0.2 or t4.misses >= 5 and 10 or 1)
			t4.busy = false
		end)

		return nil
	end

	v28 = function(p16, p17, p18)
		if type(p16) ~= "table" then
			return false
		end

		local value = rawget(p16, "RootPart")
		local CFrame_2 = value and value.Parent and value.CFrame or nil
		local Position = CFrame_2 and CFrame_2.Position or nil
		local vector3 = typeof(p18) == "Vector3" and p18 or Vector3.zero

		local function v117(p19)
			if type(p19) == "table" then
				rawset(p19, "WalkSpeed", p17)

				if CFrame_2 then
					rawset(p19, "CFrame", CFrame_2)
					rawset(p19, "Position", Position)
					rawset(p19, "LinearVelocity", vector3)
					rawset(p19, "AngularVelocity", Vector3.zero)
				end
			end
		end

		for _, v in ipairs(FIELDS) do
			v117(rawget(p16, v))
		end

		local pairs_ = pairs
		local v121 = rawget(p16, "SampleHistory") or {}

		for _, v in pairs_(v121) do
			v117(v)
		end

		local pairs_2 = pairs
		local v125 = rawget(p16, "SafeGroundCheckpoints") or {}

		for _, v in pairs_2(v125) do
			v117(v)
		end

		local value2 = rawget(p16, "Evidence")

		if type(value2) == "table" then
			value2.Speed = 0
			value2.Teleport = 0
			value2.Flight = 0
		end

		local value3 = rawget(p16, "ImpulseContext")

		if type(value3) == "table" then
			local maxHorizontalSpeed = math.max(tonumber(value3.MaxHorizontalSpeed) or 0, p17)
			local v131 = math.max((tonumber(value3.ExpiresAt) or 0) - (tonumber(value3.StartedAt) or 0), CLAMP)

			value3.MaxHorizontalSpeed = maxHorizontalSpeed

			if Position then
				value3.OriginPosition = Position
			end

			value3.MaxHorizontalDistance = math.max(tonumber(value3.MaxHorizontalDistance) or 0, maxHorizontalSpeed * v131 + PADDING * 2)
			v117(value3.PreMovementSafeSample)
		end

		if rawget(p16, "CorrectionContext") == nil then
			rawset(p16, "FirstSuspiciousAt", nil)

			if rawget(p16, "ThreatLevel") == "Observing" then
				rawset(p16, "ThreatLevel", "Trusted")
			end
		end

		return true
	end

	local function v132()
		local v133 = v26()
		local v134 = v133[INTEGRITY_KEY]

		if type(v134) ~= "table" then
			v134 = {}
			v133[INTEGRITY_KEY] = v134
		end

		return v134
	end

	v29 = function(p20, p21, p22)
		return type(p20) == "table" and rawget(p20, "Player") == LocalPlayer and rawget(p20, "Character") == LocalPlayer.Character and rawget(p20, "Humanoid") == p21 and rawget(p20, "RootPart") == p22
	end
	v30 = function(p23, p24, p25)
		return v29(p23, p24, p25)
	end
	v31 = function(p26, p27, p28)
		local v135 = v132()
		local State = v135.State

		if not v29(State, p26, p27) then
			local now = os.clock()

			if now < (v135.NextSearchAt or 0) then
				return false
			end

			v135.NextSearchAt = now + 0.2
			State = v108(LocalPlayer, p26, p27)
		end

		if not State then
			return false
		end

		if not v30(State, p26, p27) then
			v135.Enabled = false
			v135.Humanoid = p26
			v135.RootPart = p27
			v135.State = State

			return false
		end

		v135.NextSearchAt = 0
		v135.Enabled = true
		v135.Humanoid = p26
		v135.RootPart = p27
		v135.State = State
		v135.WalkSpeed = math.clamp(p28 * HEADROOM, MIN_SPEED, MAX_SPEED * HEADROOM)
		v135.TravelVelocity = Vector3.zero
		v28(State, v135.WalkSpeed, v135.TravelVelocity)

		return true
	end
	v32 = function(p29, p30, p31, p32)
		local v138 = v26()[INTEGRITY_KEY]

		if type(v138) == "table" and v138.Enabled and v138.Humanoid == p29 and v138.RootPart == p30 then
			if v30(v138.State, p29, p30) then
				v138.WalkSpeed = math.clamp(p31 * HEADROOM, MIN_SPEED, MAX_SPEED * HEADROOM)

				if typeof(p32) == "Vector3" then
					v138.TravelVelocity = p32
				elseif typeof(v138.TravelVelocity) ~= "Vector3" then
					v138.TravelVelocity = Vector3.zero
				end

				return v28(v138.State, v138.WalkSpeed, v138.TravelVelocity)
			end
		end

		return false
	end

	local function v139(p33)
		local v140 = v26()[INTEGRITY_KEY]

		if type(v140) ~= "table" then
			return
		end

		if p33 == nil or v140.Humanoid == p33 then
			v140.Enabled = false
			v140.Humanoid = nil
			v140.RootPart = nil
			v140.State = nil
			v140.TravelVelocity = nil
			v140.NextSearchAt = 0
		end
	end

	local connection3

	v33 = function()
		if connection3 then
			return
		end

		connection3 = RunService.PreSimulation:Connect(function()
			if genv.__SenaV4TweenRuntimeGeneration ~= __SenaV4TweenRuntimeGeneration then
				local v142 = connection3

				connection3 = nil

				if v142 then
					pcall(v142.Disconnect, v142)
				end

				return
			end

			local Character = LocalPlayer.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

			if not Character or not HumanoidRootPart or not Humanoid then
				return
			end

			local v146 = v20()

			v27(Character, v146 * HEADROOM)

			if not v32(Humanoid, HumanoidRootPart, v146) then
				v31(Humanoid, HumanoidRootPart, v146)
			end

			v66()
		end)
	end

	local function v147()
		if connection3 then
			pcall(connection3.Disconnect, connection3)
			connection3 = nil
		end

		v81()
		v139()
	end

	genv.__SenaV4TweenRuntimeCleanup = function()
		v68()
		v147()
	end
end

RunService.Heartbeat:Connect(function()
	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity

	if Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z).Magnitude > 400 or math.abs(AssemblyLinearVelocity.Y) > 400 then
		HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.clamp(AssemblyLinearVelocity.X, -100, 100), math.clamp(AssemblyLinearVelocity.Y, -100, 100), math.clamp(AssemblyLinearVelocity.Z, -100, 100))
	end
end)
pcall(function()
	local queue_on_teleport_ = queue_on_teleport or queueonteleport

	queue_on_teleport_ = queue_on_teleport_ or syn and syn.queue_on_teleport

	if queue_on_teleport_ then
		pcall(queue_on_teleport_, "")
	end
end)

do
	pcall(function()
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
	end)
end

do
	local connection
	local connection2

	local function v154(p34)
		if not p34 then
			return
		end

		local Humanoid = p34:WaitForChild("Humanoid", 5) or p34:FindFirstChildOfClass("Humanoid")

		if not p34:WaitForChild("HumanoidRootPart", 5) then
			p34:FindFirstChild("HumanoidRootPart")
		end

		if not Humanoid then
			return
		end

		local health = math.max(Humanoid.MaxHealth, 100)
		local u157 = false
		local n4 = 0

		local function v159()
			if u157 or not Humanoid.Parent then
				return
			end

			local now = os.clock()

			if now - n4 < 0.1 then
				if Humanoid.Health > 0 then
					if Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
						return
					end
				end
			end

			n4 = now
			u157 = true
			pcall(function()
				Humanoid.BreakJointsOnDeath = false
				Humanoid.RequiresNeck = false
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)

				if Humanoid.Health <= 0 then
					Humanoid.Health = health
				end

				if Humanoid:GetState() == Enum.HumanoidStateType.Dead then
					Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
			u157 = false
		end

		v159()

		if connection then
			pcall(connection.Disconnect, connection)
		end

		if connection2 then
			pcall(connection2.Disconnect, connection2)
		end

		connection = Humanoid.HealthChanged:Connect(function(health2)
			if health2 <= 0 or health2 < health then
				v159()
			end
		end)
		connection2 = RunService.Heartbeat:Connect(v159)
	end

	task.spawn(function()
		v154(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
	end)
	LocalPlayer.CharacterAdded:Connect(function(character)
		v154(character)
	end)
end

local senaV4Config = {
	AutoSteal = false,
	HelpFriend = false,
	LowSpeedBoost = true,
	ScrambleTradeInTrade = false,
	ScrambleTradeInReroll = false,
	ScrambleTradeInBanners = {},
	ScrambleBossAuto = false,
	StealMode = "Fly",
	FlyAerial = false,
	StealHoldSeconds = 5,
	StealAreas = { "None" },
	StealRarities = { "None" },
	StealNamesFilter = { "None" },
	StealMinValue = 0,
	StealMutations = { "None" },
	StealMinWeight = 0,
	StealPriority = "Rarity",
	AutoFavorite = false,
	FavMode = "Rarity",
	FavRarities = { "None" },
	FavSpecies = { "None" },
	AutoEquipBest = false,
	AutoClaimOffline = false,
	AutoBaseUpgrade = false,
	AutoClaimAlmanac = false,
	AutoFusePets = false,
	ScrambleFarmDrones = false,
	ScrambleLostParts = false,
	ScrambleCollectSamples = false,
	ScrambleAutoVault = false,
	ScrambleAutoBuy = false,
	ScrambleAreas = {},
	ScrambleDroneTypes = {},
	ScrambleBuyList = {},
	ButterflyAutoNet = false,
	ButterflyAutoCatch = false,
	ButterflyEsp = false,
	ButterflyTiers = {},
	ButterflyAutoTrade = false,
	ButterflyTradeRecipe = "All",
	ButterflyCatchMode = "Tween",
	ButterflyAutoCraft = false,
	Noclip = false,
	BottingMode = false,
	AntiCutscene = false,
	FuseSelectedOnly = false,
	FuseRarities = { "None" },
	FuseSpecies = { "None" },
	EspDetails = {
		"Name",
		"Rarity",
		"Value"
	},
	BackpackRateEsp = false,
	AntiAFK = true,
	AutoReconnect = true,
	AutoExecute = false,
	AutoPlace = false,
	PlaceRarities = { "None" },
	AutoHatch = false,
	SellAll = false,
	AutoSell = false,
	SellNames = { "None" },
	SellRarities = { "None" },
	AutoSellEgg = false,
	SellEggRarities = { "None" },
	WebhookEnabled = false,
	WebhookURL = "",
	TweenSpeedMultiplier = 60,
	AutoTreadmillIdle = false,
	AutoTreadmillUpgrade = false,
	AntiTreadmill = false,
	HopNoMatch = false,
	PrivateServerMax = "2",
	PrivateServerAuto = false,
	HopCooldown = 5,
	AutoIndex = false,
	AntiHitGuard = false,
	FlyForCapture = false,
	AutoStealCapture = false,
	InstantGrab = false,
	InfiniteJump = false,
	WalkSpeedMultiplier = 1,
	AntiGuardKnockback = true,
	GodMode = true,
	EggPredictUI = false,
	EggESP = false,
	StealPlayers = false,
	StealPlayerRarities = { "None" },
	StealPlayerMinValue = 0,
	StealPlayerTarget = "Any Player",
	WebhookRarities = { "None" },
	WebhookMinValue = 0
}
local EggState = require(game:GetService("ReplicatedStorage").Client.EggState)

EggState.GetAreaEggSnapshot = EggState.ReadFieldEggs
EggState.GetAreaEggRecord = EggState.ReadFieldEgg
EggState.RequestAreaEggSnapshot = EggState.SyncFieldEggs
EggState.RequestCarryAreaEgg = EggState.CarryFieldEgg
EggState.RequestDropHeldAreaEgg = EggState.DropFieldEgg
EggState.AreaEggCarryStateChanged = EggState.CarryChanged
EggState.AreaEggClaimed = EggState.FieldClaimed
EggState.AreaEggUpdated = EggState.FieldShifted
EggState.AreaEggRemoved = EggState.FieldGone
EggState.GetOwnerRuntimeRecords = EggState.ReadOwnerEggs
EggState.RequestEquipTool = EggState.WearEggTool
EggState.RequestPlaceEgg = EggState.PlantEgg
EggState.RequestHatchEgg = EggState.BeginHatch
EggState.RequestCompleteHatchEgg = EggState.FinishHatch
EggState.RequestRuntimeSnapshot = EggState.SyncOwnedEggs
EggState.RuntimeOwnerUpdated = EggState.OwnerRefreshed
EggState.RuntimeOwnerCleared = EggState.OwnerCleared

local PlotState = require(game:GetService("ReplicatedStorage").Client.PlotState)

PlotState.GetMySlot = PlotState.ResolveLocalSlot
PlotState.GetPlotsFolder = PlotState.ResolveFolder
PlotState.IsWorldPositionWithinLocalPlotBounds = PlotState.ContainsLocalPoint
PlotState.GetPlotData = PlotState.ResolvePlot

local AreaEggResetWall = require(game:GetService("ReplicatedStorage").Client.AreaEggResetWall)

AreaEggResetWall.IsClosed = AreaEggResetWall.IsSealed
v20 = function()
	if genv.__SenaV4AdminBoost == true then
		return 4000
	end

	return math.clamp(math.floor((tonumber(senaV4Config.TweenSpeedMultiplier) or t1.DEF_INPUT) + 0.5), t1.MIN_INPUT, t1.MAX_INPUT) * t1.MULTIPLIER
end
senaV4Config.applyStealValueInput = function(p35, p36)
	local lower = string.lower
	local tostring_ = tostring
	local v167 = lower(tostring_(p36 or "")):gsub("[%s,]", "")

	if v167 == "" then
		p35.StealMinValue = 0

		return true
	end

	local v168, v169 = string.match(v167, "^([%d]+%.?[%d]*)([kmb]?)$")
	local v170 = tonumber(v168)

	if not v170 then
		return false
	end

	local n5 = 1

	if v169 == "k" then
		n5 = 1000
	elseif v169 == "m" then
		n5 = 1000000
	elseif v169 == "b" then
		n5 = 1e9
	end

	p35.StealMinValue = v170 * n5

	return true
end
senaV4Config.getAreaEggValue = function(p37, p38)
	if not p37._assetGenerationUtil then
		p37._assetGenerationUtil = require(game:GetService("ReplicatedStorage").Shared.Util.AssetEarnings)
	end

	return p37._assetGenerationUtil.MutationOnlyRatePerSecond({
		Category = p38.AssetCategory,
		Scale = p38.AssetScale or 1,
		Mutations = p38.Mutations or {},
		BaseMutation = p38.BaseMutation,
		EyeColor = p38.AssetEyeColor,
		ColorSeed = p38.AssetColorSeed,
		ColorIndex = p38.AssetColorIndex,
		Gender = p38.Gender,
		Personality = p38.Personality or "Normal",
		HasBeenFirstPlaced = p38.HasBeenFirstPlaced == true
	})
end

local function v172(p39)
	local max = math.max
	local StealPriorityUntil = senaV4Config.StealPriorityUntil or 0

	senaV4Config.StealPriorityUntil = max(StealPriorityUntil, os.clock() + (p39 or 5))
end

local AreaEggCycle
local AreaEggResetWall2

pcall(function()
	AreaEggCycle = require(ReplicatedStorage.Shared.Util.AreaEggCycle)
	AreaEggResetWall2 = require(ReplicatedStorage.Client.AreaEggResetWall)
end)

local function v177()
	if AreaEggCycle then
		if type(AreaEggCycle.IsNightPhase) == "function" then
			local ok, result = pcall(AreaEggCycle.IsNightPhase, workspace:GetServerTimeNow())

			if ok then
				if result == true then
					return true
				end
			end
		end
	end

	if AreaEggResetWall2 then
		if type(AreaEggResetWall2.IsSealed) == "function" then
			local ok, result = pcall(AreaEggResetWall2.IsSealed)

			if ok and result == true then
				return true
			end
		end

		if type(AreaEggResetWall2.IsClosed) == "function" then
			local ok, result = pcall(AreaEggResetWall2.IsClosed)

			if ok and result == true then
				return true
			end
		end
	end

	return false
end

do
	local n6 = 0
	local u185 = false

	local function v186()
		if v177() then
			return false
		end

		local now = os.clock()

		if now - n6 < 0.35 then
			return u185
		end

		n6 = now

		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local v189 = require(ReplicatedStorage2.Client.EggState).GetAreaEggSnapshot()
		local Directory = require(ReplicatedStorage2.Data.Assets).Directory
		local pairs_ = pairs
		local Records = v189 and v189.Records or {}

		for _, Record in pairs_(Records) do
			if Record.State ~= "Slot" and Record.State ~= "Dropped" or not Record.BottomCFrame then
				continue
			end

			local v195 = Directory[Record.AssetCategory]
			local Rarity = v195 and v195.Rarity
			local DisplayName = Rarity and (Rarity.DisplayName or Rarity._id)

			if DisplayName ~= "Eternal" and DisplayName ~= "Divine" then
				continue
			end

			u185 = true

			return true
		end

		u185 = false

		return false
	end
end

local function v198()
	if senaV4Config.IsStealing then
		return false
	end

	local __SenaV4DronesWantCharacter = genv.__SenaV4DronesWantCharacter

	if __SenaV4DronesWantCharacter and __SenaV4DronesWantCharacter() then
		return false
	end

	if senaV4Config.IsPlacing == true then
		return false
	end

	if senaV4Config.AutoSteal then
		return os.clock() >= (senaV4Config.StealPriorityUntil or 0)
	end

	return true
end

do
	local function v200(p40)
		pcall(function()
			if typeof(writefile) ~= "function" then
				return
			end

			local s1 = ""

			if typeof(readfile) == "function" and typeof(isfile) == "function" and isfile("Sena_Disconnect_Log.txt") then
				s1 = readfile("Sena_Disconnect_Log.txt") or ""
			end

			local t5 = {}

			for match in s1:gmatch("[^\r\n]+") do
				table.insert(t5, match)
			end

			local v204 = "] " .. p40

			table.insert(t5, "[" .. os.date("%Y-%m-%d %H:%M:%S") .. v204)

			while #t5 > 50 do
				table.remove(t5, 1)
			end

			writefile("Sena_Disconnect_Log.txt", table.concat(t5, "\n"))
		end)
	end
end

local function v205(p41)
	if not p41 or type(p41.GetValue) ~= "function" then
		return nil
	end

	local ok, result = pcall(function()
		return p41:GetValue()
	end)

	if not ok then
		return nil
	end

	if type(result) ~= "table" then
		if type(result) == "string" then
			return { result }
		end

		return nil
	end

	local t6 = {}

	for k, v in pairs(result) do
		if type(k) == "number" then
			table.insert(t6, v)
		elseif type(k) == "string" and v == true then
			table.insert(t6, k)
		end
	end

	return t6
end
local function v211(p42, p43, p44, p45)
	if senaV4Config.SellAll then
		return true
	end

	if type(p44) ~= "table" or type(p45) ~= "table" then
		return false
	end

	local v212 = false

	if not (#p44 == 0 or table.find(p44, "None")) then
		if table.find(p44, "All") then
			v212 = true
		else
			v212 = table.find(p44, p42) ~= nil
		end
	end

	local v213 = false

	if #p45 ~= 0 and not table.find(p45, "None") then
		if table.find(p45, "All") then
			v213 = true
		else
			v213 = table.find(p45, p43) ~= nil
		end
	end

	return v212 or v213
end
local function v214(p46, p47)
	if type(p47) ~= "table" then
		return false
	end

	if #p47 ~= 0 then
		if not table.find(p47, "None") then
			if table.find(p47, "All") then
				return true
			end

			return table.find(p47, p46) ~= nil
		end
	end

	return false
end
local function v215(p48)
	local HumanoidRootPart = p48 and p48:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		HumanoidRootPart:SetAttribute("KillPartIgnore", true)
	end
end

local vector3 = Vector3.new(544.76, 71.5, -416.48)
local t7 = {
	CarryRetry = 0.25,
	CarryTimeout = 2,
	EarlyCarryDistance = 8,
	SafeStable = 0.35,
	ReturnValidation = 0.08,
	NextTarget = 0.05,
	SafeHandoff = 0.15
}
local t8 = {
	GUARD_MARGIN = 1.25,
	GUARD_FALLBACK = 222,
	maxGuardWalkSpeed = nil,
	floorNotifiedFor = -1,
	capNotifiedFor = -1
}

local function v220()
	if not t8.maxGuardWalkSpeed then
		local ok, result = pcall(function()
			return require(game:GetService("ReplicatedStorage").Data.Guards).GetHighestWalkSpeed()
		end)

		t8.maxGuardWalkSpeed = ok and type(result) == "number" and result > 0 and result or t8.GUARD_FALLBACK
		warn(string.format("[GuardEscape] Guard tercepat %d stud/detik -> lantai kabur %d stud/detik", t8.maxGuardWalkSpeed, t8.maxGuardWalkSpeed * t8.GUARD_MARGIN))
	end

	return t8.maxGuardWalkSpeed * t8.GUARD_MARGIN
end
local function v223(p49)
	local tweenSpeedMultiplier = math.clamp(math.floor((tonumber(p49) or t1.DEF_INPUT) + 0.5), t1.MIN_INPUT, t1.MAX_INPUT)

	if math.abs((senaV4Config.TweenSpeedMultiplier or 0) - tweenSpeedMultiplier) <= 0.001 then
		return
	end

	senaV4Config.TweenSpeedMultiplier = tweenSpeedMultiplier
end
local function v225(p50, p51, p52, p53)
	local v226 = os.clock() + p52
	local now
	local n7 = 0
	local n8 = 0.1

	pcall(function()
		n8 = LocalPlayer:GetNetworkPing()
	end)

	local v230 = math.clamp(n8 * 2 + 0.2, 0.4, 1)

	while true do
		if not (os.clock() < v226) then
			return false
		end

		if p53 and p53() then
			break
		end

		p50.AssemblyLinearVelocity = Vector3.zero
		p50.AssemblyAngularVelocity = Vector3.zero
		RunService.Heartbeat:Wait()

		if not ((p50.Parent and (p50.Position - p51.Position).Magnitude or math.huge) <= 1.5) then
			now = nil
			n7 = 0

			continue
		end

		p50.CFrame = p51
		now = now or os.clock()
		n7 += 1

		if not (n7 >= 3) or not (v230 <= os.clock() - now) then
			continue
		end

		return true
	end

	return false
end

local t9 = {}

local function v232(p54, p55, p56, p57, p58, p59, p60)
	if not p54 or not p55 or typeof(p56) ~= "CFrame" then
		return false
	end

	if p57 and p57() then
		return false
	end

	local v233 = t9[p54]

	if v233 then
		v233.cancelled = true
		t9[p54] = nil
	end

	local Parent = p54.Parent

	if not Parent then
		return false
	end

	v24()
	v215(Parent)
	v33()

	local CurrentCamera = workspace.CurrentCamera

	if CurrentCamera and CurrentCamera.CameraSubject ~= p55 then
		pcall(function()
			CurrentCamera.CameraSubject = p55
		end)
	end

	local AutoRotate = p55.AutoRotate

	p55.AutoRotate = false

	local v237 = p60 and math.max(p54.Position.Y, p56.Position.Y + 5, vector3.Y + 5) or nil
	local v238 = v237 and cFrameNew(p56.Position.X, v237, p56.Position.Z) * p56.Rotation or p56
	local v239 = math.clamp(v20(), t1.MIN_SPEED, genv.__SenaV4AdminBoost == true and 3000 or t1.MAX_SPEED)

	v27(Parent, v239 * t1.HEADROOM)

	local t10 = {
		cancelled = false
	}

	t9[p54] = t10
	v22()

	local now
	local v242
	local n9 = 0
	local v244 = v237 and (math.abs(p54.Position.Y - v237) > 0.35 and "takeoff" or "cruise") or nil
	local Magnitude = (v238.Position - p54.Position).Magnitude
	local v246 = os.clock() + math.max(Magnitude / v239, 0.08) * 3 + 8
	local v247 = false
	local v248 = false

	while not t10.cancelled and (not p57 or not p57()) and p54.Parent and not (v246 <= os.clock()) do
		local v249 = math.max(math.min(RunService.Heartbeat:Wait(), 0.15), 0.0041666666666666666)
		local v250 = math.clamp(v20(), t1.MIN_SPEED, genv.__SenaV4AdminBoost == true and 3000 or t1.MAX_SPEED)

		v27(Parent, v250 * t1.HEADROOM)

		local v251 = v26()[t1.INTEGRITY_KEY]
		local State = type(v251) == "table" and v251.State or nil

		if v30(State, p55, p54) then
			local Position = p54.Position
			local v254 = v238.Position - Position
			local Magnitude2 = v254.Magnitude
			local vector32 = Vector3.new(v254.X, 0, v254.Z)

			if v237 and v244 == "takeoff" and math.abs(Position.Y - v237) <= 0.35 then
				v244 = "cruise"
			end

			local v257 = (v237 and v244 == "takeoff" and Vector3.new(Position.X, v237, Position.Z) or v238.Position) - Position
			local Magnitude3 = v257.Magnitude
			local Magnitude4 = v237 and vector32.Magnitude or Magnitude2

			if v242 and v242 + 2 < Magnitude4 then
				n9 = os.clock() + 0.5
			end

			v242 = Magnitude4

			local v260 = (os.clock() < n9 and math.max(t1.MIN_SPEED, v250 * 0.45) or v250) * v249

			if p59 and not v248 and Magnitude2 <= t7.EarlyCarryDistance then
				v248 = true
				task.spawn(p59)
			end

			local vector33 = Vector3.new(p54.CFrame.LookVector.X, 0, p54.CFrame.LookVector.Z)
			local Unit = vector32.Magnitude > 0.001 and vector32.Unit or vector33.Magnitude > 0.001 and vector33.Unit or Vector3.new(0, 0, -1)

			if (not v237 or v244 == "cruise") and Magnitude2 <= math.max(v260, 0.05) then
				if Magnitude2 > 0.5 then
					now = nil
				end

				v21(v238.Position)
				p54.CFrame = lookAt(v238.Position, v238.Position + Unit)
				p54.AssemblyLinearVelocity = Vector3.zero
				p54.AssemblyAngularVelocity = Vector3.zero
				v21(v238.Position)
				v32(p55, p54, v250, Vector3.zero)
				now = now or os.clock()

				if os.clock() - now >= 0.4 then
					v247 = true

					break
				end
			else
				now = nil

				if Magnitude3 <= 0.001 then
					p54.AssemblyLinearVelocity = Vector3.zero
					p54.AssemblyAngularVelocity = Vector3.zero
					v21(Position)
				else
					local v263 = Position + v257.Unit * math.min(v260, Magnitude3)
					local v264 = (v263 - Position) / v249

					v21(v263)
					p54.CFrame = lookAt(v263, v263 + Unit)
					p54.AssemblyLinearVelocity = Vector3.zero
					v21(v263)

					if not v32(p55, p54, v250, v264) then
						v31(p55, p54, v250)
						v32(p55, p54, v250, v264)
					end
				end
			end
		else
			v242 = nil
			now = nil
			p54.AssemblyLinearVelocity = Vector3.zero
			p54.AssemblyAngularVelocity = Vector3.zero
			v21(p54.Position)

			if v29(State, p55, p54) then
				v28(State, v250 * t1.HEADROOM, Vector3.zero)
			else
				v31(p55, p54, v250)
			end
		end
	end

	if p55.Parent and AutoRotate ~= nil then
		p55.AutoRotate = AutoRotate
	end

	p54.AssemblyLinearVelocity = Vector3.zero
	p54.AssemblyAngularVelocity = Vector3.zero

	if v247 and p58 then
		v25(p54, v238)
	else
		v23()
	end

	local v265 = v247 and not t10.cancelled

	return v265
end
local function v266(p61, p62, p63, p64)
	return v232(p61, p62, p63, p64, false, nil, true)
end
local function v267(p65, p66)
	if p65 then
		if typeof(p66) == "CFrame" then
			if not pcall(function()
				p65.AssemblyLinearVelocity = Vector3.zero
				p65.AssemblyAngularVelocity = Vector3.zero
				p65.CFrame = p66
				p65.AssemblyLinearVelocity = Vector3.zero
				p65.AssemblyAngularVelocity = Vector3.zero
			end) then
				return false
			end

			v21(p66.Position)

			local Parent = p65.Parent
			local Humanoid = Parent and Parent:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				local v270 = math.clamp(v20(), t1.MIN_SPEED, genv.__SenaV4AdminBoost == true and 3000 or t1.MAX_SPEED)

				v27(Parent, v270 * t1.HEADROOM)

				if not v32(Humanoid, p65, v270, Vector3.zero) then
					v31(Humanoid, p65, v270)
					v32(Humanoid, p65, v270, Vector3.zero)
				end
			end

			return true
		end
	end

	return false
end

getgenv().SenaV4Config = senaV4Config

local function v271(p67)
	if p67 and p67.Name == "PlayerTrap" then
		pcall(function()
			p67:Destroy()
		end)
	end
end

task.spawn(function()
	local function v272(p68)
		if not p68 then
			return
		end

		local v273, v274, v275 = ipairs(p68:GetChildren())
		local v276 = geniter(v273, v274, v275)
		local v277 = table.pack(v276())

		if v277[1] then
			local v278 = v277[3]

			while true do
				v271(v278)

				local v279 = table.pack(v276())

				if v279[1] then
					v278 = v279[3]
				else
					break
				end
			end
		end

		p68.ChildAdded:Connect(function(child)
			v271(child)
		end)
	end

	local Transient = workspace:FindFirstChild("Transient")

	if Transient then
		v272(Transient)
	end

	local __DEBRIS = workspace:FindFirstChild("__DEBRIS")

	if __DEBRIS then
		v272(__DEBRIS)
	end

	workspace.ChildAdded:Connect(function(child)
		if child.Name == "Transient" or child.Name == "__DEBRIS" then
			v272(child)
		elseif child.Name == "PlayerTrap" then
			v271(child)

			return
		elseif child.Name:lower():find("trap") then
			v271(child)
		end
	end)
	task.spawn(function()
		while v16() do
			for _, v in ipairs({
				workspace:FindFirstChild("Transient"),
				workspace:FindFirstChild("__DEBRIS")
			}) do
				if v then
					for _, child in ipairs(v:GetChildren()) do
						v271(child)
					end
				end
			end

			task.wait(1.5)
		end
	end)
end)

local u286

local function v287()
	local ok, result = pcall(function()
		return require(game:GetService("ReplicatedStorage").Shared.Remotes).Treadmill.AskRenderSnapshot:InvokeServer()
	end)

	if ok then
		if type(result) == "table" then
			return table.find(result, LocalPlayer.UserId) ~= nil
		end
	end

	return nil
end
local function v290()
	local ok, result, result2 = pcall(function()
		return require(game:GetService("ReplicatedStorage").Shared.Remotes).Treadmill.AskDoff:InvokeServer()
	end)

	if not ok then
		return false, tostring(result)
	end

	if result ~= true then
		return false, tostring(result2)
	end

	return true
end
local function v294()
	local ok, result = pcall(function()
		local PlotState2 = require(ReplicatedStorage.Client.PlotState)
		local v298 = type(PlotState2.ResolveLocalSlot) == "function" and PlotState2.ResolveLocalSlot() or PlotState2.GetMySlot()
		local v299 = type(PlotState2.ResolveFolder) == "function" and PlotState2.ResolveFolder() or PlotState2.GetPlotsFolder()
		local v300 = v299 and v298

		v300 = v300 and v299:FindFirstChild(tostring(v298))

		local TreadmillBottom = v300 and v300:FindFirstChild("TreadmillBottom")

		if not TreadmillBottom or not TreadmillBottom:IsA("BasePart") then
			return nil
		end

		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if HumanoidRootPart and Humanoid then
			return TreadmillBottom.CFrame * cFrameNew(0, TreadmillBottom.Size.Y * 0.5 + (Humanoid.RigType == Enum.HumanoidRigType.R15 and HumanoidRootPart.Size.Y * 0.5 + math.max(Humanoid.HipHeight, 0.5) or HumanoidRootPart.Size.Y * 0.5 + 2) + 0.05, 0)
		end

		return nil
	end)
	local v305 = ok and result or nil

	return v305
end

local t11 = {
	HoldSeconds = 0.3,
	ConfirmStableSeconds = 0.3,
	ConfirmTimeout = 2.5,
	PollSeconds = 0.05,
	ArrivalSettle = 0.5,
	DecoyName = "__SenaV4TweenTreadmillDecoy",
	destroyTrail = function(p69)
		if typeof(p69) == "Instance" then
			if p69:IsA("Trail") then
				pcall(p69.Destroy, p69)
			end
		end
	end,
	destroyStealPopup = function(p70)
		if senaV4Config.IsStealing then
			if typeof(p70) == "Instance" and (p70.Name == "SpeedGainPopup" or p70.Name == "PlusOne") then
				pcall(p70.Destroy, p70)
			end
		end
	end
}

t11.purgeStealPopups = function()
	local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")

	if not PlayerGui then
		return
	end

	for _, descendant in ipairs(PlayerGui:GetDescendants()) do
		t11.destroyStealPopup(descendant)
	end
end
t11.guiConnection = LocalPlayer:WaitForChild("PlayerGui").DescendantAdded:Connect(function(descendant)
	t11.destroyStealPopup(descendant)
end)
t11.removeDecoy = function()
	if t11.cameraConnection then
		pcall(t11.cameraConnection.Disconnect, t11.cameraConnection)
		t11.cameraConnection = nil
	end

	if t11.characterConnection then
		pcall(t11.characterConnection.Disconnect, t11.characterConnection)
		t11.characterConnection = nil
	end

	local pairs_ = pairs
	local transparency = t11.transparency or {}

	for k, v in pairs_(transparency) do
		if typeof(k) == "Instance" and k.Parent then
			pcall(function()
				k.LocalTransparencyModifier = v
			end)
		end
	end

	t11.transparency = nil

	local Character = LocalPlayer.Character
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
	local CurrentCamera = workspace.CurrentCamera

	if CurrentCamera then
		pcall(function()
			CurrentCamera.CameraSubject = Humanoid or t11.cameraSubject
		end)
	end

	t11.cameraSubject = nil

	if t11.decoy then
		pcall(t11.decoy.Destroy, t11.decoy)
	end

	t11.decoy = nil
end
t11.spawnDecoy = function(p71)
	t11.removeDecoy()

	local Character = LocalPlayer.Character

	if not Character then
		return false
	end

	local Archivable = Character.Archivable

	Character.Archivable = true

	local ok, decoy = pcall(Character.Clone, Character)

	Character.Archivable = Archivable

	if not ok or not decoy or typeof(decoy) ~= "Instance" then
		return false
	end

	decoy.Name = t11.DecoyName

	for _, descendant in ipairs(decoy:GetDescendants()) do
		if not descendant:IsA("Script") then
			if not descendant:IsA("LocalScript") and not descendant:IsA("BillboardGui") and not descendant:IsA("Sound") and not descendant:IsA("Trail") then
				if not descendant:IsA("BasePart") then
					continue
				end

				descendant.LocalTransparencyModifier = 0
				descendant.Anchored = true
				descendant.CanCollide = false
				descendant.CanQuery = false
				descendant.CanTouch = false

				continue
			end
		end

		pcall(descendant.Destroy, descendant)
	end

	local Humanoid = decoy:FindFirstChildOfClass("Humanoid")

	if not Humanoid then
		decoy:Destroy()

		return false
	end

	pcall(function()
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
	end)
	decoy.Parent = workspace
	decoy:PivotTo(p71)
	t11.decoy = decoy

	local transparency = setmetatable({}, {
		__mode = "k"
	})

	local function v325(p72)
		if not p72 or not p72:IsA("BasePart") or not p72:IsDescendantOf(Character) then
			return
		end

		if transparency[p72] == nil then
			transparency[p72] = p72.LocalTransparencyModifier
		end

		p72.LocalTransparencyModifier = 1
	end

	for _, descendant in ipairs(Character:GetDescendants()) do
		v325(descendant)
		t11.destroyTrail(descendant)
	end

	t11.transparency = transparency
	t11.characterConnection = Character.DescendantAdded:Connect(function(descendant)
		if t11.decoy == decoy then
			pcall(v325, descendant)
			t11.destroyTrail(descendant)
		end
	end)

	local CurrentCamera = workspace.CurrentCamera

	if CurrentCamera then
		t11.cameraSubject = CurrentCamera.CameraSubject
		CurrentCamera.CameraSubject = Humanoid
	end

	t11.cameraConnection = RunService.RenderStepped:Connect(function()
		if t11.decoy == decoy then
			if decoy.Parent and Humanoid.Parent then
				for k in pairs(transparency) do
					if k.Parent and k.LocalTransparencyModifier ~= 1 then
						k.LocalTransparencyModifier = 1
					end
				end

				local CurrentCamera2 = workspace.CurrentCamera

				if CurrentCamera2 and CurrentCamera2.CameraSubject ~= Humanoid then
					CurrentCamera2.CameraSubject = Humanoid
				end

				return
			end
		end
	end)

	return true
end
t11.requestEquip = function()
	local ok, result, result2 = pcall(function()
		return require(ReplicatedStorage.Shared.Remotes).Treadmill.AskWearStill:InvokeServer()
	end)

	if ok then
		if result ~= false then
			return true
		end
	end

	local v334 = false
	local tostring_ = tostring
	local v336 = result2 or result

	return v334, tostring_(v336)
end
t11.prepare = function(p73, p74)
	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

	if HumanoidRootPart then
		if Humanoid and typeof(p73) == "CFrame" then
			local function v340()
				return p74 ~= nil and p74()
			end
			local function v341()
				local Character2 = LocalPlayer.Character
				local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart2 then
					v267(HumanoidRootPart2, p73)
					task.wait(0.1)
				end

				t11.removeDecoy()
			end

			t11.purgeStealPopups()
			v24()
			v23()

			if not t11.spawnDecoy(p73) then
				return false
			end

			local v344 = v294()

			if not v344 or v340() or not v267(HumanoidRootPart, v344) then
				v290()
				v341()

				return false
			end

			task.wait(t11.ArrivalSettle)

			if v340() then
				v290()
				v341()

				return false
			end

			if not t11.requestEquip() then
				v290()
				v341()

				return false
			end

			local v345 = os.clock() + t11.ConfirmTimeout
			local v346 = false
			local now

			while not v340() do
				if not (os.clock() < v345) then
					break
				end

				if v287() == true then
					now = now or os.clock()

					if not (t11.ConfirmStableSeconds <= os.clock() - now) then
						task.wait(t11.PollSeconds)

						continue
					end

					v346 = true

					break
				end

				now = nil
				task.wait(t11.PollSeconds)
			end

			if not v346 or v340() then
				v290()
				v341()

				return false
			end

			local v348 = os.clock() + t11.HoldSeconds

			while not v340() and os.clock() < v348 do
				task.wait(t11.PollSeconds)
			end

			local v349 = os.clock() + t11.ConfirmTimeout
			local v350 = false

			while not v340() and os.clock() < v349 do
				v290()
				task.wait(t11.PollSeconds)

				if v287() == false then
					u286 = nil
					v350 = true

					break
				end
			end

			v341()

			local v351 = v350 and not v340()

			return v351
		end
	end

	return false
end
t11.previousCleanup = genv.__SenaV4TweenRuntimeCleanup
genv.__SenaV4TweenRuntimeCleanup = function()
	v290()
	t11.removeDecoy()

	if t11.guiConnection then
		pcall(t11.guiConnection.Disconnect, t11.guiConnection)
		t11.guiConnection = nil
	end

	if type(t11.previousCleanup) == "function" then
		t11.previousCleanup()
	end
end
LocalPlayer.CharacterRemoving:Connect(function()
	t11.removeDecoy()
end)

do
	if type(genv.__SenaV4CosmeticSuppressCleanup) == "function" then
		pcall(genv.__SenaV4CosmeticSuppressCleanup)
	end

	local t12 = {}

	local function v353(child)
		if child then
			if child.Name == "DropHeldEgg" then
				if not child:IsA("ScreenGui") then
					if not child:IsA("LayerCollector") then
						return
					end
				end

				pcall(function()
					child.Enabled = false
				end)
				table.insert(t12, child:GetPropertyChangedSignal("Enabled"):Connect(function()
					if child.Enabled then
						pcall(function()
							child.Enabled = false
						end)
					end
				end))

				return
			end
		end
	end
	local function v354()
		local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if PlayerGui then
			for _, child in ipairs(PlayerGui:GetChildren()) do
				v353(child)
			end

			table.insert(t12, PlayerGui.ChildAdded:Connect(v353))

			return
		end
	end

	v354()
	table.insert(t12, LocalPlayer.CharacterAdded:Connect(function()
		task.defer(v354)
	end))
	pcall(function()
		local GuardPresentationComponent = require(ReplicatedStorage.Shared.Modules.GuardAreas.GuardPresentationComponent)

		if type(GuardPresentationComponent) == "table" then
			genv.__SenaV4GuardPresentOrig = genv.__SenaV4GuardPresentOrig or {
				PlayWake = GuardPresentationComponent.PlayWake,
				PlayHit = GuardPresentationComponent.PlayHit,
				PlayAfterWake = GuardPresentationComponent.PlayAfterWake,
				ScheduleAfterWake = GuardPresentationComponent.ScheduleAfterWake
			}

			local function playWake()
			end

			GuardPresentationComponent.PlayWake = playWake
			GuardPresentationComponent.PlayHit = function()
				return 0
			end
			GuardPresentationComponent.PlayAfterWake = playWake
			GuardPresentationComponent.ScheduleAfterWake = playWake
		end
	end)
	genv.__SenaV4CosmeticSuppressCleanup = function()
		for _, v in ipairs(t12) do
			pcall(function()
				v:Disconnect()
			end)
		end

		table.clear(t12)

		local __SenaV4GuardPresentOrig = genv.__SenaV4GuardPresentOrig

		if type(__SenaV4GuardPresentOrig) == "table" then
			pcall(function()
				local GuardPresentationComponent = require(ReplicatedStorage.Shared.Modules.GuardAreas.GuardPresentationComponent)

				for k, v in pairs(__SenaV4GuardPresentOrig) do
					GuardPresentationComponent[k] = v
				end
			end)
		end
	end
end

do
	if type(genv.__SenaV4StealDeclutterCleanup) == "function" then
		pcall(genv.__SenaV4StealDeclutterCleanup)
	end

	local t13 = {
		{
			name = "ProximityPrompts",
			restore = true
		},
		{
			name = "AreaGui",
			restore = false
		}
	}
	local u367 = false
	local t14 = {}

	local function v369(p75)
		return p75 and (p75:IsA("ScreenGui") or p75:IsA("LayerCollector"))
	end
	local function v370(p76)
		if not v369(p76) then
			return
		end

		pcall(function()
			p76.Enabled = false
		end)
		table.insert(t14, p76:GetPropertyChangedSignal("Enabled"):Connect(function()
			if u367 then
				if p76.Enabled then
					pcall(function()
						p76.Enabled = false
					end)
				end
			end
		end))
	end
	local function v371(p77)
		local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if not PlayerGui then
			return
		end

		for _, v in ipairs(t13) do
			local VName = PlayerGui:FindFirstChild(v.name)

			if VName then
				p77(VName, v)
			end
		end
	end
	local function v376()
		local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if not PlayerGui then
			return
		end

		v371(function(p78)
			v370(p78)
		end)
		table.insert(t14, PlayerGui.ChildAdded:Connect(function(child)
			if not u367 then
				return
			end

			for _, v in ipairs(t13) do
				if child.Name == v.name then
					v370(child)

					break
				end
			end
		end))
	end
	local function v380()
		for _, v in ipairs(t14) do
			pcall(function()
				v:Disconnect()
			end)
		end

		table.clear(t14)
		v371(function(p79, p80)
			pcall(function()
				p79.Enabled = p80.restore
			end)
		end)
	end

	genv.__SenaV4SetStealDeclutter = function(p81)
		local v383 = p81 == true

		if v383 == u367 then
			return
		end

		u367 = v383

		if v383 then
			v376()
		else
			v380()
		end
	end
	genv.__SenaV4StealDeclutterCleanup = function()
		u367 = false
		v380()
	end
end

do
	local function v384()
		local v385 = v287()

		if v385 == false then
			u286 = nil

			return true
		end

		if v385 == nil and u286 == nil then
			return true
		end

		u286 = u286 or "server"

		local v386, v387 = v290()

		if not v386 then
			warn("[Treadmill] Gagal minta lepas dari treadmill sebelum steal:", v387)

			return false
		end

		local v388 = os.clock() + 1.5

		while u286 ~= nil and os.clock() < v388 do
			task.wait(0.05)

			if not senaV4Config.AutoSteal then
				return false
			end

			if v287() == false then
				u286 = nil

				break
			end
		end

		if u286 ~= nil then
			warn("[Treadmill] Lepas treadmill gak kekonfirmasi dalam 1.5s, steal dilanjut apa adanya.")

			return false
		end

		task.wait(0.12)

		return true
	end
end

if type(genv.__SenaV4DecomBoostCleanup) == "function" then
	pcall(genv.__SenaV4DecomBoostCleanup)
end

local t15, v390, v391

do
	local t16 = {}
	local u393 = false

	genv.__SenaV4DecomBoostCleanup = function()
		for _, v in ipairs(t16) do
			pcall(function()
				v:Disconnect()
			end)
		end

		table.clear(t16)
		u393 = false
	end

	local function v396()
		local ClientRenderedAssets = workspace:FindFirstChild("ClientRenderedAssets")

		if not ClientRenderedAssets then
			return
		end

		for _, child in ipairs(ClientRenderedAssets:GetChildren()) do
			pcall(function()
				child.Parent = nil
			end)
		end
	end
	local function v400(p82)
		return string.sub(p82.Name, 1, #tostring(LocalPlayer.UserId) + 1) == tostring(LocalPlayer.UserId) .. "_"
	end
	local function v401()
		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == "PlacedEggRenders" then
				for _, child2 in ipairs(child:GetChildren()) do
					pcall(function()
						if not child2:FindFirstChildOfClass("ProximityPrompt") then
							if not v400(child2) then
								child2.Parent = nil
							end
						end
					end)
				end
			end
		end
	end
	local function v406()
		for _, v in ipairs({
			"Transient",
			"__DEBRIS"
		}) do
			local v409 = workspace:FindFirstChild(v)

			if v409 then
				for _, child in ipairs(v409:GetChildren()) do
					if child.Name ~= "PlayerTrap" then
						if not child.Name:lower():find("trap") then
							continue
						end
					end

					pcall(function()
						child:Destroy()
					end)
				end
			end
		end
	end
	local function v412(p83)
		if not p83:FindFirstAncestor("SenaVisualBack") then
			if not p83:FindFirstAncestor("SenaVisualRemote") then
				local Tool = p83:FindFirstAncestorWhichIsA("Tool")

				return Tool ~= nil and Tool:GetAttribute("SenaVisual") ~= nil
			end
		end

		return true
	end

	t15 = {
		effects = {},
		parts = {},
		decals = {},
		snapshot = nil
	}

	local t17 = {
		PlusOne = true,
		SpeedGainPopup = true,
		SellPayout = true,
		SyncedIncomeCash = true
	}
	local t18 = {
		PlayerPlotSign = true,
		CanUpgrade = true,
		AlertGui = true,
		OfflineMoneyClaimBillboard = true
	}

	local function v416(descendant)
		pcall(function()
			if v412(descendant) then
				return
			end

			if t17[descendant.Name] then
				descendant:Destroy()

				return
			end

			if descendant:IsA("BillboardGui") and t18[descendant.Name] then
				if descendant.Enabled then
					t15.effects[descendant] = true
				end

				descendant.Enabled = false

				return
			end

			if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Beam") or descendant:IsA("Sparkles") or descendant:IsA("Fire") or descendant:IsA("Smoke") or descendant:IsA("PostEffect") then
				if descendant.Enabled then
					t15.effects[descendant] = true
				end

				descendant.Enabled = false
			end
		end)
	end
	local function v417()
		if u393 then
			return
		end

		u393 = true
		table.insert(t16, game.DescendantAdded:Connect(v416))
		table.insert(t16, workspace.ChildAdded:Connect(function(child)
			if child.Name == "ClientRenderedAssets" then
				v396()
				table.insert(t16, child.ChildAdded:Connect(function(child2)
					pcall(function()
						child2.Parent = nil
					end)
				end))
			elseif child.Name == "PlacedEggRenders" then
				v401()
				table.insert(t16, child.ChildAdded:Connect(function(child2)
					pcall(function()
						if not child2:FindFirstChildOfClass("ProximityPrompt") and not v400(child2) then
							child2.Parent = nil
						end
					end)
				end))
			elseif child.Name == "__DEBRIS" or child.Name == "Transient" then
				table.insert(t16, child.ChildAdded:Connect(function(child2)
					if child2.Name == "PlayerTrap" then
						pcall(function()
							child2:Destroy()
						end)

						return
					elseif child2.Name:lower():find("trap") then
						pcall(function()
							child2:Destroy()
						end)
					end
				end))
			end
		end))

		local ClientRenderedAssets = workspace:FindFirstChild("ClientRenderedAssets")

		if ClientRenderedAssets then
			table.insert(t16, ClientRenderedAssets.ChildAdded:Connect(function(child)
				pcall(function()
					child.Parent = nil
				end)
			end))
		end

		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == "PlacedEggRenders" then
				table.insert(t16, child.ChildAdded:Connect(function(child2)
					pcall(function()
						if not child2:FindFirstChildOfClass("ProximityPrompt") then
							if not v400(child2) then
								child2.Parent = nil
							end
						end
					end)
				end))
			end
		end
	end

	local u421 = false

	v390 = function()
		if u421 then
			return
		end

		u421 = true

		local Lighting = game:GetService("Lighting")

		if not t15.snapshot then
			local t19 = {}

			pcall(function()
				t19.quality = settings().Rendering.QualityLevel
				t19.throttle = settings().Physics.PhysicsEnvironmentalThrottle
				t19.technology = Lighting.Technology
				t19.shadows = Lighting.GlobalShadows
				t19.fogEnd = Lighting.FogEnd
				t19.brightness = Lighting.Brightness
				t19.ambient = Lighting.Ambient
				t19.outdoorAmbient = Lighting.OutdoorAmbient
			end)

			local Terrain = workspace:FindFirstChildOfClass("Terrain")

			if Terrain then
				pcall(function()
					t19.terrain = {
						WaterWaveSize = Terrain.WaterWaveSize,
						WaterWaveSpeed = Terrain.WaterWaveSpeed,
						WaterReflectance = Terrain.WaterReflectance,
						WaterTransparency = Terrain.WaterTransparency,
						Decoration = Terrain.Decoration
					}
				end)
				pcall(function()
					local Clouds = Terrain:FindFirstChildOfClass("Clouds")

					if Clouds then
						t19.cloudsEnabled = Clouds.Enabled
					end
				end)
			end

			pcall(function()
				local Preferences = ReplicatedStorage.Shared:FindFirstChild("Preferences")

				if Preferences then
					local module = require(Preferences)

					t19.prefs = {
						HideOtherPets = module.IsOn("HideOtherPets"),
						DisableVideos = module.IsOn("DisableVideos")
					}
				end
			end)

			if t19.quality == Enum.QualityLevel.Level01 then
				t19.quality = Enum.QualityLevel.Automatic
			end

			t15.snapshot = genv.__SenaV4DecomSnapshot or t19
			genv.__SenaV4DecomSnapshot = t15.snapshot
		end

		pcall(function()
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
			settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Always
			Lighting.Technology = Enum.Technology.Compatibility
			Lighting.GlobalShadows = false
			Lighting.FogEnd = 9e9
			Lighting.Brightness = 2
			Lighting.Ambient = Color3.new(1, 1, 1)
			Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
		end)

		local now = os.clock()

		for _, v in ipairs({
			workspace,
			Lighting
		}) do
			for _, descendant in ipairs(v:GetDescendants()) do
				if not v412(descendant) then
					if descendant:IsA("BasePart") then
						pcall(function()
							if not t15.parts[descendant] then
								t15.parts[descendant] = {
									descendant.Material,
									descendant.CastShadow,
									descendant:IsA("MeshPart") and descendant.RenderFidelity or nil
								}
							end

							descendant.Material = Enum.Material.SmoothPlastic
							descendant.CastShadow = false

							if descendant:IsA("MeshPart") then
								descendant.RenderFidelity = Enum.RenderFidelity.Performance
							end
						end)
					else
						if descendant:IsA("Decal") then
							pcall(function()
								if descendant.Texture ~= "" and not t15.decals[descendant] then
									t15.decals[descendant] = descendant.Texture
								end

								descendant.Texture = ""
							end)

							if os.clock() - now > 0.004 then
								task.wait()
								now = os.clock()
							end

							continue
						end

						if descendant:IsA("Texture") then
							pcall(function()
								if descendant.Texture ~= "" and not t15.decals[descendant] then
									t15.decals[descendant] = descendant.Texture
								end

								descendant.Texture = ""
							end)
						else
							v416(descendant)
						end
					end

					if os.clock() - now > 0.004 then
						task.wait()
						now = os.clock()
					end
				end
			end
		end

		local Terrain = workspace:FindFirstChildOfClass("Terrain")

		if Terrain then
			pcall(function()
				Terrain.WaterWaveSize = 0
				Terrain.WaterWaveSpeed = 0
				Terrain.WaterReflectance = 0
				Terrain.WaterTransparency = 1
				Terrain.Decoration = false

				local Clouds = Terrain:FindFirstChildOfClass("Clouds")

				if Clouds then
					Clouds.Enabled = false
				end
			end)
		end

		pcall(function()
			local Shared = ReplicatedStorage.Shared
			local Preferences = Shared:FindFirstChild("Preferences")

			if Preferences then
				local module = require(Preferences)

				module.Set("HideOtherPets", true)
				module.Set("DisableVideos", true)
			else
				local SettingsCmds = require(Shared.SettingsCmds)

				SettingsCmds.Write("HideOtherPets", true)
				SettingsCmds.Write("DisableVideos", true)
			end
		end)
		v396()
		v401()
		v406()
		v417()
		u421 = false
	end
	t15.revert = function()
		for _, v in ipairs(t16) do
			pcall(function()
				v:Disconnect()
			end)
		end

		table.clear(t16)
		u393 = false

		local snapshot = t15.snapshot
		local Lighting = game:GetService("Lighting")

		if snapshot then
			pcall(function()
				settings().Rendering.QualityLevel = snapshot.quality or Enum.QualityLevel.Automatic
			end)
			pcall(function()
				settings().Physics.PhysicsEnvironmentalThrottle = snapshot.throttle
			end)
			pcall(function()
				Lighting.Technology = snapshot.technology
				Lighting.GlobalShadows = snapshot.shadows
				Lighting.FogEnd = snapshot.fogEnd
				Lighting.Brightness = snapshot.brightness
				Lighting.Ambient = snapshot.ambient
				Lighting.OutdoorAmbient = snapshot.outdoorAmbient
			end)

			local Terrain = workspace:FindFirstChildOfClass("Terrain")

			if Terrain and snapshot.terrain then
				for k, v in pairs(snapshot.terrain) do
					pcall(function()
						Terrain[k] = v
					end)
				end

				if snapshot.cloudsEnabled ~= nil then
					pcall(function()
						local Clouds = Terrain:FindFirstChildOfClass("Clouds")

						if Clouds then
							Clouds.Enabled = snapshot.cloudsEnabled
						end
					end)
				end
			end

			if snapshot.prefs then
				pcall(function()
					local Preferences = require(ReplicatedStorage.Shared.Preferences)

					for k, pref in pairs(snapshot.prefs) do
						Preferences.Set(k, pref)
					end
				end)
			end
		end

		local n10 = 0

		for k, part in pairs(t15.parts) do
			if k.Parent then
				pcall(function()
					k.Material = part[1]
					k.CastShadow = part[2]

					if part[3] ~= nil and k:IsA("MeshPart") then
						k.RenderFidelity = part[3]
					end
				end)
			end

			n10 += 1

			if n10 % 400 == 0 then
				task.wait()
			end
		end

		for k, decal in pairs(t15.decals) do
			if k.Parent then
				pcall(function()
					k.Texture = decal
				end)
			end
		end

		for k in pairs(t15.effects) do
			if k.Parent then
				pcall(function()
					k.Enabled = true
				end)
			end
		end

		t15.parts = {}
		t15.decals = {}
		t15.effects = {}
		t15.snapshot = nil
	end
	genv.__SenaV4DecomBoostUndo = t15

	local u456 = false

	local function v457(p84)
		if not p84 or not p84:IsA("Model") then
			return
		end

		local match = p84.Name:match("^(%d+)_")
		local v459 = match and tonumber(match)

		if not v459 or v459 == LocalPlayer.UserId then
			return
		end

		for _, descendant in ipairs(p84:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.Transparency = 1
				descendant.CanCollide = false
			elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
				descendant.Transparency = 1
			elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Beam") then
				descendant.Enabled = false
			elseif descendant:IsA("BillboardGui") or descendant:IsA("SurfaceGui") then
				descendant.Enabled = false
			end
		end
	end
	local function v462()
		if senaV4Config._fpsEggsReady then
			return true
		end

		local u463 = false
		local ok, result = pcall(function()
			local v466 = require(game:GetService("ReplicatedStorage").Shared.Eggs.PlacedEggRenderer).GetRenderFolder()

			if not v466 then
				return
			end

			local children = v466:GetChildren()

			for _, child in ipairs(children) do
				v457(child)
			end

			v466.ChildAdded:Connect(function(child)
				task.defer(v457, child)
			end)
			u463 = true
		end)

		if not ok then
			warn("[FPSBoost] Gagal hide egg pemain lain:", result)

			return false
		end

		return u463
	end
	local function v470(p85)
		if not p85 then
			return
		end

		pcall(function()
			p85.Parent = nil
		end)
	end
	local function v471()
		if senaV4Config._fpsPetsReady then
			return true
		end

		local IsOn
		local ok, result = pcall(function()
			local Shared = game:GetService("ReplicatedStorage").Shared
			local Preferences = Shared:FindFirstChild("Preferences")

			if Preferences then
				local module = require(Preferences)

				module.Set("HideOtherPets", true)
				IsOn = module.IsOn
			else
				local SettingsCmds = require(Shared.SettingsCmds)

				SettingsCmds.Write("HideOtherPets", true)
				IsOn = SettingsCmds.Allows
			end
		end)
		local v479 = false

		if ok and IsOn then
			local ok2, result2 = pcall(IsOn, "HideOtherPets")

			v479 = ok2 and result2 == true
		end

		if ok then
			if v479 then
				local u482 = false
				local ok2, result2 = pcall(function()
					local ClientRenderedAssets = workspace:FindFirstChild("ClientRenderedAssets") or workspace:WaitForChild("ClientRenderedAssets", 10)

					if not ClientRenderedAssets then
						return
					end

					local children = ClientRenderedAssets:GetChildren()

					for _, child in ipairs(children) do
						v470(child)
					end

					ClientRenderedAssets.ChildAdded:Connect(function(child)
						task.defer(v470, child)
					end)
					u482 = true
				end)

				if not ok2 then
					warn("[FPSBoost] Gagal hide pet (manual):", result2)

					return false
				end

				return u482
			end
		end

		warn("[FPSBoost] Gagal set HideOtherPets bawaan game:", result or "setting belum aktif")

		return false
	end
	local function v489()
		if type(genv.__SenaV4SetCapFps) == "function" then
			pcall(genv.__SenaV4SetCapFps, 240)
		end

		pcall(function()
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		end)

		local function v490()
			UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
		end

		pcall(v490)
		pcall(function()
			require(game:GetService("ReplicatedStorage").Client.LightingsController):SetModifier("FPSBoost", function(p86)
				local v491 = table.clone(p86)

				v491.Bloom = nil
				v491.ColorCorrection = nil
				v491.SunRays = nil
				v491.DepthOfField = nil
				v491.Blur = nil
				v491.Clouds = nil
				v491.Atmosphere = nil
				v491.ShadowSoftness = 1

				return v491
			end, 100, 0)
		end)
		pcall(function()
			local Lighting = game:GetService("Lighting")

			Lighting.GlobalShadows = false
			Lighting.Technology = Enum.Technology.Compatibility
			Lighting.FogEnd = 9e9
			Lighting.Brightness = 2
		end)
		pcall(function()
			local Terrain = workspace:FindFirstChildOfClass("Terrain")

			if Terrain then
				Terrain.WaterWaveSize = 0
				Terrain.WaterWaveSpeed = 0
				Terrain.WaterReflectance = 0
				Terrain.WaterTransparency = 1
				Terrain.Decoration = false
			end
		end)
		pcall(function()
			local __DEBRIS = workspace:FindFirstChild("__DEBRIS")

			if __DEBRIS then
				for _, child in ipairs(__DEBRIS:GetChildren()) do
					if child.Name == "PlayerTrap" then
						pcall(function()
							child:Destroy()
						end)
					end
				end
			end
		end)
	end

	local color3 = Color3.fromRGB(120, 120, 120)

	local function v498(p87)
		if not p87 or not p87:IsA("BasePart") then
			return
		end

		p87.Material = Enum.Material.SmoothPlastic
		p87.Color = color3
		p87.CastShadow = false
	end
	local function v499(p88)
		if p88:IsA("ParticleEmitter") then
			p88.Enabled = false
			p88.Rate = 0
			pcall(function()
				p88:Clear()
			end)
		elseif p88:IsA("Trail") or p88:IsA("Beam") or p88:IsA("Smoke") or p88:IsA("Fire") or p88:IsA("Sparkles") or p88:IsA("PostEffect") or p88:IsA("Light") or p88:IsA("Highlight") or p88:IsA("Clouds") then
			p88.Enabled = false
		elseif p88:IsA("Atmosphere") then
			p88.Density = 0
			p88.Haze = 0
			p88.Glare = 0
		elseif p88:IsA("Explosion") then
			pcall(function()
				p88.Visible = false
			end)
		end
	end
	local function v500()
		if senaV4Config._fpsWorldReady then
			return true
		end

		local u501 = false
		local t20 = {}
		local ok, result = pcall(function()
			local function v505(p89)
				if v412(p89) then
					return
				end

				v498(p89)
				v499(p89)
			end

			local t21 = {
				workspace,
				game:GetService("Lighting")
			}

			for _, v in ipairs(t21) do
				table.insert(t20, v.DescendantAdded:Connect(function(descendant)
					task.defer(v505, descendant)
				end))
			end

			local t22 = {}

			for _, v in ipairs(t21) do
				for _, child in ipairs(v:GetChildren()) do
					table.insert(t22, child)
				end
			end

			local n11 = 0

			while #t22 > 0 do
				local v515 = table.remove(t22)

				v505(v515)

				for _, child in ipairs(v515:GetChildren()) do
					table.insert(t22, child)
				end

				n11 += 1

				if n11 >= 250 and #t22 > 0 then
					n11 = 0
					RunService.Heartbeat:Wait()
				end
			end

			u501 = true
		end)

		if ok then
			return u501
		end

		for _, v in ipairs(t20) do
			v:Disconnect()
		end

		warn("[FPSBoost] Gagal flatten material workspace:", result)

		return false
	end
	local function v520()
		if senaV4Config._fpsAreasReady then
			return true
		end

		local v521 = v14()
		local Areas = v521 and v521:FindFirstChild("Areas")
		local GuardAreas = Areas and Areas:FindFirstChild("GuardAreas")
		local Build = v521 and v521:FindFirstChild("Build")

		if not GuardAreas or not Build then
			return false
		end

		for _, child in ipairs(GuardAreas:GetChildren()) do
			local RequiredSpeedSign = child:FindFirstChild("RequiredSpeedSign")

			if RequiredSpeedSign then
				pcall(function()
					RequiredSpeedSign:Destroy()
				end)
			end
		end

		local MainMap = Build:FindFirstChild("MainMap")
		local Bases = MainMap and MainMap:FindFirstChild("Bases")

		local function v530(p90)
			if Bases and p90:IsDescendantOf(Bases) then
				return p90.Size.Y <= 5 and not string.find(string.upper(p90.Name), "WALL", 1, true)
			end

			local Parent = p90

			while true do
				if not Parent or Parent == Build then
					return false
				end

				if not string.find(string.upper(Parent.Name), "BOTTOM", 1, true) then
					Parent = Parent.Parent

					continue
				end

				break
			end

			return true
		end

		local t23 = {
			"ENCHANTED",
			"FUSEBIOME",
			"WISP",
			"BUTTERFLY",
			"MARKERS",
			"PORTAL",
			"TRIGGER"
		}

		local function v533(p91)
			if p91:FindFirstChildOfClass("TouchTransmitter") or p91:FindFirstChildWhichIsA("ProximityPrompt", true) then
				return true
			end

			local Parent = p91

			while true do
				if not Parent then
					return false
				end

				if Parent == Build then
					return false
				end

				local v535 = string.upper(Parent.Name)

				for _, v in ipairs(t23) do
					if string.find(v535, v, 1, true) then
						return true
					end
				end

				Parent = Parent.Parent
			end
		end
		local function v538(p92)
			if not p92:IsA("BasePart") then
				return
			end

			if v533(p92) then
				return
			end

			if v530(p92) then
				v498(p92)
			else
				pcall(function()
					p92:Destroy()
				end)
			end
		end

		local connection = Build.DescendantAdded:Connect(function(descendant)
			task.defer(v538, descendant)
		end)
		local n12 = 0
		local fpsAreaDeleted = 0

		for _, descendant in ipairs(Build:GetDescendants()) do
			local v544 = descendant.Parent ~= nil

			v538(descendant)

			if v544 and descendant.Parent == nil then
				fpsAreaDeleted += 1
			end

			n12 += 1

			if n12 >= 250 then
				n12 = 0
				RunService.Heartbeat:Wait()
			end
		end

		senaV4Config._fpsAreaListener = connection
		senaV4Config._fpsAreaDeleted = fpsAreaDeleted
		senaV4Config._fpsAreasReady = true

		return true
	end
	local function v545()
		if senaV4Config._fpsPlotsReady then
			return true
		end

		local u546 = false
		local ok, result = pcall(function()
			local PlotState2 = require(game:GetService("ReplicatedStorage").Client.PlotState)

			if PlotState2.GetMySlot() == nil then
				warn("[FPSBoost] Slot plot kita belum ke-resolve, skip delete plot dulu (biar aman).")

				return
			end

			local function v550(p93)
				local v551 = PlotState2.GetMySlot()

				return v551 ~= nil and p93.Name == tostring(v551)
			end

			local Plots = PlotState2.GetPlotsFolder() or workspace:WaitForChild("Plots", 10)

			if not Plots then
				warn("[FPSBoost] workspace.Plots gak ketemu sama sekali.")

				return
			end

			local children = Plots:GetChildren()
			local n13 = 0

			for _, child in ipairs(children) do
				if not v550(child) and pcall(function()
					child:Destroy()
				end) then
					n13 += 1
				end
			end

			Plots.ChildAdded:Connect(function(child)
				task.defer(function()
					if child.Parent then
						if not v550(child) then
							pcall(function()
								child:Destroy()
							end)
						end
					end
				end)
			end)
			u546 = true
		end)

		if ok then
			return u546
		end

		warn("[FPSBoost] Gagal delete plot pemain lain:", result)

		return false
	end
	local function v557()
		if senaV4Config._fpsTreadmillsReady then
			return true
		end

		local u558 = false
		local ok, result = pcall(function()
			local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
			local PlotState2 = require(ReplicatedStorage2.Client.PlotState)
			local v563
			local Modules = ReplicatedStorage2.Client:FindFirstChild("Modules") or ReplicatedStorage2.Client:WaitForChild("Modules", 10)
			local RuntimeInstanceRegistry = Modules and (Modules:FindFirstChild("RuntimeInstanceRegistry") or Modules:WaitForChild("RuntimeInstanceRegistry", 10))

			if RuntimeInstanceRegistry then
				local ok, result = pcall(require, RuntimeInstanceRegistry)

				if ok then
					v563 = result
				end
			end

			local __ClientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders") or workspace:WaitForChild("__ClientTreadmillRenders", 10)

			if not __ClientTreadmillRenders then
				return
			end

			local function v569()
				local v570 = PlotState2.GetMySlot()

				if v570 == nil then
					return nil
				end

				local v571 = __ClientTreadmillRenders:FindFirstChild("TreadmillRender_" .. tostring(v570))

				if v571 then
					return v571
				end

				local Peek = v563 and (v563.Peek or v563.Get)

				if not Peek then
					return nil
				end

				local ok, result = pcall(Peek, "TreadmillPlotRender", tostring(v570))

				if ok then
					return result
				end

				return nil
			end
			local function v575(p94)
				local v576 = v569()

				if v576 and p94 == v576 then
					return true
				end

				local ok, result = pcall(function()
					return p94:GetPivot().Position
				end)

				if not ok then
					return true
				end

				local ok2, result2 = pcall(PlotState2.IsWorldPositionWithinLocalPlotBounds, result)
				local v581 = ok2 and result2

				return v581
			end

			local children = __ClientTreadmillRenders:GetChildren()
			local n14 = 0

			for _, child in ipairs(children) do
				if child:IsA("Model") and not v575(child) and pcall(function()
					child:Destroy()
				end) then
					n14 += 1
				end
			end

			__ClientTreadmillRenders.ChildAdded:Connect(function(child)
				task.defer(function()
					if child.Parent and child:IsA("Model") and not v575(child) then
						pcall(function()
							child:Destroy()
						end)
					end
				end)
			end)
			u558 = true
		end)

		if ok then
			return u558
		end

		warn("[FPSBoost] Gagal delete treadmill pemain lain:", result)

		return false
	end

	v391 = function()
		if u456 or senaV4Config._fpsBoostApplying then
			return
		end

		senaV4Config._fpsBoostApplying = true

		local ok, result = pcall(function()
			v489()
			senaV4Config._fpsPlotsReady = v545() == true
			senaV4Config._fpsTreadmillsReady = v557() == true
			senaV4Config._fpsAreasReady = v520() == true
			senaV4Config._fpsWorldReady = v500() == true
			senaV4Config._fpsPetsReady = v471() == true
			senaV4Config._fpsEggsReady = v462() == true
			u456 = senaV4Config._fpsEggsReady and senaV4Config._fpsPetsReady and senaV4Config._fpsWorldReady and senaV4Config._fpsPlotsReady and senaV4Config._fpsTreadmillsReady and senaV4Config._fpsAreasReady
		end)

		senaV4Config._fpsBoostApplying = nil

		if not ok then
			warn("[FPSBoost] Gagal menerapkan FPS Boost:", result)
		end
	end
end

local function v588(p95, p96, p97)
	local u589 = true

	pcall(function()
		local filterDescendantsInstances = { p97 }
		local raycastParams = RaycastParams.new()

		raycastParams.FilterType = Enum.RaycastFilterType.Exclude

		local v592 = p95

		for i = 1, 8 do
			raycastParams.FilterDescendantsInstances = filterDescendantsInstances

			local v594 = p96 - v592

			if v594.Magnitude < 1 then
				break
			end

			local hit = workspace:Raycast(v592, v594, raycastParams)

			if not hit then
				break
			end

			if not hit.Instance.CanCollide then
				table.insert(filterDescendantsInstances, hit.Instance)
				v592 = hit.Position + v594.Unit * 0.1

				continue
			end

			u589 = false

			break
		end
	end)

	return u589
end

local t24 = {}
local ProximityPromptService = game:GetService("ProximityPromptService")
local t25 = {
	TITLES = {
		auto_steal = "Auto Steal",
		mech_boss = "Mech Boss",
		butterfly = "Butterfly Bloom",
		auto_place = "Auto Place",
		treadmill = "Treadmill"
	},
	ORDER = {
		"auto_steal",
		"mech_boss",
		"butterfly",
		"auto_place",
		"treadmill"
	}
}

do
	local function v599(p98)
		if p98 == "auto_steal" then
			local __SenaV4StealWantsCharacter = genv.__SenaV4StealWantsCharacter

			return __SenaV4StealWantsCharacter ~= nil and __SenaV4StealWantsCharacter() == true
		end

		if p98 ~= "mech_boss" then
			if p98 == "butterfly" then
				local __SenaV4ButterflyRuntime = genv.__SenaV4ButterflyRuntime

				return __SenaV4ButterflyRuntime ~= nil and __SenaV4ButterflyRuntime.wantsCharacter == true
			end

			if p98 == "auto_place" then
				return senaV4Config.IsPlacing == true
			end

			return false
		end

		if LocalPlayer:GetAttribute("InScrambleArena") == true then
			return true
		end

		if senaV4Config.ScrambleBossAuto ~= true then
			return false
		end

		local ScrambleArena = workspace:FindFirstChild("ScrambleArena")
		local v603 = workspace:FindFirstChild("ScrambleArenaPortal") ~= nil

		if not v603 then
			v603 = ScrambleArena ~= nil

			if v603 then
				v603 = tostring(ScrambleArena:GetAttribute("Phase") or "") ~= ""
			end

			v603 = v603 and ScrambleArena:GetAttribute("Phase") ~= "Defeated"
		end

		return v603
	end
	local function v604(p99)
		if p99 == "auto_steal" then
			local __SenaV4EggRuntime = genv.__SenaV4EggRuntime

			return __SenaV4EggRuntime ~= nil and __SenaV4EggRuntime.enabled == true and (__SenaV4EggRuntime.running == true or __SenaV4EggRuntime.carry ~= nil and __SenaV4EggRuntime.carry.active == true)
		end

		if p99 == "mech_boss" then
			return LocalPlayer:GetAttribute("InScrambleArena") == true
		end

		if p99 ~= "butterfly" then
			if p99 == "auto_place" then
				return senaV4Config.IsPlacing == true
			end

			return false
		end

		local __SenaV4ButterflyRuntime = genv.__SenaV4ButterflyRuntime

		return __SenaV4ButterflyRuntime ~= nil and __SenaV4ButterflyRuntime.active == true
	end

	t25.blocker = function(p100)
		if p100 ~= "mech_boss" and LocalPlayer:GetAttribute("InScrambleArena") == true then
			return "mech_boss"
		end

		for _, v in ipairs(t25.ORDER) do
			if v == p100 then
				return nil
			end

			if v599(v) then
				return v
			end
		end

		return nil
	end
	t25.holder = function(p101)
		for _, v in ipairs(t25.ORDER) do
			if v ~= p101 and v ~= "treadmill" then
				if v604(v) then
					return v
				end
			end
		end

		return nil
	end
end

local v611, v612, v613, v614, v615

do
	local function v616()
		local t26 = {}

		t26.__index = t26

		local t27 = {
			auto_place = true,
			auto_fuse = true,
			equip_best = true
		}
		local t28 = {
			auto_steal = 100,
			auto_hatch = 80,
			auto_place = 70,
			auto_fuse = 50,
			equip_best = 40,
			rewards = 20
		}

		local function v620(p102)
			local t29 = {}

			for k, v in pairs(p102) do
				t29[k] = v
			end

			return t29
		end

		t26.new = function()
			local obj = setmetatable({}, t26)

			obj.destroyed = false
			obj.active = nil
			obj.background = nil
			obj.reservations = {}
			obj.listeners = {}
			obj.backgroundListeners = {}
			obj.serial = 0

			return obj
		end
		t26._snapshot = function(p103)
			local active = p103.active

			return {
				busy = active ~= nil,
				operation = active and active.owner or nil,
				priority = active and active.priority or 0,
				reservedCount = active and #active.uids or 0,
				reservations = v620(p103.reservations)
			}
		end
		t26._emit = function(p104)
			local v626 = p104:_snapshot()

			for k in pairs(p104.listeners) do
				local ok, result = pcall(k, v626)

				if not ok then
					warn("[StealAnEgg] Coordinator listener failed:", result)
				end
			end
		end
		t26._emitBackground = function(p105)
			local background = p105.background
			local t30 = {
				busy = background ~= nil
			}
			local owner = background and background.owner

			t30.operation = owner or nil

			for k in pairs(p105.backgroundListeners) do
				local ok, result = pcall(k, t30)

				if not ok then
					warn("[StealAnEgg] Background coordinator listener failed:", result)
				end
			end
		end
		t26.subscribe = function(p106, p107)
			p106.listeners[p107] = true
			pcall(p107, p106:_snapshot())

			local function v636()
				p106.listeners[p107] = nil
			end

			return v636
		end
		t26.subscribeBackground = function(p108, p109)
			p108.backgroundListeners[p109] = true
			pcall(p109, {
				busy = p108.background ~= nil,
				operation = p108.background and p108.background.owner or nil
			})

			local function v637()
				p108.backgroundListeners[p109] = nil
			end

			return v637
		end
		t26.getSnapshot = function(p110)
			return p110:_snapshot()
		end
		t26.isBackgroundBusy = function(p111)
			return p111.background ~= nil
		end
		t26.isReserved = function(p112, p113, p114)
			local v638 = p112.reservations[p113]

			return v638 ~= nil and v638 ~= p114
		end
		t26.tryAcquire = function(p115, p116, p117, p118)
			if p115.destroyed then
				return nil, "Coordinator destroyed"
			end

			if type(p116) ~= "string" or p116 == "" then
				return nil, "Invalid operation owner"
			end

			if p115.active then
				return nil, "Busy: " .. p115.active.owner
			end

			if p115.background and t27[p116] then
				return nil, "Busy: background " .. p115.background.owner
			end

			local t31 = {}
			local t32 = {}
			local ipairs_ = ipairs
			local v642 = type(p117) == "table" and p117 or {}

			for _, v in ipairs_(v642) do
				if type(v) == "string" and v ~= "" and not t32[v] then
					if p115:isReserved(v, p116) then
						return nil, "UID reserved by " .. tostring(p115.reservations[v])
					end

					t32[v] = true
					table.insert(t31, v)
				end
			end

			p115.serial += 1

			local active = {
				id = p115.serial,
				lane = "foreground",
				owner = p116,
				priority = tonumber(p118) or t28[p116] or 0,
				uids = t31,
				released = false
			}

			p115.active = active

			for _, v in ipairs(t31) do
				p115.reservations[v] = p116
			end

			p115:_emit()

			return active
		end
		t26.tryAcquireBackground = function(p119, p120, p121)
			if p119.destroyed then
				return nil, "Coordinator destroyed"
			end

			if type(p120) ~= "string" or p120 == "" then
				return nil, "Invalid operation owner"
			end

			if p119.background then
				return nil, "Background busy: " .. p119.background.owner
			end

			if p119.active and t27[p119.active.owner] then
				return nil, "Foreground tool busy: " .. p119.active.owner
			end

			local t33 = {}
			local t34 = {}
			local ipairs_ = ipairs
			local v651 = type(p121) == "table" and p121 or {}

			for _, v in ipairs_(v651) do
				if type(v) == "string" and v ~= "" and not t34[v] then
					if p119:isReserved(v, p120) then
						return nil, "UID reserved by " .. tostring(p119.reservations[v])
					end

					t34[v] = true
					table.insert(t33, v)
				end
			end

			p119.serial += 1

			local background = {
				id = p119.serial,
				lane = "background",
				owner = p120,
				priority = 0,
				uids = t33,
				released = false
			}

			p119.background = background

			for _, v in ipairs(t33) do
				p119.reservations[v] = p120
			end

			p119:_emitBackground()

			return background
		end
		t26.release = function(p122, p123)
			if type(p123) ~= "table" or p123.released then
				return false
			end

			p123.released = true

			local ipairs_ = ipairs
			local uids = p123.uids or {}

			for _, uid in ipairs_(uids) do
				if p122.reservations[uid] == p123.owner then
					p122.reservations[uid] = nil
				end
			end

			local v661 = p122.active == p123

			if v661 then
				p122.active = nil
			elseif p122.background == p123 then
				p122.background = nil
				p122:_emitBackground()
			end

			if v661 then
				p122:_emit()
			end

			return true
		end
		t26.destroy = function(p124)
			if p124.destroyed then
				return
			end

			p124.destroyed = true

			if p124.active then
				p124:release(p124.active)
			end

			if p124.background then
				p124:release(p124.background)
			end

			table.clear(p124.reservations)
			table.clear(p124.listeners)
			table.clear(p124.backgroundListeners)
		end

		return t26
	end

	local v662 = v616()

	local function v663()
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local Areas = require(ReplicatedStorage2.Data.Areas)
		local Assets = require(ReplicatedStorage2.Data.Assets)
		local Guards = require(ReplicatedStorage2.Data.Guards)
		local Mutations = require(ReplicatedStorage2.Shared.Modules.Mutations)
		local t35 = {
			Common = 1,
			Uncommon = 2,
			Rare = 3,
			Epic = 4,
			Legendary = 5,
			Mythic = 6,
			Cosmic = 7,
			Secret = 8,
			Eternal = 9,
			Divine = 10
		}

		local function v670(p125)
			local t36 = {}
			local t37 = {}

			for _, v in ipairs(p125) do
				if type(v) == "string" and v ~= "" and not t36[v] then
					t36[v] = true
					table.insert(t37, v)
				end
			end

			table.sort(t37)

			return t37
		end

		return {
			rarityRank = function(p126)
				return t35[p126] or 0
			end,
			getRarities = function()
				local t38 = {}

				for k in pairs(Assets.ByRarity) do
					table.insert(t38, k)
				end

				table.sort(t38, function(p127, p128)
					local v677 = t35[p127] or 99
					local v678 = t35[p128] or 99

					if v677 == v678 then
						return tostring(p127) < tostring(p128)
					end

					return v677 < v678
				end)

				return t38
			end,
			getNames = function()
				local t39 = {}

				for _, v in pairs(Assets.Directory) do
					table.insert(t39, v.DisplayName or v._id)
				end

				return v670(t39)
			end,
			getAreas = function()
				local t40 = {}

				for k, v in pairs(Areas.Directory) do
					if type(k) == "string" and type(v) == "table" and type(v.DropTable) == "table" then
						table.insert(t40, k)
					end
				end

				table.sort(t40, function(p129, p130)
					local v685 = Guards.Directory[p129]
					local v686 = Guards.Directory[p130]
					local WalkSpeed = v685 and v685.WalkSpeed or math.huge
					local WalkSpeed2 = v686 and v686.WalkSpeed

					WalkSpeed2 = WalkSpeed2 or math.huge

					if WalkSpeed == WalkSpeed2 then
						return p129 < p130
					end

					return WalkSpeed < WalkSpeed2
				end)

				return t40
			end,
			getMutations = function()
				local t41 = {}
				local v690 = Mutations.Ids()
				local pairs_ = pairs
				local v692 = type(v690) == "table" and v690 or {}

				for k in pairs_(v692) do
					if type(k) == "string" and k ~= Mutations.NO_MUTATION then
						local ok, result = pcall(Mutations.LabelOf, k)

						table.insert(t41, ok and type(result) == "string" and result ~= "" and result or k)
					end
				end

				return v670(t41)
			end,
			resolveMutationId = function(p131)
				if type(p131) ~= "string" then
					return nil
				end

				if Mutations.IdSet[p131] then
					return p131
				end

				for k in pairs(Mutations.Ids()) do
					if k ~= Mutations.NO_MUTATION and Mutations.LabelOf(k) == p131 then
						return k
					end
				end

				return nil
			end,
			resolve = function(p132)
				local v697 = p132 and Assets.Directory[p132.AssetCategory]
				local Rarity = v697 and v697.Rarity
				local DisplayName = Rarity and (Rarity.DisplayName or Rarity._id) or "Unknown"

				return {
					name = v697 and (v697.DisplayName or v697._id) or p132 and p132.AssetCategory or "Unknown",
					category = p132 and p132.AssetCategory or "Unknown",
					rarity = DisplayName,
					rarityRank = t35[DisplayName] or 0,
					rarityColor = Rarity and Rarity.Color or nil,
					icon = v697 and type(v697.Icon) == "string" and v697.Icon or nil
				}
			end
		}
	end

	v611 = v663()

	local function v700(p133)
		if not p133 then
			return nil
		end

		for _, descendant in ipairs(p133:GetDescendants()) do
			if not descendant:IsA("ModuleScript") or not (descendant.Name == "Limits" and descendant.Parent) then
				continue
			end

			if not descendant.Parent:FindFirstChild("Surface") then
				continue
			end

			if descendant.Parent:FindFirstChild("Runtime") then
				return descendant
			end
		end

		return nil
	end

	local v703 = v700(LocalPlayer:FindFirstChildOfClass("PlayerScripts")) or v700(game:GetService("StarterPlayer"):FindFirstChild("StarterPlayerScripts"))

	local function v704()
	local Players2 = game:GetService("Players")
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local RunService2 = game:GetService("RunService")
	local localPlayer2 = Players2.LocalPlayer
	local EggState2 = require(ReplicatedStorage2.Client.EggState)
	local Remotes = require(ReplicatedStorage2.Shared.Remotes)
	local eggWorld = Remotes.EggWorld

	local _fpsN = 60
	RunService2.Heartbeat:Connect(function(dt)
		if dt and dt > 0 then
			_fpsN = _fpsN * 0.9 + (1 / dt) * 0.1
		end
	end)
	local function fn3()
		return _fpsN
	end

	local AreaEggs = require(ReplicatedStorage2.Shared.Types.AreaEggs)
	local AreaEggSlotIdentity = require(ReplicatedStorage2.Shared.Util.AreaEggSlotIdentity)
	local AreaEggResetWall3 = require(ReplicatedStorage2.Client.AreaEggResetWall)
	local SpeedPowerProjection = require(ReplicatedStorage2.Client.SpeedPowerProjection)
	local TreadmillUtil = require(ReplicatedStorage2.Shared.Util.TreadmillUtil)
	local EggRecords = require(ReplicatedStorage2.Shared.Util.EggRecords)
	local AssetEarnings = require(ReplicatedStorage2.Shared.Util.AssetEarnings)
	local Save = require(ReplicatedStorage2.Shared.Save)
	local PlotState2 = require(ReplicatedStorage2.Client.PlotState)
	local n8 = 10
	local n9 = 20
	local n10 = 100
	local n11 = 60
	local n12 = 0.05
	local n13 = 200
	local n14 = 1000
	local n15 = 600
	local speed = 3000

	local function fn61()
		return genv.__SenaV4AdminBoost == true and speed or n14
	end

	local str3 = "__SenaV4StealAnEggMovementSpoof"
	local n16 = 436
	local str4 = "__SenaV4StealAnEggIntegritySpoof"
	local tbl11 = {Divine = true, Eternal = true}
	local str5 = "ClientCharacter: GetDebugSnapshot"
	local tbl12 = {"LastObservedSample", "LastSample", "LastGoodSample", "LastGameplayTrustedSample", "LastValidatedSample", "LastValidatedGroundedSample", "LastConfirmedGroundSample", "CandidateGroundedSample"}
	local n17 = 0.15
	local n18 = 8
	local n19 = 1
	local name2 = "__SenaV4HoverPad"
	local str6 = "SenaV4RuntimeOwner"
	local vector2 = Vector3.new(542.93, 71.5, -405.58)
	local n20 = 612
	local tbl13 = {-364.3, -367.21, -371.12, -375.65}
	CFrame.new(599.8, 113.5, -325)
	Vector3.new(599.8, 70, -325)
	local n21 = 3
	local n22 = 0.85
	local n23 = 2
	local n24 = 3000
	local cframe = CFrame.new(554.071, 70.276, -395.573, 0, 0, 1, 0, 1, 0, -1, 0, 0)
	local n25 = 14
	local n26 = 0.7
	local n27 = 3
	local n28 = 6
	local n29 = 0.45
	local n30 = 30
	local n31 = 18
	local n32 = 0.35
	local n33 = 2
	local n34 = 0.1
	local name3 = "__SenaV4TreadmillDecoy"
	local tbl14 = {Script = true, LocalScript = true, BillboardGui = true, Sound = true}
	local n35 = 0.25
	local n36 = 5
	local n37 = 2
	local n38 = 45
	local n39 = 10
	local n40 = 0.03
	local n41 = 0.65
	local n42 = 0.35
	local n43 = 0.08
	local n44 = 1.35
	local n45 = 0.15
	local n46 = 24
	local n47 = 2
	local n48 = 0.5
	local n49 = 0.45
	local n50 = 0.4
	local str7 = "PlayerTrap"
	local str8 = "Trap"
	local index = {}
	index.__index = index
	local Stats = game:GetService("Stats")

	local function fn62(arg, firstAreaSlotKey)
		local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			pcall(function()
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)
		end

		local n51 = 0

		pcall(function()
			n51 = Stats.Network.ServerStats.Ping:GetValue()
		end)

		task.wait(math.max(0.3, n51 * 2.5 / 1000))
		local tbl15 = {Uid = arg}

		if firstAreaSlotKey ~= nil then
			tbl15.FirstAreaSlotKey = firstAreaSlotKey
		end

		firstAreaSlotKey, arg = eggWorld.AskFieldEggCarry:InvokeServer(tbl15)
		return firstAreaSlotKey == true, typeof(arg) == "string" and arg or nil
	end

	local function fn63(arg, arg2, arg3)
		local connection6 = arg:Connect(arg2)
		table.insert(arg3, connection6)
		return connection6
	end

	local function fn64(arg)
		for i, v8 in ipairs(arg) do
			pcall(v8.Disconnect, v8)
		end

		table.clear(arg)
	end

	local function fn65(arg, arg2)
		for i, v8 in ipairs(arg or {}) do
			if v8 == arg2 then
				return true
			end
		end

		return false
	end

	local fn66

	local function fn67(arg)
		local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			humanoidRootPart:SetAttribute("KillPartIgnore", true)
		end
	end

	local function fn68(arg)
		if arg._healthPinner then
			pcall(arg._healthPinner.Disconnect, arg._healthPinner)
			arg._healthPinner = nil
		end

		if arg._healthChangedConnection then
			pcall(arg._healthChangedConnection.Disconnect, arg._healthChangedConnection)
			arg._healthChangedConnection = nil
		end
	end

	local function fn69(arg, arg2)
		fn68(arg)
		local humanoid = arg2 and arg2:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = arg2 and arg2:FindFirstChild("HumanoidRootPart")
		if not humanoid then
			return false
		end
		local health = math.max(humanoid.MaxHealth, 100)
		local flag5 = false
		local n51 = 0

		local function fn70()
			if flag5 then
				return
			elseif arg.destroyed then
				return
			elseif localPlayer2.Character ~= arg2 then
				return
			elseif not humanoid.Parent then
				return
			end

			local now = os.clock()
			if now - n51 < 0.1 and (humanoid.Health > 0 and humanoid:GetState() ~= Enum.HumanoidStateType.Dead) then
				return
			end
			n51, flag5 = now, true

			pcall(function()
				humanoid.BreakJointsOnDeath = false
				humanoid.RequiresNeck = false
				humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
				humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
				humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)

				if humanoid.Health <= 0 then
					humanoid.Health = health
				end

				if humanoid:GetState() == Enum.HumanoidStateType.Dead then
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end

				if humanoidRootPart and (humanoidRootPart.Parent == arg2 and humanoidRootPart.Anchored) then
					humanoidRootPart.Anchored = false
				end
			end)

			flag5 = false
		end

		fn70()

		arg._healthChangedConnection = humanoid.HealthChanged:Connect(function(health2)
			if health2 <= 0 then
				fn70()
			elseif health2 < health then
				fn70()
			end
		end)

		arg._healthPinner = RunService2.Heartbeat:Connect(fn70)
		return true
	end

	local function fn70(arg)
		local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			return
		end

		pcall(function()
			if humanoid.Health <= 0 then
				humanoid.Health = math.max(humanoid.MaxHealth, 1)
			end

			humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
			humanoid.BreakJointsOnDeath = true
			humanoid.RequiresNeck = true
		end)
	end

	local function fn71()
		return getgenv and getgenv() or _G
	end

	local function fn72()
		if type(getconnections) ~= "function" then
			return false
		elseif type(debug) ~= "table" then
			return false
		elseif type(debug.info) ~= "function" then
			return false
		elseif type(debug.getupvalue) ~= "function" then
			return false
		end

		local ok, result = pcall(getconnections, localPlayer2.Idled)

		if ok then
			if type(result) ~= "table" then
				return false
			end
		else
			return false
		end

		local str9 = ".PlayerScripts.Game.AntiAFK"

		for i, v8 in ipairs(result) do
			local function_ = v8.Function

			if type(function_) == "function" and type(v8.Disable) == "function" then
				local ok2, result2 = pcall(debug.info, function_, "s")
				local ok3, result3 = pcall(debug.getupvalue, function_, 1)
				if ok2 and (type(result2) == "string" and (result2:sub(-27) == str9 and (ok3 and type(result3) == "number"))) then
					return (pcall(v8.Disable, v8))
				end
			end
		end

		return false
	end

	local function fn73()
		local v8 = fn71()
		local tbl15 = v8[str3]

		if type(tbl15) ~= "table" or tbl15.Version ~= n16 then
			if type(tbl15) == "table" then
				tbl15.Enabled = false
			end

			tbl15 = {Version = n16, Installed = false, Enabled = false, Mode = "StateBaseline", Humanoid = nil, RootPart = nil, WalkSpeed = n15}
			v8[str3] = tbl15
		end

		return tbl15
	end

	local function fn74(arg, arg2)
		local v8 = fn73()
		if not v8 then
			return false
		end
		local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
		v8.Humanoid = humanoid
		v8.RootPart = humanoidRootPart
		v8.WalkSpeed = math.clamp(tonumber(arg2) or n15, n13, n14 * n44)
		v8.Enabled = false
		return humanoid ~= nil and humanoidRootPart ~= nil
	end

	local function fn75()
		local v8 = fn71()[str3]

		if type(v8) == "table" then
			v8.Enabled = false
			v8.Humanoid = nil
			v8.RootPart = nil
		end
	end

	local function fn76(arg, arg2, arg3)
		local v8

		if type(getcallbackvalue) == "function" and type(debug) == "table" and type(debug.getupvalue) == "function" then
			local signal2 = ReplicatedStorage2:FindFirstChild("Packages") and ReplicatedStorage2.Packages:FindFirstChild("Signal")

			if signal2 then
				local ok, result = pcall(require, signal2)

				if ok and type(result) == "table" and type(result.Invoked) == "function" then
					local ok2, result2 = pcall(result.Invoked, str5)

					if ok2 and result2 then
						local ok3, result3 = pcall(getcallbackvalue, result2, "OnInvoke")

						if ok3 and type(result3) == "function" then
							local ok4, result4 = pcall(debug.getinfo, result3)

							if ok4 then
								local function fn77(arg4, arg5, arg6)
									if v8 then
										return
									elseif type(arg4) ~= "table" then
										return
									elseif arg5 > 3 then
										return
									elseif arg6[arg4] then
										return
									end

									arg6[arg4] = true
									if rawget(arg4, "Player") == arg and (rawget(arg4, "Character") == arg.Character and (rawget(arg4, "Humanoid") == arg2 and (rawget(arg4, "RootPart") == arg3 and (type(rawget(arg4, "SampleHistory")) == "table" and type(rawget(arg4, "Evidence")) == "table")))) then
										v8 = arg4
										return
									end
									local n51 = 0

									for k, v9 in pairs(arg4) do
										n51 += 1
										if n51 > 128 then
											break
										end

										if type(v9) == "table" then
											fn77(v9, arg5 + 1, arg6)
										end
									end
								end

								for i = 1, result4.nups or 0, 1 do
									local ok5, result5 = pcall(debug.getupvalue, result3, i)

									if ok5 and type(result5) == "table" then
										fn77(result5, 0, {})
										if v8 then
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end

		if not v8 and type(getgc) == "function" then
			local ok, result = pcall(getgc, true)

			if ok and type(result) == "table" then
				for i, v9 in ipairs(result) do
					if type(v9) == "table" and rawget(v9, "Player") == arg and rawget(v9, "Character") == arg.Character and rawget(v9, "Humanoid") == arg2 and rawget(v9, "RootPart") == arg3 and type(rawget(v9, "SampleHistory")) == "table" and type(rawget(v9, "Evidence")) == "table" then
						v8 = v9
						break
					end
				end
			end
		end

		return v8
	end

	local tbl15 = {busy = false, nextAt = 0, misses = 0, found = nil}

	local function fn77(arg, arg2, arg3)
		local found = tbl15.found
		if type(found) == "table" and (rawget(found, "Player") == arg and (rawget(found, "Character") == arg.Character and (rawget(found, "Humanoid") == arg2 and rawget(found, "RootPart") == arg3))) then
			return found
		end

		if tbl15.busy then
			return nil
		elseif os.clock() < tbl15.nextAt then
			return nil
		end

		tbl15.busy = true

		task.spawn(function()
			task.wait()
			local ok, result = pcall(fn76, arg, arg2, arg3)
			local v8 = ok and result or nil
			tbl15.found = v8
			tbl15.misses = v8 and 0 or tbl15.misses + 1
			tbl15.nextAt = os.clock() + (v8 and 0.2 or (tbl15.misses >= 5 and 10 or 1))
			tbl15.busy = false
		end)

		return nil
	end

	local function fn78(arg, arg2, arg3)
		if type(arg) ~= "table" then
			return false
		end
		local value = rawget(arg, "RootPart")
		local cFrame = value and value.Parent and value.CFrame or nil
		local position = cFrame and cFrame.Position or nil
		local vector3 = typeof(arg3) == "Vector3" and arg3 or Vector3.new(0, 0, 0)

		local function fn79(arg4)
			if type(arg4) == "table" then
				rawset(arg4, "WalkSpeed", arg2)

				if cFrame then
					rawset(arg4, "CFrame", cFrame)
					rawset(arg4, "Position", position)
					rawset(arg4, "LinearVelocity", vector3)
					rawset(arg4, "AngularVelocity", (Vector3.new(0, 0, 0)))
				end
			end
		end

		for i, v8 in ipairs(tbl12) do
			fn79(rawget(arg, v8))
		end

		for k, v8 in pairs(rawget(arg, "SampleHistory") or {}) do
			fn79(v8)
		end

		for k, v8 in pairs(rawget(arg, "SafeGroundCheckpoints") or {}) do
			fn79(v8)
		end

		local value2 = rawget(arg, "Evidence")

		if type(value2) == "table" then
			value2.Speed = 0
			value2.Teleport = 0
			value2.Flight = 0
		end

		local value3 = rawget(arg, "ImpulseContext")

		if type(value3) == "table" then
			local maxHorizontalSpeed = math.max(tonumber(value3.MaxHorizontalSpeed) or 0, arg2)
			local n51 = math.max((tonumber(value3.ExpiresAt) or 0) - (tonumber(value3.StartedAt) or 0), n45)
			value3.MaxHorizontalSpeed = maxHorizontalSpeed

			if position then
				value3.OriginPosition = position
			end

			value3.MaxHorizontalDistance = math.max(tonumber(value3.MaxHorizontalDistance) or 0, maxHorizontalSpeed * n51 + n46 * 2)
			fn79(value3.PreMovementSafeSample)
		end

		if rawget(arg, "CorrectionContext") == nil then
			rawset(arg, "FirstSuspiciousAt", nil)

			if rawget(arg, "ThreatLevel") == "Observing" then
				rawset(arg, "ThreatLevel", "Trusted")
			end
		end

		return true
	end

	local function fn79()
		local v8 = fn71()
		local tbl16 = v8[str4]

		if type(tbl16) ~= "table" then
			tbl16 = {}
			v8[str4] = tbl16
		end

		return tbl16
	end

	local function fn80(arg, arg2, arg3)
		return type(arg) == "table" and rawget(arg, "Player") == localPlayer2 and rawget(arg, "Character") == localPlayer2.Character and rawget(arg, "Humanoid") == arg2 and rawget(arg, "RootPart") == arg3
	end

	local function fn81(arg, arg2, arg3)
		return fn80(arg, arg2, arg3)
	end

	local function fn82(humanoid, rootPart, arg)
		local v8 = fn79()
		local state = v8.State

		if fn80(state, humanoid, rootPart) then
		else
			local now = os.clock()
			if now < (v8.NextSearchAt or 0) then
				return false
			end
			v8.NextSearchAt = now + 0.2
			state = fn77(localPlayer2, humanoid, rootPart)
		end

		if not state then
			return false
		end

		if not fn81(state, humanoid, rootPart) then
			v8.Enabled = false
			v8.Humanoid = humanoid
			v8.RootPart = rootPart
			v8.State = state
			return false
		end

		v8.NextSearchAt = 0
		v8.Enabled = true
		v8.Humanoid = humanoid
		v8.RootPart = rootPart
		v8.State = state
		v8.WalkSpeed = math.clamp(arg * n44, n13, n14 * n44)
		v8.TravelVelocity = Vector3.new(0, 0, 0)
		fn78(state, v8.WalkSpeed, v8.TravelVelocity)
		return true
	end

	local function fn83(arg, arg2, arg3, travelVelocity)
		local v8 = fn71()[str4]

		if type(v8) ~= "table" then
			return false
		elseif v8.Enabled then
			if v8.Humanoid ~= arg then
				return false
			elseif v8.RootPart ~= arg2 then
				return false
			elseif not fn81(v8.State, arg, arg2) then
				return false
			end
		else
			return false
		end

		v8.WalkSpeed = math.clamp(arg3 * n44, n13, n14 * n44)

		if typeof(travelVelocity) == "Vector3" then
			v8.TravelVelocity = travelVelocity
		elseif typeof(v8.TravelVelocity) ~= "Vector3" then
			v8.TravelVelocity = Vector3.new(0, 0, 0)
		end

		return fn78(v8.State, v8.WalkSpeed, v8.TravelVelocity)
	end

	local function fn84(arg)
		local v8 = fn71()[str4]
		if type(v8) ~= "table" then
			return
		end

		if arg == nil or v8.Humanoid == arg then
			v8.Enabled = false
			v8.Humanoid = nil
			v8.RootPart = nil
			v8.State = nil
			v8.TravelVelocity = nil
			v8.NextSearchAt = 0
		end
	end

	local function fn85(arg, arg2)
		if #arg2 == 0 then
			return true
		end

		for i, v8 in ipairs(arg.Mutations or {}) do
			if fn65(arg2, v8) then
				return true
			end
		end

		return arg.BaseMutation ~= nil and fn65(arg2, arg.BaseMutation)
	end

	local function fn86()
		local v8 = TreadmillUtil.SpeedPowerToWalkSpeed(SpeedPowerProjection.ReadProjected())
		local character = localPlayer2.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local walkSpeed = humanoid and humanoid.WalkSpeed or v8
		return math.clamp(math.min(v8, walkSpeed), n13, n14)
	end

	index.new = function(catalog, limitsModule, coordinator)
		local obj = setmetatable({}, index)
		obj.catalog = catalog
		obj.limitsModule = limitsModule
		obj.coordinator = coordinator
		obj.operationToken = nil
		obj.connections = {}
		obj.listeners = {}
		obj.records = {}
		obj.enabled = false
		obj.userStealEnabled = false
		obj.skippedEggs = {}
		obj.riftWants = {}
		obj.riftOnly = false
		obj.indexObjectiveEnabled = false
		obj.wispObjective = nil
		obj.manualObjectiveEnabled = false
		obj.manualQueue = {}
		obj.manualOrder = {}
		obj.indexCache = {at = 0, set = {}}
		obj.running = false
		obj.safeStarting = false
		obj.movementRetryPending = false
		obj.destroyed = false
		obj.resetBlocked = AreaEggResetWall3.IsSealed()
		obj.gateOpenAt = obj.resetBlocked and 1 / 0 or os.clock()
		obj.activeTween = nil
		obj.activeTarget = nil
		obj.claimPresentationNode = nil
		obj.claimPresentationOriginal = nil
		obj.claimPresentationSuppression = nil
		obj.carry = {active = false, uid = nil, generation = 0}
		obj.carryWorker = nil
		obj.tweenRecoveryUid = nil
		obj.planGeneration = 0
		obj.treadmillDecoy = nil
		obj.treadmillDecoyCamera = nil
		obj.treadmillDecoyCameraConnection = nil
		obj.treadmillDecoyCharacterConnection = nil
		obj.treadmillPopupConnection = nil
		obj.treadmillDecoyRealTransparency = nil
		obj.hoverPadOwnerId = string.format("%s:%0.6f", tostring(obj), os.clock())
		obj.instantPhase = nil
		obj.primerUid = nil
		obj.primerUids = {}
		obj.targetUid = nil
		obj.hitTimer = nil
		obj.guardHitBoostInstalled = false
		obj.stats = {status = obj.resetBlocked and "Reset wall closed" or "Ready", available = 0, matching = 0, lastTarget = "None", lastResult = "Idle"}
		obj.config = {stealMode = "Fly", flyAerial = false, flyZigzag = false, speed = n15, antiTrap = true, heaviestFirst = false, highestValueFirst = false, minWeightKg = 0, espEnabled = false, espRarity = true, espName = true, espKg = true, espMutation = true, espValue = true, espPlaced = false, espIcon = true, espMinRank = 0, espMinValue = 0, minValuePerSec = 0, rarityEnabled = false, rarities = {}, nameEnabled = false, names = {}, areaEnabled = false, areas = {}, mutationEnabled = false, mutations = {}}
		obj.gameAntiAfkDisabled = fn72()

		if localPlayer2.Character then
			fn67(localPlayer2.Character)
			local humanoid = localPlayer2.Character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					humanoid.BreakJointsOnDeath = false
					humanoid.RequiresNeck = false
					humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
					humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
					humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				end)
			end

			fn69(obj, localPlayer2.Character)
		end

		catalog, limitsModule = pcall(function()
			return require(ReplicatedStorage2.Shared.Util.EggRecords)
		end)

		obj.weightUtil = catalog and type(limitsModule.WeightKgForScale) == "function" and limitsModule or nil

		local function fn87(arg)
			if not arg then
				return
			end

			fn63(arg.DescendantAdded, function(arg2)
				if obj.config.antiTrap then
					obj:_purgeTrap(arg2)
				end
			end, obj.connections)
		end

		fn87(workspace:FindFirstChild("Transient"))
		fn87(workspace:FindFirstChild("__DEBRIS"))

		if obj.config.antiTrap then
			obj:_purgeTraps()
		end

		fn63(workspace.ChildAdded, function(arg)
			if arg.Name == "Transient" or arg.Name == "__DEBRIS" then
				fn87(arg)

				if obj.config.antiTrap then
					obj:_purgeTraps()
				end
			end
		end, obj.connections)

		obj:_replaceSnapshot(EggState2.ReadFieldEggs())

		fn63(EggState2.FieldRefreshed, function(arg)
			obj:_replaceSnapshot(arg)
		end, obj.connections)

		fn63(EggState2.FieldShifted, function(arg)
			obj.records[arg.Uid] = arg
			obj:_refreshCounts()

			if obj.enabled and not obj.destroyed and not obj.running and not obj.carry.active and (arg.State == AreaEggs.States.Slot or arg.State == AreaEggs.States.Dropped) and not obj._shiftWakePending then
				obj._shiftWakePending = true

				task.delay(0.25, function()
					obj._shiftWakePending = nil

					if not obj.destroyed and (obj.enabled and not obj.running) then
						obj:_schedule()
					end
				end)
			end
		end, obj.connections)

		fn63(EggState2.FieldGone, function(arg)
			obj.records[arg] = nil

			if obj.activeTarget and obj.activeTarget.Uid == arg then
				if obj.carry.active and obj.carry.uid == arg then
					obj:_refreshCounts()
					return
				end
				obj.carryAttemptToken = nil
				obj:_clearArrivalHold(arg)

				if obj.activeTween and obj.activeTween.Cancel then
					pcall(obj.activeTween.Cancel, obj.activeTween)
				end

				local activeTarget = obj.activeTarget

				task.delay(n41, function()
					if obj.destroyed then
						return
					elseif not obj.enabled then
						return
					end

					if obj.carry.active and obj.carry.uid == arg then
						return
					end

					if obj.activeTarget == activeTarget and activeTarget.Uid == arg then
						obj:_finish("Target removed \226\128\148 continuing")
					end
				end)
			end

			obj:_refreshCounts()
		end, obj.connections)

		fn63(EggState2.ResetCountdown, function()
			obj:_closeGate("Egg reset countdown")
		end, obj.connections)

		fn63(EggState2.ResetFade, function()
			obj:_closeGate("Egg reset teleport")
		end, obj.connections)

		fn63(AreaEggResetWall3.Changed, function(arg)
			if arg then
				obj:_closeGate("Reset wall closed")
			else
				obj.resetBlocked = false
				obj.gateOpenAt = os.clock()
				obj.safeStarting = false
				obj.running = false
				obj:_setStatus(obj.enabled and "Searching" or "Ready")
				obj:_schedule()
			end
		end, obj.connections)

		fn63(localPlayer2.CharacterRemoving, function()
			obj._recalling = nil
			obj:_cleanupInstantSteal()
			obj:_hideTreadmillDecoy()
			obj._forestDropInProgress = nil
			obj._instantReturnToken = nil
			obj.carry.generation += 1
			obj:_invalidateCarryWorker()
			obj.carry.active = false
			obj.carry.uid = nil
			obj.safeStarting = false
			obj.planGeneration = obj.planGeneration + 1
			obj:_cancelTween("Character resetting")
			obj:_stopMovementProtection()
		end, obj.connections)

		fn63(RunService2.Heartbeat, function()
			if obj.destroyed then
				return
			end
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			local walkSpeed = humanoid and humanoid.WalkSpeed or 0
			local vector3 = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)

			if vector3.Magnitude > math.max(400, walkSpeed * 1.5) or math.abs(assemblyLinearVelocity.Y) > 400 then
				local n51 = math.max(100, walkSpeed)
				local v8 = if vector3.Magnitude > n51 then vector3.Unit * n51 else vector3
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(v8.X, math.clamp(assemblyLinearVelocity.Y, -100, 100), v8.Z)
			end
		end, obj.connections)

		fn63(localPlayer2.CharacterAdded, function(arg)
			obj:_hideTreadmillDecoy()
			fn67(arg)
			local humanoid = arg:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					humanoid.BreakJointsOnDeath = false
					humanoid.RequiresNeck = false
					humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
					humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
					humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				end)
			end

			fn69(obj, arg)

			task.delay(0.25, function()
				if not obj.destroyed and obj.enabled then
					obj:_startMovementProtection()
				end
			end)

			task.delay(1, function()
				if not obj.destroyed and (obj.enabled and obj:_wallOpen()) then
					obj:_schedule()
				end
			end)
		end, obj.connections)

		obj:_installClaimPresentationFilter()

		fn63(EggState2.CarryChanged, function(arg)
			if arg.IsCarrying then
				if obj.running and (obj.activeTarget and arg.Uid == obj.activeTarget.Uid) then
					if obj.carry.active and obj.carry.uid == arg.Uid then
						return
					end

					if obj.instantPhase == "priming" and arg.Uid == obj.primerUid then
						obj.carry.active = true
						obj.carry.uid = arg.Uid
						obj:_clearArrivalHold(arg.Uid)
						obj:_enterBaitWait()
						return
					end

					obj.carry.generation += 1
					obj:_invalidateCarryWorker()
					obj:_clearArrivalHold(arg.Uid)
					obj.claimPresentationSuppression = {assetCategory = obj.activeTarget.AssetCategory, expiresAt = os.clock() + 8}
					obj.carry.active = true
					obj.carry.uid = arg.Uid
					obj.carryStartTime = os.clock()
					obj.carryStartPos = obj.activeTarget and obj.activeTarget.BottomCFrame and obj.activeTarget.BottomCFrame.Position or localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart") and localPlayer2.Character.HumanoidRootPart.Position

					if obj.tweenRecoveryUid == arg.Uid then
						obj.tweenRecoveryUid = nil
					end

					if obj.carryTimeouts then
						obj.carryTimeouts[arg.Uid] = nil
					end

					obj.stats.lastResult = "Carry confirmed"
					obj:_notify()
					obj.carryAttemptToken = nil

					if obj.activeTween and obj.activeTween.Cancel then
						pcall(obj.activeTween.Cancel, obj.activeTween)
					end

					task.defer(function()
						if not obj.destroyed and (obj.enabled and (obj.carry.uid == arg.Uid and obj:_hasConfirmedCarry(arg.Uid))) then
							if genv.__SenaV4GodMode then
								genv.__SenaV4GodMode:stopDefend()
							end

							obj:_returnToSafe()
						end
					end)
				end

				return
			end

			if obj.carry.uid ~= nil and (arg.Uid ~= nil and arg.Uid ~= obj.carry.uid) then
				return
			end
			local uid = arg.Uid or obj.carry.uid or obj.activeTarget and obj.activeTarget.Uid
			local active = obj.carry.active
			obj.carry.generation += 1
			local generation = obj.carry.generation
			obj:_invalidateCarryWorker()

			if obj.activeTween and obj.activeTween.Cancel then
				pcall(obj.activeTween.Cancel, obj.activeTween)
			end

			obj.carry.active = false
			obj.carry.uid = nil

			if genv.__SenaV4GodMode then
				genv.__SenaV4GodMode:startDefend(uid)
			end

			if obj._captureHoldUid ~= nil and uid == obj._captureHoldUid then
				return
			elseif obj._adminBusyUid ~= nil then
				if uid == obj._adminBusyUid then
					return
				end
			end

			if obj.instantPhase == "priming" then
				if arg.Uid == obj.primerUid then
					obj:_startPrimerTargetHunt()
					return
				elseif uid == obj.primerUid then
					obj:_startPrimerTargetHunt()
					return
				end
			end

			if obj._forestDropInProgress ~= nil and uid == obj._forestDropInProgress then
				return
			end

			if not active then
				return
			end

			if obj.running then
				if not obj.activeTarget then
					return
				end
			else
				return
			end

			local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart and obj:_isInSafeArea(humanoidRootPart) then
				obj:_reportStolen()
				obj:_finish("Safe return complete")
				return
			end

			task.delay(n40, function()
				if obj.destroyed then
					return
				elseif obj.enabled then
					if obj.carry.active then
						return
					elseif obj.carry.generation ~= generation then
						return
					end
				else
					return
				end

				local humanoidRootPart2 = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart2 and obj:_isInSafeArea(humanoidRootPart2) then
					obj:_reportStolen()
					obj:_finish("Safe return complete")
					return
				end

				obj:_reStealDroppedEgg(uid)
			end)
		end, obj.connections)

		fn63(localPlayer2:GetAttributeChangedSignal("RagdollEndTime"), function()
			local attribute = localPlayer2:GetAttribute("RagdollEndTime") or 0

			if obj.instantPhase == "priming" and attribute > workspace:GetServerTimeNow() then
				obj:_startPrimerTargetHunt()
			end
		end, obj.connections)

		fn63(RunService2.Heartbeat, function()
			if obj.destroyed then
				return
			end
			local now = os.clock()
			if now - (obj._espLastTick or 0) < 0.4 then
				return
			end
			obj._espLastTick = now

			local ok, result = pcall(function()
				obj:_updateEsp()
			end)

			if not ok and now - (obj._espErrLast or 0) > 5 then
				obj._espErrLast = now
				warn("[SAE][esp] update error: " .. tostring(result))
			end
		end, obj.connections)

		local status = obj.stats.status
		obj.stats.status = status
		return obj
	end

	index._installClaimPresentationFilter = function(arg)
		return false
	end

	index._restoreClaimPresentationFilter = function(arg)
		local claimPresentationNode = arg.claimPresentationNode
		local claimPresentationOriginal = arg.claimPresentationOriginal

		if type(claimPresentationNode) == "table" and (type(claimPresentationOriginal) == "function" and rawget(claimPresentationNode, "_fn") == arg.claimPresentationWrapper) then
			claimPresentationNode._fn = claimPresentationOriginal
		end

		arg.claimPresentationNode = nil
		arg.claimPresentationOriginal = nil
		arg.claimPresentationWrapper = nil
		arg.claimPresentationSuppression = nil
	end

	index._setStatus = function(arg, status)
		if arg.stats.status == status then
			return
		end

		if type(status) == "string" and string.find(status, "not currently trusted", 1, true) then
			arg._untrustedSeen = true
		end

		arg.stats.status = status
		arg:_notify()
	end

	index._notify = function(arg)
		local v8 = arg:getSnapshot()

		for k in pairs(arg.listeners) do
			local ok, result = pcall(k, v8)

			if not ok then
				warn("[StealAnEgg] UI listener failed:", result)
			end
		end
	end

	index.onChanged = function(arg, arg2)
		arg.listeners[arg2] = true
		local ok, result = pcall(arg2, arg:getSnapshot())

		if not ok then
			warn("[StealAnEgg] UI listener failed:", result)
		end

		return function()
			arg.listeners[arg2] = nil
		end
	end

	index.getSnapshot = function(arg)
		return {status = arg.stats.status, available = arg.stats.available, matching = arg.stats.matching, lastTarget = arg.stats.lastTarget, lastResult = arg.stats.lastResult, wallClosed = arg.resetBlocked or AreaEggResetWall3.IsSealed() or os.clock() < arg.gateOpenAt, enabled = arg.enabled, running = arg.running}
	end

	index._replaceSnapshot = function(arg, arg2)
		table.clear(arg.records)

		for k, v8 in pairs(arg2 and (arg2.Records or arg2) or {}) do
			if type(v8) == "table" and type(v8.Uid) == "string" then
				arg.records[v8.Uid] = v8
			elseif type(k) == "string" then
				if type(v8) == "table" then
					arg.records[k] = v8
				end
			end
		end

		arg:_refreshCounts()
		arg:_schedule()
	end

	index._indexWants = function(arg)
		local now = os.clock()
		local indexCache = arg.indexCache
		if indexCache and now - (indexCache.at or 0) < 2 then
			return indexCache.set
		end
		local tbl16 = {}

		pcall(function()
			local areasDirectory = arg.areasDirectory

			if areasDirectory then
			else
				areasDirectory = require(ReplicatedStorage2.Data.Areas).Directory
				arg.areasDirectory = areasDirectory
			end

			local uid = (Save.Peek or Save.Get)()

			if areasDirectory then
				if not uid then
					return
				end
			else
				return
			end

			local index2 = uid.Index or {}
			local tbl17 = {}

			for k, v8 in pairs(uid.EggInventory or {}) do
				local assetCategory = type(v8) == "table" and (v8.AssetCategory or v8.Category)

				if assetCategory then
					tbl17[tostring(assetCategory)] = true
				end
			end

			uid = arg.carry and arg.carry.uid

			if uid then
				local v8 = arg.records[uid]

				if v8 and v8.AssetCategory then
					tbl17[tostring(v8.AssetCategory)] = true
				end
			end

			for k, v8 in pairs(areasDirectory) do
				if type(v8) == "table" and type(v8.DropTable) == "table" then
					for i, v9 in ipairs(v8.DropTable) do
						uid = v9[1]

						if uid then
							local str9 = tostring(uid)

							if not index2[str9] and not tbl17[str9] then
								tbl16[str9] = true
							end
						end
					end
				end
			end
		end)

		arg.indexCache = {at = now, set = tbl16}
		return tbl16
	end

	index._isIndexObjective = function(arg, arg2)
		if not arg.indexObjectiveEnabled then
			return false
		end

		if type(arg2) ~= "table" then
			return false
		end
		local assetCategory = arg2.AssetCategory

		if assetCategory then
			if assetCategory == "" then
				return false
			end
		else
			return false
		end

		return arg:_indexWants()[tostring(assetCategory)] == true
	end

	index.setIndexObjective = function(arg, arg2)
		local indexObjectiveEnabled = arg2 == true
		if arg.indexObjectiveEnabled == indexObjectiveEnabled then
			return
		end
		arg.indexObjectiveEnabled = indexObjectiveEnabled
		arg.indexCache = {at = 0, set = {}}
		arg:_reconcileRunningState()
	end

	index._isWispObjective = function(arg, arg2)
		local wispObjective = arg.wispObjective

		if type(wispObjective) ~= "table" then
			return false
		elseif type(arg2) ~= "table" then
			return false
		end

		if wispObjective.area and arg2.AreaId ~= wispObjective.area then
			return false
		end

		if wispObjective.rarity then
			local v8 = arg.catalog.resolve(arg2)

			if v8 then
				if v8.rarity ~= wispObjective.rarity then
					return false
				end
			else
				return false
			end
		end

		return true
	end

	index.setWispObjective = function(arg, arg2)
		local wispObjectiveKey = type(arg2) == "table" and (arg2.area or "") .. "|" .. (arg2.rarity or "") or nil
		if arg.wispObjectiveKey == wispObjectiveKey then
			return
		end
		arg.wispObjectiveKey = wispObjectiveKey
		arg.wispObjective = wispObjectiveKey and arg2 or nil
		arg:_reconcileRunningState()
	end

	index.indexMissingCount = function(arg)
		local n51 = 0

		for k in pairs(arg:_indexWants()) do
			n51 += 1
		end

		return n51
	end

	index._matchesNormalFilter = function(arg, arg2)
		local minWeightKg = arg.catalog.resolve(arg2)
		local config = arg.config

		if config.rarityEnabled then
			if #config.rarities == 0 then
				return false
			elseif not fn65(config.rarities, minWeightKg.rarity) then
				return false
			end
		end

		if config.nameEnabled then
			if #config.names == 0 then
				return false
			elseif not fn65(config.names, minWeightKg.name) then
				if not fn65(config.names, minWeightKg.category) then
					return false
				end
			end
		end

		if config.areaEnabled then
			if #config.areas == 0 then
				return false
			elseif not fn65(config.areas, arg2.AreaId) then
				return false
			end
		end

		if config.mutationEnabled and not fn85(arg2, config.mutations) then
			return false
		end
		minWeightKg = config.minWeightKg

		if minWeightKg and minWeightKg > 0 then
			local v8 = arg:_resolveWeightKg(arg2)

			if v8 then
				if v8 < config.minWeightKg then
					return false
				end
			else
				return false
			end
		end

		local minValuePerSec = config.minValuePerSec

		if minValuePerSec and minValuePerSec > 0 then
			local v8 = fn66(arg2)

			if v8 then
				if v8 < config.minValuePerSec then
					return false
				end
			else
				return false
			end
		end

		return true
	end

	index._matches = function(arg, arg2)
		if arg2.State ~= AreaEggs.States.Slot and arg2.State ~= AreaEggs.States.Dropped then
			return false
		end

		if arg.riftWants[arg2.AssetCategory] then
			return true
		end

		if arg.indexObjectiveEnabled and arg:_isIndexObjective(arg2) then
			return true
		end

		if arg.wispObjective and arg:_isWispObjective(arg2) then
			return true
		end

		if arg.userStealEnabled and (not arg.riftOnly and arg:_matchesNormalFilter(arg2)) then
			return true
		end
		return false
	end

	index.setScrambleWants = function(arg, arg2, arg3)
		local riftWants = {}

		for i, v8 in ipairs(type(arg2) == "table" and arg2 or {}) do
			if type(v8) == "string" and v8 ~= "" then
				riftWants[v8] = true
			end
		end

		local riftOnly = arg3 == true
		arg3 = riftOnly ~= arg.riftOnly

		for k in pairs(riftWants) do
			arg3 = if arg.riftWants[k] then arg3 else true
		end

		for k in pairs(arg.riftWants) do
			arg3 = if riftWants[k] then arg3 else true
		end

		if not arg3 then
			return
		end
		arg.riftWants = riftWants
		arg.riftOnly = riftOnly
		arg:_reconcileRunningState()
	end

	index._refreshCounts = function(arg)
		local available = 0
		local matching = 0

		for k, record in pairs(arg.records) do
			if record.State == AreaEggs.States.Slot then
				available, matching = available + 1, if arg:_matches(record) then matching + 1 else matching
			end
		end

		arg.stats.available = available
		arg.stats.matching = matching
		arg:_notify()
	end

	index.hasPriorityRareEgg = function(arg)
		local humanoidRootPart, v8, v9, v10 = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

		for k, v11 in pairs(arg.records or {}) do
			if (v11.State == AreaEggs.States.Slot or v11.State == AreaEggs.States.Dropped) and v11.BottomCFrame then
				if arg:isSkippedEgg(v11.Uid) then
				else
					if arg:_matchesNormalFilter(v11) then
						local v12 = arg.catalog.resolve(v11)

						if tbl11[v12.rarity] then
							local magnitude = humanoidRootPart and (v11.BottomCFrame.Position - humanoidRootPart.Position).Magnitude or 0
							local rarityRank = v12.rarityRank or 0

							if v8 then
								if rarityRank > v9 then
									v8 = v11
									v9 = rarityRank
									v10 = magnitude
								else
									if rarityRank == v9 and magnitude < v10 then
										v8 = v11
										v9 = rarityRank
										v10 = magnitude
									end
								end
							else
								v8 = v11
								v9 = rarityRank
								v10 = magnitude
							end
						end
					end
				end
			end
		end

		return v8 ~= nil, v8
	end

	local str9 = "Event_CaptureTheEggUid"
	local n51 = 110

	index.isSkippedEgg = function(arg, arg2)
		if arg2 ~= nil and (arg2 == workspace:GetAttribute(str9) and not arg.captureObjectiveEnabled) then
			return true
		end
		local v8 = arg2 and arg.skippedEggs[arg2]
		if not v8 then
			return false
		end

		if os.clock() < v8 then
			return true
		end
		arg.skippedEggs[arg2] = nil
		return false
	end

	index._isCaptureEgg = function(arg, arg2)
		return arg2 ~= nil and arg2 == workspace:GetAttribute(str9)
	end

	index.setCaptureObjective = function(arg, arg2)
		local flag5 = arg2 == true
		if arg.captureObjectiveEnabled == flag5 then
			return
		end

		if flag5 then
			arg._modeBeforeCapture = {arg.config.stealMode, arg.config.flyAerial, arg.config.flyZigzag}
			arg:setStealMode("Instant", false, false)
			arg.captureObjectiveEnabled = true
		else
			arg.captureObjectiveEnabled = false
			local modeBeforeCapture = arg._modeBeforeCapture
			arg._modeBeforeCapture = nil

			if modeBeforeCapture then
				arg:setStealMode(modeBeforeCapture[1], modeBeforeCapture[2], modeBeforeCapture[3])
			end
		end

		arg:_reconcileRunningState()
	end

	index._captureHold = function(arg, captureHoldUid)
		if arg._captureHoldUid == captureHoldUid then
			return
		end
		arg._captureHoldUid = captureHoldUid

		local function fn87()
			local v8 = EggState2.ReadFieldEgg(captureHoldUid)
			return v8 ~= nil and v8.State == AreaEggs.States.Carried and v8.CarrierUserId == localPlayer2.UserId
		end

		local function fn88()
			local destroyed = arg.destroyed
			return (if destroyed then not destroyed else arg.enabled) and arg.captureObjectiveEnabled and fn87()
		end

		task.spawn(function()
			arg:_clearArrivalHold(captureHoldUid)
			arg:_hideTreadmillDecoy()

			pcall(function()
				arg:_stopHoverPad()
			end)

			arg.stats.lastResult = "Holding capture egg"
			arg:_setStatus("Holding capture egg")
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local cFrame = humanoidRootPart and CFrame.new(humanoidRootPart.Position.X, n51, humanoidRootPart.Position.Z) * humanoidRootPart.CFrame.Rotation

			if cFrame then
				arg:_glideRoot(cFrame, function()
					return not fn88()
				end)
			end

			while fn88() do
				local character2 = localPlayer2.Character
				local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
				local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart2 and humanoid and cFrame then
					pcall(function()
						humanoidRootPart2.CFrame = cFrame
						humanoidRootPart2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
						humanoidRootPart2.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					end)

					arg:_syncHoverPad(cFrame.Position)
					local n52 = math.clamp(arg.config.speed or n15, n13, fn61())

					pcall(function()
						fn74(character2, n52 * n44)
						fn83(humanoid, humanoidRootPart2, n52, (Vector3.new(0, 0, 0)))
					end)
				end

				task.wait(0.1)
			end

			pcall(function()
				arg:_stopHoverPad()
			end)

			if arg._captureHoldUid == captureHoldUid then
				arg._captureHoldUid = nil
			end

			if arg.destroyed then
				return
			elseif not arg.enabled then
				return
			end

			arg:_finish(arg.captureObjectiveEnabled and "Capture egg lost \226\128\148 re-grabbing" or "Capture stopped")
		end)
	end

	index._chooseTarget = function(arg)
		local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return nil
		end

		if arg.captureObjectiveEnabled then
			local attribute = workspace:GetAttribute(str9)
			local v8 = attribute and (EggState2.ReadFieldEgg(attribute) or arg.records[attribute])

			if type(v8) == "table" and v8.BottomCFrame then
				if v8.State == AreaEggs.States.Slot then
					return v8
				elseif v8.State == AreaEggs.States.Dropped then
					return v8
				end
			end
		end

		if arg.manualObjectiveEnabled then
			local v8 = arg:_takeManualTarget()
			if v8 then
				return v8
			end
		end

		if arg.userStealEnabled and not arg.riftOnly then
			local v8, v9 = arg:hasPriorityRareEgg()
			if v8 and v9 then
				return v9
			end
		end

		local v8, v9, v10, v11, v12, v13

		for k, record in pairs(arg.records) do
			if (record.State == AreaEggs.States.Slot or record.State == AreaEggs.States.Dropped) and record.BottomCFrame then
				if arg:isSkippedEgg(record.Uid) then
				else
					local magnitude = (record.BottomCFrame.Position - humanoidRootPart.Position).Magnitude

					if arg.riftWants[record.AssetCategory] then
						if v8 then
							if magnitude < v9 then
								v8 = record
								v9 = magnitude
							end
						else
							v8 = record
							v9 = magnitude
						end
					else
						if arg.wispObjective and arg:_isWispObjective(record) then
							if v10 then
								if magnitude < v11 then
									v10 = record
									v11 = magnitude
								end
							else
								v10 = record
								v11 = magnitude
							end
						else
							if arg.indexObjectiveEnabled and arg:_isIndexObjective(record) then
								if v12 then
									if magnitude < v13 then
										v12 = record
										v13 = magnitude
									end
								else
									v12 = record
									v13 = magnitude
								end
							end
						end
					end
				end
			end
		end

		if v8 or v10 or v12 then
			return v8 or v10 or v12
		end

		if arg.userStealEnabled and not arg.riftOnly then
			local v14, v15, v16

			for k, record in pairs(arg.records) do
				if record.State == AreaEggs.States.Slot or record.State == AreaEggs.States.Dropped then
					local v17 = arg:isSkippedEgg(record.Uid)

					if if v17 then not v17 else arg:_matchesNormalFilter(record) then
						local magnitude = (record.BottomCFrame.Position - humanoidRootPart.Position).Magnitude
						local v18 = arg.catalog.resolve(record)
						local v19 = if arg.config.highestValueFirst then fn66(record) or -1 / 0 else if arg.config.heaviestFirst then arg:_resolveWeightKg(record) or -1 / 0 else v18.rarityRank or 0

						if v14 then
							if v19 > v15 then
								v14 = record
								v15 = v19
								v16 = magnitude
							else
								if v19 == v15 and magnitude < v16 then
									v14 = record
									v15 = v19
									v16 = magnitude
								end
							end
						else
							v14 = record
							v15 = v19
							v16 = magnitude
						end
					end
				end
			end

			if v14 then
				return v14
			end
		end

		return nil
	end

	index._takeManualTarget = function(arg)
		local tbl16 = {}
		local manualOrder = {}

		for i, v8 in ipairs(arg.manualOrder) do
			local v9 = arg.records[v8]

			if v9 then
				if v9.State == AreaEggs.States.Slot then
					manualOrder[#manualOrder + 1] = v8
					tbl16[v8] = true
				elseif v9.State == AreaEggs.States.Dropped then
					manualOrder[#manualOrder + 1] = v8
					tbl16[v8] = true
				end
			end
		end

		arg.manualOrder = manualOrder

		for k in pairs(arg.manualQueue) do
			if not tbl16[k] then
				arg.manualQueue[k] = nil
			end
		end

		if #manualOrder == 0 then
			if arg.manualObjectiveEnabled then
				arg.manualObjectiveEnabled = false

				task.defer(function()
					if not arg.destroyed then
						arg:_reconcileRunningState()
					end
				end)
			end

			return nil
		end

		return arg.records[manualOrder[1]]
	end

	index.queueManual = function(arg, arg2)
		if type(arg2) ~= "table" then
			return 0
		end

		for i, v8 in ipairs(arg2) do
			if v8 ~= nil and not arg.manualQueue[v8] then
				arg.manualQueue[v8] = true
				arg.manualOrder[#arg.manualOrder + 1] = v8
			end
		end

		local n52 = #arg.manualOrder

		if n52 > 0 then
			arg.manualObjectiveEnabled = true
		end

		arg:_reconcileRunningState()
		return n52
	end

	index.clearManual = function(arg)
		arg.manualQueue = {}
		arg.manualOrder = {}
		arg.manualObjectiveEnabled = false
		arg:_reconcileRunningState()
	end

	index.manualPending = function(arg)
		return #arg.manualOrder
	end

	index.setTreadmillManager = function(arg, treadmillManager)
		arg.treadmillManager = treadmillManager
	end

	index.getStealMode = function(arg)
		return arg.config.stealMode == "Fly" and "Fly" or "Instant"
	end

	index.setStealMode = function(arg, arg2, arg3, arg4)
		local stealMode = arg2 == "Fly" and "Fly" or "Instant"
		local flyAerial = stealMode == "Fly" and arg3 == true
		local flyZigzag = stealMode == "Fly" and arg4 == true and not flyAerial

		if arg.config.stealMode ~= stealMode or arg.config.flyAerial ~= flyAerial or arg.config.flyZigzag ~= flyZigzag then
			arg.config.stealMode = stealMode
			arg.config.flyAerial = flyAerial
			arg.config.flyZigzag = flyZigzag

			if arg.enabled then
				arg:_installGuardHitDistanceBoost()
				arg:_finish("Mode changed")
			end
		end

		return stealMode
	end

	local resolveHitDistance
	local n52 = 25

	index._installGuardHitDistanceBoost = function(arg)
		if arg.guardHitBoostInstalled then
			return
		end

		local function fn87()
			local GuardChasePolicy = require(ReplicatedStorage2.Shared.Modules.GuardAreas.GuardChasePolicy)

			if GuardChasePolicy and type(GuardChasePolicy.ResolveHitDistance) == "function" then
				resolveHitDistance = resolveHitDistance or GuardChasePolicy.ResolveHitDistance
				local v8 = arg

				GuardChasePolicy.ResolveHitDistance = function(arg2)
					if v8.enabled and v8.instantPhase == "priming" then
						return n52
					end

					if v8.enabled then
						return -1 / 0
					elseif v8._recalling then
						return -1 / 0
					end

					return resolveHitDistance and resolveHitDistance(arg2) or (arg2 or 10)
				end

				arg.guardHitBoostInstalled = true
			end
		end

		pcall(fn87)
	end

	index._removeGuardHitDistanceBoost = function(arg)
		if not arg.guardHitBoostInstalled then
			return
		end

		pcall(function()
			local GuardChasePolicy = require(ReplicatedStorage2.Shared.Modules.GuardAreas.GuardChasePolicy)

			if GuardChasePolicy and resolveHitDistance then
				GuardChasePolicy.ResolveHitDistance = resolveHitDistance
				arg.guardHitBoostInstalled = false
			end
		end)
	end

	index._setInstantAnchored = function(arg, anchored)
		pcall(function()
			local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart and humanoidRootPart.Anchored ~= anchored then
				humanoidRootPart.Anchored = anchored
			end
		end)
	end

	index._kbCancelTimer = function(arg)
		if arg.hitTimer then
			pcall(task.cancel, arg.hitTimer)
			arg.hitTimer = nil
		end
	end

	index._isPrimerEgg = function(arg, arg2)
		if arg2 == nil then
			return false
		end

		if arg2 == arg.primerUid then
			return true
		end
		local primerUids = arg.primerUids and arg.primerUids[arg2]
		if primerUids and primerUids > os.clock() then
			return true
		end

		if primerUids then
			arg.primerUids[arg2] = nil
		end

		return false
	end

	index._cleanupInstantSteal = function(arg)
		arg.instantPhase = nil
		arg.primerUid = nil
		arg.targetUid = nil
		arg._flyDeparting = false
		arg:_stopGuardStick()
		arg:_kbCancelTimer()
		arg:_setInstantAnchored(false)
		arg:_hideTreadmillDecoy()
	end

	index._choosePrimerEgg = function(arg, arg2)
		local guard = fn()
		local areas = guard and guard:FindFirstChild("Areas")
		local guardAreas = areas and areas:FindFirstChild("GuardAreas")
		local forest = guardAreas and guardAreas:FindFirstChild("Forest")
		guard = forest and forest:FindFirstChild("Guard")
		areas = guard and guard:FindFirstChild("HumanoidRootPart")
		local position, v8, v9 = areas and areas.Position

		for k, record in pairs(arg.records) do
			if record.State == AreaEggs.States.Slot and (record.AreaId == "Forest" and record.Uid ~= arg2) then
				if arg:_isCaptureEgg(record.Uid) then
				else
					local magnitude = position and (record.BottomCFrame.Position - position).Magnitude or (localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart") and (record.BottomCFrame.Position - localPlayer2.Character.HumanoidRootPart.Position).Magnitude or 1 / 0)
					local rarityRank = arg.catalog.resolve(record).rarityRank or 0
					local n53 = -magnitude - rarityRank * 100

					if v8 then
						if n53 > v9 then
							v8 = record
							v9 = n53
						end
					else
						v8 = record
						v9 = n53
					end
				end
			end
		end

		return v8
	end

	local n53 = 2.5
	local n54 = 0.05
	local n55 = 1.5
	local n56 = 18
	local n57 = 0.35

	index._stopGuardStick = function(arg)
		if arg.guardStickConnection then
			pcall(arg.guardStickConnection.Disconnect, arg.guardStickConnection)
			arg.guardStickConnection = nil
		end
	end

	index._startGuardStick = function(arg)
		arg:_stopGuardStick()

		local function fn87()
			local v8 = fn()
			local areas = v8 and v8:FindFirstChild("Areas")
			local guardAreas = areas and areas:FindFirstChild("GuardAreas")
			local forest = guardAreas and guardAreas:FindFirstChild("Forest")
			local guard = forest and forest:FindFirstChild("Guard")
			return guard and guard:FindFirstChild("HumanoidRootPart")
		end

		arg.guardStickConnection = RunService2.PreSimulation:Connect(function()
			if arg.destroyed then
				arg:_stopGuardStick()
				return
			elseif arg.enabled then
				if arg.instantPhase ~= "priming" then
					arg:_stopGuardStick()
					return
				end
			else
				arg:_stopGuardStick()
				return
			end

			local n58 = fn87()
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

			if n58 then
				if not humanoidRootPart then
					return
				end
			else
				return
			end

			local position = n58.Position
			local n59 = n58.CFrame.LookVector * n53
			n58 = Vector3.new(position.X + n59.X, humanoidRootPart.Position.Y, position.Z + n59.Z) - humanoidRootPart.Position
			local v8 = if n58.Magnitude > 40 then n58.Unit * 40 else n58
			local n60 = humanoidRootPart.Position + v8
			humanoidRootPart.CFrame = CFrame.lookAt(n60, Vector3.new(position.X, n60.Y, position.Z))
			humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			arg:_syncHoverPad(n60)
		end)
	end

	index._forestGuardModel = function(arg)
		local v8 = fn()
		local areas = v8 and v8:FindFirstChild("Areas")
		local guardAreas = areas and areas:FindFirstChild("GuardAreas")
		local forest = guardAreas and guardAreas:FindFirstChild("Forest")
		return forest and forest:FindFirstChild("Guard")
	end

	index._triggerGuardHit = function(arg)
		local v8 = arg:_forestGuardModel()
		local humanoidRootPart = v8 and v8:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local character = localPlayer2.Character
		local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart2 then
			return
		end
		local position = humanoidRootPart.Position
		local n58 = humanoidRootPart.CFrame.LookVector * n53
		local vector3 = Vector3.new(position.X + n58.X, humanoidRootPart2.Position.Y, position.Z + n58.Z)
		arg.guardStrikeAnchor = vector3
		humanoidRootPart2.CFrame = CFrame.lookAt(vector3, Vector3.new(position.X, vector3.Y, position.Z))
		humanoidRootPart2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		local collider = v8:FindFirstChild("Collider") or humanoidRootPart

		if collider and firetouchinterest then
			pcall(function()
				firetouchinterest(humanoidRootPart2, collider, 0)
				firetouchinterest(humanoidRootPart2, collider, 1)
			end)
		end

		pcall(function()
			local forestStrike = Remotes.GuardPatrol and Remotes.GuardPatrol.ForestStrike

			if forestStrike then
				forestStrike:FireServer({EggUid = arg.primerUid, GuardCFrame = humanoidRootPart.CFrame})
			end
		end)
	end

	index._stopGuardStrike = function(arg)
		arg.guardStrikeGeneration = (arg.guardStrikeGeneration or 0) + 1
	end

	index._knockbackLanded = function(arg)
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart then
			if not humanoid then
				return false
			end
		else
			return false
		end

		if humanoid.PlatformStand then
			return true
		elseif humanoid.Sit then
			return true
		end

		local state = humanoid:GetState()

		if state == Enum.HumanoidStateType.Ragdoll then
			return true
		elseif state == Enum.HumanoidStateType.FallingDown then
			return true
		elseif state == Enum.HumanoidStateType.PlatformStanding then
			return true
		end

		return humanoidRootPart.AssemblyLinearVelocity.Magnitude > n56
	end

	index._settleAfterKnockback = function(arg)
		local guardStrikeAnchor = arg.guardStrikeAnchor
		local n58 = os.clock() + n57

		while os.clock() < n58 and not arg.destroyed do
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local humanoid = character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					humanoid.PlatformStand = false
					humanoid.Sit = false
					humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
				end)
			end

			if guardStrikeAnchor then
				humanoidRootPart.CFrame = CFrame.new(guardStrikeAnchor)
			end

			humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			arg:_syncHoverPad(guardStrikeAnchor or humanoidRootPart.Position)
			RunService2.Heartbeat:Wait()
		end
	end

	index._startGuardStrike = function(arg)
		arg:_stopGuardStrike()
		local guardStrikeGeneration = arg.guardStrikeGeneration

		task.spawn(function()
			local n58 = os.clock() + n55

			while true do
				local destroyed = arg.destroyed
				if not ((if destroyed then not destroyed else arg.enabled) and arg.instantPhase == "priming" and arg.guardStrikeGeneration == guardStrikeGeneration and os.clock() < n58) then
					break
				end
				arg:_triggerGuardHit()
				local n59 = os.clock() + n54
				local flag5 = false

				while os.clock() < n59 do
					if arg:_knockbackLanded() then
						flag5 = true
						break
					end
					RunService2.Heartbeat:Wait()
				end

				if flag5 then
					break
				end
			end

			if arg.guardStrikeGeneration == guardStrikeGeneration then
				arg:_stopGuardStick()
				arg:_settleAfterKnockback()
			end
		end)
	end

	index._enterBaitWait = function(arg)
		arg:_setInstantAnchored(false)
		arg:_setStatus("Preparing steal")
		arg:_startGuardStick()
		arg:_startGuardStrike()
		if arg.hitTimer then
			return
		end

		arg.hitTimer = task.delay(n55 + 0.3, function()
			arg.hitTimer = nil

			if arg.destroyed then
				return
			elseif not arg.enabled then
				return
			end

			if arg.instantPhase ~= "priming" then
				return
			end
			arg:_stopGuardStick()
			arg:_stopGuardStrike()

			if arg.carry.active and arg:_isPrimerEgg(arg.carry.uid) then
				pcall(EggState2.DropFieldEgg, "PlayerRequest")
			end

			arg:_finish("Steal timed out \226\128\148 retrying")
		end)
	end

	local function fn87(arg, arg2)
		local str10 = tostring(arg or ""):lower()
		local n58 = 8
		local n59 = 3.5

		if str10:find("enchanted") then
			n58 = 18
			n59 = 12
		else
			if str10:find("light") then
				local n60 = 16
				local n61 = 10
				n58 = n60
				n59 = n61
			else
				if str10:find("dark") then
					local n60 = 16
					local n61 = 10
					n58 = n60
					n59 = n61
				else
					if str10:find("titan") then
						local n60 = 10
						local n61 = 8
						n58 = n60
						n59 = n61
					else
						if str10:find("cosmic") then
							local n60 = 10
							local n61 = 8
							n58 = n60
							n59 = n61
						else
							if str10:find("cherry") then
								local n60 = 10
								local n61 = 8
								n58 = n60
								n59 = n61
							end
						end
					end
				end
			end
		end

		return math.max(n59, n58 * ((11 - math.clamp(arg2, 1, 10)) / 6))
	end

	index._resolveSettleSeconds = function(arg, arg2)
		local n58 = math.clamp(tonumber(senaV4Config.StealHoldSeconds) or 5, 1, 10)
		local flag5 = arg.settleBonus and type(arg2) == "table" and arg.settleBonus[arg2.Uid]
		local seconds = flag5 and flag5.untilAt > os.clock() and flag5.seconds or 0
		local v8 = fn3()
		seconds = if v8 > 0 then if v8 < 12 then seconds + 2 else seconds else seconds
		local v9 = if genv.__SenaV4NetPing() > 300 then seconds + 1 else seconds
		return fn87(type(arg2) == "table" and arg2.AreaId, n58) + v9
	end

	index._startPrimerTargetHunt = function(arg)
		if arg.instantPhase ~= "priming" then
			return
		end
		arg:_stopGuardStick()
		arg:_stopGuardStrike()

		pcall(function()
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid.PlatformStand = false
				humanoid.Sit = false
			end

			if humanoidRootPart then
				if arg.guardStrikeAnchor then
					humanoidRootPart.CFrame = CFrame.new(arg.guardStrikeAnchor)
				end

				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end
		end)

		arg:_kbCancelTimer()
		arg:_setInstantAnchored(false)
		arg.instantPhase = "hunting"
		arg:_clearArrivalHold()
		arg.carry.generation += 1
		arg:_invalidateCarryWorker()
		arg.carry.active = false
		arg.carry.uid = nil
		local targetUid = arg.targetUid
		arg.targetUid = nil
		if not targetUid then
			arg:_finish("No target egg")
			return
		end
		local v8 = EggState2.ReadFieldEgg(targetUid) or arg.records[targetUid]
		if not v8 or v8.State ~= AreaEggs.States.Slot and v8.State ~= AreaEggs.States.Dropped then
			arg:_finish("Target egg no longer available")
			return
		end
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart then
			if not humanoid then
				arg:_finish("Character unavailable")
				return
			end
		else
			arg:_finish("Character unavailable")
			return
		end

		arg.activeTarget = v8
		local v9 = arg:_resolveEggDestination(v8, humanoidRootPart, humanoid)
		if not v9 then
			arg:_finish("Target destination unavailable")
			return
		end

		if arg.config.stealMode == "Fly" then
			local uid = v8.Uid

			local function fn88()
				return arg.destroyed or not arg.enabled or arg.instantPhase ~= "hunting" or not arg.activeTarget or arg.activeTarget.Uid ~= uid
			end

			if arg.config.flyAerial then
				arg:_setStatus("Heading to target egg")
				arg:_startFlyGrounding()
				local v10 = arg:_flyWalkTo(v9, fn88, 8, 110)
				arg:_stopFlyGrounding()

				if not v10 then
					if not fn88() then
						arg:_finish("Could not reach the egg \226\128\148 retrying")
					end

					return
				end
			elseif arg.config.flyZigzag then
				arg:_setStatus("Heading to target egg")

				if not arg:_walkToZigzag(v9, fn88) then
					if not fn88() then
						arg:_finish("Zig-zag walk to target failed")
					end

					return
				end
			else
				arg:_setStatus("Heading to target egg")

				if not arg:_walkTo(v9, fn88) then
					if not fn88() then
						arg:_finish("Walk to target failed")
					end

					return
				end
			end

			if fn88() then
				return
			end
			arg:_glideRoot(v9, fn88, arg:_legitWalkSpeed())
			if fn88() then
				return
			end
			arg:_setArrivalHold(v9, uid)
			arg:_setStatus("Securing target egg")
			arg:_requestCarry(v8, true)
			return
		end

		if arg.config.stealMode == "Instant" then
			local uid = v8.Uid

			local function fn88()
				return arg.destroyed or not arg.enabled or arg.instantPhase ~= "hunting" or not arg.activeTarget or arg.activeTarget.Uid ~= uid
			end

			local n58 = v9 + Vector3.new(0, n25, 0)
			arg:_setStatus("Heading to target egg")

			if not arg:_glideRoot(n58, fn88) then
				if not fn88() then
					arg:_finish("Could not reach the egg \226\128\148 retrying")
				end

				return
			end

			task.spawn(arg._hoverSettleCarry, arg, v8, v9, n58, fn88)
			return
		end

		arg:_setStatus("Heading to target egg")

		arg:_tweenRoot(v9, function()
			if arg.instantPhase == "hunting" and (arg.activeTarget and arg.activeTarget.Uid == v8.Uid) then
				arg:_requestCarry(v8, false)
			end
		end, nil, {holdAfterArrival = true, holdUid = v8.Uid, flightProfile = true, carryTarget = v8})
	end

	index._hoverSettleCarry = function(arg, arg2, arg3, cFrame, arg4)
		arg:_startHoverPad()
		local v8 = arg:_resolveSettleSeconds(arg2)
		local n58 = os.clock() + v8

		while os.clock() < n58 do
			if arg4() then
				return
			end
			arg:_setStatus(string.format("Securing target egg (%.1fs)", math.max(0, n58 - os.clock())))
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoidRootPart and humanoid then
				pcall(function()
					humanoidRootPart.CFrame = cFrame
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				end)

				arg:_syncHoverPad(cFrame.Position)
				local n59 = math.clamp(arg.config.speed or n15, n13, fn61())

				pcall(function()
					fn74(character, n59 * n44)
					fn83(humanoid, humanoidRootPart, n59, (Vector3.new(0, 0, 0)))
				end)
			end

			task.wait(0.1)
		end

		if arg4() then
			return
		end
		arg:_glideRoot(arg3, arg4)
		if arg4() then
			return
		end
		arg:_setArrivalHold(arg3, arg2.Uid)
		arg:_setStatus("Securing target egg")
		arg:_requestCarry(arg2, true)
	end

	index._wallOpen = function(arg)
		if arg.resetBlocked then
			return false
		elseif AreaEggResetWall3.IsSealed() then
			return false
		elseif os.clock() < arg.gateOpenAt then
			return false
		end

		local v8 = fn()
		local areas = v8 and v8:FindFirstChild("Areas")
		local wallStartCollision = areas and areas:FindFirstChild("WallStartCollision")
		if wallStartCollision and (wallStartCollision:IsA("BasePart") and wallStartCollision.CanCollide) then
			return false
		end
		return true
	end

	index._closeGate = function(arg, arg2)
		arg.resetBlocked = true
		arg.gateOpenAt = 1 / 0
		arg.safeStarting = false

		if arg.activeTween then
			if not arg.activeTween.sharedTravel then
				arg:_cancelTween(arg2)
			end
		else
			arg:_cancelTween(arg2)
		end

		arg:_setStatus(arg2)
	end

	index._releaseOperation = function(arg)
		local operationToken = arg.operationToken
		arg.operationToken = nil

		if operationToken and arg.coordinator then
			arg.coordinator:release(operationToken)
		end
	end

	index._acquireOperation = function(arg)
		if arg.operationToken then
			return true
		elseif not arg.coordinator then
			return true
		end

		local autoSteal, v8 = arg.coordinator:tryAcquire("auto_steal", {})
		if not autoSteal then
			return false, v8
		end
		arg.operationToken = autoSteal
		return true
	end

	index._cancelTween = function(arg, lastResult, arg2)
		arg:_cleanupInstantSteal()
		arg.carryAttemptToken = nil
		arg:_clearArrivalHold()
		arg.safeStarting = false

		if arg.activeTween then
			pcall(arg.activeTween.Cancel, arg.activeTween)
			arg.activeTween = nil
		end

		if not arg.activeTween and not arg.arrivalHold then
			arg:_stopHoverPad()
		end

		if arg.running then
			arg.running = false
			arg.activeTarget = nil
			arg.stats.lastResult = lastResult
			arg:_notify()
		end

		if not arg2 then
			arg:_releaseOperation()
		end
	end

	index._groundYAt = function(arg, arg2, arg3, arg4)
		local character = arg4 or localPlayer2.Character
		local vector3 = Vector3.new(arg2, (character and character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position.Y or vector2.Y) + 60, arg3)
		local filterDescendantsInstances = {}

		if character then
			table.insert(filterDescendantsInstances, character)
		end

		if arg.hoverPad then
			table.insert(filterDescendantsInstances, arg.hoverPad)
		end

		if arg.treadmillDecoy then
			table.insert(filterDescendantsInstances, arg.treadmillDecoy)
		end

		for i, child in ipairs(workspace:GetChildren()) do
			if child.Name == name2 then
				table.insert(filterDescendantsInstances, child)
			elseif child.Name == name3 then
				table.insert(filterDescendantsInstances, child)
			end
		end

		for i = 1, 10, 1 do
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = filterDescendantsInstances
			raycastParams.IgnoreWater = true
			local hit = workspace:Raycast(vector3, Vector3.new(0, -300, 0), raycastParams)
			if not hit then
				return nil
			end

			if hit.Instance.CanCollide then
				return hit.Position.Y
			end
			table.insert(filterDescendantsInstances, hit.Instance)
		end

		return nil
	end

	index._resolveSafeCFrame = function(arg, arg2)
		if not arg2 then
			return nil
		end
		local x = vector2.X
		local z = vector2.Z
		local y = vector2.Y
		local v8 = arg:_groundYAt(x, z, arg2.Parent)
		local v9 = if v8 then v8 + 3.2 else y
		return CFrame.new(x, v9, z) * arg2.CFrame.Rotation
	end

	index._groundSnap = function(arg)
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not humanoidRootPart or not humanoid then
			return false
		end
		local position = humanoidRootPart.Position
		local v8 = arg:_groundYAt(position.X, position.Z, character)
		if not v8 then
			return false
		end
		local n58 = v8 + arg:_feetOffset(humanoidRootPart, humanoid)

		if position.Y < n58 - 0.25 or position.Y > n58 + 8 then
			pcall(function()
				arg:_syncHoverPad(Vector3.new(position.X, n58, position.Z))
				humanoidRootPart.CFrame = CFrame.new(position.X, n58, position.Z) * humanoidRootPart.CFrame.Rotation
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)

			return true
		end

		return false
	end

	local function fn88(arg)
		if typeof(arg) == "Instance" and arg:IsA("Trail") then
			pcall(arg.Destroy, arg)
		end
	end

	local function fn89(arg)
		if typeof(arg) == "Instance" then
			if arg.Name == "SpeedGainPopup" then
				pcall(arg.Destroy, arg)
			elseif arg.Name == "PlusOne" then
				pcall(arg.Destroy, arg)
			end
		end
	end

	index._showTreadmillDecoy = function(arg)
		if arg.treadmillDecoy and arg.treadmillDecoy.Parent then
			return true
		end
		arg:_hideTreadmillDecoy()
		local character = localPlayer2.Character
		if not character then
			return false
		end
		local archivable = character.Archivable
		character.Archivable = true
		local ok, treadmillDecoy = pcall(character.Clone, character)
		character.Archivable = archivable

		if ok then
			if not treadmillDecoy then
				return false
			elseif typeof(treadmillDecoy) ~= "Instance" then
				return false
			end
		else
			return false
		end

		treadmillDecoy.Name = name3

		for i, descendant in ipairs(treadmillDecoy:GetDescendants()) do
			if tbl14[descendant.ClassName] then
				pcall(descendant.Destroy, descendant)
			elseif descendant:IsA("Trail") then
				pcall(descendant.Destroy, descendant)
			elseif descendant:IsA("BasePart") then
				descendant.LocalTransparencyModifier = 0
				descendant.Anchored = true
				descendant.CanCollide = false
				descendant.CanQuery = false
				descendant.CanTouch = false
			end
		end

		local humanoidRootPart = treadmillDecoy:FindFirstChild("HumanoidRootPart")
		local humanoid = treadmillDecoy:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart then
			if not humanoid then
				treadmillDecoy:Destroy()
				return false
			end
		else
			treadmillDecoy:Destroy()
			return false
		end

		pcall(function()
			humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
		end)

		treadmillDecoy.Parent = workspace
		treadmillDecoy:PivotTo(CFrame.new(vector2))
		arg.treadmillDecoy = treadmillDecoy
		local playerGui = localPlayer2:FindFirstChildOfClass("PlayerGui")

		if playerGui then
			for i, descendant in ipairs(playerGui:GetDescendants()) do
				if descendant.Name == "SpeedGainPopup" then
					fn89(descendant)
				elseif descendant.Name == "PlusOne" then
					fn89(descendant)
				end
			end

			arg.treadmillPopupConnection = playerGui.DescendantAdded:Connect(function(descendant)
				if arg.treadmillDecoy == treadmillDecoy then
					fn89(descendant)
				end
			end)
		end

		local treadmillDecoyRealTransparency = setmetatable({}, {__mode = "k"})

		local function fn90(arg2)
			if arg2 then
				if arg2:IsA("BasePart") then
					if not arg2:IsDescendantOf(character) then
						return
					end
				else
					return
				end
			else
				return
			end

			if treadmillDecoyRealTransparency[arg2] == nil then
				treadmillDecoyRealTransparency[arg2] = arg2.LocalTransparencyModifier
			end

			arg2.LocalTransparencyModifier = 1
		end

		for i, descendant in ipairs(character:GetDescendants()) do
			fn90(descendant)
			fn88(descendant)
		end

		arg.treadmillDecoyRealTransparency = treadmillDecoyRealTransparency

		arg.treadmillDecoyCharacterConnection = character.DescendantAdded:Connect(function(descendant)
			if arg.treadmillDecoy == treadmillDecoy then
				pcall(fn90, descendant)
				fn88(descendant)
			end
		end)

		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			arg.treadmillDecoyCamera = currentCamera.CameraSubject
			currentCamera.CameraSubject = humanoid
		end

		arg.treadmillDecoyCameraConnection = RunService2.RenderStepped:Connect(function()
			if arg.treadmillDecoy ~= treadmillDecoy then
				return
			elseif treadmillDecoy.Parent then
				if not humanoid.Parent then
					return
				end
			else
				return
			end

			for k in pairs(treadmillDecoyRealTransparency) do
				if k.Parent and k.LocalTransparencyModifier ~= 1 then
					k.LocalTransparencyModifier = 1
				end
			end

			local currentCamera2 = workspace.CurrentCamera

			if currentCamera2 and currentCamera2.CameraSubject ~= humanoid then
				currentCamera2.CameraSubject = humanoid
			end
		end)

		return true
	end

	index._hideTreadmillDecoy = function(arg, arg2)
		if arg._recalling and not arg2 then
			return
		end

		if arg.treadmillDecoyCameraConnection then
			pcall(arg.treadmillDecoyCameraConnection.Disconnect, arg.treadmillDecoyCameraConnection)
			arg.treadmillDecoyCameraConnection = nil
		end

		if arg.treadmillDecoyCharacterConnection then
			pcall(arg.treadmillDecoyCharacterConnection.Disconnect, arg.treadmillDecoyCharacterConnection)
			arg.treadmillDecoyCharacterConnection = nil
		end

		if arg.treadmillPopupConnection then
			pcall(arg.treadmillPopupConnection.Disconnect, arg.treadmillPopupConnection)
			arg.treadmillPopupConnection = nil
		end

		for k, v8 in pairs(arg.treadmillDecoyRealTransparency or {}) do
			if typeof(k) == "Instance" and k.Parent then
				pcall(function()
					k.LocalTransparencyModifier = v8
				end)
			end
		end

		arg.treadmillDecoyRealTransparency = nil
		local character = localPlayer2.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			pcall(function()
				currentCamera.CameraSubject = humanoid or arg.treadmillDecoyCamera
			end)
		end

		arg.treadmillDecoyCamera = nil

		if arg.treadmillDecoy then
			pcall(arg.treadmillDecoy.Destroy, arg.treadmillDecoy)
		end

		arg.treadmillDecoy = nil
	end

	index._restoreTreadmillVisualAtSafe = function(arg)
		if not arg.treadmillDecoy then
			arg:_hideTreadmillDecoy()
			return true
		end
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local v8 = arg:_resolveSafeCFrame(humanoidRootPart)

		if humanoidRootPart then
			if humanoid then
				if not v8 then
					arg:_hideTreadmillDecoy()
					return false
				end
			else
				arg:_hideTreadmillDecoy()
				return false
			end
		else
			arg:_hideTreadmillDecoy()
			return false
		end

		local n58, v9 = os.clock() + n33
		local n59 = 0

		while true do
			local destroyed = arg.destroyed
			if not (if destroyed then not destroyed else os.clock() < n58) then
				break
			end
			local now = os.clock()

			if arg:_isInSafeArea(humanoidRootPart) then
				v9 = v9 or now
				if now - v9 >= n32 then
					arg:_hideTreadmillDecoy()
					return true
				end
			else
				v9 = nil

				if now >= n59 then
					n59 = now + n34
					arg:_teleportRoot(humanoidRootPart, humanoid, v8)
				end
			end

			task.wait(0.03)
		end

		arg:_hideTreadmillDecoy()
		return false
	end

	index._prepareTreadmillLaunch = function(arg, arg2, arg3)
		local treadmillManager = arg.treadmillManager

		if treadmillManager then
			if type(treadmillManager.pulseForCarry) ~= "function" then
				return false, "Preparation unavailable"
			end
		else
			return false, "Preparation unavailable"
		end

		local uid = arg2 and arg2.Uid

		local function fn90()
			return uid and (EggState2.ReadFieldEgg(uid) or arg.records[uid]) or nil
		end

		local function fn91()
			local v8 = fn90()
			return arg.destroyed or not arg.enabled or arg.planGeneration ~= arg3 or not arg:_wallOpen() or type(v8) ~= "table" or not arg:_matches(v8)
		end

		local function fn92(arg4)
			local character = localPlayer2.Character
			return arg:_teleportRoot(character and character:FindFirstChild("HumanoidRootPart"), character and character:FindFirstChildOfClass("Humanoid"), arg4)
		end

		arg:_setStatus("Preparing carry")
		if not arg:_showTreadmillDecoy() then
			return false, "Safe-zone visual unavailable"
		end
		local v8, v9 = treadmillManager:pulseForCarry(fn92, fn91)
		if not v8 then
			arg:_restoreTreadmillVisualAtSafe()
			return false, v9
		end
		arg:_setStatus("Positioning at safe area")
		if not arg:_restoreTreadmillVisualAtSafe() then
			return false, "Safe teleport failed"
		end

		if fn91() then
			return false, "Target changed before travel"
		end
		return true, (fn90())
	end

	index._resolveEggDestination = function(arg, arg2, arg3, arg4)
		if type(arg2) ~= "table" then
			return nil
		elseif typeof(arg2.BottomCFrame) ~= "CFrame" then
			return nil
		end

		local character = localPlayer2.Character
		arg3, arg4 = arg3 or character and character:FindFirstChild("HumanoidRootPart"), arg4 or character and character:FindFirstChildOfClass("Humanoid")

		if arg3 then
			if not arg4 then
				return nil
			end
		else
			return nil
		end

		local n58 = arg:_feetOffset(arg3, arg4) + n17
		return CFrame.new(arg2.BottomCFrame.Position + Vector3.new(0, n58, 0))
	end

	local n58 = 110
	local n59 = 30
	local n60 = 900
	local n61 = 120
	local n62 = 18
	local n63 = -426
	local n64 = -308

	local function fn90()
		local ok, result = pcall(function()
			local v8 = fn()
			return v8 and v8:FindFirstChild("Areas") and v8.Areas:FindFirstChild("EggCarryBounds")
		end)

		if ok and result then
			local gameplay1 = result:FindFirstChild("Gameplay1")

			if gameplay1 and gameplay1:IsA("BasePart") then
				local n65 = gameplay1.Size.Z * 0.5 - n62
				if n65 > 5 then
					return gameplay1.Position.Z - n65, gameplay1.Position.Z + n65
				end
			end
		end

		return n63, n64
	end

	index._resolveRouteCruiseY = function(arg, arg2, arg3)
		if arg.config.stealMode ~= "Fly" then
			return nil
		end

		if arg2 then
			if typeof(arg3) ~= "CFrame" then
				return nil
			end
		else
			return nil
		end

		if arg3.Position.Y >= n58 - 6 then
			return nil
		end
		return n58
	end

	index._resolveElevatedDestination = function(arg, arg2, arg3)
		if arg2 then
			if typeof(arg3) ~= "CFrame" then
				return nil
			end
		else
			return nil
		end

		return arg3
	end

	index._teleportRoot = function(arg, arg2, arg3, cFrame)
		if not arg2 or not arg3 then
			return false
		elseif typeof(cFrame) ~= "CFrame" then
			return false
		end

		if not pcall(function()
			arg2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			arg2.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			arg2.CFrame = cFrame
			arg2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			arg2.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		end) then
			return false
		end

		local n65 = math.clamp(arg.config.speed or n15, n13, fn61())
		fn74(localPlayer2.Character, n65 * n44)

		if not fn83(arg3, arg2, n65, (Vector3.new(0, 0, 0))) then
			fn82(arg3, arg2, n65)
			fn83(arg3, arg2, n65, (Vector3.new(0, 0, 0)))
		end

		return true
	end

	index._legitWalkSpeed = function(arg)
		local walkSpeed

		pcall(function()
			local humanoid = localPlayer2.Character and localPlayer2.Character:FindFirstChildOfClass("Humanoid")
			walkSpeed = humanoid and humanoid.WalkSpeed
		end)

		if type(walkSpeed) == "number" and (walkSpeed >= 1 and walkSpeed <= 400) then
			arg._legitWsCache = walkSpeed
		end

		return arg._legitWsCache or type(walkSpeed) == "number" and math.clamp(walkSpeed, 1, 400) or 16
	end

	index._activeGlideSpeed = function(arg)
		if arg.config.stealMode == "Fly" and arg._flyDeparting then
			return arg:_legitWalkSpeed()
		end
		return n24
	end

	index._glideRoot = function(arg, cFrame, arg2, arg3)
		if typeof(cFrame) ~= "CFrame" then
			return false
		end
		local v8 = arg3 or arg:_activeGlideSpeed()
		local character = localPlayer2.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart or not humanoid then
			return false
		end
		pcall(fn67, character)

		pcall(function()
			humanoid.AutoRotate = false
		end)

		arg:_startHoverPad()
		local position = cFrame.Position

		local function fn91(arg4, arg5, arg6)
			local n65 = math.clamp(arg.config.speed or n15, n13, fn61())

			pcall(function()
				fn74(arg4, n65 * n44)
				fn83(arg5, arg6, n65, (Vector3.new(0, 0, 0)))
			end)
		end

		local n65 = os.clock() + math.clamp((position - humanoidRootPart.Position).Magnitude / math.max(v8, 1) * 1.6 + 6, 15, 120)

		while os.clock() < n65 do
			if arg2 and arg2() then
				return false
			end

			if arg.destroyed then
				return false
			elseif not arg.enabled then
				if not arg._externalDeliver then
					return false
				end
			end

			local character2 = localPlayer2.Character
			humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
			humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid then
				return false
			end
			local position2 = humanoidRootPart.Position
			local n66 = position - position2
			local magnitude = n66.Magnitude

			if magnitude <= 1 then
				pcall(function()
					humanoidRootPart.CFrame = cFrame
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				end)

				arg:_syncHoverPad(position)
				fn91(character2, humanoid, humanoidRootPart)
				return true
			end

			local result = RunService2.Heartbeat:Wait()
			local n67 = math.max(math.min(result, n45), 0.004166666666666667)
			local n68 = math.min(v8 * n67, magnitude)
			local n69 = position2 + n66.Unit * n68

			if n67 >= 0.03333333333333333 then
				local v9 = arg:_groundYAt(n69.X, n69.Z, character2)

				if v9 then
					local n70 = v9 + arg:_feetOffset(humanoidRootPart, humanoid)

					if n69.Y < n70 then
						n69 = Vector3.new(n69.X, n70, n69.Z)
					end
				end
			end

			pcall(function()
				humanoidRootPart.CFrame = CFrame.new(n69, n69 + n66.Unit)
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)

			arg:_syncHoverPad(n69)
			fn91(character2, humanoid, humanoidRootPart)
		end

		return false
	end

	index.HOP = {studs = 500, gap = 0.15, height = 40, safeWait = 0.8}
	index.RELAY_LAND_OK = 200
	index.RELAY_ROUNDS = 3
	index.EGG_FREE_SLOTS = 5

	index._relaySettle = function(arg)
		if not arg._relaySettle_s then
			local n65 = 0.05

			pcall(function()
				n65 = localPlayer2:GetNetworkPing() or 0.05
			end)

			arg._relaySettle_s = math.clamp(0.5 + n65 * 4, index.HOP.safeWait, 2)
			arg._relayGood = 0
		end

		return arg._relaySettle_s
	end

	index._noteRelayLanding = function(arg, arg2)
		local v8 = arg:_relaySettle()

		if arg2 > index.RELAY_LAND_OK then
			arg._relaySettle_s = math.min(v8 + 0.2, 2)
			arg._relayGood = 0
		else
			arg._relayGood = (arg._relayGood or 0) + 1

			if arg._relayGood >= 5 then
				arg._relayGood = 0
				arg._relaySettle_s = math.max(v8 - 0.05, index.HOP.safeWait)
			end
		end
	end

	index._hopRoot = function(arg, arg2, arg3)
		if typeof(arg2) ~= "CFrame" then
			return false
		end
		local hop = index.HOP
		local character = localPlayer2.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart or not humanoid then
			return false
		end
		pcall(fn67, character)

		pcall(function()
			humanoid.AutoRotate = false
		end)

		arg:_startHoverPad()
		local position = arg2.Position
		local n65 = position.Y + hop.height

		local function fn91()
			if arg3 and arg3() then
				return false
			end

			if arg.destroyed then
				return false
			elseif not arg.enabled then
				if not arg._externalDeliver then
					return false
				end
			end

			character = localPlayer2.Character
			humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			humanoid = character and character:FindFirstChildOfClass("Humanoid")
			return humanoidRootPart ~= nil and humanoid ~= nil and humanoid.Health > 0
		end

		local function fn92(cFrame)
			pcall(function()
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.CFrame = cFrame
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)

			arg:_syncHoverPad(cFrame.Position)
			local n66 = math.clamp(arg.config.speed or n15, n13, fn61())

			pcall(function()
				fn74(character, n66 * n44)
				fn83(humanoid, humanoidRootPart, n66, (Vector3.new(0, 0, 0)))
			end)
		end

		local n66 = os.clock() + 20

		while os.clock() < n66 do
			if not fn91() then
				return false
			end
			local position2 = humanoidRootPart.Position
			local vector3 = Vector3.new(position.X - position2.X, 0, position.Z - position2.Z)
			if vector3.Magnitude <= hop.studs then
				fn92(arg2)
				return true
			end
			local n67 = Vector3.new(position2.X, n65, position2.Z) + vector3.Unit * hop.studs
			local cframe2 = CFrame.new(n67, n67 + vector3.Unit)
			fn92(cframe2)
			local n68 = os.clock() + hop.gap

			while os.clock() < n68 do
				RunService2.Heartbeat:Wait()
				if not fn91() then
					return false
				end
				fn92(cframe2)
			end
		end

		return false
	end

	local n65 = 420
	local n66 = 20
	local n67 = 0.5

	index._walkBrakeDecel = function(arg)
		if arg._brakeDecel then
			return arg._brakeDecel
		end
		local senaV4BrakeDecel = genv.__SenaV4BrakeDecel
		local humanoid = localPlayer2.Character and localPlayer2.Character:FindFirstChildOfClass("Humanoid")
		if type(senaV4BrakeDecel) == "table" and (humanoid and math.abs((senaV4BrakeDecel.ws or 0) - humanoid.WalkSpeed) < 15) then
			arg._brakeDecel = senaV4BrakeDecel.decel
			return senaV4BrakeDecel.decel
		end
		return n65
	end

	index._walkLeg = function(arg, arg2, arg3, arg4, arg5, arg6, arg7)
		local function fn91(arg8, arg9)
			if arg8 and arg9 then
				pcall(function()
					arg8:MoveTo(arg9.Position)
				end)
			end

			return false
		end

		local unit, v8, v9

		while os.clock() < arg6 do
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoidRootPart then
				if not humanoid then
					return false
				end
			else
				return false
			end

			if arg3 and arg3() then
				return (fn91(humanoid, humanoidRootPart))
			end

			if arg.destroyed then
				return (fn91(humanoid, humanoidRootPart))
			elseif not arg.enabled then
				if not arg._externalDeliver then
					return (fn91(humanoid, humanoidRootPart))
				end
			end

			local position = humanoidRootPart.Position
			local vector3 = Vector3.new(arg2.X - position.X, 0, arg2.Z - position.Z)
			local magnitude = vector3.Magnitude
			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local magnitude2 = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z).Magnitude

			if arg5 then
				if magnitude <= arg4 and magnitude2 <= n66 then
					pcall(function()
						humanoid:MoveTo(position)
					end)

					return true
				end
			else
				unit = unit or (magnitude > 0.001 and vector3.Unit or Vector3.new(0, 0, 0))

				if magnitude <= arg4 then
					return true
				elseif vector3:Dot(unit) <= 0 then
					return true
				end
			end

			local vector4
			local n68 = magnitude > 0.001 and math.max(assemblyLinearVelocity.X * vector3.X + assemblyLinearVelocity.Z * vector3.Z, 0) / magnitude or magnitude2

			if arg5 and magnitude <= n68 * n68 / (2 * arg:_walkBrakeDecel()) + n68 * 0.06 then
				vector4 = position
				local now = os.clock()

				if v8 and (now > v9 and magnitude2 > n66) then
					local n69 = (v8 - magnitude2) / (now - v9)

					if n69 > 20 and n69 < 5000 then
						arg._brakeDecel = arg:_walkBrakeDecel() * 0.8 + n69 * 0.93 * 0.2
						genv.__SenaV4BrakeDecel = {ws = humanoid.WalkSpeed, decel = arg._brakeDecel}
					end
				end

				v8 = magnitude2
				v9 = now
			else
				v8 = nil
				local n69 = math.max(humanoid.WalkSpeed * n67, 12)

				if arg5 and magnitude <= n69 then
					vector4 = Vector3.new(arg2.X, position.Y, arg2.Z)
				else
					vector4 = position + vector3.Unit * n69
				end
			end

			pcall(function()
				humanoid:MoveTo(vector4)
			end)

			if arg7 then
				arg7()
			end

			RunService2.Heartbeat:Wait()
		end

		local character = localPlayer2.Character
		return (fn91(character and character:FindFirstChildOfClass("Humanoid"), character and character:FindFirstChild("HumanoidRootPart")))
	end

	index._walkTo = function(arg, arg2, arg3, arg4)
		if typeof(arg2) ~= "CFrame" then
			return false
		end
		local n68 = arg4 or 8
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart then
			if not humanoid then
				return false
			end
		else
			return false
		end

		pcall(function()
			humanoid.AutoRotate = true
		end)

		local position = arg2.Position
		local walkSpeed = humanoid.WalkSpeed
		local v8 = if walkSpeed then if walkSpeed < 1 then 16 else walkSpeed else 16
		local magnitude = Vector3.new(position.X - humanoidRootPart.Position.X, 0, position.Z - humanoidRootPart.Position.Z).Magnitude
		return arg:_walkLeg(position, arg3, n68, true, os.clock() + math.clamp(magnitude / v8 * 2 + 8, 12, 90))
	end

	index._walkToZigzag = function(arg, arg2, arg3, arg4)
		if typeof(arg2) ~= "CFrame" then
			return false
		end
		local n68 = arg4 or 8
		local n69 = 60
		local n70 = 38
		local n71 = 10
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart then
			if not humanoid then
				return false
			end
		else
			return false
		end

		pcall(function()
			humanoid.AutoRotate = true
		end)

		local position = arg2.Position
		local walkSpeed = humanoid.WalkSpeed
		local v8 = if walkSpeed then if walkSpeed < 1 then 16 else walkSpeed else 16
		local magnitude = Vector3.new(position.X - humanoidRootPart.Position.X, 0, position.Z - humanoidRootPart.Position.Z).Magnitude
		local n72 = math.max(45, v8 * v8 / (2 * arg:_walkBrakeDecel()) * 1.25)
		local n73, v9, v10 = os.clock() + math.clamp(magnitude / v8 * 3 + 10, 14, 120)

		local ok, result, result2 = pcall(function()
			return fn90()
		end)

		if ok and (type(result) == "number" and type(result2) == "number") then
			local n74 = math.min(result, result2)
			local n75 = math.max(result, result2)
			v9 = n74
			v10 = n75
		end

		result2 = math.random() < 0.5 and -1 or 1

		while os.clock() < n73 do
			if arg3 and arg3() then
				return false
			end

			if arg.destroyed then
				return false
			elseif not arg.enabled then
				return false
			end

			local character2 = localPlayer2.Character
			humanoidRootPart, humanoid = character2 and character2:FindFirstChild("HumanoidRootPart"), character2 and character2:FindFirstChildOfClass("Humanoid")

			if humanoidRootPart then
				if not humanoid then
					return false
				end
			else
				return false
			end

			local position2 = humanoidRootPart.Position
			local vector3 = Vector3.new(position.X - position2.X, 0, position.Z - position2.Z)
			local magnitude2 = vector3.Magnitude
			if magnitude2 <= n72 then
				return arg:_walkLeg(position, arg3, n68, true, n73)
			end
			local unit = vector3.Unit
			local vector4 = Vector3.new(-unit.Z, 0, unit.X)
			local n74 = math.max(magnitude2 - n72 * 0.5, 4)
			local n75 = math.min(n69 + math.random() * 40, n74)
			local n76 = result2 * math.min(n70, n75 * 0.4) * (0.6 + math.random() * 0.4)
			result2 = -result2
			local n77 = position2 + unit * n75 + vector4 * n76
			n75 = n77.Z
			local v11 = if v9 then if v10 then math.clamp(n75, v9 + 2, v10 - 2) else n75 else n75
			if not arg:_walkLeg(Vector3.new(n77.X, position2.Y, v11), arg3, n71, false, n73) then
				return false
			end
		end

		return false
	end

	index._flyWalkTo = function(arg, arg2, arg3, arg4, arg5)
		if typeof(arg2) ~= "CFrame" then
			return false
		end
		local n68 = arg4 or 8
		local hoverPadHeightOverride = tonumber(arg5) or 110
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not humanoidRootPart or not humanoid then
			return false
		end

		pcall(function()
			humanoid.AutoRotate = true
		end)

		local function fn91()
			pcall(function()
				local humanoid2 = localPlayer2.Character and localPlayer2.Character:FindFirstChildOfClass("Humanoid")
				local animator = humanoid2 and humanoid2:FindFirstChildWhichIsA("Animator")

				if animator then
					for i, v8 in ipairs(animator:GetPlayingAnimationTracks()) do
						v8:Stop(0)
					end
				end
			end)
		end

		local function fn92(disabled)
			local character2 = localPlayer2.Character
			local animate = character2 and character2:FindFirstChild("Animate")

			if animate then
				pcall(function()
					animate.Disabled = disabled
				end)
			end
		end

		fn92(true)
		fn91()
		local position = arg2.Position
		arg.hoverPadHeightOverride = hoverPadHeightOverride
		arg:_startHoverPad()

		pcall(function()
			humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, hoverPadHeightOverride, humanoidRootPart.Position.Z) * humanoidRootPart.CFrame.Rotation
			humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		end)

		arg:_syncHoverPad()
		local walkSpeed = humanoid.WalkSpeed
		local v8 = if walkSpeed then if walkSpeed < 1 then 16 else walkSpeed else 16
		local magnitude = Vector3.new(position.X - humanoidRootPart.Position.X, 0, position.Z - humanoidRootPart.Position.Z).Magnitude
		local v9 = arg:_walkLeg(position, arg3, n68, true, os.clock() + math.clamp(magnitude / v8 * 2 + 10, 12, 120), fn91)
		fn92(false)
		arg.hoverPadHeightOverride = nil
		if not v9 then
			return false
		end

		if arg3 and arg3() then
			return false
		end
		arg:_glideRoot(arg2, arg3, arg:_legitWalkSpeed())
		return not (arg3 and arg3())
	end

	index._isInSafeArea = function(arg, arg2)
		if not arg2 then
			return false
		end
		local n68 = arg2.Position - vector2
		return Vector2.new(n68.X, n68.Z).Magnitude <= n30 and math.abs(n68.Y) <= n31
	end

	index._isInField = function(arg, arg2)
		local v8 = fn()
		local areas = v8 and v8:FindFirstChild("Areas")
		local wallStartCollision = areas and areas:FindFirstChild("WallStartCollision")

		if wallStartCollision then
			if not wallStartCollision:IsA("BasePart") then
				return true
			end
		else
			return true
		end

		return arg2.Position.X >= wallStartCollision.Position.X + 3
	end

	index._needsSafeZoneHop = function(arg, arg2)
		if arg:_isInField(arg2) then
			return false, nil
		elseif arg:_isInSafeArea(arg2) then
			return false, nil
		end

		return true, arg:_resolveSafeCFrame(arg2)
	end

	index._invalidateCarryWorker = function(arg)
		arg.carryWorker = nil
	end

	index._claimCarryWorker = function(arg, arg2, arg3)
		local generation = arg.carry.generation
		local carryWorker = arg.carryWorker
		if carryWorker and carryWorker.generation == generation then
			return nil
		end
		local carryWorker2 = {kind = arg2, uid = arg3, generation = generation, token = {}}
		arg.carryWorker = carryWorker2
		return carryWorker2
	end

	index._isCarryWorkerCurrent = function(arg, arg2)
		return type(arg2) == "table" and arg.carryWorker == arg2 and arg.carry.generation == arg2.generation and not arg.destroyed and (arg.enabled or arg._externalDeliver)
	end

	index._releaseCarryWorker = function(arg, arg2)
		if arg.carryWorker == arg2 then
			arg.carryWorker = nil
		end
	end

	index.ownsCarryRecovery = function(arg, arg2)
		if arg.destroyed then
			return false
		elseif not arg.enabled then
			return false
		end

		if arg.carry.uid == arg2 then
			return true
		end
		return arg.running and arg.activeTarget ~= nil and (arg2 == nil or arg.activeTarget.Uid == arg2)
	end

	index.requestCarryRecovery = function(arg, arg2)
		if arg.destroyed then
			return false
		elseif arg.enabled then
			if type(arg2) ~= "string" then
				return false
			elseif arg2 == "" then
				return false
			end
		else
			return false
		end

		if arg:isSkippedEgg(arg2) then
			return true
		end

		if arg.tweenRecoveryUid == arg2 then
			arg:_scheduleMovementRetry()
			return true
		end

		if arg.carry.active and arg.carry.uid == arg2 then
			return true
		end
		local v8 = EggState2.ReadFieldEgg(arg2) or arg.records[arg2]

		if type(v8) ~= "table" then
			return false
		elseif v8.State ~= AreaEggs.States.Dropped then
			if v8.State ~= AreaEggs.States.Slot then
				return false
			end
		end

		local carryWorker = arg.carryWorker

		if carryWorker and carryWorker.kind == "re-steal" and carryWorker.uid == arg2 or arg.activeTween and arg.activeTarget and arg.activeTarget.Uid == arg2 then
			return true
		elseif arg.carryAttemptToken then
			if arg.activeTarget and arg.activeTarget.Uid == arg2 then
				return true
			end
		end

		arg.carry.generation += 1
		arg:_invalidateCarryWorker()
		arg.carryAttemptToken = nil
		arg.running = true
		arg.activeTarget = v8

		task.defer(function()
			if not arg.destroyed and (arg.enabled and not arg.carry.active) then
				arg:_reStealDroppedEgg(arg2)
			end
		end)

		return true
	end

	index._hasConfirmedCarry = function(arg, arg2)
		if not arg.carry.active then
			return false
		end

		if arg2 == nil then
			return true
		elseif arg.carry.uid == nil then
			return true
		end

		return arg.carry.uid == arg2
	end

	index._adoptCarryFromRecord = function(arg, uid)
		if arg.carry.active and arg.carry.uid == uid then
			return
		end

		if arg.carryTimeouts then
			arg.carryTimeouts[uid] = nil
		end

		if arg.instantPhase == "priming" and uid == arg.primerUid then
			arg.carry.active = true
			arg.carry.uid = uid
			return
		end

		arg.carry.generation += 1
		arg:_invalidateCarryWorker()
		arg:_clearArrivalHold(uid)
		local activeTarget = arg.activeTarget
		arg.claimPresentationSuppression = {assetCategory = activeTarget and activeTarget.AssetCategory, expiresAt = os.clock() + 8}
		arg.carry.active = true
		arg.carry.uid = uid
		arg.carryStartTime = os.clock()
		local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
		arg.carryStartPos = activeTarget and activeTarget.BottomCFrame and activeTarget.BottomCFrame.Position or humanoidRootPart and humanoidRootPart.Position

		if arg.tweenRecoveryUid == uid then
			arg.tweenRecoveryUid = nil
		end

		arg.stats.lastResult = "Carry confirmed"
		arg:_notify()
	end

	index._recordShowsCarried = function(arg, arg2)
		if type(arg2) ~= "string" then
			return false
		elseif arg2 == "" then
			return false
		end

		local v8 = EggState2.ReadFieldEgg(arg2) or arg.records[arg2]
		return type(v8) == "table" and v8.State == AreaEggs.States.Carried and v8.CarrierUserId == localPlayer2.UserId
	end

	index._recordShowsForeignCarry = function(arg, arg2)
		if type(arg2) ~= "string" then
			return false
		elseif arg2 == "" then
			return false
		end

		local v8 = EggState2.ReadFieldEgg(arg2) or arg.records[arg2]
		return type(v8) == "table" and v8.State == AreaEggs.States.Carried and v8.CarrierUserId ~= nil and v8.CarrierUserId ~= localPlayer2.UserId
	end

	index._resolveMovementSpeed = function(arg, arg2)
		if arg2.Parent then
			if arg2.Health <= 0 then
				return nil
			end
		else
			return nil
		end

		return math.clamp(arg.config.speed, n13, fn61())
	end

	index._isAreaSafe = function(arg, arg2)
		return true
	end

	index._feetOffset = function(arg, arg2, arg3)
		if arg3.RigType == Enum.HumanoidRigType.R15 then
			return arg2.Size.Y * 0.5 + math.max(arg3.HipHeight, 0.5)
		end
		return arg2.Size.Y * 0.5 + 2
	end

	index.setAntiTrap = function(arg, arg2)
		arg.config.antiTrap = arg2 == true

		if arg.config.antiTrap then
			arg:_purgeTraps()
		end
	end

	index._isForeignTrap = function(arg, arg2)
		if arg2.Name == str7 and arg2:IsA("BasePart") then
			local attribute = arg2:GetAttribute("Owner")
			return type(attribute) ~= "string" or attribute ~= localPlayer2.Name
		end
		return arg2:IsA("Model") and arg2.Name == str8 and arg2:FindFirstChild("Hitbox") ~= nil
	end

	index._purgeTrap = function(arg, arg2)
		if arg.config.antiTrap then
			if arg2 then
				if not arg2.Parent then
					return
				end
			else
				return
			end
		else
			return
		end

		if arg:_isForeignTrap(arg2) then
			pcall(arg2.Destroy, arg2)
		end
	end

	index._purgeTraps = function(arg)
		for i, v8 in ipairs({"Transient", "__DEBRIS"}) do
			local v9 = workspace:FindFirstChild(v8)

			if v9 then
				for i2, descendant in ipairs(v9:GetDescendants()) do
					arg:_purgeTrap(descendant)
				end
			end
		end
	end

	index._syncHoverPad = function(arg, arg2)
		local hoverPad = arg.hoverPad

		if hoverPad then
			if hoverPad.Parent then
				if hoverPad:GetAttribute(str6) ~= arg.hoverPadOwnerId then
					return false
				end
			else
				return false
			end
		else
			return false
		end

		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart then
			if not humanoid then
				return false
			end
		else
			return false
		end

		local position = typeof(arg2) == "Vector3" and arg2 or humanoidRootPart.Position
		local y = position.Y
		local v8 = if arg.hoverPadHeightOverride ~= nil then if typeof(arg2) ~= "Vector3" then arg.hoverPadHeightOverride else y else y
		local v9 = if arg.hoverPadHeightOverride ~= nil then math.max(n18, humanoid.WalkSpeed * 2 / 15) else n18

		if math.abs(hoverPad.Size.X - v9) > 0.5 then
			hoverPad.Size = Vector3.new(v9, n19, v9)
		end

		hoverPad.CFrame = CFrame.new(position.X, v8 - arg:_feetOffset(humanoidRootPart, humanoid) - n19 * 0.5 - 0.05, position.Z)
		return true
	end

	index._setArrivalHold = function(arg, arg2, arg3)
		if typeof(arg2) ~= "CFrame" then
			return
		end
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		if character then
			if not humanoidRootPart then
				return
			end
		else
			return
		end

		arg.arrivalHold = {Character = character, RootPart = humanoidRootPart, CFrame = arg2, Uid = arg3}
	end

	index._clearArrivalHold = function(arg, arg2)
		local arrivalHold = arg.arrivalHold

		if arrivalHold then
			if arg2 == nil then
				arg.arrivalHold = nil
			elseif arrivalHold.Uid == nil then
				arg.arrivalHold = nil
			elseif arrivalHold.Uid == arg2 then
				arg.arrivalHold = nil
			end
		else
			arg.arrivalHold = nil
		end
	end

	index._enforceArrivalHold = function(arg)
		local arrivalHold = arg.arrivalHold

		if type(arrivalHold) ~= "table" then
			return false
		elseif typeof(arrivalHold.CFrame) ~= "CFrame" then
			return false
		end

		if localPlayer2.Character ~= arrivalHold.Character then
			arg.arrivalHold = nil
			return false
		elseif arrivalHold.RootPart then
			if not arrivalHold.RootPart.Parent then
				arg.arrivalHold = nil
				return false
			end
		else
			arg.arrivalHold = nil
			return false
		end

		arg:_startHoverPad()

		pcall(function()
			arrivalHold.RootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			arrivalHold.RootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			arg:_syncHoverPad(arrivalHold.CFrame.Position)
			arrivalHold.RootPart.CFrame = arrivalHold.CFrame
		end)

		arg:_syncHoverPad(arrivalHold.CFrame.Position)
		return true
	end

	index._purgeOrphanHoverPads = function(arg)
		for i, child in ipairs(workspace:GetChildren()) do
			if child.Name == name2 and child ~= arg.hoverPad then
				pcall(child.Destroy, child)
			end
		end
	end

	index._startHoverPad = function(arg)
		local hoverPad = arg.hoverPad

		if (if hoverPad then not hoverPad.Parent else not hoverPad) or hoverPad:GetAttribute(str6) ~= arg.hoverPadOwnerId then
			arg:_purgeOrphanHoverPads()

			if hoverPad and hoverPad.Parent then
				pcall(hoverPad.Destroy, hoverPad)
			end

			local part = Instance.new("Part")
			part.Name = name2
			part:SetAttribute(str6, arg.hoverPadOwnerId)
			part.Anchored = true
			part.CanCollide = true
			part.CanQuery = true
			part.CanTouch = false
			part.CastShadow = false
			part.Transparency = 1
			part.Material = Enum.Material.SmoothPlastic
			part.Size = Vector3.new(n18, n19, n18)
			arg.hoverPad = part
			part.Parent = workspace
		end

		arg:_syncHoverPad()

		if not arg.hoverPadConnection then
			arg.hoverPadConnection = RunService2.PreSimulation:Connect(function()
				if not arg:_syncHoverPad() then
					arg:_startHoverPad()
				end
			end)
		end

		if not arg.hoverPadPostConnection then
			arg.hoverPadPostConnection = RunService2.PostSimulation:Connect(function()
				if arg.activeTween then
					arg:_syncHoverPad()
				elseif arg.arrivalHold then
					arg:_syncHoverPad()
				end
			end)
		end
	end

	index._stopHoverPad = function(arg)
		arg.hoverPadHeightOverride = nil

		if arg.hoverPadConnection then
			pcall(arg.hoverPadConnection.Disconnect, arg.hoverPadConnection)
			arg.hoverPadConnection = nil
		end

		if arg.hoverPadPostConnection then
			pcall(arg.hoverPadPostConnection.Disconnect, arg.hoverPadPostConnection)
			arg.hoverPadPostConnection = nil
		end

		if arg.hoverPad then
			pcall(arg.hoverPad.Destroy, arg.hoverPad)
			arg.hoverPad = nil
		end

		arg:_purgeOrphanHoverPads()
	end

	index._startMovementProtection = function(arg)
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if character then
			if humanoidRootPart then
				if not humanoid then
					return false
				end
			else
				return false
			end
		else
			return false
		end

		local n68 = math.clamp(arg.config.speed or n15, n13, fn61())
		arg.protectionCharacter = character
		arg.protectionHumanoid = humanoid
		arg.protectionRoot = humanoidRootPart
		fn74(character, n68 * n44)
		fn82(humanoid, humanoidRootPart, n68)

		if not arg.integritySpoofConnection then
			arg.integritySpoofConnection = RunService2.PreSimulation:Connect(function()
				local character2 = localPlayer2.Character
				local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
				local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")

				if character2 then
					if humanoidRootPart2 then
						if not humanoid2 then
							return
						end
					else
						return
					end
				else
					return
				end

				local n69 = math.clamp(arg.config.speed or n15, n13, fn61())
				arg.protectionCharacter = character2
				arg.protectionHumanoid = humanoid2
				arg.protectionRoot = humanoidRootPart2
				fn74(character2, n69 * n44)

				if not fn83(humanoid2, humanoidRootPart2, n69) then
					fn82(humanoid2, humanoidRootPart2, n69)
				end

				arg:_enforceArrivalHold()
			end)
		end

		if not arg.arrivalHoldConnection then
			arg.arrivalHoldConnection = RunService2.Heartbeat:Connect(function()
				arg:_enforceArrivalHold()
			end)
		end

		return true
	end

	index._startFlyGrounding = function(arg)
		arg:_stopFlyGrounding()
		local v8 = fn79()

		arg._flyGroundConn = RunService2.PreSimulation:Connect(function()
			if arg.destroyed then
				return
			end
			local state = v8 and v8.State

			if type(state) ~= "table" then
				return
			elseif rawget(state, "CorrectionContext") ~= nil then
				return
			end

			rawset(state, "IsSupportedNow", true)
			rawset(state, "UnsupportedStartedAt", nil)

			if rawget(state, "MovementMode") ~= "Correcting" then
				rawset(state, "MovementMode", "Grounded")
			end

			local value = rawget(state, "Evidence")

			if type(value) == "table" then
				value.Flight = 0
				value.Teleport = 0
				value.Speed = 0
			end
		end)
	end

	index._stopFlyGrounding = function(arg)
		if arg._flyGroundConn then
			pcall(arg._flyGroundConn.Disconnect, arg._flyGroundConn)
			arg._flyGroundConn = nil
		end
	end

	index._stopMovementProtection = function(arg)
		arg:_stopFlyGrounding()

		if arg.integritySpoofConnection then
			pcall(arg.integritySpoofConnection.Disconnect, arg.integritySpoofConnection)
			arg.integritySpoofConnection = nil
		end

		if arg.arrivalHoldConnection then
			pcall(arg.arrivalHoldConnection.Disconnect, arg.arrivalHoldConnection)
			arg.arrivalHoldConnection = nil
		end

		arg:_clearArrivalHold()
		arg:_stopHoverPad()
		fn75()
		fn84(arg.protectionHumanoid)
		arg.protectionCharacter = nil
		arg.protectionHumanoid = nil
		arg.protectionRoot = nil
	end

	index.travelAndWait = function(arg, arg2, arg3)
		local tbl16 = arg3 or {}
		if arg.destroyed then
			return false
		end

		if arg.travelBusy and os.clock() < (arg.travelBusyUntil or 0) then
			return false
		end
		local flag5, ok = arg.activeTween and not arg.running

		if flag5 then
			local sharedTravel = arg.activeTween.sharedTravel
			ok = if sharedTravel then tbl16.preempt == true else not sharedTravel
		else
			ok = flag5
		end

		if ok then
			pcall(arg.activeTween.Cancel, arg.activeTween)
			flag5 = os.clock() + 0.5

			while arg.activeTween and os.clock() < flag5 do
				task.wait(0.05)
			end
		end

		if arg.activeTween then
			return false
		end
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return false
		end
		arg.travelBusy = true
		arg.travelBusyUntil = os.clock() + 45

		ok, flag5 = pcall(function()
			local flag6
			local now = os.clock()
			local magnitude = (arg2.Position - humanoidRootPart.Position).Magnitude
			local n68 = now + magnitude / math.max(tonumber(tbl16.speed) or arg.config.speed or n15, n13) + 6
			arg.travelBusyUntil = n68 + 2
			local speed2 = tbl16.speed

			local tbl17 = {silent = true, sharedTravel = true, abort = function()
				return arg.destroyed or tbl16.abort ~= nil and tbl16.abort()
			end}

			tbl17.onDone = function(arg4)
				flag6 = arg4 == true
			end

			arg:_tweenRoot(arg2, nil, speed2, tbl17)
			speed2 = now

			while true do
				if not (flag6 == nil) then
					break
				end
				local now2 = os.clock()
				local humanoidRootPart2 = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
				local magnitude2 = humanoidRootPart2 and (arg2.Position - humanoidRootPart2.Position).Magnitude or 1 / 0

				if magnitude2 < magnitude - 0.5 then
					magnitude = magnitude2
					speed2 = now2
				end

				if arg.destroyed or tbl16.abort ~= nil and tbl16.abort() or now2 - speed2 >= 1.5 or now2 >= n68 then
					if arg.activeTween and arg.activeTween.Cancel then
						pcall(arg.activeTween.Cancel)
					end

					flag6 = false
					break
				end

				task.wait(0.05)
			end

			return flag6
		end)

		arg.travelBusy = false

		if not ok then
			if arg.activeTween and (arg.activeTween.sharedTravel and arg.activeTween.Cancel) then
				pcall(arg.activeTween.Cancel)
			end

			return false
		end

		return flag5 == true
	end

	index._tweenRoot = function(arg, arg2, arg3, arg4, arg5)
		arg:_clearArrivalHold()
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local tbl16 = arg5 or {}

		if not humanoidRootPart or not humanoid then
			arg.safeStarting = false

			if tbl16.silent then
				if tbl16.onDone then
					pcall(tbl16.onDone, false)
				end

				return
			end

			arg:_finish("Character unavailable")
			return
		end

		local v8 = arg4 or arg:_resolveMovementSpeed(humanoid)

		if not v8 then
			arg.safeStarting = false

			if tbl16.silent then
				if tbl16.onDone then
					pcall(tbl16.onDone, false)
				end

				return
			end

			arg:_finish("Movement unavailable")
			return
		end

		local n68 = math.clamp(v8, n13, fn61())
		arg:_startMovementProtection()
		pcall(fn67, character)
		local currentCamera = workspace.CurrentCamera

		if currentCamera and currentCamera.CameraSubject ~= humanoid then
			pcall(function()
				currentCamera.CameraSubject = humanoid
			end)
		end

		local autoRotate = humanoid.AutoRotate
		humanoid.AutoRotate = false
		local flag5 = tbl16.flightProfile == true and arg:_resolveRouteCruiseY(humanoidRootPart, arg2) or nil
		local activeTween = {sharedTravel = tbl16.sharedTravel == true, routeCruiseY = flag5, travelPhase = flag5 and "takeoff" or nil, zigzag = arg.config.stealMode == "Zig-Zag", zigT = 0, zigLast = 0}
		arg.activeTween = activeTween
		arg:_startHoverPad()
		local flag6, connection6, now, v9 = false
		local n69 = 0

		local function fn91(arg6)
			if flag6 then
				return
			end
			flag6, now = true, nil

			if humanoid.Parent ~= nil then
				humanoid.AutoRotate = autoRotate
			end

			if arg6 and tbl16.holdAfterArrival then
				arg:_setArrivalHold(arg2, tbl16.holdUid)
			end

			if tbl16.onDone then
				pcall(tbl16.onDone, arg6 == true)
			end

			if connection6 then
				connection6:Disconnect()
				connection6 = nil
			end

			if arg.activeTween == activeTween then
				arg.activeTween = nil
			end

			if not arg.arrivalHold then
				arg:_stopHoverPad()
			end

			if not arg.enabled then
				arg:_stopMovementProtection()
			end

			pcall(function()
				if localPlayer2.Character == character and humanoidRootPart.Parent then
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				end
			end)

			if arg6 and (localPlayer2.Character == character and (humanoid.Parent ~= nil and arg3)) then
				arg3()
			end
		end

		activeTween.Cancel = function()
			fn91(false)
		end

		connection6 = RunService2.Heartbeat:Connect(function(deltaTime)
			if tbl16.abort and tbl16.abort() then
				fn91(false)
				return
			end

			if arg.destroyed then
				fn91(false)
				return
			elseif arg.activeTween ~= activeTween then
				fn91(false)
				return
			end

			if tbl16.carryTarget and os.clock() >= (activeTween.nextTargetCheck or 0) then
				activeTween.nextTargetCheck = os.clock() + 0.1
				local uid = tbl16.carryTarget.Uid
				local v10 = EggState2.ReadFieldEgg(uid)
				local state = v10 and v10.State

				if state ~= AreaEggs.States.Slot and (state ~= AreaEggs.States.Dropped and (state ~= "GuardCarried" and (not (v10 and v10.CarrierUserId == localPlayer2.UserId) and not arg:_hasConfirmedCarry(uid)))) then
					fn91(false)
					local senaV4PlayerSteal = genv.__SenaV4PlayerSteal
					arg:_finish(state == "Carried" and senaV4PlayerSteal ~= nil and senaV4PlayerSteal:intercept(uid) and "Target taken - chasing the carrier" or "Target taken by someone else")
					return
				end
			end

			pcall(function()
				local n70 = math.clamp(arg4 or arg.config.speed or n68, n13, fn61())
				fn74(character, n70 * n44)
				local v10 = fn71()[str4]
				local state = type(v10) == "table" and v10.State or nil

				if not fn81(state, humanoid, humanoidRootPart) then
					v9, now = nil, nil
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					arg:_syncHoverPad(humanoidRootPart.Position)

					if fn80(state, humanoid, humanoidRootPart) then
						fn78(state, n70 * n44, (Vector3.new(0, 0, 0)))
					else
						fn82(humanoid, humanoidRootPart, n70)
					end

					return
				end

				local position = humanoidRootPart.Position
				local n71 = arg2.Position - position
				local magnitude = n71.Magnitude
				local vector3 = Vector3.new(n71.X, 0, n71.Z)
				local magnitude2 = vector3.Magnitude
				local position2 = arg2.Position

				if activeTween.routeCruiseY then
					if activeTween.travelPhase == "takeoff" then
						if position.Y >= activeTween.routeCruiseY - 0.5 then
							activeTween.travelPhase = "cruise"
						else
							position2 = Vector3.new(position.X, activeTween.routeCruiseY, position.Z)
						end
					end

					if activeTween.travelPhase == "cruise" then
						if magnitude2 <= 4 then
							activeTween.travelPhase = "descend"
						else
							position2 = Vector3.new(arg2.Position.X, activeTween.routeCruiseY, arg2.Position.Z)
						end
					end

					position2 = if activeTween.travelPhase == "descend" then arg2.Position else position2
				end

				local n72 = position2 - position
				local magnitude3 = n72.Magnitude
				local routeCruiseY = activeTween.routeCruiseY and magnitude2 or magnitude
				local carryTarget

				if v9 and routeCruiseY > v9 + n47 then
					n69 = os.clock() + n48
				end

				v9 = routeCruiseY
				routeCruiseY = os.clock() < n69 and math.max(n13, n70 * n49) or n70

				if tbl16.carryTarget and not activeTween.__earlyCarrySpam and magnitude <= 30 then
					activeTween.__earlyCarrySpam = true
					carryTarget = tbl16.carryTarget
					local uid = carryTarget.Uid
					local v11 = AreaEggSlotIdentity.LooksLikeFirstAreaUid(uid) and AreaEggSlotIdentity.SlotKey(carryTarget.AreaId, carryTarget.NestId) or nil

					task.spawn(function()
						while true do
							local destroyed = arg.destroyed
							if not ((if destroyed then not destroyed else arg.enabled) and arg.activeTween == activeTween and not arg:_hasConfirmedCarry(uid)) then
								break
							end
							pcall(fn62, uid, v11)
							task.wait(0.08)
						end
					end)
				end

				local n73 = math.max(math.min(deltaTime, n45), 0.004166666666666667)
				local n74 = routeCruiseY * n73
				local vector4 = Vector3.new(humanoidRootPart.CFrame.LookVector.X, 0, humanoidRootPart.CFrame.LookVector.Z)
				local unit = vector3.Magnitude > 0.001 and vector3.Unit or (vector4.Magnitude > 0.001 and vector4.Unit or Vector3.new(0, 0, -1))
				local routeCruiseY2 = activeTween.routeCruiseY

				if (if routeCruiseY2 then activeTween.travelPhase == "descend" else not routeCruiseY2) and magnitude <= math.max(n74, 0.05) then
					if magnitude > 0.5 then
						now = nil
					end

					arg:_syncHoverPad(arg2.Position)
					humanoidRootPart.CFrame = CFrame.lookAt(arg2.Position, arg2.Position + unit)
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					arg:_syncHoverPad(arg2.Position)
					fn83(humanoid, humanoidRootPart, n70, (Vector3.new(0, 0, 0)))
					now = now or os.clock()

					if os.clock() - now >= n50 then
						fn91(true)
					end

					return
				end

				now = nil

				if magnitude3 <= 0.001 then
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					arg:_syncHoverPad(position)
					return
				end

				if arg.hoverPad then
					if not arg.hoverPad.Parent then
						arg:_startHoverPad()
					end
				else
					arg:_startHoverPad()
				end

				local n75 = math.min(n74, magnitude3)
				vector3, routeCruiseY2, routeCruiseY = position + n72.Unit * n75, n73 >= 0.03333333333333333

				if routeCruiseY2 then
					local routeCruiseY3 = activeTween.routeCruiseY
					routeCruiseY = if routeCruiseY3 then activeTween.travelPhase ~= "cruise" else not routeCruiseY3
				else
					routeCruiseY = routeCruiseY2
				end

				if routeCruiseY then
					local v11 = arg:_groundYAt(vector3.X, vector3.Z, character)

					if v11 then
						local n76 = v11 + arg:_feetOffset(humanoidRootPart, humanoid)
						vector3 = if vector3.Y < n76 then Vector3.new(vector3.X, n76, vector3.Z) else vector3
					end
				end

				magnitude, n74 = activeTween.zigzag

				if magnitude then
					local routeCruiseY3 = activeTween.routeCruiseY
					n74 = if routeCruiseY3 then activeTween.travelPhase == "cruise" else not routeCruiseY3
				else
					n74 = magnitude
				end

				if n74 then
					local vector5 = Vector3.new(n72.X, 0, n72.Z)

					if vector5.Magnitude > 1 then
						if magnitude2 > 12 then
							local unit2 = vector5.Unit
							local vector6 = Vector3.new(-unit2.Z, 0, unit2.X)
							magnitude3 = math.min(n59, magnitude2 * 0.3)
							local v11 = if magnitude2 < n61 then magnitude3 * (magnitude2 / n61) else magnitude3
							activeTween.zigT = (activeTween.zigT or 0) + n75
							local zigLast = v11 * math.sin(activeTween.zigT / n60 * 3.141592653589793 * 2)
							local n76 = zigLast - (activeTween.zigLast or 0)
							activeTween.zigLast = zigLast
							local n77 = vector3 + vector6 * n76

							if not activeTween.zigLaneMin then
								activeTween.zigLaneMin, activeTween.zigLaneMax = fn90()
							end

							local n78 = math.clamp(n77.Z, activeTween.zigLaneMin, activeTween.zigLaneMax)
							vector3 = if n78 ~= n77.Z then Vector3.new(n77.X, n77.Y, n78) else n77
						else
							activeTween.zigLast = 0
						end
					else
						activeTween.zigLast = 0
					end
				end

				local n76 = (vector3 - position) / n73
				arg:_syncHoverPad(vector3)
				humanoidRootPart.CFrame = CFrame.lookAt(vector3, vector3 + unit)
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				arg:_syncHoverPad(vector3)

				if not fn83(humanoid, humanoidRootPart, n70, n76) then
					fn82(humanoid, humanoidRootPart, n70)
					fn83(humanoid, humanoidRootPart, n70, n76)
				end
			end)
		end)
	end

	index._reStealDroppedEgg = function(arg, arg2)
		if type(arg2) ~= "string" then
			arg:_finish("Egg lost \226\128\148 retrying")
			return
		elseif arg2 == "" then
			arg:_finish("Egg lost \226\128\148 retrying")
			return
		end

		if arg:isSkippedEgg(arg2) then
			return
		end

		if arg.tweenRecoveryUid == arg2 then
			arg.running = false
			arg.activeTarget = nil
			arg:_releaseOperation()
			arg:_scheduleMovementRetry()
			return
		end

		local v8 = arg:_claimCarryWorker("re-steal", arg2)
		if not v8 then
			return
		end

		if genv.__SenaV4GodMode then
			genv.__SenaV4GodMode:startDefend(arg2)
		end

		local n68 = os.clock() + 5
		arg:_setStatus("Re-stealing dropped egg")
		local v9

		while arg:_isCarryWorkerCurrent(v8) and os.clock() < n68 do
			local v10 = EggState2.ReadFieldEgg(arg2) or arg.records[arg2]

			if v10 then
				if v10.State == AreaEggs.States.Dropped then
					v9 = v10
					break
				elseif v10.State == AreaEggs.States.Slot then
					v9 = v10
					break
				end
			end

			task.wait(0.03)
		end

		if not arg:_isCarryWorkerCurrent(v8) then
			return
		end

		if if v9 then not arg:_wallOpen() else not v9 then
			arg:_releaseCarryWorker(v8)
			arg:_finish("Egg lost \226\128\148 retrying")
			return
		end

		arg:_cancelTween("Re-stealing dropped egg", true)
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		n68 = arg:_resolveEggDestination(v9, humanoidRootPart, humanoid)
		local v10 = n68 and arg:_resolveElevatedDestination(humanoidRootPart, n68) or nil

		if not v10 then
			arg:_releaseCarryWorker(v8)
			arg:_finish("Character unavailable")
			return
		end

		arg.running = true
		arg.activeTarget = v9
		arg:_setStatus("Bringing egg home")

		if arg:_regrabBurst(v8, v9.Uid, 3.5) then
			return
		elseif not arg:_isCarryWorkerCurrent(v8) then
			return
		end

		arg:_setStatus("Re-stealing egg")

		if not arg:_teleportRoot(humanoidRootPart, humanoid, v10) then
			arg:_releaseCarryWorker(v8)
			arg:_finish("Re-steal failed \226\128\148 retrying")
			return
		end

		arg:_setArrivalHold(v10, v9.Uid)
		arg:_setStatus("Re-stealing egg")

		if arg:_isCarryWorkerCurrent(v8) then
			arg:_requestCarry(v9, true)
		end
	end

	index._regrabBurst = function(arg, arg2, arg3, arg4)
		local function fn91()
			local v8 = EggState2.ReadFieldEgg(arg3)
			return v8 ~= nil and v8.State == AreaEggs.States.Carried and v8.CarrierUserId == localPlayer2.UserId
		end

		local RagdollJoints

		pcall(function()
			RagdollJoints = require(ReplicatedStorage2.Shared.Modules.RagdollJoints)
		end)

		local flag5 = false
		local flag6 = false
		local n68 = os.clock() + arg4

		while os.clock() < n68 and not arg.destroyed and (arg.enabled or arg._externalDeliver) do
			if fn91() then
				return true
			end

			if not arg:_isCarryWorkerCurrent(arg2) then
				return (fn91())
			end
			local v8 = EggState2.ReadFieldEgg(arg3)

			if v8 then
				if v8.State ~= AreaEggs.States.Dropped and v8.State ~= AreaEggs.States.Slot then
					return false
				end
			else
				return false
			end

			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoidRootPart then
				if not humanoid then
					return false
				end
			else
				return false
			end

			pcall(function()
				if RagdollJoints and RagdollJoints.Release then
					RagdollJoints.Release(character)
				end

				humanoid.PlatformStand = false
				humanoid.Sit = false

				if humanoid:GetState() ~= Enum.HumanoidStateType.Running then
					humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
				end
			end)

			local v9 = arg:_resolveEggDestination(v8, humanoidRootPart, humanoid)

			if v9 then
				humanoidRootPart.CFrame = v9
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				arg:_syncHoverPad(v9.Position)
			end

			if not flag5 then
				flag5 = true

				task.spawn(function()
					pcall(function()
						eggWorld.AskFieldEggCarry:InvokeServer({Uid = arg3})
					end)

					flag5 = false
				end)
			end

			if not flag6 then
				flag6 = true

				task.spawn(function()
					pcall(EggState2.CarryFieldEgg, arg3)
					flag6 = false
				end)
			end

			pcall(function()
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				local v10 = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(tostring(arg3))
				local carryAreaEgg = v10 and (v10:FindFirstChild("CarryAreaEgg", true) or v10:FindFirstChildWhichIsA("ProximityPrompt", true))

				if carryAreaEgg and (carryAreaEgg.Enabled and type(fireproximityprompt) == "function") then
					carryAreaEgg.HoldDuration = 0
					carryAreaEgg.RequiresLineOfSight = false
					fireproximityprompt(carryAreaEgg, 0)
				end
			end)

			task.wait(0.06)
		end

		return (fn91())
	end

	index._recoverCarryConfirmationTimeout = function(arg, arg2, arg3)
		if arg.destroyed then
			return false
		elseif arg.enabled then
			if arg.carryAttemptToken ~= arg2 then
				return false
			elseif arg:_hasConfirmedCarry(arg3) then
				return false
			end
		else
			return false
		end

		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		arg2 = humanoidRootPart and arg:_resolveSafeCFrame(humanoidRootPart)
		local v8 = arg2 and arg:_resolveElevatedDestination(humanoidRootPart, arg2) or nil
		arg.carryTimeouts = arg.carryTimeouts or {}
		local n68 = (arg.carryTimeouts[arg3] or 0) + 1
		local flag5 = n68 >= n37

		if flag5 then
			arg.carryTimeouts[arg3] = nil
			arg.skippedEggs[arg3] = os.clock() + n38
			arg.tweenRecoveryUid = nil
		else
			arg.carryTimeouts[arg3] = n68
			local v9 = arg:_isPrimerEgg(arg3)
			arg.tweenRecoveryUid = (if v9 then not v9 else arg3) or nil
		end

		local lastCarryReject = arg.stats.lastCarryReject

		if type(lastCarryReject) == "string" and lastCarryReject:lower():find("inventory is full", 1, true) then
			arg.eggFullCount = arg:_eggCount() or 1 / 0
		end

		local v9 = arg.records[arg3] or EggState2.ReadFieldEgg(arg3)
		local flag6 = arg.config.stealMode == "Instant" and (arg3 == arg.primerUid or type(v9) == "table" and v9.AreaId == "Forest")
		arg.carry.generation += 1
		arg:_invalidateCarryWorker()
		arg.carryAttemptToken = nil
		arg:_clearArrivalHold(arg3)

		if arg.activeTween and arg.activeTween.Cancel then
			pcall(arg.activeTween.Cancel, arg.activeTween)
		end

		arg.activeTween = nil
		arg.running = true
		arg.activeTarget = nil
		arg.stats.lastResult = "Carry confirmation timeout"

		if humanoidRootPart and v8 then
			pcall(function()
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)

			arg:_setStatus("Carry timeout - returning to safe area")

			pcall(arg._glideRoot, arg, v8, function()
				return arg.destroyed or not arg.enabled
			end)

			if flag5 then
				arg:_setStatus(lastCarryReject and "Carry refused (" .. lastCarryReject .. ") \226\128\148 skipping egg" or "Carry timed out twice \226\128\148 skipping egg")
			else
				arg:_setStatus("Carry timeout \226\128\148 retrying")
			end
		else
			arg:_setStatus("Carry timeout \226\128\148 safe area unavailable")
		end

		arg.running = false
		arg:_releaseOperation()

		if flag6 then
			arg.running = true
		end

		task.delay(0.35, function()
			if flag6 then
				if not arg.destroyed and arg.enabled then
					arg:_setStatus("Retrying steal")

					pcall(arg._treadmillReset, arg, function()
						return arg.destroyed or not arg.enabled
					end)
				end

				arg.running = false
			end

			if not arg.destroyed and (arg.enabled and arg.carryAttemptToken == nil) then
				arg:_schedule()
			end
		end)

		return true
	end

	index._requestCarry = function(arg, arg2, arg3)
		if not arg:_wallOpen() then
			arg:_finish("Wall closed before carry")
			return
		end
		local uid, carryAttemptToken, n68 = arg2.Uid, {}
		arg.stats.lastCarryReject = nil
		local n69 = arg.instantPhase == "priming" and uid == arg.primerUid and n36 or math.max(n36, arg:_resolveSettleSeconds(arg2) + 3)
		arg.carryAttemptToken = carryAttemptToken
		arg.stats.lastResult = "Carry requested"
		arg:_setStatus("Securing egg")
		arg2 = localPlayer2.Character
		local humanoid = arg2 and arg2:FindFirstChildOfClass("Humanoid")

		if humanoid then
			pcall(humanoid.UnequipTools, humanoid)
		end

		if arg.coordinator then
			local n70 = os.clock() + 0.35

			while arg.coordinator:isBackgroundBusy() and not arg.destroyed and arg.enabled and arg.carryAttemptToken == carryAttemptToken and os.clock() < n70 do
				task.wait(0.02)
			end

			if humanoid and humanoid.Parent then
				pcall(humanoid.UnequipTools, humanoid)
			end
		end

		task.spawn(function()
			while true do
				local destroyed = arg.destroyed
				if not ((if destroyed then not destroyed else arg.enabled) and arg.running and arg.carryAttemptToken == carryAttemptToken and arg.activeTarget and arg.activeTarget.Uid == uid) then
					break
				end

				if not arg:_hasConfirmedCarry(uid) and arg:_recordShowsCarried(uid) then
					arg:_adoptCarryFromRecord(uid)
				end

				if arg:_hasConfirmedCarry(uid) then
					if arg:_recordShowsCarried(uid) then
						arg:_clearArrivalHold(uid)
						arg.carryAttemptToken = nil

						if arg.activeTween then
							pcall(arg.activeTween.Cancel, arg.activeTween)
							arg.activeTween = nil
						end

						if arg.instantPhase == "priming" and uid == arg.primerUid then
							arg.carry.active = true
							arg.carry.uid = uid
							arg.stats.lastResult = "Preparing steal"
							arg:_enterBaitWait()
							return
						end

						arg.carry.active = true
						arg.carry.uid = uid
						arg.stats.lastResult = "Carry confirmed"
						arg:_setStatus("Carry confirmed")

						task.defer(function()
							if not arg.destroyed and (arg.enabled and arg:_hasConfirmedCarry(uid)) then
								arg:_returnToSafe()
							end
						end)

						return
					end

					arg:_setStatus("Confirming carry record")
					task.wait(n35)
					continue
				end

				if n68 and os.clock() >= n68 then
					arg:_recoverCarryConfirmationTimeout(carryAttemptToken, uid)
					return
				end

				if not arg:_wallOpen() then
					arg:_finish("Wall closed before carry")
					return
				end
				local v8 = EggState2.ReadFieldEgg(uid) or arg.records[uid]
				if not v8 then
					arg:_finish("Target unavailable")
					return
				end

				if v8.State == AreaEggs.States.Carried then
					if v8.CarrierUserId == localPlayer2.UserId then
						arg:_setStatus("Confirming carry state")
						task.wait(n35)
						continue
					end

					arg:_finish("Egg carried by another player")
					return
				end

				if v8.State ~= AreaEggs.States.Slot and v8.State ~= AreaEggs.States.Dropped then
					arg:_finish("Target changed")
					return
				end
				local character = localPlayer2.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					arg:_finish("Character unavailable")
					return
				end
				local humanoid2 = character and character:FindFirstChildOfClass("Humanoid")
				if not humanoid2 then
					arg:_finish("Character unavailable")
					return
				end
				local v9 = arg:_resolveEggDestination(v8, humanoidRootPart, humanoid2)
				local v10 = v9 and arg:_resolveElevatedDestination(humanoidRootPart, v9) or nil
				if not v10 then
					arg:_finish("Character unavailable")
					return
				end
				local position = v10.Position

				if (humanoidRootPart.Position - position).Magnitude > n39 then
					if arg3 then
						arg:_setStatus("Re-stealing egg")
						if not arg:_teleportRoot(humanoidRootPart, humanoid2, v10) then
							arg:_finish("Re-steal failed \226\128\148 retrying")
							return
						end
						arg:_setArrivalHold(v10, uid)
						arg:_setStatus("Re-stealing egg")
					else
						arg:_setStatus("Re-approaching egg")
						local flag5 = false

						arg:_tweenRoot(v9, function()
							flag5 = true

							if arg.carryAttemptToken == carryAttemptToken and not arg:_hasConfirmedCarry(uid) then
								arg:_setStatus("Securing egg")
							end
						end, nil, {holdAfterArrival = true, holdUid = uid, flightProfile = true})

						while true do
							local destroyed2 = arg.destroyed
							if not ((if destroyed2 then not destroyed2 else arg.enabled) and arg.carryAttemptToken == carryAttemptToken and not arg:_hasConfirmedCarry(uid) and not flag5) then
								break
							end
							task.wait(n35)
						end

						continue
					end
				end

				local v11 = AreaEggSlotIdentity.LooksLikeFirstAreaUid(v8.Uid) and AreaEggSlotIdentity.SlotKey(v8.AreaId, v8.NestId) or nil
				humanoidRootPart, character, position = pcall(fn62, v8.Uid, v11)
				local v12 = if humanoidRootPart then if character == true then nil else position else tostring(character)

				if v12 then
					arg.stats.lastCarryReject = v12

					if v12 ~= arg._lastCarryRejectLogged then
						arg._lastCarryRejectLogged = v12
						warn("[Sena Steal] carry refused: " .. v12)
					end
				end

				n68 = n68 or os.clock() + n69
				arg.stats.lastResult = "Carry requested"
				arg:_setStatus(v12 and "Waiting for carry \194\183 " .. v12 or "Waiting for carry confirmation")
				task.wait(n35)
			end
		end)
	end

	index._burstHold = function(arg, cFrame, arg2)
		if typeof(cFrame) ~= "CFrame" then
			return false
		end
		local position = cFrame.Position

		local function fn91()
			local character = localPlayer2.Character
			return character and character:FindFirstChild("HumanoidRootPart")
		end

		local function fn92(arg3)
			arg3.CFrame = cFrame
			arg3.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			arg3.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		end

		local n68 = os.clock() + n26

		while os.clock() < n68 do
			if arg2 and arg2() then
				return false
			end
			local v8 = fn91()

			if v8 then
				if not v8.Parent then
					return false
				end
			else
				return false
			end

			pcall(fn92, v8)
			RunService2.Heartbeat:Wait()
		end

		local n69, now = os.clock() + n27

		while os.clock() < n69 do
			if arg2 and arg2() then
				return false
			end
			n68 = fn91()

			if n68 then
				if not n68.Parent then
					return false
				end
			else
				return false
			end

			if (n68.Position - position).Magnitude > n28 then
				now = nil
			else
				if now then
					if os.clock() - now >= n29 then
						return true
					end
				else
					now = os.clock()
				end
			end

			pcall(fn92, n68)
			RunService2.Heartbeat:Wait()
		end

		local v8 = fn91()
		return v8 ~= nil and (v8.Position - position).Magnitude <= n28
	end

	local tbl16 = {["Titan Temple"] = true, ["Light Dark"] = true, ["Enchanted Forest"] = true, ["Cherry Blossom"] = true, Cosmic = true, Prehistoric = true, ["Abyss Ocean"] = true, Volcano = true, Snow = true, Jungle = true, Desert = true, Lake = true}
	local n68 = 200
	local n69 = 5000

	index._usesPortalBoost = function(arg, arg2)
		return senaV4Config.LowSpeedBoost == true and arg.config.stealMode == "Instant" and type(arg2) == "table" and tbl16[arg2.AreaId] ~= nil and not (arg.portalBoostFailed and (arg.portalBoostFailed[arg2.Uid] or 0) > os.clock())
	end

	local function fn91(arg, arg2)
		local v8 = fn()
		local build = v8 and v8:FindFirstChild("Build")
		local v9 = build and build:FindFirstChild(arg)
		if not v9 then
			return nil
		end
		local basePart = arg2 and v9:FindFirstChild(arg2) or v9:FindFirstChildWhichIsA("BasePart", true)
		return basePart and basePart:IsA("BasePart") and basePart or nil
	end

	local function fn92()
		local attribute = localPlayer2:GetAttribute("RagdollEndTime")
		if type(attribute) ~= "number" then
			return 0
		end
		return math.max(attribute + 0.15 - workspace:GetServerTimeNow(), 0)
	end

	local function fn93(arg)
		local v8

		if type(arg) == "string" then
			local ok, result = pcall(function()
				return game:GetService("HttpService"):JSONDecode(arg)
			end)

			v8 = ok and result or nil
		else
			v8 = arg
		end

		if type(v8) ~= "table" then
			return nil
		end
		local arguments = v8.Arguments
		local vector3 = type(arguments) == "table" and type(arguments[3]) == "number" and Vector3.new(arguments[1], arguments[2], arguments[3]) or nil
		return v8.Action, vector3
	end

	index._watchRelocates = function(arg)
		if arg._relocateConn then
			return
		end
		local refresh = Remotes.RigSync and Remotes.RigSync.Refresh
		if not refresh then
			return
		end
		arg._relocateCount = 0

		arg._relocateConn = refresh.OnClientEvent:Connect(function(arg2)
			if fn93(arg2) == "Relocate" then
				arg._relocateCount = (arg._relocateCount or 0) + 1
				arg._relocateAt = os.clock()
			end
		end)
	end

	index._guardLagback = function(arg, arg2)
		local refresh = Remotes.RigSync and Remotes.RigSync.Refresh
		if not refresh then
			return
		end

		if not arg2 then
			for i, v8 in ipairs(arg._lagbackHooks or {}) do
				pcall(v8.forward.Disconnect, v8.forward)
				pcall(v8.connection.Enable, v8.connection)
			end

			arg._lagbackHooks = nil
			return
		end

		if arg._lagbackHooks then
			return
		elseif type(getconnections) ~= "function" then
			return
		end

		local lagbackHooks = {}
		arg._lagbackHooks = lagbackHooks
		local ok, result = pcall(getconnections, refresh.OnClientEvent)

		for i, v8 in ipairs(ok and type(result) == "table" and result or {}) do
			local function_ = v8.Function

			if type(function_) == "function" then
				i, arg = pcall(debug.info, function_, "s")

				if i and (tostring(arg):find("ContentCatalog", 1, true) and (type(v8.Disable) == "function" and pcall(v8.Disable, v8))) then
					local function fn94(arg3, ...)
						local v9, v10 = fn93(arg3)
						if v9 == "Relocate" and (v10 and v10.Y < n69) then
							return
						end
						function_(arg3, ...)
					end

					local connection6 = refresh.OnClientEvent:Connect(fn94)
					table.insert(lagbackHooks, {connection = v8, forward = connection6})
				end
			end
		end
	end

	index._crossPortal = function(arg, arg2, arg3, arg4)
		arg = localPlayer2.Character
		local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")

		if not arg2 or not humanoidRootPart then
			return false
		elseif type(firetouchinterest) ~= "function" then
			return false
		end

		local position = humanoidRootPart.Position
		local n70 = os.clock() + (arg4 or 8)
		local n71 = n70 + 6
		local n72 = 0

		while os.clock() < n70 do
			if arg3 and arg3() then
				return false
			end
			local character = localPlayer2.Character
			humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return false
			end

			if (humanoidRootPart.Position - position).Magnitude >= n68 then
				if position.Y > n69 ~= (humanoidRootPart.Position.Y > n69) then
					return true
				end
				position = humanoidRootPart.Position
			end

			local v8 = fn92()

			if v8 > 0 then
				n70 = math.min(math.max(n70, os.clock() + v8 + 1), n71)
			else
				if os.clock() - n72 >= 0.1 then
					n72 = os.clock()

					pcall(function()
						firetouchinterest(humanoidRootPart, arg2, 0)
						task.wait()
						firetouchinterest(humanoidRootPart, arg2, 1)
					end)
				end
			end

			task.wait(0.05)
		end

		return false
	end

	index._mutePortalFx = function(arg, arg2, arg3)
		local portalTransition = Remotes.FuseBiome and Remotes.FuseBiome.PortalTransition
		if not portalTransition then
			return
		end

		if arg2 then
			arg._portalFxMuteCount = (arg._portalFxMuteCount or 0) + 1

			if arg._portalFxMuted then
				return
			elseif type(getconnections) ~= "function" then
				return
			end

			arg._portalFxMuted = {}
			local ok, result = pcall(getconnections, portalTransition.OnClientEvent)

			for i, v8 in ipairs(ok and type(result) == "table" and result or {}) do
				local function_ = v8.Function

				if type(function_) == "function" then
					local ok2, result2 = pcall(debug.info, function_, "s")

					if ok2 and (tostring(result2):find("FuseBiomePortalController", 1, true) and (type(v8.Disable) == "function" and pcall(v8.Disable, v8))) then
						table.insert(arg._portalFxMuted, v8)
					end
				end
			end

			if #arg._portalFxMuted > 0 then
				arg._portalFxHandshake = portalTransition.OnClientEvent:Connect(function(arg4, arg5, arg6)
					if arg5 ~= nil and not arg6 then
						pcall(function()
							portalTransition:FireServer(arg5)
						end)
					end
				end)
			end

			arg:_filterPortalToasts(true)
		else
			arg._portalFxMuteCount = arg3 and 0 or math.max((arg._portalFxMuteCount or 0) - 1, 0)
			if arg._portalFxMuteCount > 0 then
				return
			end
			arg:_filterPortalToasts(false, arg3)

			for i, v8 in ipairs(arg._portalFxMuted or {}) do
				pcall(v8.Enable, v8)
			end

			arg._portalFxMuted = nil

			if arg._portalFxHandshake then
				pcall(arg._portalFxHandshake.Disconnect, arg._portalFxHandshake)
				arg._portalFxHandshake = nil
			end
		end
	end

	local tbl17 = {{"Toasts", "Line"}, {"Alerts", "Raise"}}

	index._filterPortalToasts = function(arg, arg2, arg3)
		if arg2 then
			arg._portalToastUntil = 1 / 0

			if arg._portalToastHooks then
				return
			elseif type(getconnections) ~= "function" then
				return
			end

			local portalToastHooks = {}
			arg._portalToastHooks = portalToastHooks

			for i, v8 in ipairs(tbl17) do
				local ok, result = pcall(function()
					return Remotes[v8[1]][v8[2]]
				end)

				local v9 = if ok then result else nil
				i, ok = false

				if v9 then
					i, ok = pcall(getconnections, v9.OnClientEvent)
				end

				for i2, v10 in ipairs(i and type(ok) == "table" and ok or {}) do
					local function_ = v10.Function

					if type(function_) == "function" and (type(v10.Disable) == "function" and pcall(v10.Disable, v10)) then
						local function fn94(arg4, ...)
							local body = type(arg4) == "table" and (arg4.Body or arg4.Text)
							if type(body) == "string" and (body:lower():find("portal", 1, true) and os.clock() < (arg._portalToastUntil or 0)) then
								return
							end
							function_(arg4, ...)
						end

						local connection6 = v9.OnClientEvent:Connect(fn94)
						table.insert(portalToastHooks, {connection = v10, forward = connection6})
					end
				end
			end

			return
		end

		local function fn94()
			local portalToastHooks = arg._portalToastHooks
			arg._portalToastHooks = nil

			for i, v8 in ipairs(portalToastHooks or {}) do
				pcall(v8.forward.Disconnect, v8.forward)
				pcall(v8.connection.Enable, v8.connection)
			end
		end

		if arg3 then
			fn94()
			return
		end
		local portalToastUntil = os.clock() + 2
		arg._portalToastUntil = portalToastUntil

		task.delay(2.1, function()
			if arg._portalToastUntil == portalToastUntil then
				local portalFxMuteCount = arg._portalFxMuteCount

				if portalFxMuteCount then
					if portalFxMuteCount == 0 then
						fn94()
					end
				else
					fn94()
				end
			end
		end)
	end

	index._portalBoostSteal = function(arg, arg2)
		arg:_mutePortalFx(true)
		arg._boostHopUid = arg2.Uid
		local ok, result = pcall(arg._portalBoostHop, arg, arg2)
		arg:_guardLagback(false)

		if arg._boostHopUid == arg2.Uid then
			arg._boostHopUid = nil
		end

		if arg._treeHopUid == arg2.Uid then
			arg._treeHopUid = nil
		end

		arg:_mutePortalFx(false)
		arg:_muteTreeFx(false)

		if not ok then
			warn("[Sena Steal] steal error: " .. tostring(result))

			if not arg.destroyed and arg.enabled then
				arg:_finish("Steal error \226\128\148 retrying")
			end
		end
	end

	index._muteTreeFx = function(arg, arg2)
		if type(getconnections) ~= "function" then
			return
		end

		if arg2 then
			arg._treeFxToken = (arg._treeFxToken or 0) + 1
			if arg._treeFxMuted then
				return
			end
			arg._treeFxMuted = {}
			local transition = Remotes.EnchantedTree and Remotes.EnchantedTree.Transition

			for i, v8 in ipairs({{transition and transition.OnClientEvent, "EnchantedTreeController"}, {localPlayer2:GetAttributeChangedSignal("InEnchantedTree"), "EnchantedTreeController"}}) do
				i, transition = false

				if v8[1] then
					i, transition = pcall(getconnections, v8[1])
				end

				for i2, v9 in ipairs(i and type(transition) == "table" and transition or {}) do
					local function_ = v9.Function

					if type(function_) == "function" then
						local ok, result = pcall(debug.info, function_, "s")

						if ok and (tostring(result):find(v8[2], 1, true) and (type(v9.Disable) == "function" and pcall(v9.Disable, v9))) then
							table.insert(arg._treeFxMuted, v9)
						end
					end
				end
			end
		else
			if not arg._treeFxMuted then
				return
			end
			local treeFxToken = arg._treeFxToken

			task.spawn(function()
				local n70 = os.clock() + 12

				while os.clock() < n70 and (localPlayer2:GetAttribute("InEnchantedTree") == true or arg._treePromptAt and os.clock() - arg._treePromptAt < 2.5) do
					task.wait(0.1)
				end

				task.wait(1.5)
				if arg._treeFxToken ~= treeFxToken then
					return
				end

				for i, v8 in ipairs(arg._treeFxMuted or {}) do
					pcall(v8.Enable, v8)
				end

				arg._treeFxMuted = nil
			end)
		end
	end

	index._isStealPrompt = function(arg, arg2)
		if typeof(arg2) ~= "Instance" then
			return false
		end

		if arg2.Name == "EnchantedTreePrompt" then
			return true
		end
		local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
		if areaEggSlotsClient and arg2:IsDescendantOf(areaEggSlotsClient) then
			return true
		end

		if arg2:FindFirstAncestor("FuseBiomeLanePortals") then
			return true
		elseif arg2:FindFirstAncestor("FuseBiomeZone") then
			return true
		end

		return false
	end

	index._installPromptFilter = function(arg)
		if arg._promptFilter then
			return
		elseif type(getconnections) ~= "function" then
			return
		end

		local promptFilter = {muted = {}, forwarders = {}}
		arg._promptFilter = promptFilter

		local function fn94()
			local destroyed = arg.destroyed
			return if destroyed then not destroyed else arg.enabled or arg._externalDeliver or arg._recalling or arg._treeFxMuted ~= nil
		end

		for i, v8 in ipairs({ProximityPromptService.PromptShown, ProximityPromptService.PromptHidden}) do
			local ok, result = pcall(getconnections, v8)

			for i2, v9 in ipairs(ok and type(result) == "table" and result or {}) do
				local function_ = v9.Function

				if type(function_) == "function" then
					i, i2 = pcall(debug.info, function_, "s")

					if i and (tostring(i2):find("ProximityPromptScriptController", 1, true) and (type(v9.Disable) == "function" and pcall(v9.Disable, v9))) then
						table.insert(promptFilter.muted, v9)

						table.insert(promptFilter.forwarders, v8:Connect(function(arg2, ...)
							if fn94() and arg:_isStealPrompt(arg2) then
								return
							end
							function_(arg2, ...)
						end))
					end
				end
			end
		end

		pcall(function()
			local machines = workspace:FindFirstChild("World") and workspace.World:FindFirstChild("Machines")
			local fuseMachine = machines and machines:FindFirstChild("FuseMachine")
			local proximityPrompt = fuseMachine and fuseMachine:FindFirstChildWhichIsA("ProximityPrompt", true)
			if not proximityPrompt then
				return
			end
			local ok, result = pcall(getconnections, proximityPrompt.Triggered)

			for i, v8 in ipairs(ok and type(result) == "table" and result or {}) do
				local function_ = v8.Function

				if type(function_) == "function" and (type(v8.Disable) == "function" and pcall(v8.Disable, v8)) then
					table.insert(promptFilter.muted, v8)

					table.insert(promptFilter.forwarders, proximityPrompt.Triggered:Connect(function(...)
						if fn94() then
							return
						end
						function_(...)
					end))
				end
			end
		end)
	end

	index._removePromptFilter = function(arg)
		local promptFilter = arg._promptFilter
		if not promptFilter then
			return
		end
		arg._promptFilter = nil

		for i, forwarder in ipairs(promptFilter.forwarders) do
			pcall(forwarder.Disconnect, forwarder)
		end

		for i, v8 in ipairs(promptFilter.muted) do
			pcall(v8.Enable, v8)
		end
	end

	index._leaveTreeHidden = function(arg, arg2)
		local enchantedTreeInterior = fn()
		local build = enchantedTreeInterior and enchantedTreeInterior:FindFirstChild("Build")
		enchantedTreeInterior = build and build:FindFirstChild("EnchantedTreeInterior")
		local markers = enchantedTreeInterior and enchantedTreeInterior:FindFirstChild("Markers")
		local exitTrigger = markers and markers:FindFirstChild("ExitTrigger")
		local n70 = os.clock() + 2.5

		while localPlayer2:GetAttribute("InEnchantedTree") ~= true and arg._treePromptAt and os.clock() - arg._treePromptAt < 2.5 and os.clock() < n70 do
			task.wait(0.05)
		end

		local n71 = os.clock() + 10

		while localPlayer2:GetAttribute("InEnchantedTree") == true and os.clock() < n71 do
			if arg2 and arg2() then
				break
			end
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart and exitTrigger then
				pcall(firetouchinterest, humanoidRootPart, exitTrigger, 0)
				task.wait()
				pcall(firetouchinterest, humanoidRootPart, exitTrigger, 1)
			end

			task.wait(0.2)
		end

		return localPlayer2:GetAttribute("InEnchantedTree") ~= true
	end

	index._usesTreeBoost = function(arg, arg2)
		return false
	end

	index._treeBoostHop = function(arg, arg2)
		local uid = arg2.Uid
		local v8 = fn()
		local build = v8 and v8:FindFirstChild("Build")
		local enchantedTreeInterior = build and build:FindFirstChild("EnchantedTreeInterior")
		local markers = enchantedTreeInterior and enchantedTreeInterior:FindFirstChild("Markers")
		local enterTrigger = markers and markers:FindFirstChild("EnterTrigger")
		local enchantedTreePrompt = enterTrigger and enterTrigger:FindFirstChild("EnchantedTreePrompt", true)
		local exitTrigger = markers and markers:FindFirstChild("ExitTrigger")

		local function fn94()
			return arg.destroyed or not arg.enabled or arg.instantPhase ~= "hunting" or not arg.activeTarget or arg.activeTarget.Uid ~= uid
		end

		local function fn95()
			local character = localPlayer2.Character
			return character and character:FindFirstChild("HumanoidRootPart"), character and character:FindFirstChildOfClass("Humanoid")
		end

		local function fn96()
			return localPlayer2:GetAttribute("InEnchantedTree") == true
		end

		local function fn97()
			local n70 = os.clock() + 8

			while fn96() and os.clock() < n70 do
				local v9 = fn95()

				if v9 and exitTrigger then
					pcall(firetouchinterest, v9, exitTrigger, 0)
					task.wait()
					pcall(firetouchinterest, v9, exitTrigger, 1)
				end

				task.wait(0.2)
			end

			return not fn96()
		end

		local function fn98(arg3)
			fn97()
			if fn94() then
				return
			end
			arg.treeBoostFailed = arg.treeBoostFailed or {}
			arg.treeBoostFailed[uid] = os.clock() + 60
			arg:_finish(arg3)
		end

		build, arg2 = fn95()

		if enchantedTreePrompt and exitTrigger then
			if build then
				if not arg2 then
					fn98("Steal unavailable \226\128\148 retrying")
					return
				end
			else
				fn98("Steal unavailable \226\128\148 retrying")
				return
			end
		else
			fn98("Steal unavailable \226\128\148 retrying")
			return
		end

		local parent = enchantedTreePrompt.Parent
		local worldPosition = parent and (parent:IsA("Attachment") and parent.WorldPosition or parent:IsA("BasePart") and parent.Position)
		if not worldPosition then
			fn98("Steal unavailable \226\128\148 retrying")
			return
		end
		parent = os.clock() + 4

		while fn92() > 0 and os.clock() < parent do
			if fn94() then
				return
			end
			task.wait(0.05)
		end

		arg:_clearArrivalHold(uid)
		arg:_stopHoverPad()
		arg:_setStatus("Heading to target egg")
		arg._treeHopUid = uid
		arg:_muteTreeFx(true)
		arg:_teleportRoot(build, arg2, CFrame.new(worldPosition + Vector3.new(0, 1, 4)))
		local n70 = (tonumber(enchantedTreePrompt.HoldDuration) or 0) + 0.05
		local n71 = os.clock() + 6

		while true do
			local v9 = fn96()
			if not (if v9 then not v9 else os.clock() < n71) then
				break
			end

			if fn94() then
				return
			end

			pcall(function()
				enchantedTreePrompt.Enabled = true
			end)

			arg._treePromptAt = os.clock()

			pcall(function()
				enchantedTreePrompt:InputHoldBegin()
				task.wait(n70)
				enchantedTreePrompt:InputHoldEnd()
			end)

			if type(fireproximityprompt) == "function" then
				pcall(fireproximityprompt, enchantedTreePrompt, n70)
			end

			task.wait(0.1)
		end

		if not fn96() then
			fn98("Could not reach the egg \226\128\148 retrying")
			return
		end
		arg:_setStatus("Securing target egg")
		task.wait(0.3)
		if not fn97() then
			fn98("Could not reach the egg \226\128\148 retrying")
			return
		end

		if fn94() then
			return
		end
		parent, arg2 = fn95()

		if parent then
			if not arg2 then
				fn98("Character unavailable")
				return
			end
		else
			fn98("Character unavailable")
			return
		end

		local v9 = EggState2.ReadFieldEgg(uid) or arg.records[uid]

		if v9 then
			if v9.State ~= AreaEggs.States.Slot and v9.State ~= AreaEggs.States.Dropped then
				arg:_finish("Target egg no longer available")
				return
			end
		else
			arg:_finish("Target egg no longer available")
			return
		end

		local v10 = arg:_resolveEggDestination(v9, parent, arg2)
		if not v10 then
			fn98("Target destination unavailable")
			return
		end
		arg:_walkTo(v10, fn94, 4)
		if fn94() then
			return
		end
		parent, arg2 = fn95()
		local flag5 = not parent

		if if parent then not arg2 else flag5 then
			fn98("Could not reach the egg \226\128\148 retrying")
			return
		elseif (parent.Position - v10.Position).Magnitude > 25 then
			fn98("Could not reach the egg \226\128\148 retrying")
			return
		end

		arg:_setArrivalHold(v10, uid)
		arg.boostedUid = uid
		arg.treeBoostedUid = uid

		task.spawn(function()
			pcall(function()
				eggWorld.AskFieldEggCarry:InvokeServer({Uid = uid})
			end)
		end)

		arg:_setStatus("Securing target egg")
		arg:_requestCarry(v9, true)
	end

	index._portalBoostHop = function(arg, arg2)
		local uid = arg2.Uid
		if arg:_usesTreeBoost(arg2) then
			return arg:_treeBoostHop(arg2)
		end
		local FuseBiomeLanePortals = fn91("FuseBiomeLanePortals")
		local FuseBiomeZone = fn91("FuseBiomeZone", "ExitPart")

		local function fn94()
			return arg.destroyed or not arg.enabled or arg.instantPhase ~= "hunting" or not arg.activeTarget or arg.activeTarget.Uid ~= uid
		end

		local function fn95()
			local character = localPlayer2.Character
			return character and character:FindFirstChild("HumanoidRootPart"), character and character:FindFirstChildOfClass("Humanoid")
		end

		local function fn96()
			local v8 = fn95()

			if v8 and v8.Position.Y > n69 then
				arg:_crossPortal(FuseBiomeZone, nil, 8)
			end
		end

		local function fn97(arg3)
			fn96()
			if fn94() then
				return
			end
			arg.portalBoostMisses = arg.portalBoostMisses or {}
			local n70 = (arg.portalBoostMisses[uid] or 0) + 1
			arg.portalBoostMisses[uid] = n70

			if n70 >= 2 then
				arg.portalBoostMisses[uid] = nil
				arg.portalBoostFailed = arg.portalBoostFailed or {}
				arg.portalBoostFailed[uid] = os.clock() + 60
			end

			arg:_finish(arg3)
		end

		local v8, v9 = fn95()

		if FuseBiomeLanePortals then
			if not FuseBiomeZone then
				fn97("Steal unavailable \226\128\148 retrying")
				return
			elseif v8 then
				if not v9 then
					fn97("Steal unavailable \226\128\148 retrying")
					return
				end
			else
				fn97("Steal unavailable \226\128\148 retrying")
				return
			end
		else
			fn97("Steal unavailable \226\128\148 retrying")
			return
		end

		local v10 = arg:_resolveEggDestination(arg2, v8, v9)
		if not v10 then
			fn97("Target destination unavailable")
			return
		end
		arg:_setStatus("Heading to target egg")
		arg:_guardLagback(true)
		RunService2.PreSimulation:Wait()
		v9.PlatformStand = true
		arg:_teleportRoot(v8, v9, v10)
		RunService2.PreSimulation:Wait()
		v9.PlatformStand = false
		local n70 = 0.1

		pcall(function()
			n70 = localPlayer2:GetNetworkPing() or 0.1
		end)

		task.wait(math.clamp(0.15 + n70 * 2.5, 0.3, 1))
		if fn94() then
			return
		end
		arg:_stopHoverPad()
		arg:_setStatus("Securing target egg")
		local v11 = arg:_crossPortal(FuseBiomeLanePortals, fn94, 6)
		arg:_guardLagback(false)
		if not v11 then
			fn97("Could not reach the egg \226\128\148 retrying")
			return
		end
		arg:_setStatus("Securing target egg")
		if not arg:_crossPortal(FuseBiomeZone, fn94, 8) then
			fn97("Could not reach the egg \226\128\148 retrying")
			return
		end

		if fn94() then
			return
		end
		v9, FuseBiomeLanePortals = fn95()

		if v9 then
			if not FuseBiomeLanePortals then
				fn97("Character unavailable")
				return
			end
		else
			fn97("Character unavailable")
			return
		end

		if (v9.Position - v10.Position).Magnitude > 25 then
			fn97("Could not reach the egg \226\128\148 retrying")
			return
		end
		local v12 = EggState2.ReadFieldEgg(uid) or arg.records[uid]

		if v12 then
			if v12.State ~= AreaEggs.States.Slot and v12.State ~= AreaEggs.States.Dropped then
				arg:_finish("Target egg no longer available")
				return
			end
		else
			arg:_finish("Target egg no longer available")
			return
		end

		local v13 = arg:_resolveEggDestination(v12, v9, FuseBiomeLanePortals) or v10
		arg:_teleportRoot(v9, FuseBiomeLanePortals, v13)
		arg:_setArrivalHold(v13, uid)
		arg.boostedUid = uid
		arg:_setStatus("Securing target egg")
		task.wait(0.35)
		if fn94() then
			return
		end

		task.spawn(function()
			pcall(function()
				eggWorld.AskFieldEggCarry:InvokeServer({Uid = uid})
			end)
		end)

		arg:_requestCarry(v12, true)
	end

	index._needsHiddenRecall = function(arg)
		if arg.destroyed then
			return false
		end
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return false
		end

		if humanoidRootPart.Position.Y > n69 then
			return true
		end

		if localPlayer2:GetAttribute("InEnchantedTree") == true then
			return true
		end

		if arg._treePromptAt and os.clock() - arg._treePromptAt < 2.5 then
			return true
		end

		if arg._treeHopUid ~= nil then
			return true
		end
		return arg.treadmillDecoy ~= nil and arg.treadmillDecoy.Parent ~= nil and not arg:_isInSafeArea(humanoidRootPart)
	end

	index._finishBoostedEgg = function(arg, arg2)
		local v8 = EggState2.ReadFieldEgg(arg2) or arg.records[arg2]

		if v8 then
			if v8.State ~= AreaEggs.States.Slot and v8.State ~= AreaEggs.States.Dropped then
				return false
			end
		else
			return false
		end

		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local flag5 = humanoidRootPart and humanoid and arg:_resolveEggDestination(v8, humanoidRootPart, humanoid)

		if flag5 then
			if (humanoidRootPart.Position - flag5.Position).Magnitude > 25 then
				return false
			end
		else
			return false
		end

		arg:_setArrivalHold(flag5, arg2)
		arg:_setStatus("Finishing target egg")

		local function fn94()
			local v9 = EggState2.ReadFieldEgg(arg2)
			return v9 ~= nil and v9.State == AreaEggs.States.Carried and v9.CarrierUserId == localPlayer2.UserId
		end

		local n70 = os.clock() + 3
		flag5 = false

		while (if flag5 then not flag5 else os.clock() < n70) and not arg.destroyed and not arg.enabled do
			task.spawn(function()
				pcall(function()
					eggWorld.AskFieldEggCarry:InvokeServer({Uid = arg2})
				end)
			end)

			local n71 = os.clock() + 0.25

			while os.clock() < n71 do
				if fn94() then
					flag5 = true
					break
				end
				task.wait(0.03)
			end
		end

		arg:_clearArrivalHold(arg2)

		if flag5 then
			if arg.destroyed then
				return false
			elseif arg.enabled then
				return false
			end
		else
			return false
		end

		arg.boostedUid = nil
		if not arg:deliverCarriedEgg(arg2, v8) then
			return false
		end
		local n71 = os.clock() + 30

		while arg._instantReturnToken ~= nil and os.clock() < n71 and not arg.destroyed do
			task.wait(0.1)
		end

		arg.boostedUid = nil
		local v9 = EggState2.ReadFieldEgg(arg2)
		local flag6 = v9 == nil or v9.State == AreaEggs.States.Claimed or senaV4Config.HelpFriend and v9.State == AreaEggs.States.Dropped
		local character2 = localPlayer2.Character
		local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
		return flag6 and humanoidRootPart2 ~= nil and arg:_isInSafeArea(humanoidRootPart2)
	end

	index._finishTreeEgg = function(arg, treeBoostedUid)
		local v8 = EggState2.ReadFieldEgg(treeBoostedUid) or arg.records[treeBoostedUid]

		if v8 then
			if v8.State ~= AreaEggs.States.Slot and v8.State ~= AreaEggs.States.Dropped then
				return false
			end
		else
			return false
		end

		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local v9 = humanoidRootPart and humanoid and arg:_resolveEggDestination(v8, humanoidRootPart, humanoid)

		if v9 then
			if (humanoidRootPart.Position - v9.Position).Magnitude > 400 then
				return false
			end
		else
			return false
		end

		arg:_setStatus("Finishing target egg")
		local externalDeliver = arg._externalDeliver
		arg._externalDeliver = true

		arg:_walkTo(v9, function()
			return arg.destroyed or arg.enabled
		end, 4)

		arg._externalDeliver = externalDeliver

		if arg.destroyed then
			return false
		elseif arg.enabled then
			return false
		end

		arg.treeBoostedUid = treeBoostedUid
		return arg:_finishBoostedEgg(treeBoostedUid)
	end

	index._recallHidden = function(arg)
		arg._recalling = true
		local boostHopUid = arg._boostHopUid
		local treeHopUid = arg._treeHopUid

		task.spawn(function()
			local function fn94()
				return arg.destroyed or arg.enabled
			end

			local ok, result = pcall(function()
				arg:_startMovementProtection()
				arg:_mutePortalFx(true)
				local flag5 = localPlayer2:GetAttribute("InEnchantedTree") == true or arg._treePromptAt ~= nil and os.clock() - arg._treePromptAt < 2.5

				if flag5 or treeHopUid then
					arg:_muteTreeFx(true)
					arg:_setStatus("Finishing target egg")
					local flag6 = arg:_leaveTreeHidden(fn94) and not fn94() and treeHopUid ~= nil and arg:_finishTreeEgg(treeHopUid)
					arg:_muteTreeFx(false)

					if flag6 then
						return
					elseif fn94() then
						return
					end
				end

				local character = localPlayer2.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local flag6 = (if flag5 then not flag5 else humanoidRootPart ~= nil) and humanoidRootPart.Position.Y > n69

				if flag6 then
					arg:_setStatus("Returning to safe area")
					arg:_crossPortal(fn91("FuseBiomeZone", "ExitPart"), fn94, 8)
				end

				if fn94() then
					return
				end

				if flag6 and (boostHopUid and arg:_finishBoostedEgg(boostHopUid)) then
					return
				end
				local flag7 = false

				local function fn95()
					for i, v8 in ipairs(EggState2.ReadFieldEggs().Records or {}) do
						if v8.State == AreaEggs.States.Carried and v8.CarrierUserId == localPlayer2.UserId then
							flag7 = true
							break
						end
					end
				end

				pcall(fn95)

				if flag7 then
					pcall(EggState2.DropFieldEgg, "PlayerRequest")
					task.wait(0.3)
				end

				local character2 = localPlayer2.Character
				local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart2 and (not arg:_isInSafeArea(humanoidRootPart2) and not fn94()) then
					arg:_setStatus("Returning to safe area")
					local v8 = arg:_resolveSafeCFrame(humanoidRootPart2)
					local externalDeliver = arg._externalDeliver
					arg._externalDeliver = true

					if v8 then
						arg:_glideRoot(v8, fn94)
					end

					arg._externalDeliver = externalDeliver

					if not fn94() then
						arg:_groundSnap()
					end
				end
			end)

			if not ok then
				warn("[Sena Steal] hidden recall error: " .. tostring(result))
			end

			arg:_mutePortalFx(false)
			arg._recalling = nil

			if not arg.destroyed and not arg.enabled then
				arg:_hideTreadmillDecoy()
				arg:_removeGuardHitDistanceBoost()
				arg:_stopMovementProtection()
				fn68(arg)
				arg:_setStatus("Idle")
			end
		end)
	end

	index._treadmillReset = function(arg, arg2)
		arg._treadmillResetting = true
		local ok, result = pcall(arg._treadmillResetInner, arg, arg2)
		arg._treadmillResetting = false
		return ok and result
	end

	index._treadmillResetInner = function(arg, arg2)
		local function fn94()
			return arg2 ~= nil and arg2()
		end

		local treadmill = Remotes and Remotes.Treadmill
		if not treadmill or fn94() then
			return false
		end

		local function fn95()
			local ok, result = pcall(function()
				return treadmill.AskRenderSnapshot:InvokeServer()
			end)

			if ok then
				if type(result) ~= "table" then
					return nil
				end
			else
				return nil
			end

			return table.find(result, localPlayer2.UserId) ~= nil
		end

		local flag5 = (function()
			local ok, result = pcall(function()
				local flag5 = type(PlotState2.ResolveLocalSlot) == "function" and PlotState2.ResolveLocalSlot() or PlotState2.GetMySlot()
				local flag6 = type(PlotState2.ResolveFolder) == "function" and PlotState2.ResolveFolder() or PlotState2.GetPlotsFolder()
				local v8 = flag6 and flag5 and flag6:FindFirstChild(tostring(flag5))
				local treadmillBottom = v8 and v8:FindFirstChild("TreadmillBottom")

				if treadmillBottom then
					if not treadmillBottom:IsA("BasePart") then
						return nil
					end
				else
					return nil
				end

				local character = localPlayer2.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart then
					if not humanoid then
						return nil
					end
				else
					return nil
				end

				local n70 = humanoid.RigType == Enum.HumanoidRigType.R15 and humanoidRootPart.Size.Y * 0.5 + math.max(humanoid.HipHeight, 0.5) or humanoidRootPart.Size.Y * 0.5 + 2
				return treadmillBottom.CFrame * CFrame.new(0, treadmillBottom.Size.Y * 0.5 + n70 + 0.05, 0)
			end)

			return ok and result or nil
		end)()

		if flag5 then
			if fn94() then
				return false
			end
		else
			return false
		end

		arg:_glideRoot(flag5, function()
			return fn94()
		end)

		if fn94() then
			return false
		end
		arg = os.clock() + 0.7
		flag5 = false

		while true do
			local v8 = fn94()
			if not (if v8 then not v8 else os.clock() < arg) then
				break
			end

			pcall(function()
				treadmill.AskWearStill:InvokeServer()
			end)

			task.wait(0.08)
			if fn95() == true then
				flag5 = true
				break
			end
		end

		if flag5 then
			local n70 = os.clock() + 0.25

			while true do
				local v8 = fn94()
				if not (if v8 then not v8 else os.clock() < n70) then
					break
				end
				task.wait(0.05)
			end
		end

		local n70 = os.clock() + 0.7
		local flag6 = false

		while true do
			local v8 = fn94()
			if not (if v8 then not v8 else os.clock() < n70) then
				break
			end

			pcall(function()
				treadmill.AskDoff:InvokeServer()
			end)

			task.wait(0.08)
			if fn95() == false then
				flag6 = true
				break
			end
		end

		return flag5 and flag6
	end

	index._instantReturn = function(arg, forestDropInProgress)
		if arg._instantReturnToken ~= nil then
			return
		end
		local instantReturnToken = {}
		arg._instantReturnToken = instantReturnToken
		arg._flyDeparting = false

		if arg.config.stealMode == "Fly" then
			arg:_showTreadmillDecoy()
		end

		task.spawn(function()
			local function fn94()
				local destroyed = arg.destroyed
				return (if destroyed then not destroyed else arg.enabled or arg._externalDeliver) and arg._instantReturnToken == instantReturnToken
			end

			local function fn95()
				local character = localPlayer2.Character
				return character and character:FindFirstChild("HumanoidRootPart"), character and character:FindFirstChildOfClass("Humanoid")
			end

			local function fn96()
				return EggState2.ReadFieldEgg(forestDropInProgress)
			end

			local function fn97()
				local v8 = fn96()
				return v8 ~= nil and v8.State == AreaEggs.States.Carried and v8.CarrierUserId == localPlayer2.UserId
			end

			local function fn98()
				local v8 = fn96()
				if not v8 then
					return true
				end
				return v8.State == AreaEggs.States.Claimed
			end

			local function fn99()
				local v8 = fn95()
				return v8 and arg:_resolveSafeCFrame(v8) or nil
			end

			local function fn100(arg2)
				arg.settleBonus = arg.settleBonus or {}

				if arg2 then
					arg.settleBonus[forestDropInProgress] = nil
				elseif arg.config.stealMode == "Instant" then
					if arg.boostedUid ~= forestDropInProgress then
						local settleBonus = arg.settleBonus
						local tbl18 = {seconds = n23}
						tbl18.untilAt, settleBonus[forestDropInProgress] = os.clock() + 300, tbl18
					end
				end
			end

			local function fn101(arg2)
				if arg._instantReturnToken ~= instantReturnToken then
					return
				end
				fn100(arg2 == nil or arg2 == "Safe return complete")
				arg._instantReturnToken = nil
				arg._forestDropInProgress = nil
				local externalDeliver = arg._externalDeliver
				arg._externalDeliver = nil
				if arg.destroyed then
					return
				end

				if arg.enabled then
					arg:_reportStolen()
					arg:_finish(arg2 or "Safe return complete")
				elseif externalDeliver then
					arg:_reportStolen()
					arg.carry.active = false
					arg.carry.uid = nil
					arg.activeTarget = nil
					arg:_hideTreadmillDecoy()
				end
			end

			arg:_clearArrivalHold(forestDropInProgress)
			local treeRegrabMode = arg.treeBoostedUid == forestDropInProgress and (arg.treeRegrabMode or "walk") or "glide"

			local function fn102()
				local v8 = fn95()
				return v8 ~= nil and arg:_isInSafeArea(v8)
			end

			local function fn103(arg2, arg3, arg4)
				return arg:_walkTo(arg2, arg3, arg4 or 4)
			end

			local function fn104(arg2, arg3, arg4, arg5)
				local flag5 = treeRegrabMode == "walk" or arg5 == "egg" and (treeRegrabMode == "glideSafe" or treeRegrabMode == "skipSafe") or arg5 == "safe" and treeRegrabMode == "glideEgg"

				if flag5 and arg5 == "safe" then
					local function fn105()
						return arg3() or fn102()
					end

					return arg:_walkTo(arg2, fn105, arg4 or 4)
				end

				if flag5 then
					return arg:_walkTo(arg2, arg3, arg4 or 4)
				end
				return arg:_glideRoot(arg2, arg3)
			end

			local flag5 = arg.config.stealMode == "Fly" or arg.boostedUid == forestDropInProgress and not senaV4Config.HelpFriend
			local n70 = arg.boostedUid == forestDropInProgress and not senaV4Config.HelpFriend and 0.3 or flag5 and 0.15 or 0.4
			local n71 = flag5 and 0.45 or n22
			local v8 = fn97()

			if v8 then
			else
				arg:_setStatus("Confirming carry record")
				local n72 = os.clock() + 2.5

				while fn94() and os.clock() < n72 do
					v8 = fn97()
					if v8 then
						break
					end
					local v9 = fn96()
					if v9 and v9.State == AreaEggs.States.Claimed then
						break
					end
					RunService2.Heartbeat:Wait()
				end

				if not fn94() then
					return
				end
			end

			if v8 then
				arg._forestDropInProgress = forestDropInProgress

				for i = 1, index.RELAY_ROUNDS, 1 do
					arg._forestDropInProgress = forestDropInProgress
					arg:_setStatus("Bringing egg home")

					arg:_hopRoot(cframe, function()
						local v9 = fn94()
						return if v9 then not fn97() else not v9
					end)

					if not fn94() then
						return
					end
					flag5 = false

					for i2 = 1, n21, 1 do
						if fn94() then
							if not fn97() then
								break
							end
						else
							break
						end

						arg:_setStatus("Bringing egg home")

						arg:_hopRoot(cframe, function()
							local v9 = fn94()
							return if v9 then not fn97() else not v9
						end)

						if not fn94() then
							return
						end

						if fn97() then
							task.wait(math.max(n70, arg:_relaySettle()))
							if not fn94() then
								return
							end

							if fn97() then
								pcall(EggState2.DropFieldEgg, "PlayerRequest")
							end

							local n72 = os.clock() + n71

							while fn94() and fn97() and os.clock() < n72 do
								RunService2.Heartbeat:Wait()
							end
						end

						local v9 = fn96()
						local v10 = flag5
						if v9 and v9.State == AreaEggs.States.Dropped then
							flag5 = true
							break
						end

						if not fn97() then
							flag5 = v10
							break
						end
					end

					if not fn94() then
						return
					end

					if not flag5 then
						if arg._instantReturnToken == instantReturnToken then
							arg._instantReturnToken = nil
						end

						arg._forestDropInProgress = nil
						fn100(false)
						arg:_finish("Drop failed \226\128\148 retrying")
						return
					end

					if senaV4Config.HelpFriend then
						arg.skippedEggs[forestDropInProgress] = os.clock() + 1800
						arg._forestDropInProgress = nil
						arg.carry.active = false
						arg.carry.uid = nil
						arg.stats.lastResult = "Dropped for a friend"
						arg:_setStatus("Egg dropped for a friend, heading back")
						local v9 = fn99()

						if v9 then
							arg:_glideRoot(v9, function()
								return not fn94()
							end)
						end

						if not fn94() then
							return
						end
						local externalDeliver = arg._externalDeliver
						arg._instantReturnToken = nil
						arg._externalDeliver = nil

						if arg.enabled then
							arg:_finish("Dropped for a friend")
						elseif externalDeliver then
							arg.activeTarget = nil
							arg:_hideTreadmillDecoy()
						end

						return
					end

					local n72, position = os.clock() + 3

					while fn94() and os.clock() < n72 do
						local v9 = fn96()

						if v9 and v9.State == AreaEggs.States.Dropped then
							local bottomCFrame = v9.BottomCFrame or v9.BoundsCFrame
							position = bottomCFrame and bottomCFrame.Position
							if position then
								break
							end
						else
							if v9 and v9.State ~= AreaEggs.States.Carried then
								break
							end
						end

						task.wait(0.1)
					end

					if not fn94() then
						return
					end
					arg._forestDropInProgress = nil

					if position then
						arg:_noteRelayLanding((position - cframe.Position).Magnitude)
					end

					arg:_setStatus("Bringing egg home")
					local flag6 = treeRegrabMode ~= "skipSafe" and fn99()

					if flag6 then
						fn104(flag6, function()
							return not fn94()
						end, nil, "safe")
					end

					if not fn94() then
						return
					end
					local v9 = arg:_claimCarryWorker("instant-regrab", forestDropInProgress)
					local cframe2 = position and CFrame.new(position + Vector3.new(0, 3.2, 0)) or cframe

					local function fn105()
						fn104(cframe2, function()
							local v10 = fn94()
							return if v10 then fn97() else not v10
						end, 3, "egg")
					end

					n72 = false

					if v9 then
						arg:_setStatus("Bringing egg home")
						fn105()
						if not fn94() then
							return
						end
						n72 = arg:_regrabBurst(v9, forestDropInProgress, 0.5)
						if not fn94() then
							return
						end
						n72 = if fn97() then true else n72

						if n72 then
						else
							if fn97() then
							else
								if arg:_isCarryWorkerCurrent(v9) then
									arg:_setStatus("Bringing egg home")
									local v10 = fn99()

									if v10 then
										arg:_glideRoot(v10, function()
											return not fn94()
										end)
									end

									if not fn94() then
										return
									end
									arg:_setStatus("Bringing egg home")

									arg:_treadmillReset(function()
										return not fn94()
									end)

									if not fn94() then
										return
									end
									arg:_setStatus("Bringing egg home")
									v10 = fn99()

									if v10 then
										arg:_glideRoot(v10, function()
											return not fn94()
										end)
									end

									if not fn94() then
										return
									end

									if arg:_isCarryWorkerCurrent(v9) then
										arg:_setStatus("Bringing egg home")
										fn105()
										if not fn94() then
											return
										end
										local v11 = arg:_regrabBurst(v9, forestDropInProgress, 0.6)
										if not fn94() then
											return
										end
										n72 = v11
									end
								end
							end
						end
					end

					if not n72 and not fn97() then
						fn101(fn98() and "Safe return complete" or "Re-grab failed \226\128\148 retrying")
						return
					end

					if position ~= nil then
						if (position - cframe.Position).Magnitude > index.RELAY_LAND_OK then
							if fn97() then
								if i >= index.RELAY_ROUNDS then
									break
								end
							else
								break
							end
						else
							break
						end
					else
						break
					end

					arg:_setStatus("Bringing egg home")
				end
			end

			local n72 = 80

			local function fn105(arg2, arg3)
				local v9, v10 = fn95()
				if v9 and (v10 and (v9.Position - arg2.Position).Magnitude <= n72) then
					return arg:_teleportRoot(v9, v10, arg2)
				end
				return fn103(arg2, arg3)
			end

			if fn97() then
				arg:_setStatus("Bringing egg home")
				local v9 = fn99()

				if v9 then
					fn105(v9, function()
						local v10 = fn94()
						return if v10 then not fn97() else not v10
					end)
				end
			end

			arg:_setStatus("Waiting for deposit")
			local n73 = os.clock() + 8

			while fn94() and not fn98() and os.clock() < n73 do
				n70, fn99 = fn95()

				if n70 and (fn99 and not arg:_isInSafeArea(n70)) then
					local v9 = arg:_resolveSafeCFrame(n70)

					if v9 then
						fn105(v9, function()
							local v10 = fn94()
							return if v10 then fn98() else not v10
						end)
					end
				end

				task.wait(0.1)
			end

			fn101(fn98() and "Safe return complete" or "Bank not confirmed \226\128\148 retrying")
		end)
	end

	index.deliverCarriedEgg = function(arg, uid, activeTarget)
		if type(uid) ~= "string" then
			return false
		elseif uid == "" then
			return false
		elseif arg.destroyed then
			return false
		end

		if arg._instantReturnToken ~= nil then
			return false
		end
		arg._externalDeliver = true

		if type(activeTarget) == "table" then
			arg.activeTarget = activeTarget
		end

		arg.carry.active = true
		arg.carry.uid = uid
		arg.reportedUid = nil
		arg:_instantReturn(uid)

		if arg._instantReturnToken == nil then
			arg._externalDeliver = nil
			arg.carry.active = false
			arg.carry.uid = nil
			return false
		end

		task.spawn(function()
			local n70 = os.clock() + 30

			while arg._instantReturnToken ~= nil and os.clock() < n70 do
				task.wait(0.25)
			end

			if arg._externalDeliver then
				arg._externalDeliver = nil
				arg._instantReturnToken = nil
				arg.carry.active = false
				arg.carry.uid = nil
			end
		end)

		return true
	end

	index._adminSteal = function(arg, activeTarget)
		local uid = activeTarget.Uid
		arg._adminBusyUid = uid

		local function fn94()
			local v8 = EggState2.ReadFieldEgg(uid)
			return v8 ~= nil and v8.State == AreaEggs.States.Carried and v8.CarrierUserId == localPlayer2.UserId
		end

		local function fn95()
			local destroyed = arg.destroyed
			return (if destroyed then not destroyed else arg.enabled) and genv.__SenaV4AdminBoost == true and arg._adminBusyUid == uid
		end

		local ok, result = pcall(function()
			arg.instantPhase = nil
			arg.primerUid = nil
			arg.targetUid = nil
			arg.activeTarget = activeTarget
			arg.stats.lastResult = "Admin Abuse"
			arg:_setStatus("Heading to target egg")
			local n70 = os.clock() + 3
			local n71 = 0

			while fn95() and not fn94() do
				if os.clock() >= n70 then
					arg.skippedEggs[uid] = os.clock() + 10
					return arg:_finish("Carry refused \226\128\148 next egg")
				end
				local v8 = EggState2.ReadFieldEgg(uid)
				if if v8 then v8.State ~= AreaEggs.States.Slot and v8.State ~= AreaEggs.States.Dropped else not v8 then
					return arg:_finish("Target egg no longer available")
				end
				local character = localPlayer2.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if if humanoidRootPart then not humanoid else not humanoidRootPart then
					return arg:_finish("Character unavailable")
				end
				local v9 = arg:_resolveEggDestination(v8, humanoidRootPart, humanoid)

				if v9 and (humanoidRootPart.Position - v9.Position).Magnitude > 4 then
					arg:_teleportRoot(humanoidRootPart, humanoid, v9)
				end

				if os.clock() >= n71 then
					n71 = os.clock() + 0.1
					arg:_setStatus("Securing egg")

					task.spawn(function()
						pcall(function()
							eggWorld.AskFieldEggCarry:InvokeServer({Uid = uid})
						end)
					end)
				end

				RunService2.Heartbeat:Wait()
			end

			if not fn95() then
				return
			end
			arg.carry.active = true
			arg.carry.uid = uid
			arg:_adminDeliver(uid)
		end)

		if arg._adminBusyUid == uid then
			arg._adminBusyUid = nil
		end

		if not ok then
			warn("[Sena Steal] admin steal error: " .. tostring(result))

			if not arg.destroyed and arg.enabled then
				arg:_finish("Steal error \226\128\148 retrying")
			end
		end
	end

	index._adminDeliver = function(arg, adminDeliverUid)
		if arg._adminDeliverUid == adminDeliverUid then
			return
		end
		arg._adminDeliverUid = adminDeliverUid
		arg._adminBusyUid = adminDeliverUid

		local function fn94()
			return EggState2.ReadFieldEgg(adminDeliverUid)
		end

		local function fn95()
			local v8 = fn94()
			return v8 ~= nil and v8.State == AreaEggs.States.Carried and v8.CarrierUserId == localPlayer2.UserId
		end

		local function fn96()
			local v8 = fn94()
			return v8 == nil or v8.State == AreaEggs.States.Claimed
		end

		arg:_clearArrivalHold(adminDeliverUid)
		arg:_setStatus("Bringing egg home")
		local n70 = os.clock() + 4

		while true do
			local destroyed = arg.destroyed
			if not ((if destroyed then not destroyed else arg.enabled) and not fn96() and fn95() and os.clock() < n70) then
				break
			end
			local character = localPlayer2.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			local v8 = humanoidRootPart and arg:_resolveSafeCFrame(humanoidRootPart)

			if v8 and (humanoid and (humanoidRootPart.Position - v8.Position).Magnitude > 4) then
				arg:_teleportRoot(humanoidRootPart, humanoid, v8)
				arg:_setStatus("Waiting for deposit")
			end

			RunService2.Heartbeat:Wait()
		end

		arg._adminDeliverUid = nil

		if arg._adminBusyUid == adminDeliverUid then
			arg._adminBusyUid = nil
		end

		if arg.destroyed then
			return
		elseif not arg.enabled then
			return
		end

		if fn96() then
			arg:_reportStolen()
			arg:_finish("Safe return complete")
		else
			arg:_finish(fn95() and "Bank not confirmed \226\128\148 retrying" or "Egg lost \226\128\148 retrying")
		end
	end

	index._returnToSafe = function(arg)
		local uid

		if arg:_isPrimerEgg(arg.carry.uid) then
			local uid2 = arg.carry.uid
			arg.stats.lastResult = "Steal not banked \226\128\148 retrying"
			arg.carry.active = false
			arg.carry.uid = nil
			arg.carry.generation += 1
			arg:_invalidateCarryWorker()
			arg.skippedEggs[uid2] = os.clock() + 30
			pcall(EggState2.DropFieldEgg, "PlayerRequest")

			if arg.instantPhase == "priming" then
				arg:_startPrimerTargetHunt()
			else
				task.delay(0.5, function()
					if not arg.destroyed and (arg.enabled and not arg.running) then
						arg:_schedule()
					end
				end)
			end

			arg:_notify()
			return
		end

		if arg.captureObjectiveEnabled and arg:_isCaptureEgg(arg.carry.uid) then
			arg:_captureHold(arg.carry.uid)
			return
		end

		if genv.__SenaV4AdminBoost == true then
			uid = arg.carry.uid or arg.activeTarget and arg.activeTarget.Uid

			if uid and arg._adminBusyUid ~= uid then
				task.spawn(arg._adminDeliver, arg, uid)
			end

			return
		end

		if arg.config.stealMode == "Instant" or arg.config.stealMode == "Fly" then
			uid = arg.carry.uid or arg.activeTarget and arg.activeTarget.Uid
			if uid then
				arg:_instantReturn(uid)
				return
			end
			arg:_finish("Carry lost \226\128\148 retrying")
			return
		end

		local uid2 = arg.carry.uid
		local v8 = arg:_claimCarryWorker("return", uid2)
		if not v8 then
			return
		end
		arg:_clearArrivalHold(uid2)

		if not arg:_wallOpen() then
			arg:_releaseCarryWorker(v8)
			arg:_finish("Reset interrupted carry")
			return
		end

		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		if not humanoidRootPart then
			arg:_releaseCarryWorker(v8)
			arg:_finish("Character unavailable")
			return
		end

		local v9 = arg:_hasConfirmedCarry(uid2)

		if if v9 then arg:_recordShowsForeignCarry(uid2) else not v9 then
			arg:_releaseCarryWorker(v8)
			arg:_finish("Carry not confirmed \226\128\148 retrying")
			return
		end

		if arg:_isInSafeArea(humanoidRootPart) then
			arg:_finalizeReturn(v8)
			return
		end

		if senaV4Config.HelpFriend then
			arg.handoffLane = (arg.handoffLane or 0) % #tbl13 + 1
			local n70 = CFrame.new(n20, vector2.Y, tbl13[arg.handoffLane]) * humanoidRootPart.CFrame.Rotation
			arg:_setStatus("Taking the egg to the friend drop")

			arg:_tweenRoot(n70, function()
				if arg:_isCarryWorkerCurrent(v8) then
					task.spawn(arg._handOffEgg, arg, v8, uid2, n70)
				end
			end, nil, {flightProfile = true})

			return
		end

		local v10 = arg:_resolveSafeCFrame(humanoidRootPart)

		if not v10 then
			arg:_releaseCarryWorker(v8)
			arg:_finish("Safe destination unavailable")
			return
		end

		arg:_setStatus("Returning to safe area")

		arg:_tweenRoot(v10, function()
			if arg:_isCarryWorkerCurrent(v8) then
				arg:_finalizeReturn(v8)
			end
		end, nil, {flightProfile = true})
	end

	index._handOffEgg = function(arg, arg2, arg3, cFrame)
		local function fn94()
			local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return false
			end
			humanoidRootPart.CFrame = cFrame
			humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			return true
		end

		local function fn95()
			local v8 = EggState2.ReadFieldEgg(arg3)
			return v8 ~= nil and v8.State == AreaEggs.States.Carried and v8.CarrierUserId == localPlayer2.UserId
		end

		arg:_setStatus("Dropping the egg for a friend")
		local n70 = 0.1

		pcall(function()
			n70 = localPlayer2:GetNetworkPing() or 0.1
		end)

		local n71 = os.clock() + math.max(0.3, 0.2 + 2 * n70)

		while os.clock() < n71 do
			if not fn94() then
				break
			end
			RunService2.Heartbeat:Wait()
		end

		arg.skippedEggs[arg3] = os.clock() + 1800
		arg:_reportStolen()
		n71 = false

		for i = 1, 4, 1 do
			fn94()
			local v8 = n71
			if not fn95() then
				n71 = true
				break
			end
			pcall(EggState2.DropFieldEgg, "PlayerRequest")
			local n72 = os.clock() + 0.6
			n71 = v8

			repeat
				RunService2.Heartbeat:Wait()
				n71 = not fn95()
			until n71 or os.clock() >= n72

			if n71 then
				break
			end
		end

		if not n71 then
			arg.skippedEggs[arg3] = nil

			if arg:_isCarryWorkerCurrent(arg2) then
				arg:_releaseCarryWorker(arg2)
				arg:_finish("Friend drop failed \226\128\148 retrying")
			end

			return
		end

		local n72 = os.clock() + 1

		while arg.carry.active and os.clock() < n72 do
			RunService2.Heartbeat:Wait()
		end

		arg.carry.active = false
		arg.carry.uid = nil
		arg.stats.lastResult = "Dropped for a friend"
		local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
		local v8 = humanoidRootPart and arg:_resolveSafeCFrame(humanoidRootPart)
		if not v8 then
			arg:_finish("Dropped for a friend")
			return
		end
		arg:_setStatus("Egg dropped for a friend, heading back")

		arg:_tweenRoot(v8, nil, nil, {flightProfile = true, onDone = function()
			arg:_finish("Dropped for a friend")
		end})
	end

	index._reportStolen = function(arg)
		local activeTarget = arg.activeTarget

		if type(activeTarget) ~= "table" then
			return
		elseif not activeTarget.Uid then
			return
		end

		if arg.reportedUid == activeTarget.Uid then
			return
		end
		arg.reportedUid = activeTarget.Uid

		task.delay(1.5, function()
			if arg.destroyed then
				return
			end
			local v8

			pcall(function()
				v8 = EggState2.ReadFieldEgg(activeTarget.Uid)
			end)

			if type(v8) == "table" and (v8.State == AreaEggs.States.Slot or v8.State == AreaEggs.States.Dropped or v8.State == AreaEggs.States.Carried and v8.CarrierUserId ~= localPlayer2.UserId) then
				arg.reportedUid = nil
				arg.stats.deliveryFailed = (arg.stats.deliveryFailed or 0) + 1
				arg.stats.lastResult = "Delivery failed \226\128\148 retrying"
				arg:_notify()

				if arg.enabled and not arg.running then
					arg:_schedule()
				end

				return
			end

			arg.stats.delivered = (arg.stats.delivered or 0) + 1
			local senaV4Webhook = genv.__SenaV4Webhook
			if not senaV4Webhook then
				return
			end
			local ok, result = pcall(arg.catalog.resolve, activeTarget)
			pcall(senaV4Webhook.stolen, activeTarget, ok and result or nil, nil)
		end)
	end

	index._startWatchdog = function(arg)
		if arg.watchdogRunning then
			return
		end
		arg.watchdogRunning = true

		task.spawn(function()
			local v8 = nil
			local position = nil
			local now = nil
			local v9 = nil
			local v10 = nil
			local now2 = os.clock()

			while fn2() and not arg.destroyed and arg.userStealEnabled do
				task.wait(2)
				local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
				local str10 = tostring(arg.stats.status)

				if arg.enabled then
					if humanoidRootPart then
						if humanoidRootPart.Position.Y > n69 then
							if arg._boostHopUid == nil then
								if arg._recalling then
									arg._biomeStrandedSince = nil
								elseif arg._biomeStrandedSince and os.clock() - arg._biomeStrandedSince >= 2 then
									arg._biomeStrandedSince = nil
									arg.stats.watchdogResets = (arg.stats.watchdogResets or 0) + 1
									arg:_setStatus("Leaving the portal biome")
									arg:_mutePortalFx(true)
									pcall(arg._crossPortal, arg, fn91("FuseBiomeZone", "ExitPart"), nil, 8)
									arg:_mutePortalFx(false)

									if arg.running then
										arg:_finish("Left the portal biome")
									end
								else
									arg._biomeStrandedSince = arg._biomeStrandedSince or os.clock()
								end
							else
								arg._biomeStrandedSince = nil
							end
						else
							arg._biomeStrandedSince = nil
						end
					else
						arg._biomeStrandedSince = nil
					end
				else
					arg._biomeStrandedSince = nil
				end

				if arg.enabled and arg.running and not arg.carry.active and arg.carryAttemptToken == nil and arg._instantReturnToken == nil and not arg._captureHoldUid and humanoidRootPart and str10 == v8 and position and (humanoidRootPart.Position - position).Magnitude < 3 then
					if os.clock() - now > 12 then
						arg.stats.watchdogResets = (arg.stats.watchdogResets or 0) + 1

						pcall(function()
							arg:_invalidateCarryWorker()
						end)

						arg:_finish("Stuck - retrying")
						arg:_releaseOperation()
						v8 = nil
						position = nil
						now = nil
						v9 = nil
					end
				else
					v8 = str10
					position = humanoidRootPart and humanoidRootPart.Position
					now = os.clock()
				end

				if arg.enabled then
					str10, humanoidRootPart = nil

					if arg._captureHoldUid then
						local v11 = nil
						local v12 = nil
						v9 = v11
						v10 = v12
					else
						if arg.running then
							local v11 = nil
							local str11 = tostring(arg.activeTarget and arg.activeTarget.Uid) .. "|" .. tostring(arg.carry.active)

							if str11 ~= v9 then
								local now3 = os.clock()
								v9 = str11
								now2 = now3
							else
								if os.clock() - now2 > 60 then
									arg.stats.watchdogResets = (arg.stats.watchdogResets or 0) + 1
									local uid = arg.activeTarget and arg.activeTarget.Uid

									if uid and not arg.carry.active then
										arg.skippedEggs[uid] = os.clock() + n38

										if arg.tweenRecoveryUid == uid then
											arg.tweenRecoveryUid = nil
										end
									end

									pcall(function()
										arg:_invalidateCarryWorker()
									end)

									arg:_finish("Stuck \226\128\148 retrying")
									v9 = nil
								end
							end

							v10 = v11
						else
							local v11 = nil
							local ok, result = pcall(arg._chooseTarget, arg)

							if arg:_wallOpen() then
								if ok then
									if result ~= nil then
										local now3 = v10 or os.clock()

										if os.clock() - now3 > 6 then
											arg.stats.watchdogResets = (arg.stats.watchdogResets or 0) + 1
											arg:_releaseOperation()
											arg:_schedule()
											v10 = nil
										else
											v10 = now3
										end
									else
										v10 = nil
									end
								else
									v10 = nil
								end
							else
								v10 = nil
							end

							v9 = v11
						end
					end
				else
					local v11, v12
					v9 = v11
					v10 = v12
				end
			end

			arg.watchdogRunning = false
		end)
	end

	index._finalizeReturn = function(arg, arg2)
		if not arg:_isCarryWorkerCurrent(arg2) then
			return
		end

		if not arg.carry.active then
			arg:_releaseCarryWorker(arg2)
			arg:_reportStolen()
			arg:_finish("Safe return complete")
			return
		end

		arg:_setStatus("Validating safe arrival")
		local now = os.clock()
		local n70 = os.clock() + 6

		while arg:_isCarryWorkerCurrent(arg2) and arg.carry.active and os.clock() < n70 do
			local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

			if not humanoidRootPart then
				arg:_releaseCarryWorker(arg2)
				arg:_finish("Character unavailable")
				return
			end

			if not arg:_isInSafeArea(humanoidRootPart) then
				arg:_setStatus("Rollback detected \226\128\148 returning again")
				arg:_releaseCarryWorker(arg2)

				task.defer(function()
					if not arg.destroyed and (arg.enabled and arg.carry.active) then
						arg:_returnToSafe()
					end
				end)

				return
			end

			if os.clock() - now >= n42 then
				arg:_setStatus("Waiting for deposit")
			end

			task.wait(n43)
		end

		if not arg:_isCarryWorkerCurrent(arg2) then
			return
		end

		if not arg.carry.active then
			arg:_releaseCarryWorker(arg2)
			arg:_reportStolen()
			arg:_finish("Safe return complete")
			return
		end

		arg:_setStatus("Deposit pending \226\128\148 validating again")

		task.defer(function()
			if arg:_isCarryWorkerCurrent(arg2) and arg.carry.active then
				arg:_finalizeReturn(arg2)
			end
		end)
	end

	index._finish = function(arg, arg2)
		arg:_noteLowSpeedOutcome(arg2)
		arg:_hideTreadmillDecoy()
		arg._forestDropInProgress = nil
		arg._instantReturnToken = nil
		arg.boostedUid = nil
		arg:_invalidateCarryWorker()
		arg.planGeneration = arg.planGeneration + 1
		arg:_cancelTween(arg2, arg.enabled)
		arg:_setStatus(arg.enabled and "Searching" or "Idle")

		if arg.enabled then
			task.delay(n12, function()
				if arg.destroyed then
					arg:_releaseOperation()
					return
				elseif not arg.enabled then
					arg:_releaseOperation()
					return
				end

				arg:_schedule()
			end)
		end
	end

	index._scheduleMovementRetry = function(arg)
		if arg.movementRetryPending then
			return
		elseif arg.destroyed then
			return
		elseif not arg.enabled then
			return
		end

		arg.movementRetryPending = true

		task.delay(0.2, function()
			arg.movementRetryPending = false

			if not arg.destroyed and arg.enabled then
				arg:_schedule()
			end
		end)
	end

	index._eggCount = function(arg)
		local ok, result = pcall(function()
			local n70 = 0

			for k in pairs(require(ReplicatedStorage2.Shared.Save).Peek().EggInventory or {}) do
				n70 += 1
			end

			return n70
		end)

		return ok and result or nil
	end

	index._eggInventoryFull = function(arg)
		local eggFullCount = arg.eggFullCount
		if not eggFullCount then
			return false
		end
		local v8 = arg:_eggCount()
		if not v8 then
			return true
		end

		if v8 > eggFullCount then
			arg.eggFullCount = nil
			arg._eggFullHold = false
			return false
		end

		if v8 >= eggFullCount then
			arg._eggFullHold = true
			local senaV4IsAutoSellEggBusy = genv.__SenaV4IsAutoSellEggBusy and genv.__SenaV4IsAutoSellEggBusy()
			arg._eggFullAt = arg._eggFullAt or os.clock()

			if not senaV4IsAutoSellEggBusy and os.clock() - arg._eggFullAt > 60 then
				arg.eggFullCount = nil
				arg._eggFullHold = false
				arg._eggFullAt = nil
				return false
			end

			return true
		end

		arg._eggFullAt = nil

		if arg._eggFullHold then
			if genv.__SenaV4IsAutoSellEggBusy and (genv.__SenaV4IsAutoSellEggBusy() and v8 > eggFullCount - index.EGG_FREE_SLOTS) then
				return true
			end
			arg._eggFullHold = false
			arg.eggFullNotified = nil
		end

		return false
	end

	index._schedule = function(arg)
		if not arg.running then
			arg.safeStarting = false
		end

		if arg.destroyed then
			return
		elseif arg.enabled then
			if arg.running then
				return
			end
		else
			return
		end

		if not arg.carry.active and arg:_eggInventoryFull() then
			arg:_releaseOperation()
			arg:_setStatus("Egg inventory full - place, hatch or sell eggs")

			if not arg.eggFullNotified then
				arg.eggFullNotified = true

				pcall(function()
					game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Auto Steal", Text = "Egg inventory full. Place, hatch or sell eggs and it continues by itself.", Duration = 6})
				end)
			end

			task.delay(3, function()
				if not arg.destroyed and (arg.enabled and not arg.running) then
					arg:_schedule()
				end
			end)

			return
		end

		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if if humanoidRootPart then not humanoid else not humanoidRootPart then
			arg:_releaseOperation()
			arg:_setStatus("Character unavailable")
			return
		end

		arg:_startMovementProtection()

		if arg.carry.active and arg.carry.uid ~= nil then
			if arg.instantPhase == "priming" and arg.carry.uid == arg.primerUid then
				return
			end

			if arg:_isPrimerEgg(arg.carry.uid) then
				arg:_setStatus("Dropping primer egg")
				arg.skippedEggs[arg.carry.uid] = os.clock() + 30
				pcall(EggState2.DropFieldEgg, "PlayerRequest")

				task.delay(0.5, function()
					if not arg.destroyed and arg.enabled then
						arg:_schedule()
					end
				end)

				return
			end

			local v8 = arg.records[arg.carry.uid] or EggState2.ReadFieldEgg(arg.carry.uid)
			local captureObjectiveEnabled = type(v8) == "table" and (arg.riftWants[v8.AssetCategory] or arg.captureObjectiveEnabled and arg:_isCaptureEgg(v8.Uid) or arg.indexObjectiveEnabled and arg:_isIndexObjective(v8) or arg.wispObjective and arg:_isWispObjective(v8) or arg.userStealEnabled and not arg.riftOnly and arg:_matchesNormalFilter(v8))

			if type(v8) == "table" and not captureObjectiveEnabled then
				arg:_setStatus("Dropping unwanted egg")
				arg.skippedEggs[arg.carry.uid] = os.clock() + 30
				pcall(EggState2.DropFieldEgg, "PlayerRequest")

				task.delay(0.5, function()
					if not arg.destroyed and arg.enabled then
						arg:_schedule()
					end
				end)

				return
			end

			arg:_returnToSafe()
			return
		end

		if not arg:_wallOpen() then
			arg:_releaseOperation()
			arg:_setStatus("Waiting for reset wall")
			return
		end

		local senaV4PlayerSteal = genv.__SenaV4PlayerSteal
		local autoSteal = senaV4TaskLadder.blocker("auto_steal")
		local v8 = (if autoSteal then not autoSteal else senaV4TaskLadder.holder("auto_steal")) or nil

		if autoSteal or v8 or senaV4PlayerSteal and senaV4PlayerSteal.running then
			arg:_releaseOperation()
			arg:_setStatus(autoSteal and "Yielding to " .. senaV4TaskLadder.TITLES[autoSteal] or v8 and "Waiting for " .. senaV4TaskLadder.TITLES[v8] .. " to hand over" or "Yielding to Steal Players")
			if arg._yieldRetryPending then
				return
			end
			arg._yieldRetryPending = true

			task.delay((autoSteal or v8) and 1 or 0.5, function()
				arg._yieldRetryPending = nil

				if not arg.destroyed and arg.enabled then
					arg:_schedule()
				end
			end)

			return
		end

		character = arg.tweenRecoveryUid
		local v9 = character and (EggState2.ReadFieldEgg(character) or arg.records[character]) or nil

		if character and (type(v9) ~= "table" or v9.State ~= AreaEggs.States.Slot and v9.State ~= AreaEggs.States.Dropped) then
			arg.tweenRecoveryUid = nil
			v9 = nil
			character = nil
		end

		local v10

		if v9 then
			v10 = v9
		else
			v10 = arg:_chooseTarget()
		end

		if not v10 then
			if arg.stats.matching == 0 then
				if arg.stats.available > 0 then
					local minWeightKg = arg.config.minWeightKg

					if minWeightKg then
						if minWeightKg > 0 then
							arg:_setStatus(string.format("No eggs \226\137\165 %dKg", arg.config.minWeightKg))
						else
							arg:_setStatus("No matching eggs")
						end
					else
						arg:_setStatus("No matching eggs")
					end
				else
					arg:_setStatus("No matching eggs")
				end
			else
				arg:_setStatus("No matching eggs")
			end

			arg:_releaseOperation()

			if not arg.activeTween and (arg:_isInField(humanoidRootPart) and not arg:_isInSafeArea(humanoidRootPart)) then
				local v11 = arg:_resolveSafeCFrame(humanoidRootPart)

				if v11 then
					arg:_tweenRoot(v11, nil, nil, {silent = true, flightProfile = true, abort = function()
						local enabled = arg.enabled
						return if enabled then arg.running else not enabled
					end})
				end
			end

			return
		end

		if arg.treadmillManager and arg.treadmillManager:isEngaged() then
			arg.treadmillManager:_cancelIdle(true)
		end

		local planGeneration = arg.planGeneration
		senaV4PlayerSteal, autoSteal = arg:_acquireOperation()

		if not senaV4PlayerSteal then
			arg:_setStatus("Waiting \194\183 " .. tostring(autoSteal or "another operation"))

			task.delay(0.5, function()
				if not arg.destroyed and (arg.enabled and arg.planGeneration == planGeneration) then
					arg:_schedule()
				end
			end)

			return
		end

		arg.safeStarting = true
		arg.running = true
		arg.activeTarget = v10
		local v11 = arg.catalog.resolve(v10)
		arg.stats.lastTarget = string.format("%s \194\183 %s \194\183 %s", v11.rarity, v11.name, v10.AreaId)

		if character then
			arg.safeStarting = false
			arg.stats.lastResult = "Recovering with tween"
			local v12 = arg:_resolveEggDestination(v10, humanoidRootPart, humanoid)

			if not v12 then
				arg.tweenRecoveryUid = nil
				arg:_finish("Recovery destination unavailable")
				return
			end

			arg:_setStatus("Returning to egg")

			arg:_tweenRoot(v12, function()
				if arg.tweenRecoveryUid == v10.Uid then
					arg:_requestCarry(v10, false)
				end
			end, nil, {holdAfterArrival = true, holdUid = v10.Uid, flightProfile = true, carryTarget = v10})

			return
		end

		if not arg:_leftTreadmill(humanoidRootPart) then
			arg.running = false
			arg.safeStarting = false
			arg.activeTarget = nil
			arg:_releaseOperation()
			arg:_setStatus("Preparing steal")

			task.delay(0.3, function()
				if not arg.destroyed and (arg.enabled and arg.planGeneration == planGeneration) then
					arg:_schedule()
				end
			end)

			return
		end

		if genv.__SenaV4AdminBoost == true and not (arg.captureObjectiveEnabled and arg:_isCaptureEgg(v10.Uid)) then
			arg.safeStarting = false
			task.spawn(arg._adminSteal, arg, v10)
			return
		end

		autoSteal = humanoidRootPart.Position - vector2
		local magnitude = Vector2.new(autoSteal.X, autoSteal.Z).Magnitude
		character = if arg:_usesPortalBoost(v10) then true else false

		if arg.config.stealMode == "Fly" then
			local bottomCFrame = v10.BottomCFrame or v10.BoundsCFrame

			if bottomCFrame then
				local n70 = bottomCFrame.Position - humanoidRootPart.Position
				character = if Vector2.new(n70.X, n70.Z).Magnitude < magnitude then true else character
			end
		end

		if not character and (magnitude > 3 and os.clock() - (arg.lastSafeRepositionAt or 0) > 5) then
			local v12 = arg:_resolveSafeCFrame(humanoidRootPart)

			if v12 then
				arg.safeStarting = true
				arg.running = true
				arg.lastSafeRepositionAt = os.clock()
				arg:_setStatus("Repositioning to safe area")

				arg:_tweenRoot(v12, function()
					arg:_groundSnap()
					arg.safeStarting = false
					arg.running = false

					task.delay(0.15, function()
						if not arg.destroyed and (arg.enabled and arg.planGeneration == planGeneration) then
							arg:_schedule()
						end
					end)
				end, nil, {flightProfile = true})

				return
			end
		end

		arg.safeStarting = false

		if arg:_usesPortalBoost(v10) then
			arg.instantPhase = "hunting"
			arg.primerUid = nil
			arg.targetUid = nil
			arg.activeTarget = v10
			arg._flyDeparting = false
			arg:_installGuardHitDistanceBoost()
			arg:_startMovementProtection()
			arg:_showTreadmillDecoy()
			arg.stats.lastResult = "Low Speed Boost"
			task.spawn(arg._portalBoostSteal, arg, v10)
			return
		end

		if arg.config.stealMode == "Fly" then
			arg.instantPhase = "priming"
			arg.primerUid = nil
			arg.targetUid = v10.Uid
			arg.activeTarget = v10
			arg._flyDeparting = false
			arg.lowFpsPrime = false
			arg:_installGuardHitDistanceBoost()
			arg:_startMovementProtection()
			arg.stats.lastResult = "High Speed departing"
			arg:_startPrimerTargetHunt()
			return
		end

		local v12 = arg:_choosePrimerEgg(v10.Uid)

		if not v12 then
			arg.running = false
			arg.activeTarget = nil
			arg:_releaseOperation()
			arg:_setStatus("Preparing steal")

			task.delay(0.25, function()
				if not arg.destroyed and (arg.enabled and arg.planGeneration == planGeneration) then
					arg:_schedule()
				end
			end)

			return
		end

		arg.instantPhase = "priming"
		arg.primerUid = v12.Uid
		arg.primerUids[v12.Uid] = os.clock() + 120
		arg.skippedEggs[v12.Uid] = os.clock() + 30
		arg.targetUid = v10.Uid
		arg.activeTarget = v12
		arg._flyDeparting = arg.config.stealMode == "Fly"

		if arg.config.stealMode == "Instant" then
			arg:_showTreadmillDecoy()
		end

		arg:_installGuardHitDistanceBoost()
		arg.stats.lastResult = arg.config.stealMode .. " priming"
		arg.lowFpsPrime = fn3() < 30
		local v13 = arg:_resolveEggDestination(v12, humanoidRootPart, humanoid)
		if not v13 then
			arg:_finish("Steal unavailable \226\128\148 retrying")
			return
		end

		if arg.lowFpsPrime then
			arg:_setStatus("Preparing steal")

			arg:_tweenRoot(v13, function()
				if arg.instantPhase == "priming" and arg.primerUid == v12.Uid then
					arg:_requestCarry(v12, false)
				end
			end, nil, {holdAfterArrival = true, holdUid = v12.Uid, flightProfile = true, carryTarget = v12})

			return
		end

		if arg.config.stealMode == "Fly" then
			arg:_setStatus("Preparing steal")

			local function fn94()
				return arg.destroyed or not arg.enabled or arg.instantPhase ~= "priming" or arg.primerUid ~= v12.Uid
			end

			if not arg:_glideRoot(v13, fn94) then
				if arg.instantPhase == "priming" and arg.primerUid == v12.Uid then
					arg:_finish("Steal unavailable \226\128\148 retrying")
				end

				return
			end

			arg:_setArrivalHold(v13, v12.Uid)
			arg:_requestCarry(v12, true)
			return
		end

		arg:_setStatus("Preparing steal")
		if not arg:_teleportRoot(humanoidRootPart, humanoid, v13) then
			arg:_finish("Steal unavailable \226\128\148 retrying")
			return
		end
		arg:_setArrivalHold(v13, v12.Uid)
		arg:_requestCarry(v12, true)
	end

	index._leftTreadmill = function(arg, arg2)
		local treadmillManager = arg.treadmillManager
		if not treadmillManager or treadmillManager.destroyed then
			return true
		end

		if not (treadmillManager.activeTreadmill ~= nil) and (not (treadmillManager.treadmillEquipPending == true) and not (treadmillManager.travelingToTreadmill == true)) then
			if arg2 ~= nil then
				if not arg2.Anchored then
					arg.treadmillLeaveAt = nil
					return true
				end
			else
				arg.treadmillLeaveAt = nil
				return true
			end
		end

		local now = os.clock()
		arg.treadmillLeaveAt = arg.treadmillLeaveAt or now
		treadmillManager.idleGeneration = treadmillManager.idleGeneration + 1

		if not arg.treadmillDoffBusy and now - (arg.treadmillDoffAt or 0) > 0.6 then
			arg.treadmillDoffBusy = true
			arg.treadmillDoffAt = now

			task.spawn(function()
				pcall(treadmillManager._requestUnequip, treadmillManager)
				pcall(treadmillManager._syncActiveTreadmillSnapshot, treadmillManager)
				arg.treadmillDoffBusy = false
			end)
		end

		if arg2 and arg2.Anchored and now - arg.treadmillLeaveAt > 1 then
			pcall(function()
				arg2.Anchored = false
			end)
		end

		if now - arg.treadmillLeaveAt > 8 then
			arg.treadmillLeaveAt = nil
			return true
		end
		return false
	end

	index._reconcileRunningState = function(arg)
		local enabled = arg.userStealEnabled == true or next(arg.riftWants) ~= nil or arg.indexObjectiveEnabled == true or arg.wispObjective ~= nil or arg.manualObjectiveEnabled == true or arg.captureObjectiveEnabled == true

		if arg.enabled == enabled then
			if arg.enabled then
				arg:_refreshCounts()
				arg:_schedule()
			end

			return
		end

		arg.enabled = enabled

		if arg.enabled then
			if localPlayer2.Character then
				fn67(localPlayer2.Character)
				fn69(arg, localPlayer2.Character)
			end

			arg:_installGuardHitDistanceBoost()
			arg:_startMovementProtection()
			pcall(arg._installPromptFilter, arg)
			arg:_setStatus("Searching")
			arg:_schedule()
		else
			if arg._instantReturnToken ~= nil and (arg.carry.uid ~= nil and not arg._externalDeliver) then
				arg._externalDeliver = true
				arg.planGeneration = arg.planGeneration + 1
				arg.running = false
				arg:_setStatus("Finishing target egg")

				task.spawn(function()
					local n70 = os.clock() + 45

					while arg._instantReturnToken ~= nil and os.clock() < n70 and not arg.destroyed do
						task.wait(0.2)
					end

					if arg.destroyed then
						return
					elseif arg.enabled then
						return
					end

					arg._externalDeliver = nil
					arg._instantReturnToken = nil
					arg.carry.active = false
					arg.carry.uid = nil
					arg.activeTarget = nil
					arg:_cleanupInstantSteal()
					arg:_removeGuardHitDistanceBoost()
					arg:_restoreTreadmillVisualAtSafe()
					arg:_stopMovementProtection()
					fn68(arg)
					arg:_setStatus("Idle")
				end)

				arg:_refreshCounts()
				return
			end

			local v8 = arg:_needsHiddenRecall()

			if v8 then
				arg._recalling = true
			end

			arg.planGeneration = arg.planGeneration + 1
			arg.carry.generation += 1
			arg:_cleanupInstantSteal()

			if not v8 then
				arg:_removeGuardHitDistanceBoost()
			end

			arg:_invalidateCarryWorker()
			arg._forestDropInProgress = nil
			arg._instantReturnToken = nil
			arg.carry.active = false
			arg.carry.uid = nil
			arg.tweenRecoveryUid = nil
			arg.claimPresentationSuppression = nil
			arg.safeStarting = false
			arg.movementRetryPending = false
			arg:_cancelTween("Disabled")
			arg:_releaseOperation()

			if v8 then
				arg:_recallHidden()
			else
				arg:_restoreTreadmillVisualAtSafe()
				arg:_stopMovementProtection()
				fn68(arg)
			end

			arg.activeTarget = nil
			arg.running = false
			arg:_setStatus("Idle")
		end

		arg:_refreshCounts()
	end

	index.setEnabled = function(arg, arg2)
		arg.userStealEnabled = arg2 == true
		arg:_reconcileRunningState()

		if arg.userStealEnabled then
			arg:_startWatchdog()
		end

		arg:_reconcileScramblePortal()
	end

	local str10 = "ScrambleArenaPortal"

	index._neutralizeScramblePortal = function(arg, arg2)
		if typeof(arg2) ~= "Instance" then
			return
		elseif arg2.Name ~= str10 then
			return
		end

		arg.scramblePortalOriginals = arg.scramblePortalOriginals or {}

		for i, descendant in ipairs(arg2:GetDescendants()) do
			if descendant:IsA("BasePart") then
				if arg.scramblePortalOriginals[descendant] == nil then
					local attribute = descendant:GetAttribute("SenaV4PortalOrig")

					if type(attribute) == "string" then
						arg.scramblePortalOriginals[descendant] = {CanCollide = attribute:sub(1, 1) == "1", CanTouch = attribute:sub(2, 2) == "1"}
					else
						arg.scramblePortalOriginals[descendant] = {CanCollide = descendant.CanCollide, CanTouch = descendant.CanTouch}
						pcall(descendant.SetAttribute, descendant, "SenaV4PortalOrig", (descendant.CanCollide and "1" or "0") .. (descendant.CanTouch and "1" or "0"))
					end
				end

				pcall(function()
					descendant.CanCollide = false
					descendant.CanTouch = false
				end)
			end
		end
	end

	index._startScramblePortalBypass = function(arg)
		local v8 = workspace:FindFirstChild(str10)

		if v8 then
			arg:_neutralizeScramblePortal(v8)
		end

		if not arg.scramblePortalConn then
			arg.scramblePortalConn = workspace.ChildAdded:Connect(function(child)
				if arg.destroyed then
					return
				elseif arg.userStealEnabled then
					if arg._scramblePortalHold then
						return
					end
				else
					return
				end

				if child.Name ~= str10 then
					return
				end

				for i, v9 in ipairs({0, 0.15, 0.4, 0.8}) do
					task.delay(v9, function()
						if not arg.destroyed and (arg.userStealEnabled and (not arg._scramblePortalHold and child.Parent)) then
							arg:_neutralizeScramblePortal(child)
						end
					end)
				end
			end)
		end
	end

	index._stopScramblePortalBypass = function(arg)
		if arg.scramblePortalConn then
			pcall(arg.scramblePortalConn.Disconnect, arg.scramblePortalConn)
			arg.scramblePortalConn = nil
		end

		if arg.scramblePortalOriginals then
			for k, scramblePortalOriginal in pairs(arg.scramblePortalOriginals) do
				if typeof(k) == "Instance" and k.Parent then
					pcall(function()
						k.CanCollide = scramblePortalOriginal.CanCollide
						k.CanTouch = scramblePortalOriginal.CanTouch
						k:SetAttribute("SenaV4PortalOrig", nil)
					end)
				end
			end

			arg.scramblePortalOriginals = nil
		end
	end

	index._setScramblePortalHold = function(arg, arg2)
		local scramblePortalHold = arg2 == true
		if arg._scramblePortalHold == scramblePortalHold then
			return
		end
		arg._scramblePortalHold = scramblePortalHold
		arg:_reconcileScramblePortal()
	end

	index._reconcileScramblePortal = function(arg)
		if arg.userStealEnabled then
			if arg._scramblePortalHold then
				arg:_stopScramblePortalBypass()
			else
				arg:_startScramblePortalBypass()
			end
		else
			arg:_stopScramblePortalBypass()
		end
	end

	index._resolveWeightKg = function(arg, arg2)
		local weightUtil = arg.weightUtil

		if weightUtil then
			if arg2 then
				if arg2.AssetScale then
					if not arg2.AssetCategory then
						return nil
					end
				else
					return nil
				end
			else
				return nil
			end
		else
			return nil
		end

		local ok, result = pcall(weightUtil.WeightKgForScale, arg2.AssetCategory, arg2.AssetScale)
		if ok and type(result) == "number" then
			return result
		end
		return nil
	end

	index.setHeaviestFirst = function(arg, arg2)
		arg.config.heaviestFirst = arg2 == true

		if arg.config.heaviestFirst then
			arg.config.highestValueFirst = false
		end

		arg:_schedule()
	end

	index.setHighestValueFirst = function(arg, arg2)
		arg.config.highestValueFirst = arg2 == true

		if arg.config.highestValueFirst then
			arg.config.heaviestFirst = false
		end

		arg:_schedule()
	end

	local name4 = "__SenaV4EggEsp"
	local name5 = "__SenaV4EggHighlight"
	local tbl18 = {rarity = true, name = true, kg = true, mutation = true, value = true, placed = true, icon = true}

	fn66 = function(arg)
		if type(arg) ~= "table" then
			return nil
		end
		local category = arg.Category or arg.AssetCategory
		local num = tonumber(arg.Scale or arg.AssetScale)

		if type(category) ~= "string" then
			return nil
		elseif num then
			if num <= 0 then
				return nil
			end
		else
			return nil
		end

		local tbl19 = {Category = category, Scale = num, Mutations = type(arg.Mutations) == "table" and table.clone(arg.Mutations) or {}, BaseMutation = type(arg.BaseMutation) == "string" and arg.BaseMutation or nil}
		category, arg = pcall(AssetEarnings.MutationOnlyRatePerSecond, tbl19)
		return category and type(arg) == "number" and arg or nil
	end

	local v8

	local function fn94(arg)
		if type(v8) ~= "table" then
			local ok, result = pcall(require, ReplicatedStorage2.Packages.FormatNumber.Simple)

			if ok and type(result.FormatCompact) == "function" then
				v8 = result
			end
		end

		if v8 then
			local ok, result = pcall(v8.FormatCompact, arg, ".#")
			if ok and type(result) == "string" then
				return result
			end
		end

		local n70 = math.abs(arg)

		if n70 >= 1000000000000 then
			return string.format("%.2fT", arg / 1000000000000)
		elseif n70 >= 1000000000 then
			return string.format("%.2fB", arg / 1000000000)
		elseif n70 >= 1000000 then
			return string.format("%.1fM", arg / 1000000)
		elseif n70 >= 1000 then
			return string.format("%.1fK", arg / 1000)
		end

		return string.format("%d", math.floor(arg + 0.5))
	end

	local n70 = 2
	local n71 = 3.2
	local n72 = 1.25
	local n73 = 597
	local tbl19 = {["Carry not confirmed \226\128\148 retrying"] = true, ["Carry refused \226\128\148 next egg"] = true, ["Carry lost \226\128\148 retrying"] = true, ["Drop failed \226\128\148 retrying"] = true, ["Egg lost \226\128\148 retrying"] = true, ["Re-steal failed \226\128\148 retrying"] = true, ["Steal timed out \226\128\148 retrying"] = true}
	local n74 = 8
	local n75 = 600
	local tbl20 = {}

	local function fn95()
		if next(tbl20) then
			return tbl20
		end
		local v9 = fn()
		local areas = v9 and v9:FindFirstChild("Areas")
		local guardAreas = areas and areas:FindFirstChild("GuardAreas")

		for i, v10 in ipairs(guardAreas and guardAreas:GetChildren() or {}) do
			local closestExitPoint = v10:FindFirstChild("ClosestExitPoint")

			if closestExitPoint and closestExitPoint:IsA("BasePart") then
				tbl20[v10.Name] = closestExitPoint.Position.X
			end
		end

		return tbl20
	end

	index.settleNeed = function(arg, arg2, arg3)
		local v9 = fn95()[arg2]
		return n70 + math.max(0, (v9 or n73) - n73) / (n71 * math.max(arg3, 16))
	end

	index.recommendLowSpeedLevel = function(arg, arg2)
		local v9 = arg2 or fn86()
		local tbl21 = {}

		if arg.config.areaEnabled and #arg.config.areas > 0 then
			tbl21 = arg.config.areas
		else
			for k in pairs(fn95()) do
				tbl21[#tbl21 + 1] = k
			end
		end

		local n76, v10 = 10
		arg2 = 10

		for i, v11 in ipairs(tbl21) do
			if senaV4Config.LowSpeedBoost == true and tbl16[v11] ~= nil then
			else
				local v12 = arg:settleNeed(v11, v9)
				local n77 = 1

				for i2 = 10, 1, -1 do
					if fn87(v11, i2) >= v12 then
						n77 = i2
						break
					end
				end

				i = 1

				for i2 = 10, 1, -1 do
					if fn87(v11, i2) >= v12 * n72 then
						i = i2
						break
					end
				end

				if n77 < n76 then
					n76 = n77
					v10 = v11
				end

				arg2 = math.min(arg2, i)
			end
		end

		local lowSpeedFailCap = arg.lowSpeedFailCap

		if lowSpeedFailCap then
			n76 = math.min(n76, lowSpeedFailCap)
			arg2 = math.min(arg2, lowSpeedFailCap)
		end

		return math.min(arg2, n76), n76, v9, v10
	end

	index._noteLowSpeedOutcome = function(arg, arg2)
		local flag5 = arg._untrustedSeen == true
		arg._untrustedSeen = nil
		if arg.config.stealMode ~= "Instant" then
			return
		end

		if arg.boostedUid ~= nil then
			return
		elseif arg._boostHopUid ~= nil then
			return
		end

		local failed = tbl19[tostring(arg2)] == true or flag5
		if not failed and arg2 ~= "Safe return complete" then
			return
		end
		local n76 = math.clamp(tonumber(senaV4Config.StealHoldSeconds) or 5, 1, 10)
		arg.lowSpeedOutcomes = arg.lowSpeedOutcomes or {}
		flag5 = arg.lowSpeedOutcomes[n76] or {}
		arg.lowSpeedOutcomes[n76] = flag5
		local n77 = #flag5 + 1
		local tbl21 = {}
		tbl21.at, tbl21.failed, flag5[n77] = os.clock(), failed, tbl21

		while #flag5 > n74 do
			table.remove(flag5, 1)
		end

		tbl21 = 0
		n77 = 0

		for i, v9 in ipairs(flag5) do
			if os.clock() - v9.at <= n75 then
				tbl21, n77 = tbl21 + 1, if v9.failed then n77 + 1 else n77
			end
		end

		if n76 > 1 and (n77 >= 3 and n77 / tbl21 >= 0.4) then
			local lowSpeedFailCap = n76 - 1
			local lowSpeedFailCap2 = arg.lowSpeedFailCap

			if if lowSpeedFailCap2 then lowSpeedFailCap < arg.lowSpeedFailCap else not lowSpeedFailCap2 then
				arg.lowSpeedFailCap = lowSpeedFailCap
				arg.lowSpeedAdvice = {from = n76, to = lowSpeedFailCap, fails = n77, total = tbl21, fresh = true}
			end
		end
	end

	index.lowSpeedStatus = function(arg)
		local v9

		pcall(function()
			v9 = SpeedPowerProjection.ReadProjected()
		end)

		local v10, v11, v12 = arg:recommendLowSpeedLevel()
		local n76 = math.clamp(tonumber(senaV4Config.StealHoldSeconds) or 5, 1, 10)
		local lowSpeedAdvice = arg.lowSpeedAdvice
		local v13 = lowSpeedAdvice and (if n76 <= lowSpeedAdvice.to then nil else lowSpeedAdvice)
		return {speedText = type(v9) == "number" and fn94(v9) or "?", walkSpeed = math.floor((v12 or 0) + 0.5), safe = v10, fast = v11, level = n76, advice = v13}
	end

	index.setEggEsp = function(arg, arg2)
		arg.config.espEnabled = arg2 == true

		if not arg.config.espEnabled then
			pcall(function()
				arg:_clearEsp()
			end)
		end
	end

	index.setEspMinRank = function(arg, arg2)
		arg.config.espMinRank = math.max(tonumber(arg2) or 0, 0)
	end

	index.setEspMinValue = function(arg, arg2)
		arg.config.espMinValue = math.max(tonumber(arg2) or 0, 0)
	end

	index._espPasses = function(arg, arg2, arg3)
		local config = arg.config
		local espMinRank = config.espMinRank
		if espMinRank and (espMinRank > 0 and (tonumber(arg2 and arg2.rarityRank) or 0) < config.espMinRank) then
			return false
		end
		local espMinValue = config.espMinValue
		if espMinValue and (espMinValue > 0 and (tonumber(arg3) or 0) < config.espMinValue) then
			return false
		end
		return true
	end

	index.setEspOption = function(arg, arg2, arg3)
		if tbl18[arg2] then
			arg.config["esp" .. arg2:sub(1, 1):upper() .. arg2:sub(2)] = arg3 == true
		end
	end

	index._clearEsp = function(arg)
		local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
		if not areaEggSlotsClient then
			return
		end

		for i, child in ipairs(areaEggSlotsClient:GetChildren()) do
			local v9 = child:FindFirstChild(name4)

			if v9 then
				v9:Destroy()
			end

			local v10 = child:FindFirstChild(name5)

			if v10 then
				v10:Destroy()
			end
		end
	end

	index._updateEsp = function(arg)
		local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
		if not areaEggSlotsClient then
			return
		end
		local config = arg.config

		for i, child in ipairs(areaEggSlotsClient:GetChildren()) do
			local v9 = arg.records[child.Name]
			local flag5 = config.espEnabled and v9 ~= nil and (v9.State == AreaEggs.States.Slot or v9.State == AreaEggs.States.Dropped)
			local v10 = flag5 and (if arg:_espPasses(arg.catalog.resolve(v9), fn66(v9)) then flag5 else false)
			local hitbox = v10 and (child:FindFirstChild("Hitbox") or child:FindFirstChildWhichIsA("BasePart", true))
			local billboardGui = child:FindFirstChild(name4)
			local highlight = child:FindFirstChild(name5)

			if if v10 then not hitbox else not v10 then
				if billboardGui then
					billboardGui:Destroy()
				end

				if highlight then
					highlight:Destroy()
				end
			else
				if billboardGui then
					if billboardGui:FindFirstChild("Icon") then
					else
						billboardGui:Destroy()
						billboardGui = nil
					end
				end

				if billboardGui then
				else
					billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = name4
					billboardGui.AlwaysOnTop = true
					billboardGui.Size = UDim2.fromOffset(220, 72)
					billboardGui.StudsOffset = Vector3.new(0, 4.4, 0)
					billboardGui.MaxDistance = 1000
					billboardGui.Adornee = hitbox
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.Name = "Icon"
					imageLabel.AnchorPoint = Vector2.new(0.5, 1)
					imageLabel.Position = UDim2.fromScale(0.5, 0.42)
					imageLabel.Size = UDim2.fromOffset(30, 30)
					imageLabel.BackgroundTransparency = 1
					imageLabel.ScaleType = Enum.ScaleType.Fit
					imageLabel.Visible = false
					imageLabel.Parent = billboardGui
					local textLabel = Instance.new("TextLabel")
					textLabel.Name = "Text"
					textLabel.AnchorPoint = Vector2.new(0.5, 0)
					textLabel.Position = UDim2.fromScale(0.5, 0.45)
					textLabel.Size = UDim2.new(1, 0, 0.55, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextSize = 13
					textLabel.TextStrokeTransparency = 0.35
					textLabel.TextXAlignment = Enum.TextXAlignment.Center
					textLabel.TextYAlignment = Enum.TextYAlignment.Top
					textLabel.Parent = billboardGui
					billboardGui.Parent = child
				end

				billboardGui.Adornee = hitbox
				local tbl21 = arg.catalog.resolve(v9)
				local icon = billboardGui:FindFirstChild("Icon")
				local icon2 = config.espIcon and type(tbl21.icon) == "string" and tbl21.icon ~= "" and tbl21.icon or nil
				icon.Image = icon2 or ""
				icon.Visible = icon2 ~= nil
				local rarityColor = typeof(tbl21.rarityColor) == "Color3" and tbl21.rarityColor or Color3.fromRGB(255, 255, 255)
				local tbl22 = {}

				if config.espRarity then
					tbl22[#tbl22 + 1] = string.upper(tbl21.rarity or "?")
				end

				if config.espName then
					tbl22[#tbl22 + 1] = tostring(tbl21.name)
				end

				if config.espKg then
					tbl21 = arg:_resolveWeightKg(v9)

					if tbl21 then
						tbl22[#tbl22 + 1] = string.format("%d Kg", math.floor(tbl21))
					end
				end

				if config.espMutation and type(v9.Mutations) == "table" and next(v9.Mutations) then
					tbl21 = {}

					for k, mutation in pairs(v9.Mutations) do
						tbl21[#tbl21 + 1] = tostring(mutation)
					end

					if #tbl21 > 0 then
						table.sort(tbl21)
						tbl22[#tbl22 + 1] = table.concat(tbl21, ", ")
					end
				end

				if config.espValue then
					tbl21 = fn66(v9)

					if tbl21 then
						tbl22[#tbl22 + 1] = "$" .. fn94(tbl21) .. "/s"
					end
				end

				local text = billboardGui:FindFirstChild("Text")
				text.Text = table.concat(tbl22, " | ")
				text.TextColor3 = rarityColor

				if highlight then
					if highlight:IsA("Highlight") then
					else
						highlight:Destroy()
						highlight = nil
					end
				end

				if highlight then
				else
					highlight = Instance.new("Highlight")
					highlight.Name = name5
					highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					highlight.Parent = child
				end

				highlight.Adornee = child
				highlight.FillColor = rarityColor
				highlight.FillTransparency = 0.72
				highlight.OutlineColor = rarityColor
				highlight.OutlineTransparency = 0
			end
		end

		arg._placedEspAnchors = arg._placedEspAnchors or {}
		os.clock()

		if config.espPlaced then
			local v9 = (Save.Peek or Save.Get)()
			local eggInventory = type(v9) == "table" and v9.EggInventory or nil
			local centerPoint = PlotState2.ResolveLocalSlot()
			local senaV4PlacedEggAnchors = PlotState2.ResolveFolder()
			local v10 = senaV4PlacedEggAnchors and centerPoint and senaV4PlacedEggAnchors:FindFirstChild(tostring(centerPoint))
			centerPoint = v10 and v10:FindFirstChild("CenterPoint")
			local v11 = centerPoint and (if centerPoint:IsA("BasePart") then centerPoint else nil)
			local tbl21 = {}

			if type(eggInventory) == "table" and v11 then
				senaV4PlacedEggAnchors = workspace:FindFirstChild("SenaV4PlacedEggAnchors")

				if senaV4PlacedEggAnchors then
				else
					senaV4PlacedEggAnchors = Instance.new("Folder")
					senaV4PlacedEggAnchors.Name = "SenaV4PlacedEggAnchors"
					senaV4PlacedEggAnchors.Parent = workspace
				end

				for i, child in ipairs(senaV4PlacedEggAnchors:GetChildren()) do
					if child:IsA("Highlight") then
						child:Destroy()
					elseif child:IsA("BillboardGui") then
						child:Destroy()
					end
				end

				for k, v12 in pairs(eggInventory) do
					if type(k) == "string" and (type(v12) == "table" and type(v12.Placement) == "table") then
						tbl21[k] = true
						local localCFrame = v12.Placement.LocalCFrame

						if typeof(localCFrame) ~= "CFrame" then
							local ok, result = pcall(EggRecords.Decode, v12)
							local placement = ok and type(result) == "table" and result.Placement or nil
							localCFrame = type(placement) == "table" and placement.LocalCFrame or nil
						end

						if typeof(localCFrame) == "CFrame" then
							local ok, result = pcall(EggRecords.Decode, v12)
							local flag5 = ok and type(result) == "table" and result or v12
							result = tonumber(flag5.AssetScale) or 1
							local cFrame = v11.CFrame * localCFrame + Vector3.new(0, 3 + result * 2, 0)
							arg._placedEspAnchors[k] = arg._placedEspAnchors[k] or {}
							local v13 = arg._placedEspAnchors[k]

							if typeof(v13.anchor) ~= "Instance" then
								local part = Instance.new("Part")
								part.Name = "SenaV4PE_" .. k
								part.Size = Vector3.new(1.5, 1.5, 1.5)
								part.Transparency = 1
								part.Anchored = true
								part.CanCollide = false
								part.CanQuery = false
								part.CanTouch = false
								part.Parent = senaV4PlacedEggAnchors
								v13.anchor = part
							end

							v13.anchor.CFrame = cFrame
							local v14 = arg.catalog.resolve({AssetCategory = flag5.AssetCategory})
							local rarityColor = typeof(v14.rarityColor) == "Color3" and v14.rarityColor or Color3.fromRGB(255, 255, 255)
							local billboardGui = fn66({Category = flag5.AssetCategory, Mutations = type(flag5.Mutations) == "table" and flag5.Mutations or {}, Scale = result, BaseMutation = type(flag5.BaseMutation) == "string" and flag5.BaseMutation or nil})
							if not arg:_espPasses(v14, billboardGui) then
								tbl21[k] = nil
								continue
							end
							local tbl22 = {}

							if config.espRarity then
								tbl22[#tbl22 + 1] = string.upper(v14.rarity or "?")
							end

							if config.espName then
								tbl22[#tbl22 + 1] = tostring(v14.name)
							end

							if config.espKg then
								local ok2, result2 = pcall(EggRecords.WeightKgForScale, flag5.AssetCategory, result)

								if ok2 and type(result2) == "number" then
									tbl22[#tbl22 + 1] = string.format("%d Kg", math.floor(result2))
								end
							end

							if config.espValue and billboardGui then
								tbl22[#tbl22 + 1] = "$" .. fn94(billboardGui) .. "/s"
							end

							if type(v12.Placement.ReadyAt) == "number" then
								tbl22[#tbl22 + 1] = "READY"
							elseif type(flag5.Placement) == "table" then
								if flag5.Placement.ReadyAt ~= nil then
									tbl22[#tbl22 + 1] = "READY"
								end
							end

							billboardGui = v13.anchor:FindFirstChild(name4)

							if billboardGui then
							else
								billboardGui = Instance.new("BillboardGui")
								billboardGui.Name = name4
								billboardGui.AlwaysOnTop = true
								billboardGui.Size = UDim2.fromOffset(220, 72)
								billboardGui.StudsOffset = Vector3.new(0, 1.4, 0)
								billboardGui.MaxDistance = 1000
								local imageLabel = Instance.new("ImageLabel")
								imageLabel.Name = "Icon"
								imageLabel.AnchorPoint = Vector2.new(0.5, 1)
								imageLabel.Position = UDim2.fromScale(0.5, 0.42)
								imageLabel.Size = UDim2.fromOffset(34, 34)
								imageLabel.BackgroundTransparency = 1
								imageLabel.ScaleType = Enum.ScaleType.Fit
								imageLabel.Visible = false
								imageLabel.Parent = billboardGui
								local textLabel = Instance.new("TextLabel")
								textLabel.Name = "Text"
								textLabel.AnchorPoint = Vector2.new(0.5, 0)
								textLabel.Position = UDim2.fromScale(0.5, 0.45)
								textLabel.Size = UDim2.new(1, 0, 0.55, 0)
								textLabel.BackgroundTransparency = 1
								textLabel.Font = Enum.Font.GothamBold
								textLabel.TextSize = 13
								textLabel.TextStrokeTransparency = 0.35
								textLabel.TextXAlignment = Enum.TextXAlignment.Center
								textLabel.TextYAlignment = Enum.TextYAlignment.Top
								textLabel.Parent = billboardGui
								billboardGui.Parent = v13.anchor
							end

							local icon = billboardGui:FindFirstChild("Icon")

							if icon then
								local icon2 = config.espIcon and type(v14.icon) == "string" and v14.icon ~= "" and v14.icon or nil
								icon.Image = icon2 or ""
								icon.Visible = icon2 ~= nil
							end

							local text = billboardGui:FindFirstChild("Text")
							text.Text = table.concat(tbl22, " | ")
							text.TextColor3 = rarityColor
							local v15 = v13.anchor:FindFirstChild(name5)

							if v15 then
								v15:Destroy()
							end
						end
					end
				end
			end

			for k, placedEspAnchor in pairs(arg._placedEspAnchors) do
				if not tbl21[k] then
					if typeof(placedEspAnchor.anchor) == "Instance" then
						placedEspAnchor.anchor:Destroy()
					end

					if typeof(placedEspAnchor.highlight) == "Instance" then
						placedEspAnchor.highlight:Destroy()
					end

					arg._placedEspAnchors[k] = nil
				end
			end
		else
			for k, v9 in pairs(arg._placedEspAnchors or {}) do
				if typeof(v9.anchor) == "Instance" then
					v9.anchor:Destroy()
				end

				if typeof(v9.highlight) == "Instance" then
					v9.highlight:Destroy()
				end

				arg._placedEspAnchors[k] = nil
			end
		end
	end

	index.setMinWeightKg = function(arg, arg2)
		local n76 = tonumber(arg2) or 0
		arg.config.minWeightKg = math.max(n76, 0)
	end

	index.setMinValuePerSec = function(arg, arg2)
		local n76 = tonumber(arg2) or 0
		arg.config.minValuePerSec = math.max(n76, 0)
		arg:_refreshCounts()
		arg:_schedule()
	end

	index.setSpeed = function(arg, arg2)
		local n76 = math.clamp(math.floor((tonumber(arg2) or n11) + 0.5), n9, n10)
		arg.config.speed = n76 * n8

		if genv.__SenaV4AdminBoost == true then
			arg.config.speed = speed
		end

		if arg.enabled then
			arg:_startMovementProtection()
		elseif arg.activeTween then
			arg:_startMovementProtection()
		end

		return n76
	end

	index.getDefaultSpeed = function(arg)
		return n11
	end

	index.setFilterEnabled = function(arg, arg2, arg3)
		arg.config[arg2 .. "Enabled"] = arg3 == true
		arg:_refreshCounts()
		arg:_schedule()
	end

	index.setFilter = function(arg, arg2, arg3)
		local tbl21 = type(arg3) == "table" and table.clone(arg3) or {}

		if arg2 == "mutations" and type(arg.catalog.resolveMutationId) == "function" then
			local tbl22 = {}

			for i, v9 in ipairs(tbl21) do
				local v10 = arg.catalog.resolveMutationId(v9)

				if v10 then
					table.insert(tbl22, v10)
				end
			end

			tbl21 = tbl22
		end

		arg.config[arg2] = tbl21
		arg:_refreshCounts()
		arg:_schedule()
	end

	index.destroy = function(arg)
		if arg.destroyed then
			return
		end
		arg.destroyed = true
		arg.enabled = false
		arg:_mutePortalFx(false, true)
		pcall(arg._guardLagback, arg, false)
		pcall(arg._stopScramblePortalBypass, arg)
		pcall(arg._removePromptFilter, arg)

		if arg._relocateConn then
			pcall(arg._relocateConn.Disconnect, arg._relocateConn)
			arg._relocateConn = nil
		end

		arg._recalling = nil
		arg:_hideTreadmillDecoy()
		arg.planGeneration = arg.planGeneration + 1
		arg.carry.generation += 1
		arg:_invalidateCarryWorker()
		arg.carry.active = false
		arg.carry.uid = nil
		arg.tweenRecoveryUid = nil
		arg.safeStarting = false
		arg:_cancelTween("Destroyed")
		arg:_cleanupInstantSteal()
		arg:_removeGuardHitDistanceBoost()
		arg:_releaseOperation()
		arg:_stopMovementProtection()

		if arg._healthPinner then
			pcall(arg._healthPinner.Disconnect, arg._healthPinner)
			arg._healthPinner = nil
		end

		if arg._healthChangedConnection then
			pcall(arg._healthChangedConnection.Disconnect, arg._healthChangedConnection)
			arg._healthChangedConnection = nil
		end

		arg:_restoreClaimPresentationFilter()
		fn70(localPlayer2.Character)

		pcall(function()
			arg:_clearEsp()
		end)

		pcall(function()
			for k, v9 in pairs(arg._placedEspAnchors or {}) do
				if typeof(v9.anchor) == "Instance" then
					v9.anchor:Destroy()
				end
			end

			local senaV4PlacedEggAnchors = workspace:FindFirstChild("SenaV4PlacedEggAnchors")

			if senaV4PlacedEggAnchors then
				senaV4PlacedEggAnchors:Destroy()
			end
		end)

		fn64(arg.connections)
		table.clear(arg.listeners)
		table.clear(arg.records)
	end

	return index
end)()

local tbl11 = {k = 1000, m = 1000000, b = 1000000000, t = 1000000000000, q = 1000000000000000}

local function fn61(arg)
	local match, v9 = tostring(arg or ""):lower():gsub("%s+", ""):gsub("%$", ""):gsub("/s$", ""):match("^([%d%.]+)([kmbtq]?)$")
	local num = tonumber(match)
	if not num then
		return nil
	end
	return math.max(0, math.floor(num * (tbl11[v9] or 1) + 0.5))
end

local v9 = (function()
	local Players2 = game:GetService("Players")
	local RunService2 = game:GetService("RunService")
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local localPlayer2 = Players2.LocalPlayer
	local Remotes = require(ReplicatedStorage2.Shared.Remotes)
	local EggState2 = require(ReplicatedStorage2.Client.EggState)
	local Ragdoll = require(ReplicatedStorage2.Shared.Modules.Ragdoll)
	local RagdollJoints = require(ReplicatedStorage2.Shared.Modules.RagdollJoints)
	local eggWorld = Remotes.EggWorld
	local n8 = 340
	local n9 = 240
	local n10 = 0.05
	local n11 = 5
	local index = {}
	index.__index = index

	local function fn62(arg)
		if arg then
			pcall(arg.Disconnect, arg)
		end
	end

	index.new = function(eggRuntime)
		local obj = setmetatable({}, index)
		obj.eggRuntime = eggRuntime
		obj.enabled = true
		obj.destroyed = false
		obj.connections = {}
		obj.originalRagdoll = {}
		obj.originalHumanoidStates = setmetatable({}, {__mode = "k"})
		obj.stats = {blockedHits = 0, blockedDrops = 0, recarriedEggs = 0}
		obj.lastHeldEggUid = nil
		obj.lastHeldSlotKey = nil
		obj._installed = false
		obj._stickyToken = 0
		obj._nextBodyRecoveryAt = 0
		obj._nextJointSweepAt = 0
		obj._forestStrikeOldFire = nil
		return obj
	end

	index._liveBody = function(arg)
		local character = localPlayer2.Character
		return character, character and character:FindFirstChildOfClass("Humanoid"), character and character:FindFirstChild("HumanoidRootPart")
	end

	index._recoverBody = function(arg, arg2)
		if arg.enabled then
			if arg.destroyed then
				return
			end
		else
			return
		end

		local v9, v10, v11 = arg:_liveBody()

		if v9 then
			if not v10 then
				return
			elseif v11 then
			else
				return
			end
		else
			return
		end

		local now = os.clock()
		if not arg2 and now < arg._nextBodyRecoveryAt then
			return
		end
		arg._nextBodyRecoveryAt = now + 0.03

		if not arg.originalHumanoidStates[v10] then
			local originalHumanoidStates = arg.originalHumanoidStates
			local tbl12 = {}
			tbl12.Physics = v10:GetStateEnabled(Enum.HumanoidStateType.Physics)
			tbl12.FallingDown = v10:GetStateEnabled(Enum.HumanoidStateType.FallingDown)
			tbl12.Ragdoll = v10:GetStateEnabled(Enum.HumanoidStateType.Ragdoll)
			originalHumanoidStates[v10] = tbl12
		end

		local state = v10:GetState()
		local flag5 = state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.PlatformStanding or state == Enum.HumanoidStateType.Seated

		pcall(function()
			v10.BreakJointsOnDeath = false
			v10.RequiresNeck = false
			v10:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
			v10:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
			v10:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			v10:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			v10.PlatformStand = false
			v10.Sit = false
			local state2 = v10:GetState()

			if state2 == Enum.HumanoidStateType.Physics or state2 == Enum.HumanoidStateType.FallingDown or state2 == Enum.HumanoidStateType.Ragdoll or state2 == Enum.HumanoidStateType.PlatformStanding or state2 == Enum.HumanoidStateType.Seated then
				v10:ChangeState(Enum.HumanoidStateType.GettingUp)
				v10:ChangeState(Enum.HumanoidStateType.Running)
			end
		end)

		for i, descendant in ipairs(v9:GetDescendants()) do
			if descendant:IsA("Motor6D") then
				if not descendant.Enabled then
					descendant.Enabled = true
				end
			elseif descendant:IsA("BallSocketConstraint") or descendant:IsA("HingeConstraint") then
				if descendant.Name:find("Ragdoll", 1, true) then
					pcall(descendant.Destroy, descendant)
				elseif descendant:GetAttribute("RagdollConstraint") then
					pcall(descendant.Destroy, descendant)
				end
			end
		end

		local assemblyLinearVelocity = v11.AssemblyLinearVelocity

		if flag5 or Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z).Magnitude > math.max(n8, (tonumber(v10.WalkSpeed) or 0) * 1.5) or math.abs(assemblyLinearVelocity.Y) > n9 then
			v11.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			v11.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			arg.stats.blockedHits = arg.stats.blockedHits + 1
		end
	end

	index._watchCharacter = function(arg, arg2)
		if not arg2 then
			return
		end

		local function fn63(descendant)
			if arg.enabled then
				if arg.destroyed then
					return
				end
			else
				return
			end

			if descendant:IsA("BallSocketConstraint") or descendant:IsA("HingeConstraint") then
				if descendant.Name:find("Ragdoll", 1, true) or descendant:GetAttribute("RagdollConstraint") then
					pcall(descendant.Destroy, descendant)
					arg:_recoverBody(true)
				end
			elseif descendant:IsA("Motor6D") then
				if not descendant.Enabled then
					descendant.Enabled = true
				end
			end
		end

		local connection6 = arg2.DescendantAdded:Connect(fn63)
		table.insert(arg.connections, connection6)
	end

	index._installRagdollHooks = function(arg)
		if arg._installed then
			return
		end
		arg._installed = true

		task.spawn(function()
			task.wait()
			local senaV4ForestGate = genv.__SenaV4ForestGate

			if type(senaV4ForestGate) == "table" and (senaV4ForestGate.comp and senaV4ForestGate.orig) then
				pcall(rawset, senaV4ForestGate.comp, "_attackHandler", senaV4ForestGate.orig)
				genv.__SenaV4ForestGate = nil
			end

			if type(getgc) ~= "function" then
				return
			end
			local ok, result = pcall(getgc, true)

			if ok then
				if type(result) ~= "table" then
					return
				end
			else
				return
			end

			for i, v9 in ipairs(result) do
				if i % 20000 == 0 then
					RunService2.Heartbeat:Wait()
				end

				if arg.destroyed then
					return
				end

				if type(v9) == "table" and rawget(v9, "_areaId") == "Forest" and type(rawget(v9, "_attackHandler")) == "function" then
					local value = rawget(v9, "_attackHandler")
					arg._forestGate = {comp = v9, orig = value}
					genv.__SenaV4ForestGate = arg._forestGate

					rawset(v9, "_attackHandler", function(...)
						if arg.enabled and (not arg.destroyed and (not (arg.eggRuntime and arg.eggRuntime.instantPhase == "priming") and not (genv.__SenaV4PlayerSteal and genv.__SenaV4PlayerSteal.running))) then
							arg.stats.blockedHits = arg.stats.blockedHits + 1
							arg:_recoverBody(true)

							if genv.__SenaV4GodMode then
								genv.__SenaV4GodMode:startDefend()
							end

							return
						end

						return value(...)
					end)

					break
				end
			end
		end)

		for i, v9 in ipairs({"ApplyClientRagdoll", "Ragdoll", "TimedRagdoll", "TimedRagdollAsync"}) do
			if type(Ragdoll[v9]) == "function" then
				arg.originalRagdoll[v9] = Ragdoll[v9]

				Ragdoll[v9] = function(...)
					if arg.enabled and not arg.destroyed then
						arg.stats.blockedHits = arg.stats.blockedHits + 1
						arg:_recoverBody(true)
						return
					end

					return arg.originalRagdoll[v9](...)
				end
			end
		end

		if type(Ragdoll.IsRagdolled) == "function" then
			arg.originalRagdoll.IsRagdolled = Ragdoll.IsRagdolled

			function Ragdoll.IsRagdolled(arg2)
				if arg.enabled and arg2 == localPlayer2.Character then
					return false
				end
				return arg.originalRagdoll.IsRagdolled(arg2)
			end
		end
	end

	index._restoreLocalState = function(arg)
		for k, originalHumanoidState in pairs(arg.originalHumanoidStates) do
			if k.Parent then
				pcall(function()
					k:SetStateEnabled(Enum.HumanoidStateType.Physics, originalHumanoidState.Physics)
					k:SetStateEnabled(Enum.HumanoidStateType.FallingDown, originalHumanoidState.FallingDown)
					k:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, originalHumanoidState.Ragdoll)
				end)
			end
		end

		arg.originalHumanoidStates = setmetatable({}, {__mode = "k"})
		pcall(RagdollJoints.Release, localPlayer2.Character)
	end

	index._slotKey = function(arg, arg2)
		if type(arg2) ~= "table" then
			return nil
		elseif type(arg2.AreaId) ~= "string" then
			return nil
		elseif type(arg2.NestId) ~= "string" then
			return nil
		end

		return string.format("%s:%s", arg2.AreaId, arg2.NestId)
	end

	index._requestCarry = function(arg, arg2, firstAreaSlotKey)
		local tbl12 = {Uid = arg2}

		if firstAreaSlotKey ~= nil then
			tbl12.FirstAreaSlotKey = firstAreaSlotKey
		end

		return eggWorld.AskFieldEggCarry:InvokeServer(tbl12)
	end

	index._startSticky = function(arg, lastHeldEggUid, lastHeldSlotKey)
		if type(lastHeldEggUid) ~= "string" then
			return
		elseif lastHeldEggUid == "" then
			return
		end

		arg._stickyToken = arg._stickyToken + 1
		local stickyToken = arg._stickyToken
		arg.stats.recarriedEggs = arg.stats.recarriedEggs + 1

		task.spawn(function()
			local n12 = os.clock() + n11

			while true do
				local destroyed = arg.destroyed
				if not ((if destroyed then not destroyed else arg.enabled) and stickyToken == arg._stickyToken and os.clock() < n12) then
					break
				end
				local v9 = EggState2.ReadFieldEgg(lastHeldEggUid)

				if v9 and (v9.State == "Carried" and v9.CarrierUserId == localPlayer2.UserId) then
					arg.lastHeldEggUid = lastHeldEggUid
					arg.lastHeldSlotKey = lastHeldSlotKey or arg:_slotKey(v9)
					return
				end

				if v9 and (v9.State == "Dropped" or v9.State == "Slot") then
					if arg.eggRuntime and arg.eggRuntime:requestCarryRecovery(lastHeldEggUid) then
						return
					end
					local v10, v11, v12 = arg:_liveBody()

					if v12 and (v9.BottomCFrame and (v12.Position - v9.BottomCFrame.Position).Magnitude <= 10) then
						pcall(arg._requestCarry, arg, lastHeldEggUid, lastHeldSlotKey or arg:_slotKey(v9))
					end
				end

				task.wait(n10)
			end
		end)
	end

	index._bindSignals = function(arg)
		table.insert(arg.connections, EggState2.CarryChanged:Connect(function(arg2)
			if not arg.enabled then
				return
			end

			if arg2.IsCarrying and type(arg2.Uid) == "string" then
				arg._stickyToken = arg._stickyToken + 1
				arg.lastHeldEggUid = arg2.Uid
				arg.lastHeldSlotKey = arg:_slotKey((EggState2.ReadFieldEgg(arg2.Uid)))
				return
			end

			local senaV4PlayerSteal = genv.__SenaV4PlayerSteal
			if senaV4PlayerSteal and senaV4PlayerSteal.running then
				return
			end
			local uid = arg2.Uid or arg.lastHeldEggUid
			local lastHeldSlotKey = arg.lastHeldSlotKey
			if arg.eggRuntime and arg.eggRuntime:isSkippedEgg(uid) then
				return
			end

			if uid then
				arg.stats.blockedDrops = arg.stats.blockedDrops + 1
				arg:_startSticky(uid, lastHeldSlotKey)

				if genv.__SenaV4GodMode then
					genv.__SenaV4GodMode:startDefend(uid)
				end
			end
		end))

		table.insert(arg.connections, localPlayer2.CharacterAdded:Connect(function(character)
			arg:_watchCharacter(character)

			task.defer(function()
				arg:_recoverBody(true)
			end)
		end))

		if localPlayer2.Character then
			arg:_watchCharacter(localPlayer2.Character)
		end

		table.insert(arg.connections, RunService2.Stepped:Connect(function()
			arg:_recoverBody()
		end))
	end

	index.setEnabled = function(arg, arg2)
		local enabled = arg2 == true
		if arg.enabled == enabled then
			return
		end
		arg.enabled = enabled

		if arg.enabled then
			arg:_recoverBody()
		else
			arg._stickyToken = arg._stickyToken + 1
			arg:_restoreLocalState()
		end
	end

	index.install = function(senaV4AntiGuard)
		if senaV4AntiGuard.destroyed then
			return false
		end
		getgenv().__SenaV4AntiGuard = senaV4AntiGuard
		senaV4AntiGuard:_installRagdollHooks()
		senaV4AntiGuard:_bindSignals()
		senaV4AntiGuard:_recoverBody()
		return true
	end

	index.destroy = function(arg)
		if arg.destroyed then
			return
		end
		arg.enabled = false
		arg:_restoreLocalState()
		arg.destroyed = true
		arg._stickyToken = arg._stickyToken + 1

		for i, connection6 in ipairs(arg.connections) do
			fn62(connection6)
		end

		table.clear(arg.connections)

		for k, v9 in pairs(arg.originalRagdoll) do
			if type(v9) == "function" then
				Ragdoll[k] = v9
			end
		end

		if arg._forestGate then
			pcall(rawset, arg._forestGate.comp, "_attackHandler", arg._forestGate.orig)

			if genv.__SenaV4ForestGate == arg._forestGate then
				genv.__SenaV4ForestGate = nil
			end

			arg._forestGate = nil
		end

		arg.eggRuntime = nil

		if getgenv().__SenaV4AntiGuard == arg then
			getgenv().__SenaV4AntiGuard = nil
		end
	end

	index.getStats = function(arg)
		return arg.stats
	end

	return index
end)()

local v10 = (function()
	local Players2 = game:GetService("Players")
	game:GetService("RunService")
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local localPlayer2 = Players2.LocalPlayer
	local index = {}
	index.__index = index

	index.new = function(eggRuntime)
		local obj = setmetatable({}, index)
		obj.eggRuntime = eggRuntime
		obj.enabled = senaV4Config.GodMode == nil and true or senaV4Config.GodMode == true
		obj.active = false
		obj.activeDroppedUid = nil
		obj.swingSequence = 0
		obj.lastSwingAt = 0
		obj.defendThread = nil
		obj.connections = {}
		obj.targetRange = 35
		obj:_bindSignals()
		return obj
	end

	index._isBat = function(arg, arg2)
		if arg2 then
			if not arg2:IsA("Tool") then
				return false
			end
		else
			return false
		end

		local senaV4IsBatTool = genv.__SenaV4IsBatTool
		if senaV4IsBatTool and senaV4IsBatTool(arg2) then
			return true
		end

		if not senaV4IsBatTool then
			if arg2:GetAttribute("IsBat") == true then
				return true
			elseif arg2:GetAttribute("GearName") == "Bat" then
				return true
			end
		end

		local attribute = arg2:GetAttribute("ItemType")
		if attribute ~= nil and attribute ~= "Gear" then
			return false
		end
		return string.find(string.lower(arg2.Name), "slap", 1, true) ~= nil
	end

	index._findBat = function(arg)
		local character = localPlayer2.Character
		local backpack = localPlayer2:FindFirstChildOfClass("Backpack")

		if character then
			for i, child in ipairs(character:GetChildren()) do
				if arg:_isBat(child) then
					return child, true
				end
			end
		end

		if backpack then
			for i, child in ipairs(backpack:GetChildren()) do
				if arg:_isBat(child) then
					return child, false
				end
			end
		end

		pcall(function()
			local networking = ReplicatedStorage2:FindFirstChild("Packages") and ReplicatedStorage2.Packages:FindFirstChild("Networking")
			local rfCodexAskWearFieldBat = networking and networking:FindFirstChild("RF/Codex/AskWearFieldBat")

			if rfCodexAskWearFieldBat then
				rfCodexAskWearFieldBat:InvokeServer()
			end
		end)

		return nil, false
	end

	index._equipBat = function(arg)
		local character = localPlayer2.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			if humanoid.Health <= 0 then
				return nil
			end
		else
			return nil
		end

		local v10, v11 = arg:_findBat()
		if not v10 then
			return nil
		end

		if v11 and v10.Parent == character then
			return v10
		end
		pcall(humanoid.EquipTool, humanoid, v10)
		local n8 = os.clock() + 0.35

		while os.clock() < n8 do
			if v10.Parent == character then
				return v10
			end
			task.wait(0.05)
		end

		return v10.Parent == character and v10 or nil
	end

	index._getNearbyEnemies = function(arg)
		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return {}
		end
		local tbl12 = {}

		for i, player in ipairs(Players2:GetPlayers()) do
			if player ~= localPlayer2 and player.Character then
				local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
				local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart2 and (humanoid and humanoid.Health > 0) then
					local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude

					if magnitude <= arg.targetRange then
						table.insert(tbl12, {player = player, root = humanoidRootPart2, humanoid = humanoid, distance = magnitude})
					end
				end
			end
		end

		table.sort(tbl12, function(arg2, arg3)
			return arg2.distance < arg3.distance
		end)

		return tbl12
	end

	index._swing = function(arg, arg2, arg3)
		if arg2 then
			if arg2.Parent ~= localPlayer2.Character then
				return false
			end
		else
			return false
		end

		local serverTimeNow = workspace:GetServerTimeNow()
		if serverTimeNow - arg.lastSwingAt < 0.22 then
			return false
		end
		arg.lastSwingAt = serverTimeNow
		pcall(arg2.Activate, arg2)
		local handle = arg2:FindFirstChild("Handle") or arg2:FindFirstChildWhichIsA("BasePart", true)

		if handle and arg3 and type(firetouchinterest) == "function" then
			pcall(function()
				firetouchinterest(handle, arg3, 0)
				task.wait(0.01)
				firetouchinterest(handle, arg3, 1)
			end)
		end

		pcall(function()
			local batSwing = require(ReplicatedStorage2.Shared.Remotes).BatSwing

			if batSwing and batSwing.Trigger then
				arg.swingSequence = arg.swingSequence + 1
				local str3 = string.format("%d:%d:%d", localPlayer2.UserId, arg.swingSequence, math.floor(serverTimeNow * 1000))
				batSwing.Trigger:FireServer(nil, str3)
			end
		end)

		return true
	end

	index.startDefend = function(arg, activeDroppedUid)
		if not arg.enabled then
			return
		end

		if arg.eggRuntime and arg.eggRuntime.instantPhase == "priming" then
			return
		end

		if activeDroppedUid and (arg.eggRuntime and arg.eggRuntime:isSkippedEgg(activeDroppedUid)) then
			return
		end
		local senaV4PlayerSteal = genv.__SenaV4PlayerSteal
		if senaV4PlayerSteal and senaV4PlayerSteal.running then
			return
		end
		arg.active = true
		arg.activeDroppedUid = activeDroppedUid or arg.activeDroppedUid
		if arg.defendThread then
			return
		end

		arg.defendThread = task.spawn(function()
			local flag5 = false

			while arg.active and arg.enabled do
				if arg.eggRuntime and (arg.eggRuntime.carry and arg.eggRuntime.carry.active) then
					break
				end
				local senaV4PlayerSteal2 = genv.__SenaV4PlayerSteal
				if senaV4PlayerSteal2 and senaV4PlayerSteal2.running then
					flag5 = true
					break
				end
				local v10 = arg:_getNearbyEnemies()

				if #v10 > 0 then
					local v11 = arg:_equipBat()

					if v11 then
						for i, v12 in ipairs(v10) do
							if v12.root and v12.root.Parent then
								arg:_swing(v11, v12.root)
							end
						end
					end
				end

				task.wait(0.1)
			end

			arg.active = false
			arg.defendThread = nil
			if flag5 then
				return
			end

			pcall(function()
				local character = localPlayer2.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid:UnequipTools()
				end
			end)
		end)
	end

	index.stopDefend = function(arg)
		arg.active = false
		arg.activeDroppedUid = nil
	end

	index.setEnabled = function(arg, arg2)
		arg.enabled = arg2 == true

		if not arg.enabled then
			arg:stopDefend()
		end
	end

	index._bindSignals = function(arg)
		pcall(function()
			local EggState2 = require(ReplicatedStorage2.Client.EggState)

			table.insert(arg.connections, EggState2.CarryChanged:Connect(function(arg2)
				if arg2.IsCarrying then
					arg:stopDefend()
				elseif arg.enabled then
					arg:startDefend(arg2.Uid)
				end
			end))
		end)

		pcall(function()
			local Remotes = require(ReplicatedStorage2.Shared.Remotes)
			local forestStrike = Remotes.GuardPatrol and Remotes.GuardPatrol.ForestStrike

			if forestStrike then
				table.insert(arg.connections, forestStrike.OnClientEvent:Connect(function()
					if arg.enabled then
						arg:startDefend()
					end
				end))
			end
		end)
	end

	index.destroy = function(arg)
		arg:stopDefend()

		for i, connection6 in ipairs(arg.connections) do
			pcall(connection6.Disconnect, connection6)
		end

		table.clear(arg.connections)
	end

	return index
end)()

local v11 = (function()
	local Players2 = game:GetService("Players")
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local localPlayer2 = Players2.LocalPlayer
	local Remotes = require(ReplicatedStorage2.Shared.Remotes)
	local PlotState2 = require(ReplicatedStorage2.Client.PlotState)
	local Hud = require(ReplicatedStorage2.Client.Hud)
	local Save = require(ReplicatedStorage2.Shared.Save)
	local Treadmills = require(ReplicatedStorage2.Data.Treadmills)
	local n8 = 8

	local function fn62()
		local treadmill = senaV4TaskLadder.blocker("treadmill")
		if treadmill then
			return "Yielding to " .. senaV4TaskLadder.TITLES[treadmill]
		end
		local treadmill2 = senaV4TaskLadder.holder("treadmill")
		if treadmill2 then
			return "Waiting for " .. senaV4TaskLadder.TITLES[treadmill2]
		end
		return nil
	end

	local function fn63()
		return fn62() ~= nil
	end

	local function fn64()
		return senaV4TaskLadder.blocker("treadmill") == "auto_steal"
	end

	local function fn65()
		return fn62() or "Yielding"
	end

	local n9 = 1
	local n10 = 0.15
	local n11 = 0.75
	local n12 = 0.35
	local n13 = 0.1
	local n14 = 1.5
	local n15 = 0.03
	local n16 = 0.2
	local n17 = 0.25
	local n18 = 0.35
	local n19 = 2.5
	local n20 = 3
	local index = {}
	index.__index = index

	index.new = function(coordinator, travel)
		local obj = setmetatable({}, index)
		obj.coordinator = coordinator
		obj.travel = travel
		obj.destroyed = false
		obj.listeners = {}
		obj.resources = {}
		obj.config = {disableDuringAutomation = true, idleFarm = false, autoUpgrade = false}
		obj.stats = {mode = "Idle", boost = "Waiting"}
		obj.busy = coordinator and coordinator:getSnapshot().busy == true or false
		obj.idleGeneration = 0
		obj.lastEquipAt = 0
		obj.activeTreadmill = nil
		obj.travelingToTreadmill = false
		obj.treadmillEquipPending = false
		obj.unequipGuardRunning = false
		obj.backgroundYieldRunning = false
		obj.lastBackgroundYieldAt = 0
		obj.carryPulseRunning = false
		obj.treadmillStateRevision = 0
		obj:_listenActiveTreadmill()

		task.spawn(function()
			pcall(function()
				obj:_syncActiveTreadmillSnapshot()
			end)
		end)

		obj:_listenCoordinator()
		obj:_listenSpeedGain()
		return obj
	end

	index._snapshot = function(arg)
		return {mode = arg.stats.mode, boost = arg.stats.boost, disableDuringAutomation = arg.config.disableDuringAutomation, idleFarm = arg.config.idleFarm}
	end

	index._emit = function(arg)
		local v11 = arg:_snapshot()

		for i, listener in ipairs(arg.listeners) do
			pcall(listener, v11)
		end
	end

	index._setStatus = function(arg, mode, boost)
		if mode ~= nil then
			arg.stats.mode = mode
		end

		if boost ~= nil then
			arg.stats.boost = boost
		end

		arg:_emit()
	end

	index.subscribe = function(arg, arg2)
		table.insert(arg.listeners, arg2)
		pcall(arg2, arg:_snapshot())

		return function()
			local v11 = table.find(arg.listeners, arg2)

			if v11 then
				table.remove(arg.listeners, v11)
			end
		end
	end

	index._requestUnequip = function(arg)
		local ok, result, result2 = pcall(function()
			return Remotes.Treadmill.AskDoff:InvokeServer()
		end)

		if not ok then
			return false, tostring(result)
		end

		if result == false then
			return false, tostring(result2 or "Server rejected")
		end
		return true
	end

	index._shouldBlockTreadmill = function(arg)
		if arg.destroyed then
			return false
		elseif arg.carryPulseRunning then
			return false
		end

		if arg.busy and arg.config.disableDuringAutomation then
			return true
		end
		local senaV4EggRuntime = genv.__SenaV4EggRuntime
		if senaV4EggRuntime and senaV4EggRuntime._treadmillResetting then
			return false
		end
		local ok, result = pcall(senaV4TaskLadder.holder, "treadmill")
		return ok and result ~= nil
	end

	index._startUnequipGuard = function(arg)
		if arg.unequipGuardRunning then
			return
		elseif arg:_shouldBlockTreadmill() then
			if arg.activeTreadmill == nil then
				return
			end
		else
			return
		end

		arg.unequipGuardRunning = true

		task.spawn(function()
			local n21 = n10

			while arg:_shouldBlockTreadmill() and arg.activeTreadmill ~= nil do
				local v11, v12 = arg:_requestUnequip()
				arg:_setStatus("Automation active", v11 and "Blocked" or "Release retry: " .. tostring(v12))
				task.wait(n21)
				n21 = math.min(n21 * 2, n11)
			end

			arg.unequipGuardRunning = false

			if arg:_shouldBlockTreadmill() and arg.activeTreadmill ~= nil then
				arg:_startUnequipGuard()
			end
		end)
	end

	index._cancelIdle = function(arg, arg2)
		arg.idleGeneration = arg.idleGeneration + 1

		if arg2 then
			arg:_requestUnequip()
		end
	end

	index.setDisableDuringAutomation = function(arg, arg2)
		arg.config.disableDuringAutomation = true

		if arg.busy and arg.config.disableDuringAutomation then
			arg:_cancelIdle(true)
			arg:_startUnequipGuard()
			arg:_setStatus("Automation active", "Blocked")
		elseif not arg.busy then
			if arg.config.idleFarm then
				arg:_startIdle()
			end
		end
	end

	index.setIdleFarm = function(arg, arg2)
		arg.config.idleFarm = arg2 == true

		if not arg.config.idleFarm then
			arg:_cancelIdle(true)
			arg:_setStatus(arg.busy and "Automation active" or "Idle", "Disabled")
			return
		end

		if not arg.busy then
			arg:_startIdle()
		end

		if arg.idleWatchdog then
			return
		end

		arg.idleWatchdog = task.spawn(function()
			while true do
				local destroyed = arg.destroyed
				if not (if destroyed then not destroyed else arg.config.idleFarm) then
					break
				end
				task.wait(2)

				if arg.idleRunning == nil and (not arg.busy and (arg.config.idleFarm and not arg.destroyed)) then
					arg:_startIdle()
				end
			end

			arg.idleWatchdog = nil
		end)
	end

	index._readUpgradeState = function(arg)
		local ok, result, result2, result3 = pcall(function()
			local v11 = (Save.Peek or Save.Get)()
			if not v11 then
				return nil
			end
			local n21 = tonumber(v11.TreadmillUpgradeLevel) or 0
			return n21, v11.Money, Treadmills.GetByUpgradeLevel(n21 + 1)
		end)

		if ok then
			if result == nil then
				return nil
			end
		else
			return nil
		end

		return result, result2, result3
	end

	index._raiseTier = function(arg)
		local v11, v12, v13 = arg:_readUpgradeState()
		if not v13 then
			return false, "Max tier"
		end

		if (tonumber(v12) or 0) < (tonumber(v13.Price) or 0) then
			return false, "Not enough money"
		end

		local ok, result, result2 = pcall(function()
			return Remotes.Treadmill.AskTierRaise:InvokeServer(v13._id)
		end)

		if not ok then
			return false, tostring(result)
		end

		if result ~= true then
			return false, tostring(result2 or "Server rejected")
		end
		return true, v13.DisplayName or v13._id
	end

	index.setAutoUpgrade = function(arg, arg2)
		arg.config.autoUpgrade = arg2 == true

		if arg.config.autoUpgrade then
			if arg.autoUpgradeRunning then
				return
			end
		else
			return
		end

		arg.autoUpgradeRunning = true

		task.spawn(function()
			while true do
				local destroyed = arg.destroyed
				if not (if destroyed then not destroyed else arg.config.autoUpgrade) then
					break
				end
				local v11, v12 = arg:_raiseTier()

				if v11 then
					arg:_setStatus(arg.busy and "Automation active" or "Idle", "Upgraded to " .. tostring(v12))
					task.wait(1)
				elseif v12 == "Max tier" then
					arg:_setStatus(arg.busy and "Automation active" or "Idle", "Treadmill maxed")
					task.wait(30)
				else
					task.wait(5)
				end
			end

			arg.autoUpgradeRunning = false
		end)
	end

	index._resolveStandCFrame = function(arg)
		local v11 = PlotState2.ResolveLocalSlot()
		local v12 = PlotState2.ResolveFolder()
		local v13 = v12 and v11 and v12:FindFirstChild(tostring(v11))
		local treadmillBottom = v13 and v13:FindFirstChild("TreadmillBottom")

		if treadmillBottom then
			if not treadmillBottom:IsA("BasePart") then
				return nil
			end
		else
			return nil
		end

		local character = localPlayer2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart then
			if not humanoid then
				return nil
			end
		else
			return nil
		end

		local v14 = if humanoid.RigType == Enum.HumanoidRigType.R15 then humanoidRootPart.Size.Y * 0.5 + math.max(humanoid.HipHeight, 0.5) else humanoidRootPart.Size.Y * 0.5 + 2
		return treadmillBottom.CFrame * CFrame.new(0, treadmillBottom.Size.Y * 0.5 + v14 + 0.05, 0)
	end

	index.isEngaged = function(arg)
		return arg.activeTreadmill ~= nil or arg.travelingToTreadmill or arg.treadmillEquipPending or arg.carryPulseRunning
	end

	index._isTreadmillHudActive = function(arg)
		local ok, result = pcall(function()
			local Game = Hud.Frame("Game")
			local Treadmill = Hud.Frame("Treadmill")
			return Game.Visible == false and Treadmill.Visible == true
		end)

		return ok and result == true
	end

	index._isGameHudRestored = function(arg)
		local ok, result = pcall(function()
			local Game = Hud.Frame("Game")
			local Treadmill = Hud.Frame("Treadmill")
			return Game.Visible == true and Treadmill.Visible == false
		end)

		return ok and result == true
	end

	index.pulseForCarry = function(arg, arg2, arg3)
		if arg.destroyed then
			return false, "Preparation unavailable"
		elseif arg.carryPulseRunning then
			return false, "Preparation unavailable"
		elseif type(arg2) ~= "function" then
			return false, "Preparation unavailable"
		end

		arg:_cancelIdle(false)
		arg.carryPulseRunning = true

		local function fn66()
			return arg.destroyed or arg3 ~= nil and arg3()
		end

		local function fn67(arg4)
			local n21, n22, treadmillStateRevision, v11 = os.clock() + arg4, 0, arg.treadmillStateRevision

			while true do
				local destroyed = arg.destroyed
				if not (if destroyed then not destroyed else os.clock() < n21) then
					break
				end
				local now = os.clock()

				if now >= n22 then
					arg:_requestUnequip()
					n22 = now + n10
				end

				local v12 = arg:_syncActiveTreadmillSnapshot()
				local v13 = arg:_isGameHudRestored()

				if arg.treadmillStateRevision ~= treadmillStateRevision then
					treadmillStateRevision = arg.treadmillStateRevision
					v11 = nil
				end

				if v12 then
					v11 = nil
				else
					if arg.activeTreadmill == nil then
						if v13 then
							local v14 = v11 or now
							if now - v14 >= n18 then
								return true
							end
							v11 = v14
						else
							v11 = nil
						end
					else
						v11 = nil
					end
				end

				task.wait(n15)
			end

			return false
		end

		local function fn68(arg4, arg5)
			if not arg4 then
				fn67(n14 + n18)
			end

			arg.treadmillEquipPending = false
			arg.carryPulseRunning = false

			if arg4 then
				arg:_setStatus("Automation active", "Preparation complete")
			elseif not arg.destroyed then
				arg:_setStatus("Automation active", tostring(arg5 or "Preparation failed"))
			end

			if arg:_shouldBlockTreadmill() and arg.activeTreadmill ~= nil then
				arg:_startUnequipGuard()
			end

			return arg4, arg5
		end

		arg:_syncActiveTreadmillSnapshot()
		local str3
		local flag5 = false

		for i = 1, n20, 1 do
			if fn66() then
				local cancelled, v11 = fn68(false, "Cancelled")
				return cancelled, v11
			end
			local cancelled = arg:_resolveStandCFrame()

			if cancelled then
				arg:_setStatus("Preparing carry", i == 1 and "Positioning" or "Repositioning")
				local ok, result = pcall(arg2, cancelled)

				if ok then
					local v11

					if result == true then
						task.wait(n12)
						arg.treadmillEquipPending = true
						arg:_setStatus("Preparing carry", "Activating")
						local n21 = os.clock() + n19
						local n22 = 0
						local flag6 = flag5
						local n23 = 0
						v11 = str3

						while true do
							local v12 = fn66()
							if not (if v12 then not v12 else os.clock() < n21) then
								break
							end
							local now = os.clock()

							if now >= n22 then
								n22 = now + n17
								arg:_syncActiveTreadmillSnapshot()
							end

							if arg.activeTreadmill ~= nil and arg:_isTreadmillHudActive() then
								flag6 = true
								break
							end

							if arg.activeTreadmill == nil and now >= n23 then
								local n24, ok2, result2, result3 = now + n16, pcall(function()
									return Remotes.Treadmill.AskWearStill:InvokeServer()
								end)

								if if ok2 then result2 == false else not ok2 then
									local str4 = tostring(result3 or result2)
									arg:_setStatus("Preparing carry", "Activation retry")
									v11 = str4
								end

								n23 = n24
							end

							task.wait(n15)
						end

						str3 = v11
						flag5 = flag6
					else
						str3 = "Positioning failed"
					end
				else
					str3 = "Positioning failed"
				end
			else
				str3 = "Position unavailable"
			end

			if flag5 then
				break
			end

			if fn66() then
				cancelled, i = fn68(false, "Cancelled")
				return cancelled, i
			end
			arg:_setStatus("Preparing carry", "Resetting position")
			fn67(n14 + n18)
		end

		if not flag5 then
			local v11, v12 = fn68(false, "Activation not confirmed: " .. tostring(str3 or "Unknown"))
			return v11, v12
		end
		arg.treadmillEquipPending = false
		arg:_setStatus("Preparing carry", "Active")
		local n21 = os.clock() + n13

		while true do
			local v11 = fn66()
			if not (if v11 then not v11 else os.clock() < n21) then
				break
			end
			task.wait(n15)
		end

		if fn66() then
			local cancelled, v11 = fn68(false, "Cancelled")
			return cancelled, v11
		end
		arg:_setStatus("Preparing carry", "Releasing")
		if fn67(n14 + n18) then
			local v11, v12 = fn68(true)
			return v11, v12
		end
		local v11, v12 = fn68(false, fn66() and "Cancelled" or "Release not confirmed")
		return v11, v12
	end

	index.yieldForBackground = function(arg)
		if arg.destroyed then
			return
		end
		arg:_cancelIdle(false)
		if arg.backgroundYieldRunning then
			return
		end
		arg.backgroundYieldRunning = true

		task.spawn(function()
			local n21 = n10

			while not arg.destroyed do
				if arg.coordinator then
					if not arg.coordinator:isBackgroundBusy() then
						break
					end
				else
					break
				end

				arg.lastBackgroundYieldAt = os.clock()
				arg:_setStatus("Idle", "Yielding to background inventory")
				arg:_requestUnequip()
				task.wait(n21)
				if not arg:_syncActiveTreadmillSnapshot() then
					break
				end
				n21 = math.min(n21 * 2, n11)
			end

			arg.backgroundYieldRunning = false

			if not arg.destroyed and not arg:isEngaged() then
				arg:_setStatus("Idle", "Background inventory ready")
			end
		end)
	end

	index._startIdle = function(arg)
		if arg.destroyed then
			return
		elseif arg.busy then
			return
		elseif not arg.config.idleFarm then
			return
		end

		arg:_cancelIdle(false)
		local idleGeneration = arg.idleGeneration
		local now = os.clock()
		arg.idleRunning = idleGeneration

		task.spawn(function()
			local ok, result = xpcall(function()
				while true do
					local destroyed = arg.destroyed
					if not ((if destroyed then not destroyed else not arg.busy) and arg.config.idleFarm and idleGeneration == arg.idleGeneration) then
						break
					end

					if arg.coordinator and arg.coordinator:isBackgroundBusy() then
						now = os.clock()
						arg:_setStatus("Idle", "Waiting for background inventory")
						task.wait(0.25)
						continue
					end

					if fn64() then
						now = os.clock()
						arg:_setStatus("Idle", "Yielding to Auto Steal")
						task.wait(0.25)
						continue
					end

					if genv.__SenaV4IsAutoSellEggBusy and genv.__SenaV4IsAutoSellEggBusy() then
						now = os.clock()
						arg:_setStatus("Idle", "Waiting for Auto Sell Egg")
						task.wait(0.25)
						continue
					end

					if fn63() then
						now = os.clock()
						arg:_setStatus("Idle", fn65())
						task.wait(0.25)
						continue
					end

					local n21 = n9 - (os.clock() - now)

					if n21 > 0 then
						arg:_setStatus("Idle", string.format("Starting in %.0fs", math.ceil(n21)))
						task.wait(math.min(n21, 0.25))
						continue
					end

					local v11 = arg:_resolveStandCFrame()

					if not v11 then
						arg:_setStatus("Idle", "Position unavailable")
						task.wait(2)
						continue
					end

					arg.travelingToTreadmill = true
					arg:_setStatus("Moving", "Waiting")
					local flag5 = false
					local travel = arg.travel
					local character = localPlayer2.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if travel and (humanoidRootPart and (humanoid and (type(travel._teleportRoot) == "function" and (type(travel._isInSafeArea) == "function" and (travel:_isInSafeArea(humanoidRootPart) and (humanoidRootPart.Position - v11.Position).Magnitude < 250))))) then
						local ok, result = pcall(travel._teleportRoot, travel, humanoidRootPart, humanoid, v11)
						flag5 = ok and result == true
					end

					local travel2 = flag5 or arg.travel and arg.travel:travelAndWait(v11, {abort = function()
						return arg.destroyed or arg.busy or not arg.config.idleFarm or idleGeneration ~= arg.idleGeneration or arg.coordinator and arg.coordinator:isBackgroundBusy() or genv.__SenaV4IsAutoSellEggBusy and genv.__SenaV4IsAutoSellEggBusy() or fn63()
					end})

					arg.travelingToTreadmill = false

					if not travel2 then
						if not arg.busy and arg.config.idleFarm then
							arg:_setStatus("Idle", "Travel failed")
							task.wait(1)
						end

						continue
					end

					if arg.busy or not arg.config.idleFarm or idleGeneration ~= arg.idleGeneration or arg.coordinator and arg.coordinator:isBackgroundBusy() then
						continue
					elseif genv.__SenaV4IsAutoSellEggBusy then
						if genv.__SenaV4IsAutoSellEggBusy() then
							continue
						elseif fn63() then
							continue
						end
					elseif fn63() then
						continue
					end

					task.wait(n12)

					if arg.busy or not arg.config.idleFarm or idleGeneration ~= arg.idleGeneration or arg.coordinator and arg.coordinator:isBackgroundBusy() then
						continue
					elseif genv.__SenaV4IsAutoSellEggBusy then
						if genv.__SenaV4IsAutoSellEggBusy() then
							continue
						elseif fn63() then
							continue
						end
					elseif fn63() then
						continue
					end

					arg.treadmillEquipPending = true

					character, destroyed, travel = pcall(function()
						return Remotes.Treadmill.AskWearStill:InvokeServer()
					end)

					if if character then destroyed == false else not character then
						arg.treadmillEquipPending = false
						arg:_setStatus("Preparing carry", "Activation failed: " .. tostring(travel or destroyed))
					else
						arg.lastEquipAt = os.clock()
						arg:_setStatus("Active", "Waiting for gain")

						task.delay(2, function()
							if not arg.destroyed and arg.activeTreadmill == nil then
								arg.treadmillEquipPending = false
							end
						end)
					end

					local n22 = os.clock() + n8

					while (arg.activeTreadmill ~= nil or os.clock() < n22) and not arg.destroyed and not arg.busy and arg.config.idleFarm and idleGeneration == arg.idleGeneration and not (arg.coordinator and arg.coordinator:isBackgroundBusy()) do
						if fn64() then
							arg:_cancelIdle(true)
							arg:_setStatus("Idle", "Yielding to Auto Steal")
							break
						end

						if genv.__SenaV4IsAutoSellEggBusy and genv.__SenaV4IsAutoSellEggBusy() then
							arg:_cancelIdle(true)
							arg:_setStatus("Idle", "Yielding to Auto Sell Egg")
							break
						end

						if fn63() then
							arg:_requestUnequip()
							arg:_setStatus("Idle", fn65())
							break
						end

						task.wait(0.25)
					end
				end
			end, debug.traceback)

			if not ok then
				warn("[SAE][treadmill] idle error:\n" .. tostring(result))
			end

			if arg.idleRunning == idleGeneration then
				arg.idleRunning = nil
			end
		end)
	end

	index._onCoordinator = function(arg, arg2)
		local busy = arg.busy
		arg.busy = arg2.busy == true

		if arg.busy then
			arg:_cancelIdle(arg.config.disableDuringAutomation)
			arg:_startUnequipGuard()
			arg:_setStatus("Automation active", arg.config.disableDuringAutomation and "Blocked" or "Unchanged")
		elseif busy or arg.config.idleFarm then
			if arg.config.idleFarm then
				arg:_startIdle()
			else
				arg:_setStatus("Idle", "Disabled")
			end
		end
	end

	index._listenCoordinator = function(arg)
		if not arg.coordinator then
			return
		end

		table.insert(arg.resources, arg.coordinator:subscribe(function(arg2)
			arg:_onCoordinator(arg2)
		end))

		table.insert(arg.resources, arg.coordinator:subscribeBackground(function(arg2)
			if arg2.busy then
				arg:_cancelIdle(false)
				arg:_setStatus("Idle", "Waiting for background inventory")
			elseif not arg.destroyed then
				if not arg.busy and arg.config.idleFarm then
					arg:_startIdle()
				end
			end
		end))
	end

	index._syncActiveTreadmillSnapshot = function(arg)
		local ok, result = pcall(function()
			return Remotes.Treadmill.AskRenderSnapshot:InvokeServer()
		end)

		if ok then
			if type(result) ~= "table" then
				return arg.activeTreadmill ~= nil
			end
		else
			return arg.activeTreadmill ~= nil
		end

		local flag5 = table.find(result, localPlayer2.UserId) ~= nil
		arg.activeTreadmill = flag5 and "snapshot" or nil

		if not flag5 then
			arg.treadmillEquipPending = false
		end

		return flag5
	end

	index._listenActiveTreadmill = function(arg)
		local function fn66(activeTreadmill)
			arg.treadmillStateRevision = arg.treadmillStateRevision + 1
			arg.activeTreadmill = activeTreadmill
			arg.treadmillEquipPending = false

			if activeTreadmill ~= nil and arg:_shouldBlockTreadmill() then
				arg:_startUnequipGuard()
			elseif activeTreadmill == nil and arg:_shouldBlockTreadmill() then
				arg:_setStatus("Automation active", "Blocked")
			elseif activeTreadmill == nil then
				arg:_setStatus("Idle", arg.config.idleFarm and "Released" or "Disabled")
			elseif not arg.busy then
				arg:_setStatus("Active", "Waiting for gain")
			end
		end

		local assignedBeltShifted, renderStateShifted

		pcall(function()
			assignedBeltShifted = Remotes.Treadmill.AssignedBeltShifted
		end)

		pcall(function()
			renderStateShifted = Remotes.Treadmill.RenderStateShifted
		end)

		if assignedBeltShifted then
			table.insert(arg.resources, assignedBeltShifted.OnClientEvent:Connect(function(arg2)
				fn66(arg2)
			end))

			return
		end

		if renderStateShifted then
			table.insert(arg.resources, renderStateShifted.OnClientEvent:Connect(function(arg2, arg3)
				if arg2 ~= localPlayer2.Name then
					return
				end
				fn66(arg3 and arg2 or nil)
			end))
		end
	end

	index._listenSpeedGain = function(arg)
		local speedGained = Remotes.Treadmill.SpeedGained

		if speedGained then
			table.insert(arg.resources, speedGained.OnClientEvent:Connect(function()
				arg.activeTreadmill = arg.activeTreadmill or true
				arg.treadmillEquipPending = false
				if arg:_shouldBlockTreadmill() then
					arg:_startUnequipGuard()
					return
				end
				arg:_setStatus("Active", "Gain ticking")
			end))
		end
	end

	index.destroy = function(arg)
		if arg.destroyed then
			return
		end
		arg.destroyed = true
		arg:_cancelIdle(true)

		for i, resource in ipairs(arg.resources) do
			pcall(function()
				if typeof(resource) == "RBXScriptConnection" then
					resource:Disconnect()
				elseif type(resource) == "function" then
					resource()
				elseif type(resource) == "table" then
					if type(resource.Disconnect) == "function" then
						resource:Disconnect()
					end
				end
			end)
		end

		table.clear(arg.resources)
		table.clear(arg.listeners)
	end

	index.Destroy = index.destroy
	return index

	end
	local v1823 = v704()
	local t63 = {
		k = 1000,
		m = 1000000,
		b = 1e9,
		t = 1e12,
		q = 1e15
	}

	local function v1825(p515)
		local match, v1827 = tostring(p515 or ""):lower():gsub("%s+", ""):gsub("%$", ""):gsub("/s$", ""):match("^([%d%.]+)([kmbtq]?)$")
		local v1828 = tonumber(match)

		if v1828 then
			return math.max(0, math.floor(v1828 * (t63[v1827] or 1) + 0.5))
		end

		return nil
	end
	local function v1829()
		local Players2 = game:GetService("Players")
		local RunService2 = game:GetService("RunService")
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local LocalPlayer2 = Players2.LocalPlayer
		local Remotes = require(ReplicatedStorage2.Shared.Remotes)
		local EggState2 = require(ReplicatedStorage2.Client.EggState)
		local Ragdoll = require(ReplicatedStorage2.Shared.Modules.Ragdoll)
		local RagdollJoints = require(ReplicatedStorage2.Shared.Modules.RagdollJoints)
		local EggWorld = Remotes.EggWorld
		local t64 = {}

		t64.__index = t64

		local function v1840(p516)
			if p516 then
				pcall(p516.Disconnect, p516)
			end
		end

		t64.new = function(p517)
			local obj = setmetatable({}, t64)

			obj.eggRuntime = p517
			obj.enabled = true
			obj.destroyed = false
			obj.connections = {}
			obj.originalRagdoll = {}
			obj.originalHumanoidStates = setmetatable({}, {
				__mode = "k"
			})
			obj.stats = {
				blockedHits = 0,
				blockedDrops = 0,
				recarriedEggs = 0
			}
			obj.lastHeldEggUid = nil
			obj.lastHeldSlotKey = nil
			obj._installed = false
			obj._stickyToken = 0
			obj._nextBodyRecoveryAt = 0
			obj._nextJointSweepAt = 0
			obj._forestStrikeOldFire = nil

			return obj
		end
		t64._liveBody = function()
			local Character = LocalPlayer2.Character
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

			return Character, Humanoid, Character and Character:FindFirstChild("HumanoidRootPart")
		end
		t64._recoverBody = function(p518, p519)
			if not p518.enabled or p518.destroyed then
				return
			end

			local v1844, v1845, v1846 = p518:_liveBody()

			if not v1844 or not v1845 or not v1846 then
				return
			end

			local now = os.clock()

			if not p519 and now < p518._nextBodyRecoveryAt then
				return
			end

			p518._nextBodyRecoveryAt = now + 0.03

			if not p518.originalHumanoidStates[v1845] then
				p518.originalHumanoidStates[v1845] = {
					Physics = v1845:GetStateEnabled(Enum.HumanoidStateType.Physics),
					FallingDown = v1845:GetStateEnabled(Enum.HumanoidStateType.FallingDown),
					Ragdoll = v1845:GetStateEnabled(Enum.HumanoidStateType.Ragdoll)
				}
			end

			local state = v1845:GetState()
			local v1849 = state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.FallingDown

			v1849 = v1849 or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.PlatformStanding or state == Enum.HumanoidStateType.Seated
			pcall(function()
				v1845.BreakJointsOnDeath = false
				v1845.RequiresNeck = false
				v1845:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
				v1845:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
				v1845:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
				v1845:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				v1845.PlatformStand = false
				v1845.Sit = false

				local state2 = v1845:GetState()

				if state2 == Enum.HumanoidStateType.Physics or state2 == Enum.HumanoidStateType.FallingDown or state2 == Enum.HumanoidStateType.Ragdoll or state2 == Enum.HumanoidStateType.PlatformStanding or state2 == Enum.HumanoidStateType.Seated then
					v1845:ChangeState(Enum.HumanoidStateType.GettingUp)
					v1845:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)

			for _, descendant in ipairs(v1844:GetDescendants()) do
				if not descendant:IsA("Motor6D") then
					if descendant:IsA("BallSocketConstraint") or descendant:IsA("HingeConstraint") then
						if descendant.Name:find("Ragdoll", 1, true) or descendant:GetAttribute("RagdollConstraint") then
							pcall(descendant.Destroy, descendant)
						end
					end
				elseif not descendant.Enabled then
					descendant.Enabled = true
				end
			end

			local AssemblyLinearVelocity = v1846.AssemblyLinearVelocity
			local Magnitude = Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z).Magnitude
			local v1855 = math.max(340, (tonumber(v1845.WalkSpeed) or 0) * 1.5)

			if v1849 or v1855 < Magnitude or math.abs(AssemblyLinearVelocity.Y) > 240 then
				v1846.AssemblyLinearVelocity = Vector3.zero
				v1846.AssemblyAngularVelocity = Vector3.zero
				p518.stats.blockedHits += 1
			end
		end
		t64._watchCharacter = function(p520, p521)
			if not p521 then
				return
			end

			local connection = p521.DescendantAdded:Connect(function(descendant)
				if not p520.enabled or p520.destroyed then
					return
				end

				if not descendant:IsA("BallSocketConstraint") and not descendant:IsA("HingeConstraint") then
					if descendant:IsA("Motor6D") and not descendant.Enabled then
						descendant.Enabled = true
					end
				elseif descendant.Name:find("Ragdoll", 1, true) or descendant:GetAttribute("RagdollConstraint") then
					pcall(descendant.Destroy, descendant)
					p520:_recoverBody(true)
				end
			end)

			table.insert(p520.connections, connection)
		end
		t64._installRagdollHooks = function(p522)
			if p522._installed then
				return
			end

			p522._installed = true
			task.spawn(function()
				task.wait()

				local __SenaV4ForestGate = genv.__SenaV4ForestGate

				if type(__SenaV4ForestGate) == "table" and __SenaV4ForestGate.comp and __SenaV4ForestGate.orig then
					pcall(rawset, __SenaV4ForestGate.comp, "_attackHandler", __SenaV4ForestGate.orig)
					genv.__SenaV4ForestGate = nil
				end

				if type(getgc) ~= "function" then
					return
				end

				local ok, result = pcall(getgc, true)

				if not ok or type(result) ~= "table" then
					return
				end

				for i, v in ipairs(result) do
					if i % 20000 == 0 then
						RunService2.Heartbeat:Wait()
					end

					if p522.destroyed then
						return
					end

					if type(v) ~= "table" or rawget(v, "_areaId") ~= "Forest" or type(rawget(v, "_attackHandler")) ~= "function" then
						continue
					end

					local value = rawget(v, "_attackHandler")

					p522._forestGate = {
						comp = v,
						orig = value
					}
					genv.__SenaV4ForestGate = p522._forestGate
					rawset(v, "_attackHandler", function(...)
						if not p522.enabled or p522.destroyed or p522.eggRuntime and p522.eggRuntime.instantPhase == "priming" or genv.__SenaV4PlayerSteal and genv.__SenaV4PlayerSteal.running then
							return value(...)
						end

						p522.stats.blockedHits += 1
						p522:_recoverBody(true)

						if genv.__SenaV4GodMode then
							genv.__SenaV4GodMode:startDefend()
						end
					end)

					break
				end
			end)

			for _, v in ipairs({
				"ApplyClientRagdoll",
				"Ragdoll",
				"TimedRagdoll",
				"TimedRagdollAsync"
			}) do
				if type(Ragdoll[v]) == "function" then
					p522.originalRagdoll[v] = Ragdoll[v]
					Ragdoll[v] = function(...)
						if p522.enabled then
							if not p522.destroyed then
								p522.stats.blockedHits += 1
								p522:_recoverBody(true)

								return
							end
						end

						return p522.originalRagdoll[v](...)
					end
				end
			end

			if type(Ragdoll.IsRagdolled) == "function" then
				p522.originalRagdoll.IsRagdolled = Ragdoll.IsRagdolled
				Ragdoll.IsRagdolled = function(p523)
					if p522.enabled then
						if p523 == LocalPlayer2.Character then
							return false
						end
					end

					return p522.originalRagdoll.IsRagdolled(p523)
				end
			end
		end
		t64._restoreLocalState = function(p524)
			for k, originalHumanoidState in pairs(p524.originalHumanoidStates) do
				if k.Parent then
					pcall(function()
						k:SetStateEnabled(Enum.HumanoidStateType.Physics, originalHumanoidState.Physics)
						k:SetStateEnabled(Enum.HumanoidStateType.FallingDown, originalHumanoidState.FallingDown)
						k:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, originalHumanoidState.Ragdoll)
					end)
				end
			end

			p524.originalHumanoidStates = setmetatable({}, {
				__mode = "k"
			})
			pcall(RagdollJoints.Release, LocalPlayer2.Character)
		end
		t64._slotKey = function(p525, p526)
			if type(p526) == "table" and type(p526.AreaId) == "string" and type(p526.NestId) == "string" then
				return string.format("%s:%s", p526.AreaId, p526.NestId)
			end

			return nil
		end
		t64._requestCarry = function(p527, p528, p529)
			local t65 = {
				Uid = p528
			}

			if p529 ~= nil then
				t65.FirstAreaSlotKey = p529
			end

			return EggWorld.AskFieldEggCarry:InvokeServer(t65)
		end
		t64._startSticky = function(p530, p531, p532)
			if type(p531) ~= "string" or p531 == "" then
				return
			end

			p530._stickyToken += 1

			local _stickyToken = p530._stickyToken

			p530.stats.recarriedEggs += 1
			task.spawn(function()
				local v1869 = os.clock() + 5

				while not p530.destroyed and p530.enabled and _stickyToken == p530._stickyToken and os.clock() < v1869 do
					local v1870 = EggState2.ReadFieldEgg(p531)

					if v1870 and v1870.State == "Carried" and v1870.CarrierUserId == LocalPlayer2.UserId then
						p530.lastHeldEggUid = p531
						p530.lastHeldSlotKey = p532 or p530:_slotKey(v1870)

						return
					end

					if v1870 and (v1870.State == "Dropped" or v1870.State == "Slot") then
						if p530.eggRuntime then
							if p530.eggRuntime:requestCarryRecovery(p531) then
								return
							end
						end

						local _, _, v1873 = p530:_liveBody()

						if v1873 and v1870.BottomCFrame and (v1873.Position - v1870.BottomCFrame.Position).Magnitude <= 10 then
							pcall(p530._requestCarry, p530, p531, p532 or p530:_slotKey(v1870))
						end
					end

					task.wait(0.05)
				end
			end)
		end
		t64._bindSignals = function(p533)
			table.insert(p533.connections, EggState2.CarryChanged:Connect(function(p534)
				if not p533.enabled then
					return
				end

				if p534.IsCarrying and type(p534.Uid) == "string" then
					p533._stickyToken += 1
					p533.lastHeldEggUid = p534.Uid

					local v1874 = EggState2.ReadFieldEgg(p534.Uid)

					p533.lastHeldSlotKey = p533:_slotKey(v1874)

					return
				end

				local __SenaV4PlayerSteal = genv.__SenaV4PlayerSteal

				if __SenaV4PlayerSteal and __SenaV4PlayerSteal.running then
					return
				end

				local Uid = p534.Uid or p533.lastHeldEggUid
				local lastHeldSlotKey = p533.lastHeldSlotKey

				if p533.eggRuntime then
					if p533.eggRuntime:isSkippedEgg(Uid) then
						return
					end
				end

				if Uid then
					p533.stats.blockedDrops += 1
					p533:_startSticky(Uid, lastHeldSlotKey)

					if genv.__SenaV4GodMode then
						genv.__SenaV4GodMode:startDefend(Uid)
					end
				end
			end))
			table.insert(p533.connections, LocalPlayer2.CharacterAdded:Connect(function(character)
				p533:_watchCharacter(character)
				task.defer(function()
					p533:_recoverBody(true)
				end)
			end))

			if LocalPlayer2.Character then
				p533:_watchCharacter(LocalPlayer2.Character)
			end

			table.insert(p533.connections, RunService2.Stepped:Connect(function()
				p533:_recoverBody()
			end))
		end
		t64.setEnabled = function(p535, p536)
			local enabled = p536 == true

			if p535.enabled == enabled then
				return
			end

			p535.enabled = enabled

			if p535.enabled then
				p535:_recoverBody()
			else
				p535._stickyToken += 1
				p535:_restoreLocalState()
			end
		end
		t64.install = function(p537)
			if p537.destroyed then
				return false
			end

			getgenv().__SenaV4AntiGuard = p537
			p537:_installRagdollHooks()
			p537:_bindSignals()
			p537:_recoverBody()

			return true
		end

		local s2 = "destroy"

		local function v1880(p538)
			if p538.destroyed then
				return
			end

			p538.enabled = false
			p538:_restoreLocalState()
			p538.destroyed = true
			p538._stickyToken += 1

			for _, connection in ipairs(p538.connections) do
				v1840(connection)
			end

			table.clear(p538.connections)

			for k, v in pairs(p538.originalRagdoll) do
				if type(v) == "function" then
					Ragdoll[k] = v
				end
			end

			if p538._forestGate then
				pcall(rawset, p538._forestGate.comp, "_attackHandler", p538._forestGate.orig)

				if genv.__SenaV4ForestGate == p538._forestGate then
					genv.__SenaV4ForestGate = nil
				end

				p538._forestGate = nil
			end

			p538.eggRuntime = nil

			if getgenv().__SenaV4AntiGuard == p538 then
				getgenv().__SenaV4AntiGuard = nil
			end
		end

		t64[s2] = v1880
		t64.getStats = function(p539)
			return p539.stats
		end

		return t64
	end

	local v1885 = v1829()

	local function v1886()
		local Players2 = game:GetService("Players")

		game:GetService("RunService")

		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local LocalPlayer2 = Players2.LocalPlayer
		local t66 = {}

		t66.__index = t66
		t66.new = function(p540)
			local obj = setmetatable({}, t66)

			obj.eggRuntime = p540
			obj.enabled = senaV4Config.GodMode == nil and true or senaV4Config.GodMode == true
			obj.active = false
			obj.activeDroppedUid = nil
			obj.swingSequence = 0
			obj.lastSwingAt = 0
			obj.defendThread = nil
			obj.connections = {}
			obj.targetRange = 35
			obj:_bindSignals()

			return obj
		end
		t66._isBat = function(p541, p542)
			if not p542 or not p542:IsA("Tool") then
				return false
			end

			local __SenaV4IsBatTool = genv.__SenaV4IsBatTool

			if __SenaV4IsBatTool and __SenaV4IsBatTool(p542) then
				return true
			end

			if not __SenaV4IsBatTool and (p542:GetAttribute("IsBat") == true or p542:GetAttribute("GearName") == "Bat") then
				return true
			end

			local attribute = p542:GetAttribute("ItemType")

			if attribute == nil or attribute == "Gear" then
				return string.find(string.lower(p542.Name), "slap", 1, true) ~= nil
			end

			return false
		end
		t66._findBat = function(p543)
			local Character = LocalPlayer2.Character
			local Backpack = LocalPlayer2:FindFirstChildOfClass("Backpack")

			if Character then
				for _, child in ipairs(Character:GetChildren()) do
					if not p543:_isBat(child) then
						continue
					end

					return child, true
				end
			end

			if Backpack then
				for _, child in ipairs(Backpack:GetChildren()) do
					if not p543:_isBat(child) then
						continue
					end

					return child, false
				end
			end

			pcall(function()
				local Networking = ReplicatedStorage2:FindFirstChild("Packages") and ReplicatedStorage2.Packages:FindFirstChild("Networking")
				local RFCodexAskWearFieldBat = Networking and Networking:FindFirstChild("RF/Codex/AskWearFieldBat")

				if RFCodexAskWearFieldBat then
					RFCodexAskWearFieldBat:InvokeServer()
				end
			end)

			return nil, false
		end
		t66._equipBat = function(p544)
			local Character = LocalPlayer2.Character
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

			if not Humanoid or Humanoid.Health <= 0 then
				return nil
			end

			local v1904, v1905 = p544:_findBat()

			if not v1904 then
				return nil
			end

			if v1905 and v1904.Parent == Character then
				return v1904
			end

			pcall(Humanoid.EquipTool, Humanoid, v1904)

			local v1906 = os.clock() + 0.35

			while true do
				if not (os.clock() < v1906) then
					return v1904.Parent == Character and v1904 or nil
				end

				if v1904.Parent == Character then
					break
				end

				task.wait(0.05)
			end

			return v1904
		end
		t66._getNearbyEnemies = function(p545)
			local Character = LocalPlayer2.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart then
				return {}
			end

			local t67 = {}

			for _, player in ipairs(Players2:GetPlayers()) do
				if player ~= LocalPlayer2 and player.Character then
					local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
					local Humanoid = player.Character:FindFirstChildOfClass("Humanoid")

					if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 then
						local Magnitude = (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude

						if Magnitude <= p545.targetRange then
							table.insert(t67, {
								player = player,
								root = HumanoidRootPart2,
								humanoid = Humanoid,
								distance = Magnitude
							})
						end
					end
				end
			end

			table.sort(t67, function(p546, p547)
				return p546.distance < p547.distance
			end)

			return t67
		end
		t66._swing = function(p548, p549, p550)
			if not p549 or p549.Parent ~= LocalPlayer2.Character then
				return false
			end

			local serverTimeNow = workspace:GetServerTimeNow()

			if serverTimeNow - p548.lastSwingAt < 0.22 then
				return false
			end

			p548.lastSwingAt = serverTimeNow
			pcall(p549.Activate, p549)

			local Handle = p549:FindFirstChild("Handle") or p549:FindFirstChildWhichIsA("BasePart", true)

			if Handle and p550 and type(firetouchinterest) == "function" then
				pcall(function()
					firetouchinterest(Handle, p550, 0)
					task.wait(0.01)
					firetouchinterest(Handle, p550, 1)
				end)
			end

			pcall(function()
				local BatSwing = require(ReplicatedStorage2.Shared.Remotes).BatSwing

				if BatSwing and BatSwing.Trigger then
					p548.swingSequence += 1

					local v1918 = string.format("%d:%d:%d", LocalPlayer2.UserId, p548.swingSequence, math.floor(serverTimeNow * 1000))

					BatSwing.Trigger:FireServer(nil, v1918)
				end
			end)

			return true
		end
		t66.startDefend = function(p551, p552)
			if not p551.enabled then
				return
			end

			if p551.eggRuntime and p551.eggRuntime.instantPhase == "priming" then
				return
			end

			if p552 and p551.eggRuntime then
				if p551.eggRuntime:isSkippedEgg(p552) then
					return
				end
			end

			local __SenaV4PlayerSteal = genv.__SenaV4PlayerSteal

			if __SenaV4PlayerSteal and __SenaV4PlayerSteal.running then
				return
			end

			p551.active = true
			p551.activeDroppedUid = p552 or p551.activeDroppedUid

			if not p551.defendThread then
				p551.defendThread = task.spawn(function()
					local v1920 = false

					while p551.active and p551.enabled and (not p551.eggRuntime or not p551.eggRuntime.carry or not p551.eggRuntime.carry.active) do
						local __SenaV4PlayerSteal2 = genv.__SenaV4PlayerSteal

						if __SenaV4PlayerSteal2 and __SenaV4PlayerSteal2.running then
							v1920 = true

							break
						end

						local v1922 = p551:_getNearbyEnemies()

						if #v1922 > 0 then
							local v1923 = p551:_equipBat()

							if v1923 then
								for _, v in ipairs(v1922) do
									if v.root and v.root.Parent then
										p551:_swing(v1923, v.root)
									end
								end
							end
						end

						task.wait(0.1)
					end

					p551.active = false
					p551.defendThread = nil

					if v1920 then
						return
					end

					pcall(function()
						local Character = LocalPlayer2.Character
						local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

						if Humanoid then
							Humanoid:UnequipTools()
						end
					end)
				end)

				return
			end
		end
		t66.stopDefend = function(p553)
			p553.active = false
			p553.activeDroppedUid = nil
		end
		t66.setEnabled = function(p554, p555)
			p554.enabled = p555 == true

			if not p554.enabled then
				p554:stopDefend()
			end
		end
		t66._bindSignals = function(p556)
			pcall(function()
				table.insert(p556.connections, require(ReplicatedStorage2.Client.EggState).CarryChanged:Connect(function(p557)
					if p557.IsCarrying then
						p556:stopDefend()
					elseif p556.enabled then
						p556:startDefend(p557.Uid)
					end
				end))
			end)
			pcall(function()
				local Remotes = require(ReplicatedStorage2.Shared.Remotes)
				local ForestStrike = Remotes.GuardPatrol and Remotes.GuardPatrol.ForestStrike

				if ForestStrike then
					table.insert(p556.connections, ForestStrike.OnClientEvent:Connect(function()
						if p556.enabled then
							p556:startDefend()
						end
					end))
				end
			end)
		end
		t66.destroy = function(p558)
			p558:stopDefend()

			for _, connection in ipairs(p558.connections) do
				pcall(connection.Disconnect, connection)
			end

			table.clear(p558.connections)
		end

		return t66
	end

	local v1932 = v1886()

	local function v1933()
		local Players2 = game:GetService("Players")
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local LocalPlayer2 = Players2.LocalPlayer
		local Remotes = require(ReplicatedStorage2.Shared.Remotes)
		local PlotState2 = require(ReplicatedStorage2.Client.PlotState)
		local Hud = require(ReplicatedStorage2.Client.Hud)
		local Save = require(ReplicatedStorage2.Shared.Save)
		local Treadmills = require(ReplicatedStorage2.Data.Treadmills)

		local function v1942()
			local treadmill = t25.blocker("treadmill")

			if treadmill then
				return "Yielding to " .. t25.TITLES[treadmill]
			end

			local treadmill2 = t25.holder("treadmill")

			if treadmill2 then
				return "Waiting for " .. t25.TITLES[treadmill2]
			end

			return nil
		end
		local function v1945()
			return v1942() ~= nil
		end
		local function v1946()
			return t25.blocker("treadmill") == "auto_steal"
		end
		local function v1947()
			return v1942() or "Yielding"
		end

		local t68 = {}

		t68.__index = t68
		t68.new = function(p559, p560)
			local obj = setmetatable({}, t68)

			obj.coordinator = p559
			obj.travel = p560
			obj.destroyed = false
			obj.listeners = {}
			obj.resources = {}
			obj.config = {
				disableDuringAutomation = true,
				idleFarm = false,
				autoUpgrade = false
			}
			obj.stats = {
				mode = "Idle",
				boost = "Waiting"
			}
			obj.busy = p559 and p559:getSnapshot().busy == true or false
			obj.idleGeneration = 0
			obj.lastEquipAt = 0
			obj.activeTreadmill = nil
			obj.travelingToTreadmill = false
			obj.treadmillEquipPending = false
			obj.unequipGuardRunning = false
			obj.backgroundYieldRunning = false
			obj.lastBackgroundYieldAt = 0
			obj.carryPulseRunning = false
			obj.treadmillStateRevision = 0
			obj:_listenActiveTreadmill()
			task.spawn(function()
				pcall(function()
					obj:_syncActiveTreadmillSnapshot()
				end)
			end)
			obj:_listenCoordinator()
			obj:_listenSpeedGain()

			return obj
		end
		t68._snapshot = function(p561)
			return {
				mode = p561.stats.mode,
				boost = p561.stats.boost,
				disableDuringAutomation = p561.config.disableDuringAutomation,
				idleFarm = p561.config.idleFarm
			}
		end
		t68._emit = function(p562)
			local v1950 = p562:_snapshot()

			for _, listener in ipairs(p562.listeners) do
				pcall(listener, v1950)
			end
		end
		t68._setStatus = function(p563, p564, p565)
			if p564 ~= nil then
				p563.stats.mode = p564
			end

			if p565 ~= nil then
				p563.stats.boost = p565
			end

			p563:_emit()
		end
		t68.subscribe = function(p566, p567)
			table.insert(p566.listeners, p567)
			pcall(p567, p566:_snapshot())

			local function v1953()
				local v1954 = table.find(p566.listeners, p567)

				if v1954 then
					table.remove(p566.listeners, v1954)
				end
			end

			return v1953
		end
		t68._requestUnequip = function()
			local ok, result, result2 = pcall(function()
				return Remotes.Treadmill.AskDoff:InvokeServer()
			end)

			if not ok then
				return false, tostring(result)
			end

			if result ~= false then
				return true
			end

			local v1958 = false
			local tostring_ = tostring
			local v1960 = result2 or "Server rejected"

			return v1958, tostring_(v1960)
		end
		t68._shouldBlockTreadmill = function(p568)
			if p568.destroyed or p568.carryPulseRunning then
				return false
			end

			if p568.busy and p568.config.disableDuringAutomation then
				return true
			end

			local __SenaV4EggRuntime = genv.__SenaV4EggRuntime

			if __SenaV4EggRuntime and __SenaV4EggRuntime._treadmillResetting then
				return false
			end

			local ok, result = pcall(t25.holder, "treadmill")

			return ok and result ~= nil
		end
		t68._startUnequipGuard = function(p569)
			if p569.unequipGuardRunning or not p569:_shouldBlockTreadmill() or p569.activeTreadmill == nil then
				return
			end

			p569.unequipGuardRunning = true
			task.spawn(function()
				local n35 = 0.15

				while p569:_shouldBlockTreadmill() and p569.activeTreadmill ~= nil do
					local v1965, v1966 = p569:_requestUnequip()

					p569:_setStatus("Automation active", v1965 and "Blocked" or "Release retry: " .. tostring(v1966))
					task.wait(n35)
					n35 = math.min(n35 * 2, 0.75)
				end

				p569.unequipGuardRunning = false

				if p569:_shouldBlockTreadmill() and p569.activeTreadmill ~= nil then
					p569:_startUnequipGuard()
				end
			end)
		end
		t68._cancelIdle = function(p570, p571)
			p570.idleGeneration += 1

			if p571 then
				p570:_requestUnequip()
			end
		end
		t68.setDisableDuringAutomation = function(p572)
			p572.config.disableDuringAutomation = true

			if p572.busy and p572.config.disableDuringAutomation then
				p572:_cancelIdle(true)
				p572:_startUnequipGuard()
				p572:_setStatus("Automation active", "Blocked")
			elseif not p572.busy and p572.config.idleFarm then
				p572:_startIdle()
			end
		end
		t68.setIdleFarm = function(p573, p574)
			p573.config.idleFarm = p574 == true

			if not p573.config.idleFarm then
				p573:_cancelIdle(true)
				p573:_setStatus(p573.busy and "Automation active" or "Idle", "Disabled")

				return
			end

			if not p573.busy then
				p573:_startIdle()
			end

			if p573.idleWatchdog then
				return
			end

			p573.idleWatchdog = task.spawn(function()
				while not p573.destroyed and p573.config.idleFarm do
					task.wait(2)

					if p573.idleRunning == nil and not p573.busy and p573.config.idleFarm and not p573.destroyed then
						p573:_startIdle()
					end
				end

				p573.idleWatchdog = nil
			end)
		end
		t68._readUpgradeState = function()
			local ok, result, result2, result3 = pcall(function()
				local v1971 = (Save.Peek or Save.Get)()

				if not v1971 then
					return nil
				end

				local v1972 = tonumber(v1971.TreadmillUpgradeLevel) or 0

				return v1972, v1971.Money, Treadmills.GetByUpgradeLevel(v1972 + 1)
			end)

			if not ok or result == nil then
				return nil
			end

			return result, result2, result3
		end
		t68._raiseTier = function(p575)
			local _, v1974, v1975 = p575:_readUpgradeState()

			if not v1975 then
				return false, "Max tier"
			end

			if (tonumber(v1974) or 0) < (tonumber(v1975.Price) or 0) then
				return false, "Not enough money"
			end

			local ok, result, result2 = pcall(function()
				return Remotes.Treadmill.AskTierRaise:InvokeServer(v1975._id)
			end)

			if not ok then
				return false, tostring(result)
			end

			if result ~= true then
				local v1979 = false
				local tostring_ = tostring
				local v1981 = result2 or "Server rejected"

				return v1979, tostring_(v1981)
			end

			local v1982 = true
			local DisplayName = v1975.DisplayName or v1975._id

			return v1982, DisplayName
		end
		t68.setAutoUpgrade = function(p576, p577)
			p576.config.autoUpgrade = p577 == true

			if not p576.config.autoUpgrade or p576.autoUpgradeRunning then
				return
			end

			p576.autoUpgradeRunning = true
			task.spawn(function()
				while not p576.destroyed and p576.config.autoUpgrade do
					while true do
						local v1984, v1985 = p576:_raiseTier()

						if v1984 then
							p576:_setStatus(p576.busy and "Automation active" or "Idle", "Upgraded to " .. tostring(v1985))
							task.wait(1)
						else
							if v1985 ~= "Max tier" then
								break
							end

							p576:_setStatus(p576.busy and "Automation active" or "Idle", "Treadmill maxed")
							task.wait(30)
						end

						if not p576.destroyed and p576.config.autoUpgrade then
							continue
						end

						p576.autoUpgradeRunning = false

						return
					end

					task.wait(5)
				end

				p576.autoUpgradeRunning = false
			end)
		end
		t68._resolveStandCFrame = function()
			local v1986 = PlotState2.ResolveLocalSlot()
			local v1987 = PlotState2.ResolveFolder()
			local v1988 = v1987 and v1986 and v1987:FindFirstChild(tostring(v1986))
			local TreadmillBottom = v1988 and v1988:FindFirstChild("TreadmillBottom")

			if not TreadmillBottom or not TreadmillBottom:IsA("BasePart") then
				return nil
			end

			local Character = LocalPlayer2.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

			if not HumanoidRootPart or not Humanoid then
				return nil
			end

			local v1993

			if Humanoid.RigType == Enum.HumanoidRigType.R15 then
				v1993 = HumanoidRootPart.Size.Y * 0.5 + math.max(Humanoid.HipHeight, 0.5)
			else
				v1993 = HumanoidRootPart.Size.Y * 0.5 + 2
			end

			return TreadmillBottom.CFrame * cFrameNew(0, TreadmillBottom.Size.Y * 0.5 + v1993 + 0.05, 0)
		end
		t68.isEngaged = function(p578)
			return p578.activeTreadmill ~= nil or p578.travelingToTreadmill or p578.treadmillEquipPending or p578.carryPulseRunning
		end
		t68._isTreadmillHudActive = function()
			local ok, result = pcall(function()
				local Game = Hud.Frame("Game")
				local Treadmill = Hud.Frame("Treadmill")

				return Game.Visible == false and Treadmill.Visible == true
			end)
			local v1998 = ok and result == true

			return v1998
		end
		t68._isGameHudRestored = function()
			local ok, result = pcall(function()
				local Game = Hud.Frame("Game")
				local Treadmill = Hud.Frame("Treadmill")

				return Game.Visible == true and Treadmill.Visible == false
			end)
			local v2003 = ok and result == true

			return v2003
		end
		t68.pulseForCarry = function(p579, p580, p581)
			if p579.destroyed or p579.carryPulseRunning or type(p580) ~= "function" then
				return false, "Preparation unavailable"
			end

			p579:_cancelIdle(false)
			p579.carryPulseRunning = true

			local function v2004()
				return p579.destroyed or p581 ~= nil and p581()
			end
			local function v2005(p582)
				local v2006 = os.clock() + p582
				local n36 = 0
				local v2008
				local treadmillStateRevision = p579.treadmillStateRevision

				while not p579.destroyed and os.clock() < v2006 do
					local now = os.clock()

					if n36 <= now then
						p579:_requestUnequip()
						n36 = now + 0.15
					end

					local v2011 = p579:_syncActiveTreadmillSnapshot()
					local v2012 = p579:_isGameHudRestored()

					if p579.treadmillStateRevision ~= treadmillStateRevision then
						treadmillStateRevision = p579.treadmillStateRevision
						v2008 = nil
					end

					if not v2011 and p579.activeTreadmill == nil and v2012 then
						v2008 = v2008 or now

						if now - v2008 >= 0.35 then
							return true
						end
					else
						v2008 = nil
					end

					task.wait(0.03)
				end

				return false
			end
			local function v2013(p583, p584)
				if not p583 then
					v2005(1.85)
				end

				p579.treadmillEquipPending = false
				p579.carryPulseRunning = false

				if p583 then
					p579:_setStatus("Automation active", "Preparation complete")
				elseif not p579.destroyed then
					p579:_setStatus("Automation active", tostring(p584 or "Preparation failed"))
				end

				if p579:_shouldBlockTreadmill() and p579.activeTreadmill ~= nil then
					p579:_startUnequipGuard()
				end

				return p583, p584
			end

			p579:_syncActiveTreadmillSnapshot()

			local v2014 = false
			local v2015

			for i = 1, 3 do
				if v2004() then
					return v2013(false, "Cancelled")
				end

				local v2017 = p579:_resolveStandCFrame()

				if v2017 then
					p579:_setStatus("Preparing carry", i == 1 and "Positioning" or "Repositioning")

					local ok, result = pcall(p580, v2017)

					if ok and result == true then
						task.wait(0.35)
						p579.treadmillEquipPending = true
						p579:_setStatus("Preparing carry", "Activating")

						local v2020 = os.clock() + 2.5
						local n37 = 0
						local n38 = 0

						while not v2004() and os.clock() < v2020 do
							local now = os.clock()

							if n38 <= now then
								n38 = now + 0.25
								p579:_syncActiveTreadmillSnapshot()
							end

							if p579.activeTreadmill ~= nil and p579:_isTreadmillHudActive() then
								v2014 = true

								break
							end

							if p579.activeTreadmill == nil and n37 <= now then
								n37 = now + 0.2

								local ok2, result2, result3 = pcall(function()
									return Remotes.Treadmill.AskWearStill:InvokeServer()
								end)

								if not ok2 or result2 == false then
									v2015 = tostring(result3 or result2)
									p579:_setStatus("Preparing carry", "Activation retry")
								end
							end

							task.wait(0.03)
						end
					else
						v2015 = "Positioning failed"
					end
				else
					v2015 = "Position unavailable"
				end

				if v2014 then
					break
				end

				if not v2004() then
					p579:_setStatus("Preparing carry", "Resetting position")
					v2005(1.85)

					continue
				end

				return v2013(false, "Cancelled")
			end

			if not v2014 then
				local v2027 = v2013
				local v2028 = false
				local tostring_ = tostring
				local v2030 = v2015 or "Unknown"

				return v2027(v2028, "Activation not confirmed: " .. tostring_(v2030))
			end

			p579.treadmillEquipPending = false
			p579:_setStatus("Preparing carry", "Active")

			local v2031 = os.clock() + 0.1

			while not v2004() and os.clock() < v2031 do
				task.wait(0.03)
			end

			if v2004() then
				return v2013(false, "Cancelled")
			end

			p579:_setStatus("Preparing carry", "Releasing")

			if v2005(1.85) then
				return v2013(true)
			end

			local v2032 = v2013
			local v2033 = false
			local v2034 = v2004() and "Cancelled" or "Release not confirmed"

			return v2032(v2033, v2034)
		end
		t68.yieldForBackground = function(p585)
			if p585.destroyed then
				return
			end

			p585:_cancelIdle(false)

			if p585.backgroundYieldRunning then
				return
			end

			p585.backgroundYieldRunning = true
			task.spawn(function()
				local n39 = 0.15

				while not p585.destroyed do
					if p585.coordinator and p585.coordinator:isBackgroundBusy() then
						p585.lastBackgroundYieldAt = os.clock()
						p585:_setStatus("Idle", "Yielding to background inventory")
						p585:_requestUnequip()
						task.wait(n39)

						if p585:_syncActiveTreadmillSnapshot() then
							n39 = math.min(n39 * 2, 0.75)

							continue
						end
					end

					break
				end

				p585.backgroundYieldRunning = false

				if not p585.destroyed and not p585:isEngaged() then
					p585:_setStatus("Idle", "Background inventory ready")
				end
			end)
		end
		t68._startIdle = function(p586)
			if p586.destroyed or p586.busy or not p586.config.idleFarm then
				return
			end

			p586:_cancelIdle(false)

			local idleGeneration = p586.idleGeneration
			local now = os.clock()

			p586.idleRunning = idleGeneration
			task.spawn(function()
				local ok, result = xpcall(function()
					while not p586.destroyed and not p586.busy and p586.config.idleFarm and idleGeneration == p586.idleGeneration do
						if p586.coordinator then
							if p586.coordinator:isBackgroundBusy() then
								now = os.clock()
								p586:_setStatus("Idle", "Waiting for background inventory")
								task.wait(0.25)

								continue
							end
						end

						if v1946() then
							now = os.clock()
							p586:_setStatus("Idle", "Yielding to Auto Steal")
							task.wait(0.25)
						elseif genv.__SenaV4IsAutoSellEggBusy and genv.__SenaV4IsAutoSellEggBusy() then
							now = os.clock()
							p586:_setStatus("Idle", "Waiting for Auto Sell Egg")
							task.wait(0.25)
						elseif v1945() then
							now = os.clock()
							p586:_setStatus("Idle", v1947())
							task.wait(0.25)
						else
							local v2040 = 1 - (os.clock() - now)

							if v2040 > 0 then
								p586:_setStatus("Idle", string.format("Starting in %.0fs", math.ceil(v2040)))
								task.wait(math.min(v2040, 0.25))
							else
								local v2041 = p586:_resolveStandCFrame()

								if v2041 then
									p586.travelingToTreadmill = true
									p586:_setStatus("Moving", "Waiting")

									local travel = p586.travel and p586.travel:travelAndWait(v2041, {
										abort = function()
											return p586.destroyed or p586.busy or not p586.config.idleFarm or idleGeneration ~= p586.idleGeneration or p586.coordinator and p586.coordinator:isBackgroundBusy() or genv.__SenaV4IsAutoSellEggBusy and genv.__SenaV4IsAutoSellEggBusy() or v1945()
										end
									})

									p586.travelingToTreadmill = false

									if not travel then
										if not p586.busy and p586.config.idleFarm then
											p586:_setStatus("Idle", "Travel failed")
											task.wait(1)
										end
									elseif not p586.busy and p586.config.idleFarm and idleGeneration == p586.idleGeneration then
										if p586.coordinator then
											if p586.coordinator:isBackgroundBusy() then
												continue
											end
										end

										if (not genv.__SenaV4IsAutoSellEggBusy or not genv.__SenaV4IsAutoSellEggBusy()) and not v1945() then
											task.wait(0.35)

											if not p586.busy and p586.config.idleFarm and idleGeneration == p586.idleGeneration then
												if p586.coordinator then
													if p586.coordinator:isBackgroundBusy() then
														continue
													end
												end

												if (not genv.__SenaV4IsAutoSellEggBusy or not genv.__SenaV4IsAutoSellEggBusy()) and not v1945() then
													p586.treadmillEquipPending = true

													local ok, result, result2 = pcall(function()
														return Remotes.Treadmill.AskWearStill:InvokeServer()
													end)

													if ok and result ~= false then
														p586.lastEquipAt = os.clock()
														p586:_setStatus("Active", "Waiting for gain")
														task.delay(2, function()
															if not p586.destroyed and p586.activeTreadmill == nil then
																p586.treadmillEquipPending = false
															end
														end)

														local v2046 = os.clock() + 8

														while (p586.activeTreadmill ~= nil or os.clock() < v2046) and not p586.destroyed and not p586.busy and p586.config.idleFarm and idleGeneration == p586.idleGeneration do
															local ok33 = not p586.coordinator

															if not ok33 then
																ok33 = not p586.coordinator:isBackgroundBusy()
															end

															if not ok33 then
																break
															end

															if v1946() then
																p586:_cancelIdle(true)
																p586:_setStatus("Idle", "Yielding to Auto Steal")

																break
															end

															if not genv.__SenaV4IsAutoSellEggBusy or not genv.__SenaV4IsAutoSellEggBusy() then
																if not v1945() then
																	task.wait(0.25)

																	continue
																end

																p586:_requestUnequip()
																p586:_setStatus("Idle", v1947())

																break
															end

															p586:_cancelIdle(true)
															p586:_setStatus("Idle", "Yielding to Auto Sell Egg")

															break
														end

														continue
													end

													p586.treadmillEquipPending = false
													p586:_setStatus("Preparing carry", "Activation failed: " .. tostring(result2 or result))

													local v2048 = os.clock() + 8

													while true do
														local coordinator

														if p586.activeTreadmill == nil then
															if os.clock() < v2048 and not p586.destroyed and not p586.busy and p586.config.idleFarm and idleGeneration == p586.idleGeneration then
																if not p586.coordinator then
																	if v1946() then
																		p586:_cancelIdle(true)
																		p586:_setStatus("Idle", "Yielding to Auto Steal")

																		break
																	end

																	if not genv.__SenaV4IsAutoSellEggBusy or not genv.__SenaV4IsAutoSellEggBusy() then
																		if not v1945() then
																			task.wait(0.25)

																			continue
																		end

																		p586:_requestUnequip()
																		p586:_setStatus("Idle", v1947())

																		break
																	end

																	p586:_cancelIdle(true)
																	p586:_setStatus("Idle", "Yielding to Auto Sell Egg")

																	break
																end

																coordinator = p586.coordinator

																if not coordinator:isBackgroundBusy() then
																	if v1946() then
																		p586:_cancelIdle(true)
																		p586:_setStatus("Idle", "Yielding to Auto Steal")

																		break
																	end

																	if not genv.__SenaV4IsAutoSellEggBusy or not genv.__SenaV4IsAutoSellEggBusy() then
																		if not v1945() then
																			task.wait(0.25)

																			continue
																		end

																		p586:_requestUnequip()
																		p586:_setStatus("Idle", v1947())

																		break
																	end

																	p586:_cancelIdle(true)
																	p586:_setStatus("Idle", "Yielding to Auto Sell Egg")

																	break
																end
															end

															break
														end

														if not p586.destroyed and not p586.busy and p586.config.idleFarm and idleGeneration == p586.idleGeneration then
															if not p586.coordinator then
																if v1946() then
																	p586:_cancelIdle(true)
																	p586:_setStatus("Idle", "Yielding to Auto Steal")

																	break
																end

																if not genv.__SenaV4IsAutoSellEggBusy or not genv.__SenaV4IsAutoSellEggBusy() then
																	if not v1945() then
																		task.wait(0.25)

																		continue
																	end

																	p586:_requestUnequip()
																	p586:_setStatus("Idle", v1947())

																	break
																end

																p586:_cancelIdle(true)
																p586:_setStatus("Idle", "Yielding to Auto Sell Egg")

																break
															end

															coordinator = p586.coordinator

															if not coordinator:isBackgroundBusy() then
																if v1946() then
																	p586:_cancelIdle(true)
																	p586:_setStatus("Idle", "Yielding to Auto Steal")

																	break
																end

																if not genv.__SenaV4IsAutoSellEggBusy or not genv.__SenaV4IsAutoSellEggBusy() then
																	if not v1945() then
																		task.wait(0.25)

																		continue
																	end

																	p586:_requestUnequip()
																	p586:_setStatus("Idle", v1947())

																	break
																end

																p586:_cancelIdle(true)
																p586:_setStatus("Idle", "Yielding to Auto Sell Egg")

																break
															end
														end

														break
													end
												end
											end
										end
									end
								else
									p586:_setStatus("Idle", "Position unavailable")
									task.wait(2)
								end
							end
						end
					end
				end, debug.traceback)

				if not ok then
					warn("[SAE][treadmill] idle error:\n" .. tostring(result))
				end

				if p586.idleRunning == idleGeneration then
					p586.idleRunning = nil
				end
			end)
		end
		t68._onCoordinator = function(p587, p588)
			local busy = p587.busy

			p587.busy = p588.busy == true

			if p587.busy then
				p587:_cancelIdle(p587.config.disableDuringAutomation)
				p587:_startUnequipGuard()
				p587:_setStatus("Automation active", p587.config.disableDuringAutomation and "Blocked" or "Unchanged")
			elseif busy or p587.config.idleFarm then
				if p587.config.idleFarm then
					p587:_startIdle()
				else
					p587:_setStatus("Idle", "Disabled")
				end
			end
		end
		t68._listenCoordinator = function(p589)
			if not p589.coordinator then
				return
			end

			table.insert(p589.resources, p589.coordinator:subscribe(function(p590)
				p589:_onCoordinator(p590)
			end))
			table.insert(p589.resources, p589.coordinator:subscribeBackground(function(p591)
				if p591.busy then
					p589:_cancelIdle(false)
					p589:_setStatus("Idle", "Waiting for background inventory")
				elseif not p589.destroyed and not p589.busy and p589.config.idleFarm then
					p589:_startIdle()
				end
			end))
		end
		t68._syncActiveTreadmillSnapshot = function(p592)
			local ok, result = pcall(function()
				return Remotes.Treadmill.AskRenderSnapshot:InvokeServer()
			end)

			if not ok or type(result) ~= "table" then
				return p592.activeTreadmill ~= nil
			end

			local v2053 = table.find(result, LocalPlayer2.UserId) ~= nil

			p592.activeTreadmill = v2053 and "snapshot" or nil

			if not v2053 then
				p592.treadmillEquipPending = false
			end

			return v2053
		end
		t68._listenActiveTreadmill = function(p593)
			local function v2054(p594)
				p593.treadmillStateRevision += 1
				p593.activeTreadmill = p594
				p593.treadmillEquipPending = false

				if p594 ~= nil and p593:_shouldBlockTreadmill() then
					p593:_startUnequipGuard()
				elseif p594 == nil and p593:_shouldBlockTreadmill() then
					p593:_setStatus("Automation active", "Blocked")
				elseif p594 == nil then
					p593:_setStatus("Idle", p593.config.idleFarm and "Released" or "Disabled")
				elseif not p593.busy then
					p593:_setStatus("Active", "Waiting for gain")
				end
			end

			local AssignedBeltShifted
			local RenderStateShifted

			pcall(function()
				AssignedBeltShifted = Remotes.Treadmill.AssignedBeltShifted
			end)
			pcall(function()
				RenderStateShifted = Remotes.Treadmill.RenderStateShifted
			end)

			if AssignedBeltShifted then
				table.insert(p593.resources, AssignedBeltShifted.OnClientEvent:Connect(function(p595)
					v2054(p595)
				end))

				return
			end

			if RenderStateShifted then
				table.insert(p593.resources, RenderStateShifted.OnClientEvent:Connect(function(p596, p597)
					if p596 ~= LocalPlayer2.Name then
						return
					end

					local v2057 = v2054
					local v2058 = p597 and p596

					v2057(v2058 or nil)
				end))
			end
		end
		t68._listenSpeedGain = function(p598)
			local SpeedGained = Remotes.Treadmill.SpeedGained

			if SpeedGained then
				table.insert(p598.resources, SpeedGained.OnClientEvent:Connect(function()
					p598.activeTreadmill = p598.activeTreadmill or true
					p598.treadmillEquipPending = false

					if not p598:_shouldBlockTreadmill() then
						p598:_setStatus("Active", "Gain ticking")

						return
					end

					p598:_startUnequipGuard()
				end))
			end
		end
		t68.destroy = function(p599)
			if p599.destroyed then
				return
			end

			p599.destroyed = true
			p599:_cancelIdle(true)

			for _, resource in ipairs(p599.resources) do
				pcall(function()
					if typeof(resource) == "RBXScriptConnection" then
						resource:Disconnect()
					elseif type(resource) == "function" then
						resource()
					elseif type(resource) == "table" and type(resource.Disconnect) == "function" then
						resource:Disconnect()
					end
				end)
			end

			table.clear(p599.resources)
			table.clear(p599.listeners)
		end
		t68.Destroy = t68.destroy

		return t68
	end

	local v2062 = v1933()
	local v2063 = v662.new()

	v612 = v1823.new(v611, v703, v2063)
	genv.__SenaV4EggRuntime = v612
	v613 = v2062.new(v2063, v612)
	genv.__SenaV4TreadmillManager = v613
	v612:setTreadmillManager(v613)
	v613:setDisableDuringAutomation(true)

	if senaV4Config.AutoTreadmillIdle then
		v613:setIdleFarm(true)
	end

	if senaV4Config.AutoIndex then
		v612:setIndexObjective(true)
	end

	if senaV4Config.AutoTreadmillUpgrade then
		v613:setAutoUpgrade(true)
	end

	local function v2064()
		local HttpService = game:GetService("HttpService")
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local LocalPlayer2 = game:GetService("Players").LocalPlayer
		local http_request_ = http_request or request or http and http.request or syn and syn.request or fluxus and fluxus.request
		local t70 = {}
		local u2071 = false
		local t71 = {}
		local u2073
		local AssetEarnings
		local EggRecords

		pcall(function()
			AssetEarnings = require(ReplicatedStorage2.Shared.Util.AssetEarnings)
		end)
		pcall(function()
			EggRecords = require(ReplicatedStorage2.Shared.Util.EggRecords)
		end)

		local function v2076(p600)
			local match = tostring(p600 or ""):match("%d+")

			if not match then
				return nil
			end

			local v2078 = t71[match]

			if v2078 ~= nil then
				if v2078 == "" then
					return nil
				end

				return v2078
			end

			local v2079

			for _, v in ipairs({
				"512x512",
				"150x150"
			}) do
				local imageUrl

				pcall(function()
					local v2083 = "https://thumbnails.roblox.com/v1/assets?assetIds=" .. match .. "&size=" .. v .. "&format=Png&isCircular=false"
					local Body

					if http_request_ then
						local v2085 = http_request_({
							Url = v2083,
							Method = "GET"
						})

						Body = type(v2085) == "table" and (v2085.Body or v2085.body) or nil
					else
						Body = HttpService:GetAsync(v2083)
					end

					if type(Body) == "string" and Body ~= "" then
						local data = HttpService:JSONDecode(Body)
						local data2 = data and data.data and data.data[1]

						if data2 and data2.state == "Completed" and type(data2.imageUrl) == "string" and data2.imageUrl ~= "" then
							imageUrl = data2.imageUrl
						end
					end
				end)

				if imageUrl then
					v2079 = v2079 or imageUrl

					if imageUrl:find("/Png/", 1, true) then
						v2079 = imageUrl

						break
					else
					end
				else
				end
			end

			t71[match] = v2079 or ""

			return v2079
		end
		local function v2088()
			if u2073 == nil then
				u2073 = v2076("96240498384290") or false
			end

			return u2073 or nil
		end
		local function v2089()
			if u2071 then
				return
			end

			u2071 = true
			task.spawn(function()
				while #t70 > 0 do
					local v2090 = table.remove(t70, 1)

					pcall(function()
						if v2090.thumbAsset then
							local v2091 = v2090.payload.embeds[1]
							local v2092 = v2076(v2090.thumbAsset)

							if v2092 then
								v2091.thumbnail = {
									url = v2092
								}
							end
						end

						local json = HttpService:JSONEncode(v2090.payload)

						if http_request_ then
							http_request_({
								Url = v2090.url,
								Method = "POST",
								Headers = {
									["Content-Type"] = "application/json"
								},
								Body = json
							})
						else
							HttpService:PostAsync(v2090.url, json, Enum.HttpContentType.ApplicationJson)
						end
					end)
					task.wait(0.6)
				end

				u2071 = false
			end)
		end
		local function v2094(p601)
			if typeof(p601) == "Color3" then
				return math.floor(p601.R * 255 + 0.5) * 65536 + math.floor(p601.G * 255 + 0.5) * 256 + math.floor(p601.B * 255 + 0.5)
			end

			return 5814783
		end
		local function compact(p602)
			local Simple

			pcall(function()
				Simple = require(ReplicatedStorage2.Packages.FormatNumber.Simple)
			end)

			if Simple and Simple.FormatCompact then
				local ok, result = pcall(Simple.FormatCompact, p602, ".#")

				if ok and result then
					return tostring(result)
				end
			end

			local format = string.format
			local s3 = "%.1f"
			local v2101 = p602 or 0

			return format(s3, v2101)
		end

		local t69 = {
			compact = compact,
			rateOf = function(p603)
				if not AssetEarnings or type(p603) ~= "table" then
					return 0
				end

				local v2102 = tonumber(p603.AssetScale) or 1
				local t72 = {
					Category = p603.AssetCategory,
					Scale = v2102,
					AssetScale = v2102,
					BaseMutation = p603.BaseMutation,
					Mutations = p603.Mutations or {}
				}

				for _, v in ipairs({
					"LiveRatePerSecond",
					"RatePerSecond",
					"CatalogRatePerSecond"
				}) do
					if type(AssetEarnings[v]) == "function" then
						local ok, result = pcall(AssetEarnings[v], t72)

						if ok and type(result) == "number" and result > 0 then
							return result
						end
					end
				end

				return 0
			end,
			weightOf = function(p604)
				if not EggRecords or type(p604) ~= "table" then
					return 0
				end

				local ok, result = pcall(EggRecords.WeightKgForScale, p604.AssetCategory, tonumber(p604.AssetScale) or 1)

				if ok and type(result) == "number" then
					return result
				end

				return 0
			end,
			sizeText = function(p605)
				local v2110 = tonumber(p605 and (p605.AssetScale or p605.Scale)) or 1

				if v2110 >= 100 then
					return string.format("%.0fx", v2110)
				end

				return string.format("%.2fx", v2110)
			end,
			weightText = function(p606)
				local v2111 = tonumber(p606) or 0

				if v2111 >= 1000 then
					return compact(v2111) .. " kg"
				end

				return string.format("%.1fkg", v2111)
			end,
			rateText = function(p607)
				local v2112 = tonumber(p607) or 0

				if v2112 >= 1000 then
					return "$" .. compact(v2112) .. "/s"
				end

				return string.format("$%d/s", math.floor(v2112))
			end,
			passes = function(p608, p609, p610)
				local t73 = {}
				local v2114 = false
				local ipairs_ = ipairs
				local WebhookRarities = senaV4Config.WebhookRarities or {}

				for _, WebhookRarity in ipairs_(WebhookRarities) do
					if WebhookRarity ~= "None" and WebhookRarity ~= "" then
						t73[WebhookRarity] = true
						v2114 = true
					end
				end

				if v2114 and not t73[p609.rarity] then
					return false
				end

				local v2119 = tonumber(senaV4Config.WebhookMinValue) or 0

				if v2119 > 0 and p610 < v2119 then
					return false
				end

				return true
			end
		}
		local t74 = {
			"Image",
			"Icon",
			"Thumbnail",
			"ImageId",
			"IconId",
			"Texture",
			"Asset",
			"DisplayImage"
		}

		t69.eggAsset = function(p611)
			local Directory

			pcall(function()
				Directory = require(ReplicatedStorage2.Data.Assets).Directory
			end)

			local v2122 = Directory and Directory[p611]

			if type(v2122) ~= "table" then
				return nil
			end

			for _, v in ipairs({
				v2122,
				v2122.Egg,
				v2122.Pet
			}) do
				if type(v) == "table" then
					for _, v2 in ipairs(t74) do
						local v2127 = v[v2]
						local match = (type(v2127) == "string" or type(v2127) == "number") and tostring(v2127):match("%d+")

						if not match or not (tonumber(match) > 0) then
							continue
						end

						return match
					end
				end
			end

			return nil
		end
		t69.stolen = function(p612, p613, p614)
			if senaV4Config.WebhookEnabled ~= true then
				return
			end

			local WebhookURL = senaV4Config.WebhookURL

			if type(WebhookURL) ~= "string" or WebhookURL == "" then
				return
			end

			if not (type(p612) == "table" and p612.AssetCategory) then
				return
			end

			local v2130 = p613 or {
				name = p612.AssetCategory,
				rarity = "Unknown",
				rarityColor = nil
			}
			local v2131 = t69.rateOf(p612)

			if not t69.passes(p612, v2130, v2131) then
				return
			end

			local t75 = {
				{
					name = "User",
					value = LocalPlayer2.Name,
					inline = true
				},
				{
					name = "Rarity",
					value = tostring(v2130.rarity),
					inline = true
				},
				{
					name = "Size",
					value = t69.sizeText(p612),
					inline = true
				},
				{
					name = "Weight",
					value = t69.weightText(t69.weightOf(p612)),
					inline = true
				},
				{
					name = "Cash/s",
					value = t69.rateText(v2131),
					inline = true
				},
				{
					name = "Area",
					value = tostring(p612.AreaId or "?"),
					inline = true
				}
			}
			local Mutations = p612.Mutations or {}

			if #Mutations > 0 then
				local t82 = {}

				for _, Mutation in ipairs(Mutations) do
					t82[#t82 + 1] = tostring(Mutation)
				end

				t75[#t75 + 1] = {
					name = "Mutations",
					value = table.concat(t82, ", "),
					inline = false
				}
			end

			if p614 and p614 ~= "" then
				t75[#t75 + 1] = {
					name = "Taken From",
					value = tostring(p614),
					inline = false
				}
			end

			local v2143 = v2088()
			local t83 = {
				title = "Egg Stolen",
				description = string.format("You've stolen a **%s** %s", tostring(v2130.rarity), tostring(v2130.name)),
				color = v2094(v2130.rarityColor),
				timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
				author = {
					name = "Sena Hub",
					icon_url = v2143
				},
				footer = {
					text = "discord.gg/senahub",
					icon_url = v2143
				},
				fields = t75
			}

			if #t70 > 40 then
				table.remove(t70, 1)
			end

			table.insert(t70, {
				url = WebhookURL,
				payload = {
					embeds = { t83 }
				}
			})
			v2089()
		end
		t69.test = function()
			local WebhookURL = senaV4Config.WebhookURL

			if type(WebhookURL) ~= "string" or WebhookURL == "" then
				return false
			end

			local v2146 = v2088()
			local t84 = {
				title = "Webhook Test",
				description = string.format("Connection test for **%s**", LocalPlayer2.Name),
				color = 5814783,
				timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
				author = {
					name = "Sena Hub",
					icon_url = v2146
				},
				footer = {
					text = "discord.gg/senahub",
					icon_url = v2146
				},
				fields = {
					{
						name = "User",
						value = LocalPlayer2.Name,
						inline = true
					},
					{
						name = "User ID",
						value = tostring(LocalPlayer2.UserId),
						inline = true
					},
					{
						name = "Place ID",
						value = tostring(game.PlaceId),
						inline = true
					},
					{
						name = "Status",
						value = "Connected",
						inline = true
					}
				}
			}
			local v2148 = v2076("96240498384290")

			if v2148 then
				t84.thumbnail = {
					url = v2148
				}
			end

			table.insert(t70, {
				url = WebhookURL,
				payload = {
					embeds = { t84 }
				}
			})
			v2089()

			return true
		end

		return t69
	end

	genv.__SenaV4Webhook = v2064()

	local function v2149()
		local Players2 = game:GetService("Players")
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local LocalPlayer2 = Players2.LocalPlayer
		local EggState2 = require(ReplicatedStorage2.Client.EggState)
		local AreaEggs = require(ReplicatedStorage2.Shared.Types.AreaEggs)
		local t85 = {}

		t85.__index = t85

		local t86 = {
			1.1,
			0.2,
			0.7,
			1.4,
			0.45
		}

		t85.new = function(p615, p616, p617)
			local obj = setmetatable({}, t85)

			obj.eggRuntime = p615
			obj.godMode = p616
			obj.catalog = p617
			obj.enabled = false
			obj.running = false
			obj.status = "idle"
			obj.taken = 0
			obj.attempts = 0
			obj.history = {}
			obj.blacklist = {}
			obj.forced = false
			obj.listeners = {}
			obj.swingSeq = 0
			obj.leadIdx = 1
			obj.hitIdx = nil
			obj.missStreak = 0

			return obj
		end
		t85.onChanged = function(p618, p619)
			table.insert(p618.listeners, p619)
		end
		t85._notify = function(p620)
			for _, listener in ipairs(p620.listeners) do
				pcall(listener, p620)
			end
		end
		t85._setStatus = function(p621, p622)
			if p621.status == p622 then
				return
			end

			p621.status = p622
			p621:_notify()
		end
		t85._log = function(p623, p624, p625, p626)
			table.insert(p623.history, 1, {
				at = os.time(),
				player = p624 or "?",
				egg = p625 or "?",
				outcome = p626 or "?"
			})

			while #p623.history > 20 do
				table.remove(p623.history)
			end

			p623:_notify()
		end
		t85.setEnabled = function(p627, p628)
			p627.enabled = p628 == true

			if p627.enabled then
				p627:_setStatus("looking for a carrier")
				p627:_start()
			else
				p627:_setStatus("idle")
			end
		end
		t85._passes = function(p629, p630)
			if not (type(p630) == "table" and p630.AssetCategory) then
				return false
			end

			local v2160 = p629.catalog.resolve(p630)
			local t87 = {}
			local v2162 = false
			local ipairs_ = ipairs
			local StealPlayerRarities = senaV4Config.StealPlayerRarities or {}

			for _, StealPlayerRarity in ipairs_(StealPlayerRarities) do
				if StealPlayerRarity ~= "None" and StealPlayerRarity ~= "" then
					t87[StealPlayerRarity] = true
					v2162 = true
				end
			end

			if not v2162 then
				local ipairs_2 = ipairs
				local StealRarities = senaV4Config.StealRarities or {}

				for _, StealRarity in ipairs_2(StealRarities) do
					if StealRarity ~= "None" and StealRarity ~= "" then
						t87[StealRarity] = true
						v2162 = true
					end
				end
			end

			if v2162 and not t87[v2160.rarity] then
				return false
			end

			local v2171 = tonumber(senaV4Config.StealPlayerMinValue) or 0

			if v2171 > 0 then
				if (genv.__SenaV4Webhook and genv.__SenaV4Webhook.rateOf(p630) or 0) < v2171 then
					return false
				end
			end

			return true
		end
		t85.carriers = function(p631)
			local t88 = {}
			local ok, result = pcall(function()
				return EggState2.ReadFieldEggs()
			end)

			if not ok or not result then
				return t88
			end

			local ipairs_ = ipairs
			local Records = result.Records or {}

			for _, Record in ipairs_(Records) do
				if (Record.State == "Carried" or AreaEggs and AreaEggs.States and Record.State == AreaEggs.States.Carried) and not p631.blacklist[Record.Uid] then
					local u2179

					pcall(function()
						u2179 = EggState2.ReadFieldEgg(Record.Uid)
					end)
					u2179 = u2179 or Record

					local CarrierUserId = u2179.CarrierUserId

					if CarrierUserId and CarrierUserId ~= LocalPlayer2.UserId then
						local playerByUserId = Players2:GetPlayerByUserId(CarrierUserId)
						local HumanoidRootPart = playerByUserId and playerByUserId.Character and playerByUserId.Character:FindFirstChild("HumanoidRootPart")

						if playerByUserId and HumanoidRootPart then
							table.insert(t88, {
								record = u2179,
								player = playerByUserId,
								root = HumanoidRootPart
							})
						end
					end
				end
			end

			return t88
		end
		t85.clearHistory = function(p632)
			table.clear(p632.history)
			p632:_notify()
		end

		local function v2183(p633)
			if typeof(p633) == "Color3" then
				return string.format("%02x%02x%02x", math.floor(p633.R * 255 + 0.5), math.floor(p633.G * 255 + 0.5), math.floor(p633.B * 255 + 0.5))
			end

			return "ffffff"
		end

		t85.listEntries = function(p634)
			local t89 = {}

			for _, v in ipairs(p634:carriers()) do
				t89[v.player] = v.record
			end

			local HumanoidRootPart = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("HumanoidRootPart")
			local t90 = {}
			local v2189

			for _, player in ipairs(Players2:GetPlayers()) do
				if player ~= LocalPlayer2 then
					local v2192, s4

					if player.Character then
						local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

						v2192 = t89[player]

						local ok = not (HumanoidRootPart2 and HumanoidRootPart)

						if not ok then
							v2189 = math.floor((HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude + 0.5)
							ok = not v2189
						end

						if ok then
							v2189 = nil
						end

						s4 = "Offline"

						if v2192 and v2192.AreaId then
							s4 = tostring(v2192.AreaId)
						elseif HumanoidRootPart2 then
							s4 = HumanoidRootPart2.Position.X <= 552.2 and "Safe Zone" or "Field"
						end
					else
						v2192 = t89[player]
						v2189 = nil
						s4 = "Offline"

						if v2192 and v2192.AreaId then
							s4 = tostring(v2192.AreaId)
						end
					end

					local rarityRank
					local v2197, v2198

					if v2192 then
						local ok, result = pcall(function()
							return p634.catalog.resolve(v2192)
						end)
						local v2201 = ok and result

						if not v2201 then
							v2201 = {
								rarityRank = 0,
								name = tostring(v2192.AssetCategory or "Egg"),
								rarity = "Unknown",
								rarityColor = Color3.fromRGB(245, 196, 81)
							}
						end

						local v2202 = v2201

						rarityRank = v2202.rarityRank or 0
						v2197 = string.format("<font color=\"#%s\">%s</font>  <font color=\"#A2A2AE\">[%s]</font>", v2183(v2202.rarityColor), tostring(v2202.name or "Egg"), tostring(v2202.rarity or "Common"))
						v2198 = string.format("Running in %s%s", s4, v2189 and "  -  " .. v2189 .. " studs" or "")
					else
						v2197 = "No Egg Carried"
						v2198 = string.format("Idle in %s%s", s4, v2189 and "  -  " .. v2189 .. " studs" or "")
					end

					t90[#t90 + 1] = {
						id = tostring(player.UserId),
						name = tostring(player.DisplayName or player.Name),
						sub = string.format("<font color=\"#4ADE80\">@%s</font>  <font color=\"#A2A2AE\">[%s]</font>", tostring(player.Name), s4),
						status = v2197,
						statusSub = v2198,
						button = "Steal",
						buttonColor = v2192 and "accent" or "dim",
						player = player,
						carrying = v2192 ~= nil,
						rank = rarityRank or -1,
						distance = v2189 or 1e9,
						onClick = function(p635, p636)
							local v2203 = p634:strike(p635.player)

							p636(v2203 and "Chasing" or "No Egg", v2203 and "green" or "red")
							task.delay(1.6, function()
								pcall(p636, "Steal", p635.carrying and "accent" or "dim")
							end)
						end
					}
				end
			end

			table.sort(t90, function(p637, p638)
				if p637.carrying ~= p638.carrying then
					return p637.carrying
				end

				if not p637.carrying or p637.rank == p638.rank then
					return p637.distance < p638.distance
				end

				return p637.rank > p638.rank
			end)

			return t90
		end
		t85._pick = function(p639)
			local StealPlayerTarget = senaV4Config.StealPlayerTarget
			local v2205
			local v2206
			local v2207, v2208, v2209 = ipairs(p639:carriers())
			local v2210 = geniter(v2207, v2208, v2209)

			while true do
				local v2211 = table.pack(v2210())

				if not v2211[1] then
					break
				end

				local v2212 = v2211[3]
				local v2213 = StealPlayerTarget == nil or StealPlayerTarget == "" or StealPlayerTarget == "Any Player" or v2212.player.Name == StealPlayerTarget

				if not (v2212.root.Position.X > 672.2) then
					continue
				end

				local exitTo2

				while true do
					local v2215 = v2212.player:GetAttribute("InBossArena") ~= true
					local exitTo

					while true do
						if not v2213 or not v2215 then
							local v2217 = table.pack(v2210())

							if not v2217[1] then
								break
							end

							v2212 = v2217[3]
							v2213 = StealPlayerTarget == nil or StealPlayerTarget == "" or StealPlayerTarget == "Any Player" or v2212.player.Name == StealPlayerTarget
							v2215 = v2212.root.Position.X > 672.2

							if not v2215 then
								continue
							end

							exitTo = 2

							break
						end

						exitTo = 1

						break
					end

					if exitTo == 1 then
						exitTo2 = 1

						break
					elseif exitTo == 2 then
						continue
					end

					break
				end

				if exitTo2 == 1 then
					if p639:_passes(v2212.record) then
						local rarityRank = p639.catalog.resolve(v2212.record).rarityRank or 0

						if not v2206 or v2206 < rarityRank then
							v2205 = v2212
							v2206 = rarityRank
						end
					end

					continue
				end

				break
			end

			return v2205
		end
		t85.strike = function(p640, p641)
			if not p641 or p641 == LocalPlayer2 then
				return false
			end

			for _, v in ipairs(p640:carriers()) do
				if v.player == p641 then
					p640.forced = true
					task.spawn(function()
						p640:_chase(v)
					end)

					return true
				end
			end

			p640:_setStatus(p641.Name .. " is not carrying an egg")

			return false
		end

		local function v2221()
			local Character = LocalPlayer2.Character

			if not Character then
				return
			end

			local Humanoid = Character:FindFirstChildOfClass("Humanoid")
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

			for _, descendant in ipairs(Character:GetDescendants()) do
				if not descendant:IsA("Motor6D") then
					if not descendant:IsA("BallSocketConstraint") then
						if not descendant:IsA("HingeConstraint") then
							if not descendant:IsA("Attachment") then
								continue
							end

							if not descendant.Name:find("Ragdoll") and not descendant:GetAttribute("RagdollAttachment") then
								continue
							end

							pcall(function()
								descendant:Destroy()
							end)

							continue
						end
					end

					if descendant.Name:find("Ragdoll") or descendant:GetAttribute("RagdollConstraint") then
						pcall(function()
							descendant:Destroy()
						end)
					end
				elseif not descendant.Enabled then
					descendant.Enabled = true
				end
			end

			if Humanoid then
				Humanoid.PlatformStand = false
				Humanoid.Sit = false
				pcall(function()
					Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
					Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
					Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
					Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
					Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
					task.wait(0.02)
					Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end)
			end

			if HumanoidRootPart then
				HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			end
		end
		local function v2227()
			local v2228 = v14()
			local Areas = v2228 and v2228:FindFirstChild("Areas")
			local GuardAreas = Areas and Areas:FindFirstChild("GuardAreas")
			local Forest = GuardAreas and GuardAreas:FindFirstChild("Forest")

			if Forest then
				local Guard = Forest:FindFirstChild("Guard")
				local HumanoidRootPart = Guard and (Guard:FindFirstChild("HumanoidRootPart") or Guard:FindFirstChild("Collider") or Guard:IsA("Model") and Guard.PrimaryPart)

				if Guard and HumanoidRootPart then
					return Guard, HumanoidRootPart
				end

				local ForestGuardAuthored = Forest:FindFirstChild("ForestGuardAuthored")
				local HumanoidRootPart2 = ForestGuardAuthored and (ForestGuardAuthored:FindFirstChild("HumanoidRootPart") or ForestGuardAuthored:IsA("Model") and ForestGuardAuthored.PrimaryPart)

				if ForestGuardAuthored and HumanoidRootPart2 then
					return ForestGuardAuthored, HumanoidRootPart2
				end
			end

			local AreaGuards = workspace:FindFirstChild("AreaGuards")

			if AreaGuards then
				for _, child in ipairs(AreaGuards:GetChildren()) do
					local HumanoidRootPart = child:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart and HumanoidRootPart.Position.X < 850 then
						return child, HumanoidRootPart
					end
				end
			end

			return nil, nil
		end
		local function v2240(p642)
			local u2241

			pcall(function()
				u2241 = EggState2.ReadFieldEggs()
			end)

			local Records = u2241 and u2241.Records or {}
			local v2243

			for _, Record in ipairs(Records) do
				if (Record.State == "Slot" or Record.State == "Dropped") and Record.Uid ~= p642 and (not Record.CarrierUserId or Record.CarrierUserId == LocalPlayer2.UserId) then
					local Position = Record.BottomCFrame and Record.BottomCFrame.Position or Record.BoundsCFrame and Record.BoundsCFrame.Position

					if Record.AreaId == "Forest" or tostring(Record.Uid):find("Forest", 1, true) or tostring(Record.Uid):find("^FirstArea") or Position and Position.X < 680 then
						if Record.State == "Slot" then
							v2243 = Record

							break
						end

						v2243 = v2243 or Record
					end
				end
			end

			return v2243
		end

		t85._primeForest = function(p643, p644)
			local eggRuntime = p643.eggRuntime
			local Character = LocalPlayer2.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

			if not HumanoidRootPart or not Humanoid or not (Humanoid.Health > 0) then
				return false
			end

			if eggRuntime and eggRuntime.carry and eggRuntime.carry.active and eggRuntime.carry.uid then
				pcall(function()
					eggRuntime:_returnToSafe()
				end)
				task.wait(0.08)
			end

			p643:_setStatus("Finding Forest bait egg")

			local v2251 = v2240(p644)

			if not v2251 then
				p643:_setStatus("No Forest bait egg available")

				return false
			end

			local Position = v2251.BottomCFrame and v2251.BottomCFrame.Position or v2251.BoundsCFrame and v2251.BoundsCFrame.Position or Vector3.new(596.6, 67.7, -325)
			local vector32 = Vector3.new(Position.X, Position.Y + 2.5, Position.Z)
			local u2254 = "Forest:" .. tostring(v2251.NestId or "Slot_001")

			pcall(function()
				local AreaEggSlotIdentity = require(ReplicatedStorage2.Shared.Util.AreaEggSlotIdentity)

				if AreaEggSlotIdentity and v2251.AreaId and v2251.NestId then
					u2254 = AreaEggSlotIdentity.SlotKey(v2251.AreaId, v2251.NestId)
				end
			end)
			p643:_setStatus("Grabbing Forest bait egg")
			HumanoidRootPart.CFrame = cFrameNew(vector32)
			HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			RunService.Heartbeat:Wait()

			local v2256 = false
			local now = os.clock()
			local n40 = 0

			while os.clock() - now < 0.8 do
				HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart") or HumanoidRootPart

				if HumanoidRootPart.Position.Y < 65 then
					HumanoidRootPart.CFrame = cFrameNew(vector32)
					HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				end

				if n40 <= os.clock() then
					n40 = os.clock() + 0.1
					task.spawn(function()
						pcall(function()
							EggState2.CarryFieldEgg(v2251.Uid, u2254)
						end)
					end)
					task.spawn(function()
						pcall(function()
							local Remotes = require(ReplicatedStorage2.Shared.Remotes)

							if Remotes and Remotes.EggWorld and Remotes.EggWorld.AskFieldEggCarry then
								Remotes.EggWorld.AskFieldEggCarry:InvokeServer({
									Uid = v2251.Uid,
									FirstAreaSlotKey = u2254
								})
							end
						end)
					end)
				end

				local u2260

				pcall(function()
					u2260 = EggState2.ReadFieldEgg(v2251.Uid)
				end)

				if u2260 and u2260.State == "Carried" and u2260.CarrierUserId == LocalPlayer2.UserId then
					v2256 = true

					break
				else
					RunService.Heartbeat:Wait()
				end
			end

			if not v2256 then
				p643:_setStatus("Failed to carry Forest bait egg")
				v2221()

				return false
			end

			p643:_setStatus("Moving to Forest Guard")

			local u2261, u2262 = v2227()
			local Position2, u2264, t91

			if u2261 then
				if not u2261:FindFirstChild("Collider") then
				end

				Position2 = u2262 and u2262.Position or Vector3.new(596.6, 69.4, -317.1)
				HumanoidRootPart.CFrame = cFrameNew(Position2.X, Position2.Y + 0.8, Position2.Z)
				HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				u2264 = false
				t91 = {}
			else
				Position2 = u2262 and u2262.Position or Vector3.new(596.6, 69.4, -317.1)
				HumanoidRootPart.CFrame = cFrameNew(Position2.X, Position2.Y + 0.8, Position2.Z)
				HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				u2264 = false
				t91 = {}
			end

			pcall(function()
				local RERigSyncRefresh = ReplicatedStorage2:FindFirstChild("Packages") and ReplicatedStorage2.Packages:FindFirstChild("Networking") and ReplicatedStorage2.Packages.Networking:FindFirstChild("RE/RigSync/Refresh")

				if RERigSyncRefresh then
					table.insert(t91, RERigSyncRefresh.OnClientEvent:Connect(function()
						u2264 = true
					end))
				end
			end)
			pcall(function()
				local Remotes = require(ReplicatedStorage2.Shared.Remotes)

				if Remotes and Remotes.EggWorld and Remotes.EggWorld.OwnerDropped then
					table.insert(t91, Remotes.EggWorld.OwnerDropped.OnClientEvent:Connect(function()
						u2264 = true
					end))
				end
			end)
			table.insert(t91, Humanoid.StateChanged:Connect(function(old, new)
				if new == Enum.HumanoidStateType.Ragdoll or new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.PlatformStanding then
					u2264 = true
				end
			end))
			table.insert(t91, Humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
				if Humanoid.PlatformStand then
					u2264 = true
				end
			end))

			local function v2268()
				local v2269, v2270 = v2227()

				u2261 = v2269
				u2262 = v2270

				local Position3 = u2262 and u2262.Position or Position2
				local HumanoidRootPart2 = Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart2 then
					HumanoidRootPart2.CFrame = cFrameNew(Position3.X, Position3.Y + 0.8, Position3.Z)
					HumanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
				end

				local Collider = u2261 and u2261:FindFirstChild("Collider") or u2262

				if Collider and type(firetouchinterest) == "function" and HumanoidRootPart2 then
					pcall(function()
						firetouchinterest(HumanoidRootPart2, Collider, 0)
						firetouchinterest(HumanoidRootPart2, Collider, 1)
					end)
				end

				pcall(function()
					local Remotes = require(ReplicatedStorage2.Shared.Remotes)

					if Remotes then
						if Remotes.GuardPatrol and Remotes.GuardPatrol.ForestStrike then
							Remotes.GuardPatrol.ForestStrike:FireServer({
								EggUid = v2251.Uid,
								GuardCFrame = u2262 and u2262.CFrame or cFrameNew(Position3)
							})
						end
					end
				end)
			end

			p643:_setStatus("Triggering Forest Guard hit")
			v2268()

			local v2275 = os.clock() + 0.75
			local v2276 = os.clock() + 0.05

			while os.clock() < v2275 and not u2264 do
				local Humanoid2 = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChildOfClass("Humanoid")

				if Humanoid2 and (Humanoid2.PlatformStand or Humanoid2.Sit) then
					u2264 = true

					break
				end

				local HumanoidRootPart2 = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart2 and HumanoidRootPart2.AssemblyLinearVelocity.Magnitude > 18 then
					u2264 = true

					break
				else
					if HumanoidRootPart2 and HumanoidRootPart2.Position.Y < 65 then
						HumanoidRootPart2.CFrame = cFrameNew(Position2.X, 70, Position2.Z)
						HumanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
					end

					if v2276 <= os.clock() then
						v2276 = os.clock() + 0.05
						v2268()
					end

					RunService.Heartbeat:Wait()
				end
			end

			for _, v in ipairs(t91) do
				pcall(v.Disconnect, v)
			end

			if not u2264 then
				p643:_setStatus("Forest Guard hit timed out")
				v2221()

				return false, v2251.Uid
			end

			p643:_setStatus("Recovering posture")
			v2221()

			local v2281 = os.clock() + 0.35

			while os.clock() < v2281 do
				local Humanoid2 = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChildOfClass("Humanoid")
				local HumanoidRootPart2 = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("HumanoidRootPart")

				if not Humanoid2 or not HumanoidRootPart2 or Humanoid2.PlatformStand or Humanoid2.Sit then
					v2221()
					RunService.Heartbeat:Wait()
				else
					local state = Humanoid2:GetState()

					if state ~= Enum.HumanoidStateType.Ragdoll and state ~= Enum.HumanoidStateType.FallingDown and state ~= Enum.HumanoidStateType.PlatformStanding then
						HumanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
						HumanoidRootPart2.AssemblyAngularVelocity = Vector3.zero

						break
					end

					v2221()
					RunService.Heartbeat:Wait()
				end
			end

			return true, v2251.Uid
		end
		t85._swingBatAt = function(p645, p646, p647)
			if not p647 or p647.Parent ~= LocalPlayer2.Character then
				return false
			end

			p645.swingSeq += 1

			local v2285 = string.format("%d:%d:%d", LocalPlayer2.UserId, p645.swingSeq, math.floor(workspace:GetServerTimeNow() * 1000))

			local function v2286()
				require(ReplicatedStorage2.Shared.Remotes).BatSwing.Trigger:FireServer(p646, v2285)
			end

			return pcall(v2286)
		end
		t85._returnSafe = function(p648)
			local eggRuntime = p648.eggRuntime
			local Character = LocalPlayer2.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

			if not eggRuntime or not HumanoidRootPart or not Humanoid or eggRuntime:_isInSafeArea(HumanoidRootPart) then
				return
			end

			local v2291 = eggRuntime:_resolveSafeCFrame(HumanoidRootPart)

			if not v2291 then
				return
			end

			p648:_setStatus("Returning to safe zone")
			v232(HumanoidRootPart, Humanoid, v2291, function()
				return Humanoid.Health <= 0 or not HumanoidRootPart.Parent
			end, false, nil, true)
		end
		t85.intercept = function(p649, p650)
			if p649.running then
				return false
			end

			local HumanoidRootPart = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart then
				return false
			end

			for _, v in ipairs(p649:carriers()) do
				if v.record.Uid == p650 then
					if v.root.Position.X <= 552.2 or (v.root.Position - HumanoidRootPart.Position).Magnitude > 80 then
						return false
					end

					p649.forced = true
					task.spawn(p649._chase, p649, v, true)

					return p649.running
				end
			end

			return false
		end

		local s5 = "_chase"

		local function v2296(p651, p652, p653)
			if p651.running then
				return
			end

			p651.running = true
			p651.attempts += 1

			local record = p652.record
			local Uid = record.Uid
			local v2299 = p651.catalog.resolve(record)
			local player = p652.player
			local DisplayName = player.DisplayName or player.Name

			if p651.godMode then
				p651.godMode:stopDefend()
			end

			if not p653 then
				p651:_returnSafe()
				p651:_setStatus(string.format("Priming at Forest Guard for %s", DisplayName))

				local ok, result, result2 = pcall(p651._primeForest, p651, Uid)
				local u2305

				if ok and not result and result2 then
					pcall(function()
						u2305 = EggState2.ReadFieldEgg(result2)
					end)
				end

				if u2305 and u2305.State == "Carried" and u2305.CarrierUserId == LocalPlayer2.UserId then
					p651:_returnSafe()
					p651:_log(DisplayName, v2299.name, "Forest priming failed")
					p651:_setStatus(p651.enabled and "looking for a carrier" or "idle")
					p651.running = false
					p651.forced = false

					return
				end
			end

			local godMode = p651.godMode and p651.godMode:_equipBat()
			local v2307 = os.clock() + (p653 and 8 or 16)
			local s6 = "could not catch them"
			local n41 = 0
			local n42 = 0
			local now
			local v2312
			local now2
			local t92 = {}
			local vector32 = Vector3.zero
			local attribute = player:GetAttribute("RagdollEndTime") or false
			local n43 = 0.1

			pcall(function()
				n43 = math.clamp(LocalPlayer2:GetNetworkPing() or 0.1, 0.03, 0.6)
			end)

			local v2318 = math.clamp(0.14 + n43, 0.14, 0.35)
			local hitIdx = p651.hitIdx or p651.leadIdx

			p651.leadIdx = hitIdx or 1
			p651.missStreak = 0

			local connection

			pcall(function()
				connection = RunService.Stepped:Connect(function()
					local Character = LocalPlayer2.Character

					if Character then
						for _, descendant in ipairs(Character:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanCollide = false
							end
						end
					end
				end)
			end)
			p651:_setStatus(string.format("Chasing %s", DisplayName))

			while os.clock() < v2307 do
				local result = RunService.PreSimulation:Wait()

				if not p651.enabled and not p651.forced then
					s6 = "stopped"

					break
				end

				local u2325

				pcall(function()
					u2325 = EggState2.ReadFieldEgg(Uid)
				end)

				local State = u2325 and u2325.State

				if not u2325 or State == "Slot" or State == "GuardCarried" then
					s6 = "egg reset"

					break
				end

				if State == "Claimed" then
					s6 = "they banked it"

					break
				end

				if State == "Carried" and u2325.CarrierUserId == LocalPlayer2.UserId then
					s6 = "taken"

					break
				end

				if State == "Dropped" then
					if now and os.clock() - now <= 1 then
						p651.hitIdx = p651.leadIdx
					end

					p651:_setStatus(string.format("Grabbing dropped egg from %s", DisplayName))
					s6 = p651:_grab(u2325) and "taken" or "someone else grabbed it"

					break
				end

				local Character = LocalPlayer2.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

				if not HumanoidRootPart or not Humanoid or Humanoid.Health <= 0 then
					s6 = "character died"

					break
				end

				local HumanoidRootPart2, now3, v2332, AssemblyLinearVelocity, vector33, Magnitude, LookVector, vector34, Unit, Unit2, clamp, v2341, v2342, vector35, cFrame, v2345, Magnitude2, v2347, v2348, v2349, v2350, attribute2, v2352

				if u2325.CarrierUserId == player.UserId then
					HumanoidRootPart2 = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

					if not HumanoidRootPart2 then
						s6 = "lost sight of them"

						break
					end

					if HumanoidRootPart2.Position.X <= 552.2 then
						s6 = "banked"

						break
					end

					now3 = os.clock()
					v2332 = #t92 + 1
					t92[v2332] = {
						t = now3,
						p = HumanoidRootPart2.Position
					}

					while #t92 > 2 and now3 - t92[1].t > 0.4 do
						table.remove(t92, 1)
					end

					AssemblyLinearVelocity = HumanoidRootPart2.AssemblyLinearVelocity

					if Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z).Magnitude > 8 then
						vector32 = AssemblyLinearVelocity
					elseif #t92 >= 2 and now3 - t92[1].t > 0.15 then
						vector32 = (HumanoidRootPart2.Position - t92[1].p) / (now3 - t92[1].t)
					end

					vector33 = Vector3.new(vector32.X, 0, vector32.Z)
					Magnitude = vector33.Magnitude

					if Magnitude > 6 then
						Unit2 = vector33.Unit
					else
						LookVector = HumanoidRootPart2.CFrame.LookVector
						vector34 = Vector3.new(LookVector.X, 0, LookVector.Z)
						Unit = vector34.Magnitude > 0.05 and vector34.Unit or Vector3.new(-1, 0, 0)
						Unit2 = Unit
					end

					clamp = math.clamp
					v2341 = t86[p651.leadIdx] or 1
					v2342 = HumanoidRootPart2.Position + Unit2 * clamp(v2341 * Magnitude * v2318, 3, 110)

					if v2342.X < 557.2 then
						v2342 = Vector3.new(557.2, v2342.Y, v2342.Z)
					end

					vector35 = Vector3.new(HumanoidRootPart2.Position.X, v2342.Y, HumanoidRootPart2.Position.Z)

					if (vector35 - v2342).Magnitude < 0.5 then
						vector35 = v2342 - Unit2
					end

					cFrame = lookAt(v2342, vector35)
					v2345 = v2342 - HumanoidRootPart.Position
					Magnitude2 = v2345.Magnitude
					v2347 = v20()
					v2348 = v2347 * math.min(result, 0.05)
					v27(Character, v2347 * t1.HEADROOM)

					if v2348 < Magnitude2 then
						HumanoidRootPart.CFrame = cFrameNew(HumanoidRootPart.Position + v2345.Unit * v2348) * cFrame.Rotation
						HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						v2349 = v2345.Unit * v2347
					else
						HumanoidRootPart.CFrame = cFrame
						HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart2.AssemblyLinearVelocity
						v2349 = HumanoidRootPart2.AssemblyLinearVelocity
					end

					HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero

					if not v32(Humanoid, HumanoidRootPart, v2347, v2349) then
						v31(Humanoid, HumanoidRootPart, v2347)
						v32(Humanoid, HumanoidRootPart, v2347, v2349)
					end

					v2350 = Magnitude * result * 1.5

					if not (Magnitude2 <= 5 + v2350) then
						if 12 + v2350 < Magnitude2 and now2 then
							now2 = nil
							p651:_setStatus(string.format("Chasing %s", DisplayName))
						end
					elseif not now2 then
						now2 = os.clock()
						p651:_setStatus(string.format("Attacking %s", DisplayName))
					end

					attribute2 = player:GetAttribute("RagdollEndTime") or false

					if attribute2 ~= attribute then
						attribute = attribute2
						p651.hitIdx = p651.leadIdx
						p651.missStreak = 0
						now = nil
					end

					if (not godMode or godMode.Parent ~= Character) and n42 <= os.clock() then
						n42 = os.clock() + 0.5
						task.spawn(function()
							godMode = p651.godMode and p651.godMode:_equipBat() or godMode
						end)
					end

					v2352 = godMode and tonumber(godMode:GetAttribute("CooldownEndTime")) or 0

					if now and os.clock() - now > 0.9 then
						if v2352 ~= v2312 then
							p651.missStreak += 1

							if p651.missStreak >= 2 then
								p651.missStreak = 0
								p651.leadIdx = p651.leadIdx % #t86 + 1
								now2 = nil
							end
						end

						now = nil
					end

					if godMode and godMode.Parent == Character and now2 and v2318 + 0.05 <= os.clock() - now2 and godMode:GetAttribute("CooldownActive") ~= true and v2352 <= workspace:GetServerTimeNow() and os.clock() - n41 >= 0.35 then
						n41 = os.clock()

						if not now then
							now = os.clock()
							v2312 = v2352
						end

						task.spawn(p651._swingBatAt, p651, player, godMode)
					end
				else
					local playerByUserId = Players2:GetPlayerByUserId(u2325.CarrierUserId or 0)

					if not playerByUserId then
						s6 = "taken by another player"

						break
					end

					player = playerByUserId
					DisplayName = player.DisplayName or player.Name
					attribute = player:GetAttribute("RagdollEndTime") or false
					now2 = nil
					now = nil
					table.clear(t92)
					p651:_setStatus(string.format("Chasing %s", DisplayName))
					HumanoidRootPart2 = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

					if not HumanoidRootPart2 then
						s6 = "lost sight of them"

						break
					end

					if HumanoidRootPart2.Position.X <= 552.2 then
						s6 = "banked"

						break
					end

					now3 = os.clock()
					v2332 = #t92 + 1
					t92[v2332] = {
						t = now3,
						p = HumanoidRootPart2.Position
					}

					while #t92 > 2 and now3 - t92[1].t > 0.4 do
						table.remove(t92, 1)
					end

					AssemblyLinearVelocity = HumanoidRootPart2.AssemblyLinearVelocity

					if Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z).Magnitude > 8 then
						vector32 = AssemblyLinearVelocity
					elseif #t92 >= 2 and now3 - t92[1].t > 0.15 then
						vector32 = (HumanoidRootPart2.Position - t92[1].p) / (now3 - t92[1].t)
					end

					vector33 = Vector3.new(vector32.X, 0, vector32.Z)
					Magnitude = vector33.Magnitude

					if Magnitude > 6 then
						Unit2 = vector33.Unit
					else
						LookVector = HumanoidRootPart2.CFrame.LookVector
						vector34 = Vector3.new(LookVector.X, 0, LookVector.Z)
						Unit = vector34.Magnitude > 0.05 and vector34.Unit or Vector3.new(-1, 0, 0)
						Unit2 = Unit
					end

					clamp = math.clamp
					v2341 = t86[p651.leadIdx] or 1
					v2342 = HumanoidRootPart2.Position + Unit2 * clamp(v2341 * Magnitude * v2318, 3, 110)

					if v2342.X < 557.2 then
						v2342 = Vector3.new(557.2, v2342.Y, v2342.Z)
					end

					vector35 = Vector3.new(HumanoidRootPart2.Position.X, v2342.Y, HumanoidRootPart2.Position.Z)

					if (vector35 - v2342).Magnitude < 0.5 then
						vector35 = v2342 - Unit2
					end

					cFrame = lookAt(v2342, vector35)
					v2345 = v2342 - HumanoidRootPart.Position
					Magnitude2 = v2345.Magnitude
					v2347 = v20()
					v2348 = v2347 * math.min(result, 0.05)
					v27(Character, v2347 * t1.HEADROOM)

					if v2348 < Magnitude2 then
						HumanoidRootPart.CFrame = cFrameNew(HumanoidRootPart.Position + v2345.Unit * v2348) * cFrame.Rotation
						HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						v2349 = v2345.Unit * v2347
					else
						HumanoidRootPart.CFrame = cFrame
						HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart2.AssemblyLinearVelocity
						v2349 = HumanoidRootPart2.AssemblyLinearVelocity
					end

					HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero

					if not v32(Humanoid, HumanoidRootPart, v2347, v2349) then
						v31(Humanoid, HumanoidRootPart, v2347)
						v32(Humanoid, HumanoidRootPart, v2347, v2349)
					end

					v2350 = Magnitude * result * 1.5

					if not (Magnitude2 <= 5 + v2350) then
						if 12 + v2350 < Magnitude2 and now2 then
							now2 = nil
							p651:_setStatus(string.format("Chasing %s", DisplayName))
						end
					elseif not now2 then
						now2 = os.clock()
						p651:_setStatus(string.format("Attacking %s", DisplayName))
					end

					attribute2 = player:GetAttribute("RagdollEndTime") or false

					if attribute2 ~= attribute then
						attribute = attribute2
						p651.hitIdx = p651.leadIdx
						p651.missStreak = 0
						now = nil
					end

					if (not godMode or godMode.Parent ~= Character) and n42 <= os.clock() then
						n42 = os.clock() + 0.5
						task.spawn(function()
							godMode = p651.godMode and p651.godMode:_equipBat() or godMode
						end)
					end

					v2352 = godMode and tonumber(godMode:GetAttribute("CooldownEndTime")) or 0

					if now and os.clock() - now > 0.9 then
						if v2352 ~= v2312 then
							p651.missStreak += 1

							if p651.missStreak >= 2 then
								p651.missStreak = 0
								p651.leadIdx = p651.leadIdx % #t86 + 1
								now2 = nil
							end
						end

						now = nil
					end

					if godMode and godMode.Parent == Character and now2 and v2318 + 0.05 <= os.clock() - now2 and godMode:GetAttribute("CooldownActive") ~= true and v2352 <= workspace:GetServerTimeNow() and os.clock() - n41 >= 0.35 then
						n41 = os.clock()

						if not now then
							now = os.clock()
							v2312 = v2352
						end

						task.spawn(p651._swingBatAt, p651, player, godMode)
					end
				end
			end

			if connection then
				pcall(function()
					connection:Disconnect()
				end)
			end

			if s6 == "taken" then
				p651.taken += 1
				pcall(function()
					local Humanoid = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid then
						Humanoid:UnequipTools()
					end
				end)
			else
				p651.blacklist[Uid] = os.clock() + 20
			end

			p651:_returnSafe()
			p651:_log(DisplayName, v2299.name, s6)
			p651:_setStatus(p651.enabled and "looking for a carrier" or "idle")
			p651.running = false
			p651.forced = false
		end

		t85[s5] = v2296
		t85._grab = function(p654, p655)
			local eggRuntime = p654.eggRuntime
			local Uid = p655.Uid
			local v2357 = os.clock() + 3
			local n44 = 0

			while true do
				if not (os.clock() < v2357) then
					return false
				end

				local u2359

				pcall(function()
					u2359 = EggState2.ReadFieldEgg(Uid)
				end)

				local State = u2359 and u2359.State

				if State == "Carried" then
					if u2359.CarrierUserId ~= LocalPlayer2.UserId then
						return false
					end

					if genv.__SenaV4Webhook then
						local ok, result = pcall(p654.catalog.resolve, u2359)

						pcall(genv.__SenaV4Webhook.stolen, u2359, ok and result or nil, "player carry")
					end

					return true
				end

				if State ~= "Dropped" then
					return false
				end

				local Character = LocalPlayer2.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

				if not HumanoidRootPart or not Humanoid or Humanoid.Health <= 0 then
					break
				end

				local cFrame = eggRuntime and eggRuntime:_resolveEggDestination(u2359, HumanoidRootPart, Humanoid)

				if not cFrame then
					local Position = u2359.BottomCFrame and u2359.BottomCFrame.Position or u2359.BoundsCFrame and u2359.BoundsCFrame.Position

					cFrame = Position and cFrameNew(Position.X, Position.Y + 2.5, Position.Z)
				end

				if cFrame then
					HumanoidRootPart.CFrame = cFrame
					HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				end

				if n44 <= os.clock() then
					n44 = os.clock() + 0.1
					task.spawn(function()
						pcall(function()
							EggState2.CarryFieldEgg(Uid)
						end)
					end)
					task.spawn(function()
						pcall(function()
							require(ReplicatedStorage2.Shared.Remotes).EggWorld.AskFieldEggCarry:InvokeServer({
								Uid = Uid
							})
						end)
					end)
				end

				RunService.Heartbeat:Wait()
			end

			return false
		end
		t85._start = function(p656)
			if p656.loop then
				return
			end

			p656.loop = task.spawn(function()
				while true do
					task.wait(0.4)

					if genv.ChloeX_Running == nil and genv.__SenaV4PlayerSteal ~= p656 then
						break
					end

					for k, v in pairs(p656.blacklist) do
						if v < os.clock() then
							p656.blacklist[k] = nil
						end
					end

					local eggRuntime = p656.eggRuntime
					local __SenaV4ScrambleRuntime = genv.__SenaV4ScrambleRuntime

					if p656.enabled and not p656.running and (not eggRuntime or not eggRuntime.running and (not eggRuntime.carry or not eggRuntime.carry.active)) and (__SenaV4ScrambleRuntime == nil or __SenaV4ScrambleRuntime.active ~= true) then
						local v2372 = p656:_pick()

						if v2372 then
							p656:_chase(v2372)
						end
					end
				end

				p656.loop = nil
			end)
		end

		return t85
	end

	local v2373 = v2149()

	v614 = v1885.new(v612)
	v614:install()
	v614:setEnabled(senaV4Config.AntiGuardKnockback == true)
	genv.__SenaV4AntiGuard = v614
	v615 = v1932.new(v612)
	v615:setEnabled(senaV4Config.GodMode == nil and true or senaV4Config.GodMode == true)
	genv.__SenaV4GodMode = v615

	local v2374 = v2373.new(v612, v615, v611)

	local function v2375()
		local Players2 = game:GetService("Players")
		local RunService2 = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local LocalPlayer2 = Players2.LocalPlayer
		local t93 = {}

		t93.__index = t93
		t93.new = function()
			local obj = setmetatable({}, t93)

			obj.flyEnabled = false
			obj.flyConnection = nil
			obj.flyMover = nil
			obj.grabEnabled = false
			obj.grabConnection = nil
			obj.grabOriginals = setmetatable({}, {
				__mode = "k"
			})
			obj.jumpEnabled = false
			obj.jumpConnections = {}
			obj.lastJumpAt = 0
			obj.speedMultiplier = 1
			obj.speedModules = nil
			obj.speedConnection = nil

			return obj
		end
		t93._root = function()
			local Character = LocalPlayer2.Character

			return Character and Character:FindFirstChild("HumanoidRootPart")
		end
		t93._humanoid = function()
			local Character = LocalPlayer2.Character

			return Character and Character:FindFirstChildOfClass("Humanoid")
		end
		t93._ensureMover = function(p657, p658)
			if p657.flyMover and p657.flyMover.Parent == p658 then
				return
			end

			if p657.flyMover then
				pcall(function()
					p657.flyMover:Destroy()
				end)
			end

			local BodyVelocity = Instance.new("BodyVelocity")

			BodyVelocity.Name = "SenaFlyCaptureHover"
			BodyVelocity.MaxForce = Vector3.new(0, 9e9, 0)
			BodyVelocity.Velocity = Vector3.zero
			BodyVelocity.Parent = p658
			p657.flyMover = BodyVelocity
		end

		local function v2385()
			local __SenaV4TreadmillManager = genv.__SenaV4TreadmillManager

			return __SenaV4TreadmillManager ~= nil and not __SenaV4TreadmillManager.destroyed and __SenaV4TreadmillManager.config ~= nil and __SenaV4TreadmillManager.config.idleFarm == true
		end

		local t94 = {
			at = 0,
			value = false
		}

		local function v2388()
			local now = os.clock()

			if now - t94.at < 0.25 then
				return t94.value
			end

			t94.at = now

			local value = false

			pcall(function()
				local EggState2 = require(game:GetService("ReplicatedStorage").Client.EggState)
				local GetAreaEggSnapshot = EggState2.GetAreaEggSnapshot and EggState2.GetAreaEggSnapshot()

				if (not GetAreaEggSnapshot or not GetAreaEggSnapshot.Records) and EggState2.ReadFieldEggs then
					GetAreaEggSnapshot = EggState2.ReadFieldEggs()
				end

				local ipairs_ = ipairs
				local Records = GetAreaEggSnapshot and GetAreaEggSnapshot.Records or {}

				for _, Record in ipairs_(Records) do
					if Record.State == "Carried" and Record.CarrierUserId == LocalPlayer2.UserId then
						value = true

						break
					end
				end
			end)
			t94.value = value

			return value
		end

		t93._dropMover = function(p659, p660)
			if p659.flyMover then
				pcall(function()
					p659.flyMover:Destroy()
				end)
				p659.flyMover = nil
			end

			local SenaFlyCaptureHover = p660 and p660:FindFirstChild("SenaFlyCaptureHover")

			if SenaFlyCaptureHover then
				pcall(function()
					SenaFlyCaptureHover:Destroy()
				end)
			end
		end
		t93.setFlyForCapture = function(p661, p662)
			p661.flyEnabled = p662 == true

			if p661.flyEnabled then
				if not p661.flyConnection then
					p661.flyAnchored = false
					p661.flyConnection = RunService2.PreSimulation:Connect(function()
						if not p661.flyEnabled then
							return
						end

						local v2398 = p661:_root()

						if not v2398 then
							return
						end

						local running = not v2388() or v2385() or next(t9) ~= nil or v612 and (v612.running or v612.activeTween)

						if not running then
							local __SenaV4PlayerSteal = genv.__SenaV4PlayerSteal

							if __SenaV4PlayerSteal and __SenaV4PlayerSteal.running then
								running = true
							end
						end

						if running then
							if p661.flyAnchored then
								pcall(function()
									v2398.Anchored = false
								end)
								p661.flyAnchored = false
							end

							return
						end

						if v2398.Position.Y < 109 then
							if p661.flyAnchored then
								pcall(function()
									v2398.Anchored = false
								end)
								p661.flyAnchored = false
							end

							v2398.CFrame = cFrameNew(v2398.Position.X, v2398.Position.Y + math.min(110 - v2398.Position.Y, 4), v2398.Position.Z) * v2398.CFrame.Rotation
							v2398.AssemblyLinearVelocity = Vector3.zero
							v2398.AssemblyAngularVelocity = Vector3.zero
						elseif v2398.Anchored then
							p661.flyAnchored = true
						else
							pcall(function()
								v2398.Anchored = true
							end)
							p661.flyAnchored = true
						end
					end)

					return
				end

				return
			end

			if p661.flyConnection then
				pcall(function()
					p661.flyConnection:Disconnect()
				end)
				p661.flyConnection = nil
			end

			if p661.flyMover then
				pcall(function()
					p661.flyMover:Destroy()
				end)
				p661.flyMover = nil
			end

			local v2401 = p661:_root()

			if v2401 then
				local SenaFlyCaptureHover = v2401:FindFirstChild("SenaFlyCaptureHover")

				if SenaFlyCaptureHover then
					pcall(function()
						SenaFlyCaptureHover:Destroy()
					end)
				end

				if p661.flyAnchored then
					pcall(function()
						v2401.Anchored = false
					end)
				end
			end

			p661.flyAnchored = false
		end
		t93._isGrabPrompt = function(p663, p664)
			return p664:IsA("ProximityPrompt") and p664.Name == "CarryAreaEgg"
		end
		t93._applyGrab = function(p665, p666)
			if not p665:_isGrabPrompt(p666) then
				return
			end

			if p665.grabOriginals[p666] == nil then
				p665.grabOriginals[p666] = p666.HoldDuration
			end

			if p666.HoldDuration > 0.1 then
				p666.HoldDuration = 0.1
			end
		end
		t93._restoreGrab = function(p667)
			local v2403 = workspace:GetAttribute("FastEggPickupTime") and 0.25 or 1.2

			for k, grabOriginal in pairs(p667.grabOriginals) do
				pcall(function()
					if k.Parent then
						k.HoldDuration = tonumber(grabOriginal) and grabOriginal > 0.1 and grabOriginal or v2403
					end
				end)
			end

			p667.grabOriginals = setmetatable({}, {
				__mode = "k"
			})
		end
		t93._fireGrab = function(p668, p669)
			if not p668:_isGrabPrompt(p669) or not p669.Enabled then
				return
			end

			p668.grabFiring = p668.grabFiring or setmetatable({}, {
				__mode = "k"
			})

			if p668.grabFiring[p669] then
				return
			end

			local Parent = p669.Parent
			local v2407 = p668:_root()

			if not v2407 or not Parent or not Parent:IsA("BasePart") then
				return
			end

			if (tonumber(p669.MaxActivationDistance) or 10) + 1 < (Parent.Position - v2407.Position).Magnitude then
				return
			end

			p668.grabFiring[p669] = true
			task.spawn(function()
				pcall(function()
					local v2408 = math.max(0.1, tonumber(p669.HoldDuration) or 0.1)

					p669:InputHoldBegin()
					task.wait(v2408 + 0.05)
					p669:InputHoldEnd()
				end)
				task.wait(0.4)

				if p668.grabFiring then
					p668.grabFiring[p669] = nil
				end
			end)
		end
		t93.setInstantGrab = function(p670, p671)
			p670.grabEnabled = p671 == true

			if p670.grabEnabled then
				for _, descendant in ipairs(workspace:GetDescendants()) do
					p670:_applyGrab(descendant)
				end

				if not p670.grabConnection then
					p670.grabConnection = workspace.DescendantAdded:Connect(function(descendant)
						if p670.grabEnabled then
							if p670:_isGrabPrompt(descendant) then
								task.defer(function()
									p670:_applyGrab(descendant)
								end)
							end
						end
					end)
				end
			else
				if p670.grabConnection then
					pcall(function()
						p670.grabConnection:Disconnect()
					end)
					p670.grabConnection = nil
				end

				p670.grabFireLoop = nil
				p670:_restoreGrab()
			end
		end
		t93.triggerJump = function(p672)
			if not p672.jumpEnabled then
				return
			end

			local now = os.clock()

			if now - p672.lastJumpAt < 0.08 then
				return
			end

			local v2412 = p672:_humanoid()
			local v2413 = p672:_root()

			if not v2412 or not v2413 or v2412.Health <= 0 then
				return
			end

			p672.lastJumpAt = now
			pcall(function()
				v2412:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
				v2412:ChangeState(Enum.HumanoidStateType.Jumping)
				v2412.Jump = true
			end)

			local n45 = 55

			if v2412.UseJumpPower and v2412.JumpPower > 0 then
				n45 = v2412.JumpPower
			elseif v2412.JumpHeight and v2412.JumpHeight > 0 then
				n45 = math.sqrt(2 * workspace.Gravity * v2412.JumpHeight)
			end

			if n45 < 55 then
				n45 = 55
			end

			pcall(function()
				local AssemblyLinearVelocity = v2413.AssemblyLinearVelocity

				v2413.AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity.X, n45, AssemblyLinearVelocity.Z)
			end)
		end
		t93.setInfiniteJump = function(p673, p674)
			p673.jumpEnabled = p674 == true

			if #p673.jumpConnections > 0 then
				return
			end

			pcall(function()
				table.insert(p673.jumpConnections, UserInputService.InputBegan:Connect(function(input)
					if not p673.jumpEnabled then
						return
					end

					if UserInputService:GetFocusedTextBox() then
						return
					end

					if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.ButtonA then
						p673:triggerJump()
					end
				end))
				table.insert(p673.jumpConnections, UserInputService.JumpRequest:Connect(function()
					if not p673.jumpEnabled then
						return
					end

					if UserInputService:GetFocusedTextBox() then
						return
					end

					p673:triggerJump()
				end))
			end)
			task.spawn(function()
				while true do
					RunService2.Heartbeat:Wait()

					if p673.jumpEnabled and not UserInputService:GetFocusedTextBox() then
						local u2416 = false

						pcall(function()
							if UserInputService:IsKeyDown(Enum.KeyCode.Space) or UserInputService:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA) then
								u2416 = true
							end
						end)

						if u2416 and os.clock() - p673.lastJumpAt >= 0.28 then
							p673:triggerJump()
						end
					end
				end
			end)
		end
		t93._gameWalkSpeed = function(p675)
			local speedModules = p675.speedModules

			if not speedModules then
				speedModules = {}
				pcall(function()
					speedModules.TreadmillUtil = require(ReplicatedStorage.Shared.Util.TreadmillUtil)
				end)
				pcall(function()
					speedModules.Projection = require(ReplicatedStorage.Client.SpeedPowerProjection)
				end)
				pcall(function()
					speedModules.Save = require(ReplicatedStorage.Shared.Save)
				end)
				p675.speedModules = speedModules
			end

			if not speedModules.TreadmillUtil or not speedModules.TreadmillUtil.SpeedPowerToWalkSpeed then
				return nil
			end

			local SpeedPower

			if speedModules.Projection then
				pcall(function()
					SpeedPower = speedModules.Projection.ReadProjected()
				end)
			end

			if type(SpeedPower) ~= "number" and speedModules.Save then
				pcall(function()
					SpeedPower = (speedModules.Save.Peek or speedModules.Save.Get)().SpeedPower
				end)
			end

			if type(SpeedPower) ~= "number" then
				return nil
			end

			local ok, result = pcall(speedModules.TreadmillUtil.SpeedPowerToWalkSpeed, SpeedPower)
			local v2421 = ok and tonumber(result) or nil

			return v2421
		end
		t93.setSpeedMultiplier = function(p676, p677)
			p676.speedMultiplier = math.clamp(tonumber(p677) or 1, 1, 2.1)
			p676:_applySpeedMultiplier()

			if not p676.speedConnection then
				p676.speedConnection = RunService2.Heartbeat:Connect(function()
					if p676.speedMultiplier <= 1.001 then
						return
					end

					p676:_applySpeedMultiplier()
				end)

				return
			end
		end
		t93._applySpeedMultiplier = function(p678)
			local __SenaV4TreadmillManager = genv.__SenaV4TreadmillManager

			if __SenaV4TreadmillManager and __SenaV4TreadmillManager.activeTreadmill ~= nil then
				return
			end

			local v2423 = p678:_humanoid()

			if not v2423 then
				return
			end

			local v2424 = p678:_gameWalkSpeed()

			if not v2424 or v2424 <= 0 then
				return
			end

			local walkSpeed = v2424 * p678.speedMultiplier

			if math.abs(v2423.WalkSpeed - walkSpeed) > 0.05 then
				pcall(function()
					v2423.WalkSpeed = walkSpeed
				end)
			end
		end
		t93.destroy = function(p679)
			p679:setFlyForCapture(false)
			p679:setInstantGrab(false)
			p679.jumpEnabled = false

			for _, jumpConnection in ipairs(p679.jumpConnections) do
				pcall(function()
					jumpConnection:Disconnect()
				end)
			end

			p679.jumpConnections = {}

			if p679.speedConnection then
				pcall(function()
					p679.speedConnection:Disconnect()
				end)
				p679.speedConnection = nil
			end
		end

		return t93
	end

	local v2428 = v2375().new()

	genv.__SenaV4MovementExtras = v2428

	if senaV4Config.FlyForCapture then
		v2428:setFlyForCapture(true)
	end

	if senaV4Config.InstantGrab then
		v2428:setInstantGrab(true)
	end

	if senaV4Config.InfiniteJump then
		v2428:setInfiniteJump(true)
	end

	if (senaV4Config.WalkSpeedMultiplier or 1) > 1 then
		v2428:setSpeedMultiplier(senaV4Config.WalkSpeedMultiplier)
	end

	local function v2429()
		local Players2 = game:GetService("Players")
		local RunService2 = game:GetService("RunService")
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local LocalPlayer2 = Players2.LocalPlayer
		local cFrame = cFrameNew(544.76, 71.5, -416.48)
		local t95 = {}

		t95.__index = t95
		t95.new = function()
			local obj = setmetatable({}, t95)

			obj.enabled = false
			obj.running = false
			obj.destroyed = false
			obj.connection = nil
			obj.wasHolding = false
			obj.lastResult = "Idle"

			return obj
		end
		t95._character = function()
			return LocalPlayer2.Character
		end
		t95._root = function(p680)
			local v2437 = p680:_character()

			return v2437 and v2437:FindFirstChild("HumanoidRootPart")
		end
		t95._carriedUid = function()
			local Uid

			pcall(function()
				local EggState2 = require(ReplicatedStorage2.Client.EggState)
				local v2440

				if EggState2.GetAreaEggSnapshot then
					v2440 = EggState2.GetAreaEggSnapshot()
				end

				if (not v2440 or not v2440.Records) and EggState2.ReadFieldEggs then
					v2440 = EggState2.ReadFieldEggs()
				end

				if not v2440 or not v2440.Records then
					return
				end

				local UserId = LocalPlayer2.UserId

				for _, record in ipairs(v2440.Records) do
					if record.State == "Carried" and record.CarrierUserId == UserId then
						Uid = record.Uid

						return
					end
				end
			end)

			return Uid
		end
		t95._record = function(p681, p682)
			local ReadFieldEgg

			pcall(function()
				local EggState2 = require(ReplicatedStorage2.Client.EggState)

				ReadFieldEgg = EggState2.ReadFieldEgg and EggState2.ReadFieldEgg(p682)
			end)

			return ReadFieldEgg
		end
		t95._guardFor = function(p683, p684)
			local Guard

			pcall(function()
				local v2447 = p683:_record(p684)
				local v2448 = v14()
				local Areas = v2448 and v2448:FindFirstChild("Areas")
				local GuardAreas = Areas and Areas:FindFirstChild("GuardAreas")
				local AreaId = GuardAreas and v2447 and v2447.AreaId and GuardAreas:FindFirstChild(v2447.AreaId)

				Guard = AreaId and AreaId:FindFirstChild("Guard")
			end)

			return Guard
		end
		t95._skips = function(p685, p686)
			local __SenaV4EggRuntime = genv.__SenaV4EggRuntime

			if __SenaV4EggRuntime then
				if __SenaV4EggRuntime.instantPhase == "priming" then
					return true
				end

				if __SenaV4EggRuntime.enabled or __SenaV4EggRuntime.running then
					return true
				end
			end

			local __SenaV4PlayerSteal = genv.__SenaV4PlayerSteal

			if __SenaV4PlayerSteal and __SenaV4PlayerSteal.running then
				return true
			end

			if not p686 then
				return false
			end

			local v2454 = p685:_record(p686)

			return v2454 ~= nil and tostring(v2454.AreaId) == "Forest"
		end
		t95._freeze = function(p687, p688)
			local v2455 = p687:_character()
			local Humanoid = v2455 and v2455:FindFirstChildOfClass("Humanoid")
			local CurrentCamera = workspace.CurrentCamera
			local CFrame_2 = CurrentCamera and CurrentCamera.CFrame
			local CameraType = CurrentCamera and CurrentCamera.CameraType
			local clone

			pcall(function()
				v2455.Archivable = true
				clone = v2455:Clone()

				if p688 then
					pcall(function()
						clone:PivotTo(p688)
					end)
				end

				clone.Name = "SenaAntiHitGhost"

				for _, descendant in ipairs(clone:GetDescendants()) do
					if descendant:IsA("LuaSourceContainer") or descendant:IsA("Sound") then
						descendant:Destroy()
					elseif descendant:IsA("BasePart") then
						descendant.CanCollide = false
						descendant.Anchored = true
					end
				end

				clone.Parent = workspace

				for _, descendant in ipairs(v2455:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
						descendant.LocalTransparencyModifier = 1
					end

					if descendant:IsA("Trail") then
						descendant.Enabled = false
					end
				end

				if CurrentCamera then
					CurrentCamera.CameraType = Enum.CameraType.Scriptable
					CurrentCamera.CFrame = CFrame_2
				end
			end)

			local t96 = {}

			pcall(function()
				for _, descendant in ipairs(v2455:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
						t96[#t96 + 1] = descendant
					end
				end
			end)

			local function v2468()
				if CurrentCamera then
					CurrentCamera.CameraType = Enum.CameraType.Scriptable
					CurrentCamera.CFrame = CFrame_2
				end

				for _, v in ipairs(t96) do
					if v.Parent then
						v.LocalTransparencyModifier = 1
					end
				end
			end
			local function v2471(p689)
				pcall(function()
					if clone then
						clone:Destroy()
					end

					for _, descendant in ipairs(v2455:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.LocalTransparencyModifier = 0
						end

						if descendant:IsA("Trail") then
							descendant.Enabled = true
						end
					end

					if CurrentCamera then
						CurrentCamera.CameraType = CameraType ~= Enum.CameraType.Scriptable and CameraType or Enum.CameraType.Custom

						if Humanoid then
							CurrentCamera.CameraSubject = Humanoid
						end

						if p689 then
							CurrentCamera.CFrame = CFrame_2
						end
					end
				end)
			end

			return v2471, v2468
		end
		t95.shield = function(p690, p691)
			if not p690.enabled or p690.running then
				return false
			end

			if p690:_skips(p691) then
				return false
			end

			local v2474 = p690:_root()

			if not v2474 then
				return false
			end

			p690.running = true

			local CFrame_2 = v2474.CFrame
			local v2476 = p690:_guardFor(p691)

			local function v2477()
				local v2478 = p690:_root()

				if not v2478 then
					return false
				end

				v2478.CFrame = cFrame
				v2478.AssemblyLinearVelocity = Vector3.zero
				v2478.AssemblyAngularVelocity = Vector3.zero

				return true
			end

			v2477()

			local v2479, v2480 = p690:_freeze(CFrame_2)
			local n46 = 1
			local u2482 = false

			pcall(function()
				local now = os.clock()
				local v2484 = false

				while (os.clock() - now < 0.9 or v2484 and os.clock() - now < 1.6 and v2476 and (v2476:GetAttribute("GuardState") == "Waking" or v2476:GetAttribute("GuardState") == "Chasing")) and v2477() do
					v2480()
					n46 += 1

					local attribute = v2476 and v2476:GetAttribute("GuardState")

					if attribute == "Waking" or attribute == "Chasing" then
						v2484 = true
						RunService2.Heartbeat:Wait()
					elseif v2484 and attribute == "Sleeping" and os.clock() - now > 0.2 then
						u2482 = true

						break
					else
						RunService2.Heartbeat:Wait()
					end
				end
			end)
			v2479(true)
			p690.lastResult = (u2482 and "Guard slept" or "Held") .. " (" .. n46 .. " writes)"
			p690.running = false

			return true
		end
		t95._check = function(p692, p693)
			if not p692.enabled then
				p692.wasHolding = false

				return
			end

			local Uid

			if type(p693) == "table" and p693.IsCarrying and p693.Uid then
				Uid = p693.Uid
			else
				Uid = p692:_carriedUid()
			end

			local wasHolding = Uid ~= nil

			if wasHolding and not p692.wasHolding and not p692.running and not p692:_skips(Uid) then
				task.spawn(function()
					pcall(function()
						p692:shield(Uid)
					end)
				end)
			end

			p692.wasHolding = wasHolding
		end
		t95.setEnabled = function(p694, p695)
			p694.enabled = p695 == true

			if p694.enabled then
				p694.wasHolding = p694:_carriedUid() ~= nil
			end

			if not p694.watcher then
				p694.watcher = true
				task.spawn(function()
					while not p694.destroyed do
						if not p694.enabled or p694.running then
							task.wait(0.5)
						else
							pcall(function()
								p694:_check()
							end)
							task.wait(0.15)
						end
					end
				end)
			end

			if p694.connection then
				return
			end

			pcall(function()
				local EggState2 = require(ReplicatedStorage2.Client.EggState)

				if EggState2 and EggState2.CarryChanged then
					p694.connection = EggState2.CarryChanged:Connect(function(p696)
						task.defer(function()
							p694:_check(p696)
						end)
					end)
				end
			end)
		end
		t95.destroy = function(p697)
			p697.destroyed = true
			p697.enabled = false

			if p697.connection then
				pcall(function()
					p697.connection:Disconnect()
				end)
				p697.connection = nil
			end
		end

		return t95
	end

	local v2489 = v2429().new()

	genv.__SenaV4AntiHitGuard = v2489

	if senaV4Config.AntiHitGuard then
		v2489:setEnabled(true)
	end

	genv.__SenaV4PlayerSteal = v2374
end

do
	local t97 = {
		at = 0,
		value = false
	}

	genv.__SenaV4StealWantsCharacter = function()
		local __SenaV4PlayerSteal = genv.__SenaV4PlayerSteal

		if __SenaV4PlayerSteal and __SenaV4PlayerSteal.running then
			return true
		end

		local __SenaV4EggRuntime = genv.__SenaV4EggRuntime

		if not __SenaV4EggRuntime or not __SenaV4EggRuntime.enabled or __SenaV4EggRuntime.destroyed then
			return false
		end

		if __SenaV4EggRuntime.running or __SenaV4EggRuntime.activeTween and not __SenaV4EggRuntime.activeTween.sharedTravel or __SenaV4EggRuntime.carry and __SenaV4EggRuntime.carry.active then
			return true
		end

		local now = os.clock()

		if now - t97.at < 0.5 then
			return t97.value
		end

		t97.at = now

		local ok, result = pcall(function()
			return __SenaV4EggRuntime:_wallOpen() and __SenaV4EggRuntime:_chooseTarget() or nil
		end)

		t97.value = ok and result ~= nil

		return t97.value
	end
	genv.__SenaV4DronesWantCharacter = function()
		local __SenaV4ButterflyRuntime = genv.__SenaV4ButterflyRuntime

		return __SenaV4ButterflyRuntime ~= nil and (__SenaV4ButterflyRuntime.active == true or __SenaV4ButterflyRuntime.wantsCharacter == true)
	end
end

v612:setStealMode(senaV4Config.StealMode == "Semi Teleport" and "Instant" or senaV4Config.StealMode)
-- LowSpeedBoost apply
if senaV4Config.LowSpeedBoost == nil then senaV4Config.LowSpeedBoost = true end
v612:setSpeed(senaV4Config.TweenSpeedMultiplier or 60)

if senaV4Config.StealMinValue and senaV4Config.StealMinValue > 0 then
	v612:setMinValuePerSec(senaV4Config.StealMinValue)
end

if senaV4Config.StealAreas and not table.find(senaV4Config.StealAreas, "None") and #senaV4Config.StealAreas > 0 then
	local t98 = {}

	for _, stealArea in ipairs(senaV4Config.StealAreas) do
		if stealArea ~= "None" then
			table.insert(t98, stealArea)
		end
	end

	v612:setFilter("areas", t98)
	v612:setFilterEnabled("area", #t98 > 0)
end

if senaV4Config.StealRarities and not table.find(senaV4Config.StealRarities, "None") and #senaV4Config.StealRarities > 0 then
	local t99 = {}

	for _, stealRarity in ipairs(senaV4Config.StealRarities) do
		if stealRarity ~= "None" then
			table.insert(t99, stealRarity)
		end
	end

	v612:setFilter("rarities", t99)
	v612:setFilterEnabled("rarity", #t99 > 0)
end

if senaV4Config.StealNamesFilter and not table.find(senaV4Config.StealNamesFilter, "None") and #senaV4Config.StealNamesFilter > 0 then
	local t100 = {}

	for _, v in ipairs(senaV4Config.StealNamesFilter) do
		if v ~= "None" then
			table.insert(t100, v)
		end
	end

	v612:setFilter("names", t100)
	v612:setFilterEnabled("name", #t100 > 0)
end

do
	genv.__SenaV4EggRuntimeCleanup = function()
		if v612 then
			pcall(v612.destroy, v612)
		end

		if v613 then
			pcall(v613.destroy, v613)
		end

		if genv.__SenaV4EggRuntime == v612 then
			genv.__SenaV4EggRuntime = nil
		end

		if genv.__SenaV4TreadmillManager == v613 then
			genv.__SenaV4TreadmillManager = nil
		end
	end
	genv.__SenaV4AntiGuardCleanup = function()
		if v614 then
			pcall(v614.destroy, v614)
		end

		if v615 then
			pcall(v615.destroy, v615)
		end

		if genv.__SenaV4AntiGuard == v614 then
			genv.__SenaV4AntiGuard = nil
		end

		if genv.__SenaV4GodMode == v615 then
			genv.__SenaV4GodMode = nil
		end
	end
end

do
	local function v2506()
		return getgenv and getgenv() or _G
	end
	local function v2507()
		if type(getconnections) == "function" then
			return getconnections
		end

		if type(get_signal_cons) == "function" then
			return get_signal_cons
		end

		return nil
	end
	local function v2508(p698)
		local LocalPlayer2 = Players.LocalPlayer

		if not LocalPlayer2 then
			p698.antiAfkStatus = "LocalPlayer unavailable"

			return false
		end

		local v2510 = v2507()

		if not v2510 then
			p698.antiAfkStatus = "Native Idled connection API unavailable"

			return false
		end

		local ok, result = pcall(v2510, LocalPlayer2.Idled)

		if not ok or type(result) ~= "table" then
			p698.antiAfkStatus = "Idled scan unavailable"

			return false
		end

		local lastDisabledIdleConnections = 0

		for _, v in ipairs(result) do
			local v2516 = false

			if type(v) == "table" or type(v) == "userdata" then
				if type(v.Disable) == "function" then
					v2516 = pcall(v.Disable, v)
				elseif type(v.Disconnect) == "function" then
					v2516 = pcall(v.Disconnect, v)
				end
			end

			if v2516 then
				lastDisabledIdleConnections += 1
			end
		end

		p698.scanRuns += 1
		p698.lastScanAt = os.clock()
		p698.lastDisabledIdleConnections = lastDisabledIdleConnections
		p698.disabledIdleConnections += lastDisabledIdleConnections
		p698.antiAfkStatus = lastDisabledIdleConnections > 0 and "Anti-AFK disabled " .. tostring(lastDisabledIdleConnections) .. " Idled connection(s)" or "Anti-AFK active; Idled connections clear"

		return true
	end

	local t101 = {
		install = function()
			local v2518 = v2506()
			local value = rawget(v2518, "__FyyStealAnEggStartupProtectionLiteV2")

			if type(value) == "table" and value.installed then
				value.installRuns += 1
				v2508(value)
				value.status = value.antiAfkStatus

				return value
			end

			local t102 = {
				installRuns = 1,
				scanRuns = 0,
				disabledIdleConnections = 0,
				lastDisabledIdleConnections = 0,
				lastScanAt = 0,
				installed = false,
				mode = "native-idled-disabler",
				integrityPatcherInstalled = false,
				networkFilterInstalled = false,
				namecallHookInstalled = false
			}

			v2518.__FyyStealAnEggStartupProtectionLiteV2 = t102

			local LocalPlayer2 = Players.LocalPlayer

			if not LocalPlayer2 then
				t102.antiAfkInstalled = false
				t102.antiAfkStatus = "LocalPlayer unavailable"
				t102.status = t102.antiAfkStatus
				t102.installed = true

				return t102
			end

			t102.antiAfkInstalled = v2508(t102)
			t102.idledConnection = LocalPlayer2.Idled:Connect(function()
				v2508(t102)
			end)
			t102.characterConnection = LocalPlayer2.CharacterAdded:Connect(function()
				task.delay(1, function()
					if t102.installed then
						v2508(t102)
					end
				end)
			end)
			t102.installed = true
			t102.status = t102.antiAfkStatus

			local function v2522()
				while t102.installed and v2518.__FyyStealAnEggStartupProtectionLiteV2 == t102 do
					task.wait(60)

					if t102.installed and v2518.__FyyStealAnEggStartupProtectionLiteV2 == t102 then
						v2508(t102)
						t102.status = t102.antiAfkStatus
					end
				end
			end

			task.spawn(v2522)

			return t102
		end,
		uninstall = function()
			local value = rawget(v2506(), "__FyyStealAnEggStartupProtectionLiteV2")

			if type(value) == "table" then
				value.installed = false

				if value.idledConnection and typeof(value.idledConnection.Disconnect) == "function" then
					pcall(value.idledConnection.Disconnect, value.idledConnection)
					value.idledConnection = nil
				end

				if value.characterConnection and typeof(value.characterConnection.Disconnect) == "function" then
					pcall(value.characterConnection.Disconnect, value.characterConnection)
					value.characterConnection = nil
				end
			end
		end
	}

	local function v2524()
		local genv2 = getgenv and getgenv() or _G

		genv2.__SenaV4AntiAfkGeneration = (genv2.__SenaV4AntiAfkGeneration or 0) + 1
		genv2.__SenaV4AntiAfkEnabled = senaV4Config.AntiAFK
		genv2.__SenaV4StartupProtection = t101
		genv2.__SenaV4SetAntiAfkEnabled = function(p699)
			genv2.__SenaV4AntiAfkEnabled = p699 == true

			if p699 then
				t101.install()
			else
				t101.uninstall()
			end
		end

		if senaV4Config.AntiAFK then
			genv2.__SenaV4SetAntiAfkEnabled(true)
		end
	end

	v2524()
end

local v2526 = senaV4Config
local t103 = {
	TeleportService = TeleportService or game:GetService("TeleportService"),
	LP = LocalPlayer or Players.LocalPlayer,
	Players = Players
}

local function v2528()
	pcall(function()
		if writefile then
			pcall(function()
				writefile("autoexec/Sena_StealAnEgg.lua", [[repeat task.wait(0.5) until game:IsLoaded()
task.wait(1.5)
if getgenv then getgenv().SNE_AutoExecute = true end
loadstring(game:HttpGet("https://senahub.xyz/raw/saev2"))()
]])
			end)
			pcall(function()
				writefile("autoexecute/Sena_StealAnEgg.lua", [[repeat task.wait(0.5) until game:IsLoaded()
task.wait(1.5)
if getgenv then getgenv().SNE_AutoExecute = true end
loadstring(game:HttpGet("https://senahub.xyz/raw/saev2"))()
]])
			end)
		end
	end)

	local queue_on_teleport_ = queue_on_teleport or syn and syn.queue_on_teleport or fluxus and fluxus.queue_on_teleport

	if queue_on_teleport_ then
		pcall(function()
			queue_on_teleport_([[repeat task.wait(0.5) until game:IsLoaded()
task.wait(1.5)
if getgenv then getgenv().SNE_AutoExecute = true end
loadstring(game:HttpGet("https://senahub.xyz/raw/saev2"))()
]])
		end)
	end
end
local function v2530()
	pcall(function()
		if delfile then
			pcall(function()
				delfile("autoexec/Sena_StealAnEgg.lua")
			end)
			pcall(function()
				delfile("autoexecute/Sena_StealAnEgg.lua")
			end)
		elseif writefile then
			pcall(function()
				writefile("autoexec/Sena_StealAnEgg.lua", "")
			end)
			pcall(function()
				writefile("autoexecute/Sena_StealAnEgg.lua", "")
			end)
		end
	end)
end

local u2531 = false

local function v2532()
	if u2531 then
		return
	end

	u2531 = true

	if v2526.autoExecute or getgenv and getgenv().SNE_AutoExecute then
		pcall(v2528)
	end

	task.wait(3)

	local TeleportService2 = t103.TeleportService or game:GetService("TeleportService")
	local PlaceId = game.PlaceId
	local JobId = game.JobId

	while true do
		pcall(function()
			if JobId then
				if not (#JobId > 0) then
					TeleportService2:Teleport(PlaceId, t103.LP)

					return
				end

				TeleportService2:TeleportToPlaceInstance(PlaceId, JobId, t103.LP)
			else
				TeleportService2:Teleport(PlaceId, t103.LP)
			end
		end)
		task.wait(6)
	end
end

pcall(function()
	game:GetService("GuiService").ErrorMessageChanged:Connect(function(p700)
		if v2526.autoReconnect and p700 and #p700 > 0 then
			v2532()
		end
	end)
end)
pcall(function()
	local LP = t103.LP or LocalPlayer

	LP = LP or Players.LocalPlayer

	if LP and LP.OnTeleport then
		LP.OnTeleport:Connect(function()
			if v2526.autoExecute or getgenv and getgenv().SNE_AutoExecute then
				pcall(v2528)
			end
		end)
	end
end)
task.spawn(function()
	while true do
		task.wait(2)

		if v2526.autoReconnect then
			pcall(function()
				local RobloxPromptGui = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")
				local promptOverlay = RobloxPromptGui and RobloxPromptGui:FindFirstChild("promptOverlay")
				local ErrorPrompt = promptOverlay and promptOverlay:FindFirstChild("ErrorPrompt")

				if ErrorPrompt and ErrorPrompt.Visible then
					v2532()
				end
			end)
		end
	end
end)

local function v2540()
	local Remotes = require(ReplicatedStorage.Shared.Remotes)

	local function v2542(p701, p702, p703)
		local v2543 = (require(ReplicatedStorage.Shared.Save).Peek or require(ReplicatedStorage.Shared.Save).Get)()

		if not v2543 or type(v2543.Inventory) ~= "table" then
			return nil
		end

		local AssetItems = require(ReplicatedStorage.Shared.Util.AssetItems)
		local Directory = require(ReplicatedStorage.Data.Assets).Directory
		local t104 = {}
		local ipairs_ = ipairs
		local EquippedAssets = v2543.EquippedAssets or {}

		for _, EquippedAsset in ipairs_(EquippedAssets) do
			t104[EquippedAsset] = true
		end

		local t105 = {}

		for k, v in pairs(v2543.Inventory) do
			if not t104[k] then
				local u2554

				if AssetItems and type(AssetItems.Decode) == "function" then
					pcall(function()
						u2554 = AssetItems.Decode(v)
					end)
				end

				u2554 = u2554 or v

				if type(u2554) == "table" and not u2554.InFuse and not u2554.IsFavorite and u2554.Category then
					local v2555 = Directory[u2554.Category]
					local DisplayName = v2555 and v2555.Rarity and (v2555.Rarity.DisplayName or v2555.Rarity._id)
					local v2557 = true

					if p703 and #p703 > 0 and not table.find(p703, "All") then
						v2557 = DisplayName and table.find(p703, DisplayName) ~= nil
					end

					local v2558 = true

					if p701 and p702 and #p702 > 0 and not table.find(p702, "All") then
						v2558 = table.find(p702, u2554.Category) ~= nil or v2555 and table.find(p702, v2555.DisplayName) ~= nil
					end

					if v2557 and v2558 then
						t105[u2554.Category] = t105[u2554.Category] or {}
						table.insert(t105[u2554.Category], {
							uid = k,
							d = u2554
						})
					end
				end
			end
		end

		for _, v in pairs(t105) do
			if not (#v >= 3) then
				continue
			end

			return {
				v[1].uid,
				v[2].uid,
				v[3].uid
			}
		end

		return nil
	end

	local t106 = {
		equipBest = function()
			pcall(function()
				Remotes.Haul.WearBest:InvokeServer()
			end)
		end,
		claimOffline = function()
			local ok, result = pcall(function()
				return Remotes.AwayEarnings.FetchSummary:InvokeServer()
			end)

			if ok and type(result) == "table" then
				if (result.ClaimableAmount or 0) > 0 then
					pcall(function()
						Remotes.AwayEarnings.AskCollect:InvokeServer({
							Kind = "Claim"
						})
					end)
				end
			end
		end,
		favoriteSelected = function()
			local v2564 = (require(ReplicatedStorage.Shared.Save).Peek or require(ReplicatedStorage.Shared.Save).Get)()

			if not v2564 or type(v2564.Inventory) ~= "table" then
				return 0
			end

			local AssetItems = require(ReplicatedStorage.Shared.Util.AssetItems)
			local Directory = require(ReplicatedStorage.Data.Assets).Directory
			local n47 = 0

			for k, v in pairs(v2564.Inventory) do
				local u2570

				if AssetItems and type(AssetItems.Decode) == "function" then
					pcall(function()
						u2570 = AssetItems.Decode(v)
					end)
				end

				u2570 = u2570 or v

				if type(u2570) == "table" then
					if not u2570.IsFavorite and u2570.Category then
						local v2571 = Directory[u2570.Category]
						local DisplayName = v2571 and v2571.Rarity and (v2571.Rarity.DisplayName or v2571.Rarity._id)
						local v2573 = false

						if senaV4Config.FavMode == "Species" then
							local FavSpecies = senaV4Config.FavSpecies or {}

							if table.find(FavSpecies, "All") or table.find(FavSpecies, u2570.Category) or v2571 and table.find(FavSpecies, v2571.DisplayName) then
								v2573 = true
							end
						else
							local FavRarities = senaV4Config.FavRarities or {}

							if table.find(FavRarities, "All") or DisplayName and table.find(FavRarities, DisplayName) then
								v2573 = true
							end
						end

						if v2573 then
							pcall(function()
								Remotes.PetSatchel.WriteFavourite:FireServer(k, true)
							end)
							n47 += 1

							if n47 % 10 == 0 then
								task.wait(0.05)
							end
						end
					end
				end
			end

			return n47
		end,
		unfavoriteAll = function()
			local v2576 = (require(ReplicatedStorage.Shared.Save).Peek or require(ReplicatedStorage.Shared.Save).Get)()

			if not v2576 or type(v2576.Inventory) ~= "table" then
				return 0
			end

			local n48 = 0

			for k, v in pairs(v2576.Inventory) do
				local v2580 = v

				if type(v2580) == "table" and v2580.IsFavorite then
					pcall(function()
						Remotes.PetSatchel.WriteFavourite:FireServer(k, false)
					end)
					n48 += 1

					if n48 % 10 == 0 then
						task.wait(0.05)
					end
				end
			end

			return n48
		end,
		fuseOnePair = function()
			local v2581 = (require(ReplicatedStorage.Shared.Save).Peek or require(ReplicatedStorage.Shared.Save).Get)()

			if not v2581 then
				return false
			end

			if v2581.FusionLocked then
				return false, "Fusion locked"
			end

			local v2582 = v2542(senaV4Config.FuseSelectedOnly, senaV4Config.FuseSpecies, senaV4Config.FuseRarities)

			if not v2582 then
				return false, "No eligible group of 3"
			end

			pcall(function()
				Remotes.Fusery.ConfirmBriefing:InvokeServer()
			end)

			for _, v in ipairs(v2582) do
				local ok, result = pcall(function()
					return Remotes.Fusery.LoadPet:InvokeServer(v)
				end)

				if ok and result then
					task.wait(0.02)

					continue
				end

				return false, "Failed to load pet"
			end

			local ok, result = pcall(function()
				return Remotes.Fusery.BeginFuse:InvokeServer()
			end)

			if not ok or not result then
				return false, "Failed to begin fuse"
			end

			task.wait(0.06)
			pcall(function()
				Remotes.Fusery.FinishReveal:InvokeServer()
			end)

			return true
		end
	}

	task.spawn(function()
		local n49 = 0

		while v16() do
			local now = os.clock()

			if senaV4Config.AutoEquipBest and now - n49 > 6 then
				n49 = now
				pcall(t106.equipBest)
			end

			if senaV4Config.AutoClaimOffline then
				pcall(t106.claimOffline)
			end

			if senaV4Config.AutoFavorite then
				pcall(t106.favoriteSelected)
			end

			if senaV4Config.AutoFusePets then
				pcall(t106.fuseOnePair)
			end

			task.wait(2.5)
		end
	end)

	return t106
end

genv.__SenaV4PetBarn = v2540()

do
	local function v2591()
		local Remotes = require(ReplicatedStorage.Shared.Remotes)
		local t107 = {
			upgradeBase = function()
				local v2594 = (require(ReplicatedStorage.Shared.Save).Peek or require(ReplicatedStorage.Shared.Save).Get)()

				if not v2594 then
					return false
				end

				local v2595 = tonumber(v2594.BaseUpgradeLevel or 0) or 0
				local Bases = require(ReplicatedStorage.Data.Bases)
				local BASES = Bases and Bases.BASES and Bases.BASES[v2595 + 1]

				if not BASES then
					return false, "Max level"
				end

				local v2598 = tonumber(v2594.Money or 0) or 0

				if v2598 < (BASES.Cost or 0) then
					return false, "Not enough money"
				end

				local ok, result = pcall(function()
					return Remotes.Homestead.AskBaseTierRaise:InvokeServer()
				end)
				local v2601 = ok and result == true

				return v2601, result
			end,
			claimAlmanac = function()
				local ok, result = pcall(function()
					return Remotes.Codex.AskRedeemAll:InvokeServer()
				end)

				return ok, result
			end
		}

		task.spawn(function()
			while v16() do
				if senaV4Config.AutoBaseUpgrade then
					pcall(t107.upgradeBase)
				end

				if senaV4Config.AutoClaimAlmanac then
					pcall(t107.claimAlmanac)
				end

				task.wait(3)
			end
		end)

		return t107
	end

	genv.__SenaV4Upgrades = v2591()
end

local function v2604()
	local t108 = {
		noclipConn = nil
	}

	t108.setNoclip = function(p704)
		senaV4Config.Noclip = p704 == true

		if t108.noclipConn then
			pcall(function()
				t108.noclipConn:Disconnect()
			end)
			t108.noclipConn = nil
		end

		if senaV4Config.Noclip then
			t108.noclipConn = RunService.Stepped:Connect(function()
				if not senaV4Config.Noclip then
					return
				end

				local Character = LocalPlayer.Character

				if not Character then
					return
				end

				for _, descendant in ipairs(Character:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant.CanCollide then
						descendant:SetAttribute("SenaNoclip", true)
						descendant.CanCollide = false
					end
				end
			end)

			return
		end

		local Character = LocalPlayer.Character

		if Character then
			for _, descendant in ipairs(Character:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant:GetAttribute("SenaNoclip") then
					descendant.CanCollide = true
					descendant:SetAttribute("SenaNoclip", nil)
				end
			end
		end
	end
	t108.waypointList = function()
		local t109 = { "Respawn Point" }
		local v2613 = v14()
		local Machines = v2613 and v2613:FindFirstChild("Machines")

		if Machines and Machines:FindFirstChild("FuseMachine") then
			table.insert(t109, "Fuse Machine")
		end

		local Areas = v2613 and v2613:FindFirstChild("Areas")
		local GuardAreas = Areas and Areas:FindFirstChild("GuardAreas")

		if GuardAreas then
			for _, child in ipairs(GuardAreas:GetChildren()) do
				table.insert(t109, child.Name)
			end
		end

		return t109
	end
	t108.teleportWaypoint = function(p705)
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return false
		end

		local Position
		local v2622 = v14()

		if p705 == "Respawn Point" then
			pcall(function()
				local PlotState2 = require(ReplicatedStorage.Client.PlotState)
				local ResolvePlot = PlotState2.ResolvePlot and PlotState2.ResolvePlot()

				if ResolvePlot and ResolvePlot.RespawnPointCFrame then
					Position = ResolvePlot.RespawnPointCFrame.Position
				elseif ResolvePlot and ResolvePlot.Model then
					if ResolvePlot.Model:FindFirstChild("Spawn") then
						Position = ResolvePlot.Model.Spawn.Position
					end
				end
			end)
		elseif p705 == "Fuse Machine" then
			local Machines = v2622 and v2622:FindFirstChild("Machines")
			local FuseMachine = Machines and Machines:FindFirstChild("FuseMachine")
			local Machine = FuseMachine and (FuseMachine:FindFirstChild("Machine") or FuseMachine.PrimaryPart)

			if Machine then
				Position = Machine.Position
			end
		else
			local Areas = v2622 and v2622:FindFirstChild("Areas")
			local GuardAreas = Areas and Areas:FindFirstChild("GuardAreas")
			local v2630 = GuardAreas and GuardAreas:FindFirstChild(p705)
			local Guard = v2630 and v2630:FindFirstChild("Guard")

			if Guard and Guard:IsA("BasePart") then
				Position = Guard.Position
			end
		end

		if not Position then
			return false
		end

		HumanoidRootPart.CFrame = cFrameNew(Position + Vector3.new(0, 4, 0))
		HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero

		return true
	end
	t108.setBottingMode = function(p706)
		senaV4Config.BottingMode = p706 == true

		local __SenaV4BottingOverlay = genv.__SenaV4BottingOverlay

		if __SenaV4BottingOverlay and __SenaV4BottingOverlay.Parent then
			pcall(function()
				__SenaV4BottingOverlay:Destroy()
			end)
		end

		genv.__SenaV4BottingOverlay = nil

		if not senaV4Config.BottingMode then
			pcall(function()
				RunService:Set3dRenderingEnabled(true)
			end)

			return
		end

		pcall(function()
			RunService:Set3dRenderingEnabled(false)
		end)

		local CoreGui

		pcall(function()
			CoreGui = game:GetService("CoreGui")
		end)
		CoreGui = CoreGui or LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if not CoreGui then
			return
		end

		local ScreenGui = Instance.new("ScreenGui")

		ScreenGui.Name = "SenaBottingOverlay"
		ScreenGui.ResetOnSpawn = false
		ScreenGui.IgnoreGuiInset = true
		ScreenGui.DisplayOrder = -1
		ScreenGui.Parent = CoreGui

		local Frame = Instance.new("Frame")

		Frame.Name = "Blackscreen"
		Frame.Size = UDim2.new(1, 0, 1, 0)
		Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Active = false
		Frame.Parent = ScreenGui
		genv.__SenaV4BottingOverlay = ScreenGui
	end
	task.spawn(function()
		while v16() do
			if senaV4Config.AntiCutscene then
				pcall(function()
					local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

					if PlayerGui then
						for _, child in ipairs(PlayerGui:GetChildren()) do
							if child:IsA("ScreenGui") and (string.find(string.lower(child.Name), "cutscene") or child.Name == "Intro") and child.Enabled then
								child.Enabled = false
							end
						end
					end
				end)
			end

			task.wait(0.2)
		end
	end)

	return t108
end

genv.__SenaV4Roaming = v2604()

do
	local function v2639()
		local t110 = {
			snapAt = 0,
			snap = nil,
			status = "Idle",
			lastBuy = 0,
			doneLost = {},
			active = false,
			token = 0
		}

		local function v2641()
			return require(ReplicatedStorage.Shared.Remotes).Scramble
		end

		t110.snapshot = function(p707)
			local now = os.clock()

			if not p707 and t110.snap and now - t110.snapAt < 1.5 then
				return t110.snap
			end

			local ok, snap = pcall(function()
				return v2641().Request:InvokeServer("Snapshot")
			end)

			if ok and type(snap) == "table" and snap.State then
				t110.snap = snap
				t110.snapAt = now
			end

			return t110.snap
		end
		t110.live = function()
			local v2645 = t110.snapshot()

			if not v2645 then
				return false
			end

			local v2646 = v2645.Ready == true and v2645.Enabled == true and v2645.WorldReady == true

			if v2646 then
				v2646 = workspace:GetServerTimeNow() < (v2645.EventEndsAt or 0)
			end

			return v2646
		end
		t110.windowActive = function()
			local v2647 = t110.snapshot()

			return v2647 and v2647.Window and v2647.Window.Active == true or false
		end
		t110.progress = function()
			local v2648 = t110.snapshot()
			local State = v2648 and v2648.State

			if State then
				return State.Samples or 0, State.TotalParts or 0, State.DroneParts or 0
			end

			return 0, 0, 0
		end
		t110.buyTick = function()
			local ScrambleBuyList = senaV4Config.ScrambleBuyList

			if not ScrambleBuyList or #ScrambleBuyList == 0 then
				return
			end

			if os.clock() - t110.lastBuy < 2 then
				return
			end

			local v2651 = t110.snapshot(true)

			if not v2651 or not v2651.State or not v2651.Shop then
				return
			end

			local Samples = v2651.State.Samples or 0

			for _, v in pairs(v2651.Shop) do
				if not senaV4Config.ScrambleAutoBuy then
					return
				end

				local v2655 = tostring(v.Label)
				local v2656 = false
				local v2657, v2658, v2659 = ipairs(ScrambleBuyList)
				local v2660 = geniter(v2657, v2658, v2659)
				local v2661 = table.pack(v2660())

				if v2661[1] then
					local v2662 = v2661[3]

					while true do
						if tostring(v2662) == v2655 then
							v2656 = true

							break
						end

						local v2663 = table.pack(v2660())

						if not v2663[1] then
							break
						end

						v2662 = v2663[3]
					end

					if not v2656 then
						continue
					end

					if not ((v.Price or 0) <= Samples) then
						continue
					end

					local v2664 = (v2651.State.ShopPurchases or {})[v.Id]
					local Count = v2664 and v2664.Period == v2651.ShopPeriod and (v2664.Count or 0) or 0

					if not v.PurchaseLimit then
						t110.lastBuy = os.clock()
						pcall(function()
							v2641().Request:InvokeServer("Shop", v.Id, {
								Quote = v.Quote,
								Sequence = v2651.State.ShopSequence
							})
						end)
						t110.status = "Bought " .. v2655
						t110.snapshot(true)

						return
					end

					if not (Count + (v.Quantity or 1) <= v.PurchaseLimit) then
						continue
					end

					t110.lastBuy = os.clock()
					pcall(function()
						v2641().Request:InvokeServer("Shop", v.Id, {
							Quote = v.Quote,
							Sequence = v2651.State.ShopSequence
						})
					end)
					t110.status = "Bought " .. v2655
					t110.snapshot(true)

					return
				end
			end
		end
		task.spawn(function()
			while v16() do
				t110.wantsCharacter = false
				t110.active = false

				if senaV4Config.ScrambleAutoBuy then
					pcall(function()
						if t110.live() then
							t110.buyTick()
						else
							t110.status = "Event not active"
						end
					end)
				end

				task.wait(senaV4Config.ScrambleAutoBuy and 0.5 or 1)
			end
		end)

		return t110
	end

	genv.__SenaV4ScrambleRuntime = v2639()
end

local function v2666()
	local t111 = {
		status = "Idle",
		active = false,
		wantsCharacter = false,
		lastSwing = 0,
		retryAt = {},
		cards = {},
		snap = {}
	}
	local t112 = {
		"Green",
		"Blue",
		"Purple",
		"Golden"
	}
	local t113 = {
		Green = 1,
		Blue = 2,
		Purple = 3,
		Golden = 4
	}
	local t114 = {
		TITLES = {
			auto_steal = "Auto Steal",
			mech_boss = "Mech Boss",
			auto_place = "Auto Place"
		},
		blocker = function()
			if LocalPlayer:GetAttribute("InScrambleArena") == true then
				return "mech_boss"
			end

			if senaV4Config.ScrambleBossAuto == true then
				local ScrambleArena = workspace:FindFirstChild("ScrambleArena")

				if workspace:FindFirstChild("ScrambleArenaPortal") or ScrambleArena and ScrambleArena:GetAttribute("Phase") ~= "Defeated" then
					return "mech_boss"
				end
			end

			local __SenaV4StealWantsCharacter = genv.__SenaV4StealWantsCharacter

			if __SenaV4StealWantsCharacter and __SenaV4StealWantsCharacter() then
				return "auto_steal"
			end

			return nil
		end,
		holder = function()
			if senaV4Config.IsPlacing == true then
				return "auto_place"
			end

			return nil
		end
	}

	local function v2673(p708, ...)
		for _, v in ipairs({ ... }) do
			if not p708 then
				return nil
			end

			p708 = p708:FindFirstChild(v)
		end

		return p708
	end

	local u2676

	local function v2677()
		if u2676 then
			return u2676
		end

		local function v2678(p709)
			if not p709 then
				return nil
			end

			local ok, result = pcall(require, p709)

			return ok and result or nil
		end

		local t115 = {
			Remotes = v2678(v2673(ReplicatedStorage, "Shared", "Remotes")),
			Save = v2678(v2673(ReplicatedStorage, "Shared", "Save")),
			Catalog = v2678(v2673(ReplicatedStorage, "Shared", "Modules", "ButterflyCatalog")),
			Flags = v2678(v2673(ReplicatedStorage, "Shared", "Flags", "ButterflyFlags")),
			Swarm = v2678(v2673(ReplicatedStorage, "Controllers", "Game", "AdminAbuseClientController", "Events", "ButterflyBloom", "Swarm"))
		}

		if not t115.Remotes or not t115.Save or not t115.Catalog then
			return nil
		end

		u2676 = t115

		return t115
	end
	local function v2682(p710, p711)
		local v2683 = v2677()
		local Flags = v2683 and v2683.Flags and v2683.Flags[p710]

		if not Flags then
			return p711
		end

		local ok, result = pcall(function()
			return Flags:Get()
		end)

		if not ok or result == nil then
			return p711
		end

		return result
	end
	local function v2687(p712, p713, ...)
		local v2688 = v2677()
		local v2689 = v2688 and v2688.Remotes[p712] and v2688.Remotes[p712][p713]

		if not v2689 then
			return false, p712 .. "." .. p713 .. " missing"
		end

		local v2690 = table.pack(pcall(v2689.InvokeServer, v2689, ...))

		if v2690[1] then
			return v2690[2] == true, type(v2690[3]) == "string" and v2690[3] or nil, v2690[2]
		end

		return false, tostring(v2690[2])
	end
	local function v2691(p714)
		return (t111.retryAt[p714] or 0) <= os.clock()
	end
	local function v2692(p715)
		t111.retryAt[p715] = os.clock() + 5
	end
	local function v2693()
		local Character = LocalPlayer.Character

		return Character and Character:FindFirstChild("HumanoidRootPart") or nil
	end

	t111.bloomLeft = function()
		local v2695 = v2677()
		local attribute = workspace:GetAttribute(v2695 and v2695.Catalog.EndsAtAttribute or "ButterflyBloomEndsAt")

		if typeof(attribute) == "number" then
			return math.max(0, attribute - workspace:GetServerTimeNow())
		end

		return 0
	end
	t111.nextBloom = function()
		local v2697 = tonumber(v2682("IntervalSeconds", 1800)) or 1800
		local v2698 = tonumber(v2682("OffsetSeconds", 900)) or 900
		local v2699 = tonumber(v2682("DurationSeconds", 300)) or 300

		if v2697 <= 0 then
			return nil
		end

		local serverTimeNow = workspace:GetServerTimeNow()
		local v2701 = v2677()
		local attribute = workspace:GetAttribute(v2701 and v2701.Catalog.EndsAtAttribute or "ButterflyBloomEndsAt")
		local v2703 = typeof(attribute) == "number" and attribute - v2699 or math.floor((serverTimeNow - v2698) / v2697) * v2697 + v2698
		local n50 = 0

		while v2703 <= serverTimeNow and n50 < 64 do
			v2703 += v2697
			n50 += 1
		end

		return v2703 > serverTimeNow and v2703 - serverTimeNow or nil
	end

	local function v2705(p716)
		if not p716 then
			return nil
		end

		for _, child in ipairs(p716:GetChildren()) do
			if child:IsA("Tool") and child:GetAttribute("ButterflyNet") == true then
				return child
			end
		end

		return nil
	end

	local u2708

	t111.tiers = function()
		if u2708 then
			return u2708
		end

		local v2709 = v2677()

		if not v2709 then
			return nil
		end

		local t116 = {}

		for i, v in ipairs(t112) do
			local Tiers = v2709.Catalog.Tiers and v2709.Catalog.Tiers[v]

			t116[v] = {
				name = (Tiers and tostring(Tiers.DisplayName) or v):gsub("%s*Butterfly$", ""),
				color = Tiers and typeof(Tiers.Color) == "Color3" and Tiers.Color or Color3.new(1, 1, 1),
				trade = i < 4 and (tonumber(v2682(("%sTo%sCost"):format(v, t112[i + 1]), 0)) or 0) or 0,
				essence = tonumber(v2682("Essence" .. v, 0)) or 0
			}
		end

		u2708 = t116

		return t116
	end
	t111.snapshot = function()
		local v2714 = v2677()
		local snap = t111.snap

		if not v2714 then
			return snap
		end

		snap.left = t111.bloomLeft()
		snap.active = snap.left > 0
		snap.enabled = v2682("Enabled", true) ~= false
		snap.nextIn = not snap.active and t111.nextBloom() or nil

		local ok, result = pcall(v2714.Save.Peek)
		local v2718 = ok and result or nil
		local Butterflies = v2718 and v2718.Butterflies

		snap.net = type(Butterflies) == "table" and Butterflies.NetClaimed == true
		snap.holding = v2705(LocalPlayer.Character) ~= nil
		snap.inBag = v2705(LocalPlayer:FindFirstChildOfClass("Backpack")) ~= nil
		snap.counts = snap.counts or {}

		for _, v in ipairs(t112) do
			snap.counts[v] = type(Butterflies) == "table" and Butterflies.Counts and tonumber(Butterflies.Counts[v]) or 0
		end

		snap.essence = type(Butterflies) == "table" and tonumber(Butterflies.Essence) or 0
		snap.caught = type(Butterflies) == "table" and tonumber(Butterflies.TotalCaught) or 0
		snap.treeUnlocked = LocalPlayer:GetAttribute("EnchantedTreeUnlocked") == true

		return snap
	end
	t111.smartNext = function(p717)
		local v2722 = t111.tiers()

		if not v2722 or not p717 then
			return nil
		end

		for i = 3, 1, -1 do
			local v2724 = t112[i]
			local v2725 = t112[i + 1]
			local trade = v2722[v2724].trade

			if not (trade > 0) then
				continue
			end

			if not ((p717[v2725] or 0) < v2722[v2725].essence) then
				continue
			end

			if trade <= (p717[v2724] or 0) - v2722[v2724].essence then
				return v2724
			end
		end

		return nil
	end
	t111.canTrade = function()
		local snap = t111.snap
		local v2728 = t111.tiers()

		if not v2728 or not snap.counts then
			return false
		end

		local ButterflyTradeRecipe = senaV4Config.ButterflyTradeRecipe

		if ButterflyTradeRecipe == "Smart" then
			return t111.smartNext(snap.counts) ~= nil
		end

		for i = 1, 3 do
			local v2731 = t112[i]

			if ButterflyTradeRecipe ~= nil and ButterflyTradeRecipe ~= "All" and ButterflyTradeRecipe ~= v2731 or not (v2728[v2731].trade > 0) then
				continue
			end

			if v2728[v2731].trade <= (snap.counts[v2731] or 0) then
				return true
			end
		end

		return false
	end
	t111.canCraft = function()
		local snap = t111.snap
		local v2733 = t111.tiers()

		if not v2733 or not snap.counts then
			return false
		end

		for _, v in ipairs(t112) do
			if not (v2733[v].essence > 0) then
				continue
			end

			if (snap.counts[v] or 0) < v2733[v].essence then
				return false, v
			end
		end

		return true
	end

	local function v2736()
		local ButterflyTiers = senaV4Config.ButterflyTiers

		if type(ButterflyTiers) ~= "table" or #ButterflyTiers == 0 then
			return nil
		end

		local t117 = {}

		for _, ButterflyTier in ipairs(ButterflyTiers) do
			t117[tostring(ButterflyTier)] = true
		end

		return t117
	end
	local function v2741()
		local ButterflyBloomSwarm = workspace:FindFirstChild("ButterflyBloomSwarm")

		if not ButterflyBloomSwarm then
			return {}
		end

		local t118 = {}

		for _, child in ipairs(ButterflyBloomSwarm:GetChildren()) do
			if t113[child.Name] and child:IsA("Model") then
				t118[#t118 + 1] = {
					pos = child.PrimaryPart and child.PrimaryPart.Position or child:GetPivot().Position,
					tier = child.Name
				}
			end
		end

		return t118
	end
	local function v2746()
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
		local v2749 = v2705(LocalPlayer:FindFirstChildOfClass("Backpack"))

		if not Humanoid or not v2749 then
			return false
		end

		pcall(function()
			Humanoid:EquipTool(v2749)
		end)

		return v2705(Character) ~= nil
	end

	local t119 = {
		part = nil,
		y = 0
	}

	local function v2751()
		if t119.part then
			pcall(function()
				t119.part:Destroy()
			end)
		end

		t119.part = nil
	end
	local function v2752()
		local v2753 = v2693()

		if not v2753 then
			return
		end

		if not t119.part or not t119.part.Parent then
			local Part = Instance.new("Part")

			Part.Name = "SenaBloomPad"
			Part.Anchored = true
			Part.CanCollide = true
			Part.CanTouch = false
			Part.CastShadow = false
			Part.Transparency = 1
			Part.Size = Vector3.new(24, 1, 24)
			t119.y = v2753.Position.Y - 3.5
			Part.CFrame = cFrameNew(v2753.Position.X, t119.y, v2753.Position.Z)
			Part.Parent = workspace
			t119.part = Part
		end

		local raycastParams = RaycastParams.new()

		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = {
			LocalPlayer.Character,
			t119.part
		}

		local hit = workspace:Raycast(v2753.Position + Vector3.new(0, 4, 0), Vector3.new(0, -80, 0), raycastParams)

		if not hit then
			return
		end

		t119.y += math.clamp(hit.Position.Y - 0.5 + 6 - t119.y, -2, 2)
		t119.part.CFrame = cFrameNew(v2753.Position.X, t119.y, v2753.Position.Z)
	end
	local function v2757(p718, p719)
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if not HumanoidRootPart or not Humanoid then
			return false
		end

		v2751()

		local v2761 = os.clock() + (p719 or 30)

		local function v2762()
			if not v16() or v2761 < os.clock() then
				return true
			end

			return t114.blocker("butterfly") ~= nil
		end

		if v612 and HumanoidRootPart.Position.Y < 16000 and p718.Y < 16000 and (HumanoidRootPart.Position - p718).Magnitude > 600 and not v612:_isInSafeArea(HumanoidRootPart) then
			local v2763 = v612:_resolveSafeCFrame(HumanoidRootPart)

			if v2763 and (v2763.Position - p718).Magnitude > 40 then
				local status = t111.status

				t111.status = "Heading to the safe zone first"
				pcall(v232, HumanoidRootPart, Humanoid, v2763, v2762)
				t111.status = status
				HumanoidRootPart = v2693()

				if not HumanoidRootPart or v2762() or not v612:_isInSafeArea(HumanoidRootPart) then
					return false
				end
			end
		end

		pcall(v232, HumanoidRootPart, Humanoid, cFrameNew(p718) * HumanoidRootPart.CFrame.Rotation, v2762)

		local v2765 = v2693()
		local v2766 = v2765 ~= nil and (v2765.Position - p718).Magnitude <= 12

		return v2766
	end
	local function v2767()
		if LocalPlayer:GetAttribute("InEnchantedTree") == true then
			return true
		end

		local v2768 = v2693()

		return v2768 ~= nil and v2768.Position.Y > 16000
	end
	local function v2769(p720)
		if not p720 or not p720:IsA("ProximityPrompt") or not p720.Enabled then
			return false
		end

		local v2770 = tonumber(p720.HoldDuration) or 0

		pcall(function()
			p720:InputHoldBegin()
			task.wait(v2770 > 0 and v2770 + 0.15 or 0.05)
			p720:InputHoldEnd()
		end)

		if typeof(fireproximityprompt) == "function" then
			pcall(fireproximityprompt, p720, v2770 > 0 and v2770 + 0.15 or 0)
		end

		return true
	end

	local EnchantedTreePrompt

	local function v2772()
		if v2767() then
			return nil
		end

		if LocalPlayer:GetAttribute("EnchantedTreeUnlocked") ~= true then
			return "Enchanted Tree is locked (finish the Wisp Event)"
		end

		if not EnchantedTreePrompt or not EnchantedTreePrompt.Parent then
			local world = v2673(workspace, "World", "Build", "EnchantedTreeInterior", "Markers", "EnterTrigger")

			EnchantedTreePrompt = world and world:FindFirstChild("EnchantedTreePrompt", true) or nil
		end

		local Parent = EnchantedTreePrompt and EnchantedTreePrompt.Parent
		local WorldPosition = Parent and (Parent:IsA("Attachment") and Parent.WorldPosition or Parent:IsA("BasePart") and Parent.Position)

		if not WorldPosition then
			return "tree entrance not found"
		end

		if v177() then
			return "night - the forest is sealed"
		end

		t111.status = "Flying to the Enchanted Tree"

		if not v2757(WorldPosition + Vector3.new(0, 3, 0), 60) then
			return "could not reach the tree entrance"
		end

		t111.status = "Entering the tree"
		v2769(EnchantedTreePrompt)

		local v2776 = os.clock() + 8

		while os.clock() < v2776 and not v2767() do
			task.wait(0.05)
		end

		if v2767() then
			return nil
		end

		return "entering the tree failed"
	end
	local function v2777()
		if not v2767() then
			return true
		end

		local world = v2673(workspace, "World", "Build", "EnchantedTreeInterior", "Markers", "ExitTrigger")

		if not world or typeof(firetouchinterest) ~= "function" then
			return false
		end

		t111.status = "Leaving the tree"

		local v2779 = os.clock() + 6

		while os.clock() < v2779 and v2767() do
			local v2780 = v2693()

			if v2780 then
				pcall(firetouchinterest, v2780, world, 0)
				pcall(firetouchinterest, v2780, world, 1)
			end

			task.wait(0.3)
		end

		return not v2767()
	end
	local function v2781(p721)
		local world = v2673(workspace, "World", "Machines", "ButterflyStation", p721, "Anchor")

		return world and world:IsA("BasePart") and world.Position or nil, world
	end
	local function v2783(p722)
		local v2784 = v2781(p722)

		if not v2784 then
			return false, p722 .. " not found"
		end

		local v2785 = v2693()

		if v2785 and (v2785.Position - v2784).Magnitude <= 10 then
			return true
		end

		local v2786 = v2772()

		if v2786 then
			return false, v2786
		end

		t111.status = "Walking to the " .. p722

		if v2757(v2784 + Vector3.new(0, 3, 0), 15) then
			return true
		end

		return false, "could not reach the " .. p722
	end
	local function v2787()
		local world = v2673(workspace, "World", "Areas", "ButterflyBloom", "Bounds")

		return world and world:IsA("BasePart") and world or nil
	end
	local function v2789()
		local v2790 = v2787()
		local v2791 = v2693()

		if not v2790 or not v2791 or v2767() then
			return false
		end

		local v2792 = v2790.CFrame:PointToObjectSpace(v2791.Position)

		return math.abs(v2792.X) <= v2790.Size.X / 2 + 20 and math.abs(v2792.Z) <= v2790.Size.Z / 2 + 20
	end
	local function v2793()
		local v2794 = v2787()

		return v2794 and v2794.Position + Vector3.new(0, 4, 0) or nil
	end
	local function v2795()
		local __SenaV4TreadmillManager = genv.__SenaV4TreadmillManager

		if not __SenaV4TreadmillManager or __SenaV4TreadmillManager.activeTreadmill == nil then
			return
		end

		t111.status = "Leaving the treadmill"

		local v2797 = os.clock() + 5

		while __SenaV4TreadmillManager.activeTreadmill ~= nil and os.clock() < v2797 do
			__SenaV4TreadmillManager:_requestUnequip()
			task.wait(0.3)
		end

		local v2798 = v2693()

		if v2798 and v2798.Anchored then
			pcall(function()
				v2798.Anchored = false
			end)
		end
	end
	local function v2799()
		local __SenaV4TreadmillManager = genv.__SenaV4TreadmillManager

		if not __SenaV4TreadmillManager or __SenaV4TreadmillManager.destroyed or not __SenaV4TreadmillManager.config.idleFarm then
			return false
		end

		if not __SenaV4TreadmillManager.busy and not __SenaV4TreadmillManager.idleRunning then
			task.defer(function()
				__SenaV4TreadmillManager:_startIdle()
			end)
		end

		return true
	end
	local function v2801()
		v2751()

		if v2767() then
			v2777()
		end

		if v2799() then
			return
		end

		local v2802 = v2693()

		if not v2802 or not v612 or v612:_isInSafeArea(v2802) then
			return
		end

		local v2803 = v612:_resolveSafeCFrame(v2802)

		if v2803 then
			t111.status = "Back to the safe zone"
			v2757(v2803.Position, 60)
		end
	end

	t111.claimNet = function()
		local NetStand, v2805 = v2783("NetStand")

		if not NetStand then
			return false, v2805
		end

		t111.status = "Claiming the net"

		local _, v2807 = v2781("NetStand")
		local Butterflies, v2809

		if v2807 then
			local ProximityPrompt = v2807:FindFirstChildWhichIsA("ProximityPrompt", true)

			if ProximityPrompt and ProximityPrompt.Enabled then
				v2769(ProximityPrompt)

				local v2811 = os.clock() + 2

				while true do
					if not (os.clock() < v2811) then
						Butterflies, v2809 = v2687("Butterflies", "AskClaimNet")

						return Butterflies, v2809
					end

					if not t111.snapshot().net then
						task.wait(0.1)

						continue
					end

					break
				end

				return true
			end
		end

		Butterflies, v2809 = v2687("Butterflies", "AskClaimNet")

		return Butterflies, v2809
	end
	t111.tradeUp = function()
		t111.snapshot()

		if not t111.canTrade() then
			return false, "nothing to trade up"
		end

		local ButterflyMachine, v2813 = v2783("ButterflyMachine")

		if not ButterflyMachine then
			return false, v2813
		end

		local v2814 = t111.tiers()
		local ButterflyTradeRecipe = senaV4Config.ButterflyTradeRecipe
		local n51 = 0

		if ButterflyTradeRecipe == "Smart" then
			local v2817 = table.clone(t111.snap.counts)
			local v2818

			while true do
				if n51 < 50 then
					local v2819 = t111.smartNext(v2817)

					if not v2819 then
						return true, n51
					end

					t111.status = "Trading up " .. v2814[v2819].name .. " for the essence"

					local Butterflies

					Butterflies, v2818 = v2687("Butterflies", "AskTradeUp", v2819)

					if not Butterflies then
						break
					end

					n51 += 1
					v2817[v2819] = (v2817[v2819] or 0) - v2814[v2819].trade

					local v2821 = t112[t113[v2819] + 1]

					v2817[v2821] = (v2817[v2821] or 0) + 1
					task.wait(0.12)
				else
					return true, n51
				end
			end

			if n51 == 0 then
				return false, v2818 or "the machine refused"
			end

			return true, n51
		end

		local v2822

		for i = 3, 1, -1 do
			local v2824 = t112[i]

			if ButterflyTradeRecipe ~= nil and ButterflyTradeRecipe ~= "All" and ButterflyTradeRecipe ~= v2824 then
				continue
			end

			local v2825 = t111.snap.counts[v2824] or 0
			local trade = v2814[v2824].trade
			local exitTo

			while trade > 0 and trade <= v2825 do
				t111.status = "Trading up " .. v2814[v2824].name

				local Butterflies

				Butterflies, v2822 = v2687("Butterflies", "AskTradeUp", v2824)

				if not Butterflies then
					exitTo = 1

					break
				end

				n51 += 1
				v2825 -= trade
				task.wait(0.12)
			end

			if exitTo == 1 then
				if n51 == 0 then
					return false, v2822 or "the machine refused"
				end
			end
		end

		return true, n51
	end
	t111.craft = function()
		t111.snapshot()

		local v2829, v2830 = t111.canCraft()

		if not v2829 then
			local v2831 = t111.tiers()

			return false, "need more " .. tostring(v2831 and v2831[v2830] and v2831[v2830].name or v2830)
		end

		local MutationShrine, v2833 = v2783("MutationShrine")

		if not MutationShrine then
			return false, v2833
		end

		local n52 = 0
		local v2835

		while true do
			if n52 < 10 and t111.canCraft() then
				t111.status = "Crafting Enchanted Essence"

				local Butterflies

				Butterflies, v2835 = v2687("Butterflies", "AskCraftEssence")

				if not Butterflies then
					break
				end

				n52 += 1
				task.wait(0.2)
				t111.snapshot()
			else
				return true, n52
			end
		end

		if n52 == 0 then
			return false, v2835 or "the shrine refused"
		end

		return true, n52
	end
	t111.tierOptions = function()
		local v2837 = t111.tiers()
		local t120 = {}

		for i = #t112, 1, -1 do
			local v2840 = t112[i]

			t120[#t120 + 1] = v2837 and v2837[v2840].name or v2840
		end

		return t120
	end
	t111.tierFromLabel = function(p723)
		local v2841 = t111.tiers()

		for _, v in ipairs(t112) do
			if p723 == v or v2841 and v2841[v].name == p723 then
				return v
			end
		end

		return nil
	end
	t111.setTiers = function(p724)
		local butterflyTiers = {}
		local ipairs_ = ipairs
		local v2846 = type(p724) == "table" and p724 or {}

		for _, v in ipairs_(v2846) do
			local v2849 = t111.tierFromLabel(tostring(v))

			if v2849 then
				butterflyTiers[#butterflyTiers + 1] = v2849
			end
		end

		senaV4Config.ButterflyTiers = butterflyTiers
	end

	local t121 = {
		"All Recipes",
		"For Essence (shortfall only)",
		"Emerald to Sapphire",
		"Sapphire to Amethyst",
		"Amethyst to Radiant"
	}
	local t122 = {
		["For Essence (shortfall only)"] = "Smart",
		["Emerald to Sapphire"] = "Green",
		["Sapphire to Amethyst"] = "Blue",
		["Amethyst to Radiant"] = "Purple"
	}

	t111.recipeOptions = function()
		return t121
	end
	t111.setRecipe = function(p725)
		senaV4Config.ButterflyTradeRecipe = t122[tostring(p725)] or "All"
	end

	local t123 = {
		"Tween to Butterfly",
		"Stand",
		"Zigzag",
		"Circle"
	}
	local t124 = {
		["Tween to Butterfly"] = "Tween",
		Stand = "Stand",
		Zigzag = "Zigzag",
		Circle = "Circle"
	}

	t111.modeOptions = function()
		return t123
	end
	t111.setMode = function(p726)
		senaV4Config.ButterflyCatchMode = t124[tostring(p726)] or "Tween"
	end

	local Folder

	local function v2855()
		for k, card in pairs(t111.cards) do
			pcall(function()
				card.part:Destroy()
			end)
			t111.cards[k] = nil
		end

		if Folder then
			pcall(function()
				Folder:Destroy()
			end)
			Folder = nil
		end
	end
	local function v2858()
		local CurrentCamera = workspace.CurrentCamera

		if not CurrentCamera then
			return
		end

		if not Folder or not Folder.Parent then
			Folder = Instance.new("Folder")
			Folder.Name = "SenaBloomEsp"
			Folder.Parent = CurrentCamera
		end

		local v2860 = t111.tiers() or {}
		local v2861 = v2693()
		local t125 = {}

		for _, v in ipairs(v2741()) do
			local v2865 = ("%d_%d_%d"):format(v.pos.X, v.pos.Y, v.pos.Z)

			t125[v2865] = true

			local v2866 = t111.cards[v2865]

			if not v2866 or not v2866.part.Parent then
				local Part = Instance.new("Part")

				Part.Size = Vector3.new(0.2, 0.2, 0.2)
				Part.Anchored = true
				Part.CanCollide = false
				Part.CanQuery = false
				Part.CanTouch = false
				Part.Transparency = 1
				Part.Parent = Folder

				local BillboardGui = Instance.new("BillboardGui")

				BillboardGui.Adornee = Part
				BillboardGui.Size = UDim2.fromOffset(120, 20)
				BillboardGui.StudsOffsetWorldSpace = Vector3.new(0, 1.6, 0)
				BillboardGui.AlwaysOnTop = true
				BillboardGui.MaxDistance = 260
				BillboardGui.Parent = Part

				local TextLabel = Instance.new("TextLabel")

				TextLabel.Size = UDim2.fromScale(1, 1)
				TextLabel.BackgroundTransparency = 1
				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.TextSize = 13
				TextLabel.TextStrokeTransparency = 0.35
				TextLabel.Parent = BillboardGui
				v2866 = {
					part = Part,
					label = TextLabel
				}
				t111.cards[v2865] = v2866
			end

			v2866.part.CFrame = cFrameNew(v.pos)

			local v2870 = v2860[v.tier]

			v2866.label.TextColor3 = v2870 and v2870.color or Color3.new(1, 1, 1)

			local label = v2866.label
			local v2872 = v2861

			if v2872 then
				v2872 = ("%s  %dm"):format(v2870 and v2870.name or v.tier, math.floor((v.pos - v2861.Position).Magnitude))
			end

			label.Text = v2872 or v2870 and v2870.name or v.tier
		end

		for k, card in pairs(t111.cards) do
			if not t125[k] then
				pcall(function()
					card.part:Destroy()
				end)
				t111.cards[k] = nil
			end
		end
	end

	local t126

	t126 = {
		target = nil,
		since = 0,
		swinging = false,
		skip = setmetatable({}, {
			__mode = "k"
		}),
		pos = function(p727)
			if not p727 or not p727.Parent then
				return nil
			end

			local ok, result = pcall(function()
				return p727.PrimaryPart and p727.PrimaryPart.Position or p727:GetPivot().Position
			end)
			local v2878 = ok and result or nil

			return v2878
		end,
		pick = function(p728)
			local ButterflyBloomSwarm = workspace:FindFirstChild("ButterflyBloomSwarm")

			if not ButterflyBloomSwarm then
				return nil
			end

			local v2880 = v2736()
			local now = os.clock()
			local v2882
			local v2883

			for _, child in ipairs(ButterflyBloomSwarm:GetChildren()) do
				if child:IsA("Model") and t113[child.Name] and (not v2880 or v2880[child.Name]) then
					if (t126.skip[child] or 0) <= now then
						local v2886 = t126.pos(child)

						if v2886 then
							local v2887 = (t113[child.Name] == 4 and 1000000 or 0) - (v2886 - p728).Magnitude

							if not v2883 or v2883 < v2887 then
								v2882 = child
								v2883 = v2887
							end
						end
					end
				end
			end

			return v2882
		end,
		gain = function()
			local ok, result = pcall(v2677().Save.Peek)
			local v2890 = ok and result and result.Butterflies and tonumber(result.Butterflies.TotalCaught)

			return v2890 and t111.bloomBase and math.max(0, v2890 - t111.bloomBase) or 0
		end
	}
	t126.swing = function(p729, p730)
		if t126.swinging then
			return
		end

		local v2891 = tonumber(v2682("SwingCooldownSeconds", 0.45)) or 0.45

		if os.clock() - t111.lastSwing < v2891 then
			return
		end

		local v2892 = v2677()

		if not v2892 or not v2892.Swarm or not v2892.Swarm.Nearest then
			return
		end

		local ok, result = pcall(v2892.Swarm.Nearest, p730, Vector3.new(0, 0, -1), 4)
		local Flight = ok and result and result.Flight

		if not Flight or not Flight.Id then
			return
		end

		if Flight.Tier ~= nil and tostring(Flight.Tier) ~= p729.Name then
			return
		end

		t111.lastSwing = os.clock()
		t126.swinging = true
		task.spawn(function()
			local _, _, v2898 = v2687("Butterflies", "AskSwing", Flight.Id)

			t126.swinging = false

			if v2898 ~= "Caught" and v2898 ~= "Gone" then
				t126.skip[p729] = os.clock() + 1.5
			end

			if t126.target == p729 then
				t126.target = nil
			end

			local v2899 = t111.tiers()

			t111.status = ("%s %s  ·  +%d this Bloom"):format(v2898 == "Caught" and "Caught" or "Chasing", v2899 and v2899[p729.Name] and v2899[p729.Name].name or p729.Name, t126.gain())
		end)
	end
	t126.prepare = function()
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if not HumanoidRootPart or not Humanoid then
			return nil
		end

		v2751()
		v215(Character)
		v33()
		v22()

		local AutoRotate = Humanoid.AutoRotate

		Humanoid.AutoRotate = false

		return Character, HumanoidRootPart, Humanoid, AutoRotate
	end
	t126.release = function(p731, p732, p733)
		t126.target = nil

		if p732.Parent and p733 ~= nil then
			p732.AutoRotate = p733
		end

		p731.AssemblyLinearVelocity = Vector3.zero
		p731.AssemblyAngularVelocity = Vector3.zero
		v23()
	end
	t126.keepGoing = function(p734, p735, p736)
		if not v16() or not senaV4Config.ButterflyAutoCatch or not (t111.bloomLeft() > 0) or not p734.Parent or not (p735.Health > 0) then
			return false
		end

		if (senaV4Config.ButterflyCatchMode or "Tween") == p736 then
			return not (t111.manual or v2767() or v177() or t114.blocker("butterfly") ~= nil)
		end

		return false
	end
	t126.moveStep = function(p737, p738, p739, p740, p741, p742, p743)
		v27(p737, p742 * t1.HEADROOM)

		local v2904 = v26()[t1.INTEGRITY_KEY]
		local State = type(v2904) == "table" and v2904.State or nil

		if not v30(State, p738, p739) then
			p739.AssemblyLinearVelocity = Vector3.zero
			p739.AssemblyAngularVelocity = Vector3.zero
			v21(p739.Position)

			if v29(State, p738, p739) then
				v28(State, p742 * t1.HEADROOM, Vector3.zero)
			else
				v31(p738, p739, p742)
			end

			return nil
		end

		local Position = p739.Position
		local v2907 = p740 - Position
		local v2908 = p742 * p743
		local v2909 = v2907.Magnitude <= v2908 and p740 or Position + v2907.Unit * v2908
		local v2910 = (p741 or p740) - v2909
		local vector32 = Vector3.new(v2910.X, 0, v2910.Z)

		if vector32.Magnitude <= 0.001 then
			vector32 = Vector3.new(v2907.X, 0, v2907.Z)
		end

		local Unit = vector32.Magnitude > 0.001 and vector32.Unit or p739.CFrame.LookVector
		local v2913 = (v2909 - Position) / p743

		v21(v2909)
		p739.CFrame = lookAt(v2909, v2909 + Unit)
		p739.AssemblyLinearVelocity = Vector3.zero
		p739.AssemblyAngularVelocity = Vector3.zero

		if not v32(p738, p739, p742, v2913) then
			v31(p738, p739, p742)
			v32(p738, p739, p742, v2913)
		end

		return v2909
	end
	t126.nearest = function(p744, p745)
		local ButterflyBloomSwarm = workspace:FindFirstChild("ButterflyBloomSwarm")

		if not ButterflyBloomSwarm then
			return nil
		end

		local v2915 = v2736()
		local now = os.clock()
		local v2917
		local v2918
		local v2919 = p745

		for _, child in ipairs(ButterflyBloomSwarm:GetChildren()) do
			if child:IsA("Model") and t113[child.Name] and (not v2915 or v2915[child.Name]) then
				if (t126.skip[child] or 0) <= now then
					local v2922 = t126.pos(child)
					local Magnitude = v2922 and (v2922 - p744).Magnitude

					if Magnitude and Magnitude <= v2919 then
						v2917 = child
						v2918 = v2922
						v2919 = Magnitude
					end
				end
			end
		end

		return v2917, v2918
	end
	t126.cluster = function(p746)
		local ButterflyBloomSwarm = workspace:FindFirstChild("ButterflyBloomSwarm")
		local t127 = {}
		local ipairs_ = ipairs
		local children = ButterflyBloomSwarm and ButterflyBloomSwarm:GetChildren() or {}

		for _, child in ipairs_(children) do
			if child:IsA("Model") and t113[child.Name] then
				local v2930 = t126.pos(child)

				if v2930 then
					t127[#t127 + 1] = v2930
				end
			end
		end

		if #t127 == 0 then
			return nil, 0, 0
		end

		local n53 = 0

		for _, v in ipairs(t127) do
			if p746 and (v - p746).Magnitude <= 24 then
				n53 += 1
			end
		end

		local v2934
		local v2935

		for _, v in ipairs(t127) do
			local vector32 = Vector3.zero
			local n54 = 0

			for _, v2 in ipairs(t127) do
				if (v - v2).Magnitude <= 24 then
					vector32 += v2
					n54 += 1
				end
			end

			local v2942 = vector32 / n54
			local v2943 = n54 * 100 - (p746 and (v2942 - p746).Magnitude or 0)

			if not v2935 or v2935 < v2943 then
				v2934 = v2942
				v2935 = v2943
			end
		end

		return v2934, #t127, n53
	end
	t126.route = function(p747, p748, p749)
		if p747 == "Circle" then
			local v2944 = p749 * 2.0833333333333335

			return p748 + Vector3.new(math.cos(v2944) * 24, 0, math.sin(v2944) * 24)
		end

		local v2945 = v2787()

		if not (p747 == "Zigzag" and v2945) then
			return p748
		end

		local v2946 = math.max(v2945.Size.X / 2 - 12, 20)
		local v2947 = math.clamp(v2945.Size.Z / 2 - 12, 8, 30)
		local v2948 = p749 * 80 / math.sqrt((2 * v2946 / 8) ^ 2 + (2 * v2947) ^ 2) % 16
		local v2949 = math.floor(v2948)
		local v2950 = v2948 - v2949
		local v2951 = v2949 <= 8 and v2949 or 16 - v2949
		local v2952 = v2949 + 1 <= 8 and v2949 + 1 or 16 - (v2949 + 1)
		local v2953 = -v2946 + v2951 * (2 * v2946 / 8)
		local v2954 = v2949 % 2 == 0 and -v2947 or v2947
		local v2955 = v2945.CFrame:VectorToWorldSpace(Vector3.new(v2953 + (-v2946 + v2952 * (2 * v2946 / 8) - v2953) * v2950, 0, v2954 + (((v2949 + 1) % 2 == 0 and -v2947 or v2947) - v2954) * v2950))

		return Vector3.new(v2945.Position.X + v2955.X, p748.Y, v2945.Position.Z + v2955.Z)
	end
	t126.patrol = function(p750)
		local v2956, v2957, v2958, v2959 = t126.prepare()

		if not v2956 then
			return false
		end

		local v2960 = tonumber(v2682("NetReach", 14)) or 14
		local v2961 = ({
			Stand = "Standing in the swarm",
			Zigzag = "Zigzag patrol",
			Circle = "Circling the swarm"
		})[p750] or p750
		local v2962
		local n55 = 0
		local now = os.clock()
		local v2965
		local v2966 = false
		local n56 = 0

		while t126.keepGoing(v2957, v2958, p750) do
			local v2968 = math.max(math.min(RunService.Heartbeat:Wait(), 0.15), 0.0041666666666666666)
			local now2 = os.clock()

			if n55 <= now2 then
				local v2970, v2971, v2972 = t126.cluster(v2962)

				n55 = now2 + 1.5

				if v2971 == 0 then
					v2965 = v2965 or now2
				else
					v2965 = nil

					if p750 == "Stand" then
						if not v2962 or v2972 < 3 then
							v2962 = v2970
						end
					else
						v2962 = v2962 and v2962:Lerp(v2970, 0.5) or v2970
					end
				end
			end

			if v2965 and now2 - v2965 > 2 then
				break
			end

			if v2962 then
				v2966 = true

				local v2973 = t126.route(p750, v2962, now2 - now)
				local huge = (v2973 - v2957.Position).Magnitude > 40 and math.huge or p750 == "Stand" and 60 or p750 == "Circle" and 70 or 110
				local v2975 = math.clamp(math.min(v20(), huge), t1.MIN_SPEED, t1.MAX_SPEED)
				local v2976, v2977 = t126.nearest(v2957.Position, v2960 + 6)
				local v2978 = t126.moveStep(v2956, v2958, v2957, v2973, v2977, v2975, v2968)

				if v2978 and v2976 and (v2977 - v2978).Magnitude <= v2960 - 1.5 then
					t126.swing(v2976, v2977)
				end

				if n56 <= now2 and not t126.swinging then
					n56 = now2 + 1
					t111.status = ("%s  ·  +%d this Bloom"):format(v2961, t126.gain())
				end
			else
				v2957.AssemblyLinearVelocity = Vector3.zero
				v2957.AssemblyAngularVelocity = Vector3.zero
				v21(v2957.Position)
			end
		end

		t126.release(v2957, v2958, v2959)

		return v2966
	end
	t126.run = function()
		local v2979, v2980, v2981, v2982 = t126.prepare()

		if not v2979 then
			return false
		end

		local v2983 = tonumber(v2682("NetReach", 14)) or 14
		local v2984 = math.min(v2983 - 3, (tonumber(v2682("DodgeRadius", 9)) or 9) + 1)
		local now
		local v2986 = false

		while t126.keepGoing(v2980, v2981, "Tween") do
			local v2987 = math.max(math.min(RunService.Heartbeat:Wait(), 0.15), 0.0041666666666666666)
			local target = t126.target
			local v2989 = t126.pos(target)

			if not v2989 or os.clock() - t126.since > 3 then
				if v2989 then
					t126.skip[target] = os.clock() + 2
				end

				target = t126.pick(v2980.Position)

				local now2 = os.clock()

				t126.target = target
				t126.since = now2
				v2989 = t126.pos(target)

				if target then
					local v2991 = t111.tiers()

					t111.status = ("Chasing %s  ·  +%d this Bloom"):format(v2991 and v2991[target.Name] and v2991[target.Name].name or target.Name, t126.gain())
				end
			end

			if v2989 then
				now = nil
				v2986 = true

				local v2992 = math.clamp(v20(), t1.MIN_SPEED, t1.MAX_SPEED)
				local v2993 = v2980.Position - v2989
				local v2994 = t126.moveStep(v2979, v2981, v2980, v2993.Magnitude > 0.001 and v2989 + v2993.Unit * v2984 or v2989 + Vector3.new(v2984, 0, 0), v2989, v2992, v2987)

				if v2994 and (v2989 - v2994).Magnitude <= v2983 - 1.5 then
					t126.swing(target, v2989)
				end

				continue
			else
				now = now or os.clock()

				if not (os.clock() - now > 2) then
					v2980.AssemblyLinearVelocity = Vector3.zero
					v2980.AssemblyAngularVelocity = Vector3.zero
					v21(v2980.Position)

					continue
				end
			end

			break
		end

		t126.release(v2980, v2981, v2982)

		return v2986
	end

	local function v2995(p751)
		if v2767() then
			v2777()

			return
		end

		if not v2789() then
			v2751()

			if v177() then
				t111.status = "Night - waiting to fly to the forest"

				return
			end

			if not v2691("area") then
				return
			end

			local v2996 = v2793()

			if not v2996 then
				t111.status = "Butterfly Bloom zone not found"
				v2692("area")

				return
			end

			t111.status = "Flying to the Butterfly Bloom"

			if not v2757(v2996, 60) then
				v2692("area")
				t111.status = "Could not reach the Enchanted Forest"
			end

			return
		end

		local __SenaV4TreadmillManager = genv.__SenaV4TreadmillManager

		if __SenaV4TreadmillManager and __SenaV4TreadmillManager.activeTreadmill ~= nil then
			v2795()
		end

		if not p751.holding and not v2746() then
			t111.status = "Butterfly Net is not in your backpack"

			return
		end

		local ButterflyCatchMode = senaV4Config.ButterflyCatchMode or "Tween"
		local v2999

		if ButterflyCatchMode == "Tween" then
			v2999 = t126.run()
		else
			v2999 = t126.patrol(ButterflyCatchMode)
		end

		if not v2999 then
			v2752()
			t111.status = ("Waiting for butterflies  ·  +%d this Bloom"):format(t126.gain())
		end
	end
	local function v3000(p752)
		if not p752.net then
			return p752.treeUnlocked and "No Butterfly Net yet" or "Enchanted Tree locked - finish the Wisp Event"
		end

		if p752.active then
			return "Bloom is live"
		end

		if p752.nextIn then
			return ("Next Bloom in %dm %02ds"):format(math.floor(p752.nextIn / 60), math.floor(p752.nextIn % 60))
		end

		return "Idle"
	end
	local function v3001()
		if t111.manual then
			return
		end

		local v3002 = t111.snapshot()

		if v3002.active then
			t111.bloomBase = t111.bloomBase or v3002.caught
		else
			t111.bloomBase = nil
		end

		if senaV4Config.ButterflyEsp and v3002.active then
			v2858()
		elseif next(t111.cards) or Folder then
			v2855()
		end

		local s7

		if senaV4Config.ButterflyAutoNet and not v3002.net and v3002.treeUnlocked and v2691("net") then
			s7 = "net"
		elseif senaV4Config.ButterflyAutoCatch and v3002.active and v3002.net then
			s7 = "catch"
		elseif not v3002.active and senaV4Config.ButterflyAutoTrade and v3002.net and t111.canTrade() and v2691("trade") then
			s7 = "trade"
		elseif not v3002.active and senaV4Config.ButterflyAutoCraft and v3002.net and t111.canCraft() and v2691("craft") then
			s7 = "craft"
		end

		t111.wantsCharacter = s7 ~= nil

		local butterfly = s7 and t114.blocker("butterfly") or nil
		local butterfly2 = s7 and not butterfly and t114.holder("butterfly") or nil
		local active = t111.active

		t111.active = s7 ~= nil and butterfly == nil and butterfly2 == nil

		if s7 and not t111.active then
			v2751()

			if butterfly and v2767() then
				t111.status = "Leaving the tree for " .. t114.TITLES[butterfly]
				v2777()
			end

			t111.status = butterfly and "Yielding to " .. t114.TITLES[butterfly] or "Waiting for " .. t114.TITLES[butterfly2] .. " to hand over"

			return
		end

		if not s7 then
			if active then
				v2801()
			end

			v2751()
			t111.status = v3000(v3002)

			return
		end

		if not active then
			v2795()
		end

		if s7 == "net" then
			local v3007, v3008 = t111.claimNet()
			local status = v3007 and "Butterfly Net claimed"

			if not status then
				status = "Net: " .. tostring(v3008 or "refused")
			end

			t111.status = status

			if not v3007 then
				v2692("net")
			end
		elseif s7 == "catch" then
			v2995(v3002)
		elseif s7 == "trade" then
			local status, v3011 = t111.tradeUp()

			if status then
				status = ("Traded up %d time(s)"):format(tonumber(v3011) or 0)
			end

			t111.status = status or "Trade: " .. tostring(v3011)
			v2692("trade")
		elseif s7 == "craft" then
			local status, v3013 = t111.craft()

			if status then
				status = ("Crafted %d Enchanted Essence"):format(tonumber(v3013) or 0)
			end

			t111.status = status or "Craft: " .. tostring(v3013)
			v2692("craft")
		end
	end

	task.spawn(function()
		while v16() do
			local ok, result = pcall(v3001)

			if not ok then
				t111.active = false
				t111.wantsCharacter = false
				v2751()
				t111.status = "Error: " .. tostring(result)
				task.wait(1)
			end

			task.wait(0.2)
		end

		v2751()
		v2855()
	end)
	genv.__SenaV4ButterflyRuntime = t111
end

v2666()

local function v3016()
	local u3017

	local function v3018()
		if u3017 then
			return u3017
		end

		local t128 = {}

		pcall(function()
			for _, child in ipairs(ReplicatedStorage.Data.Gears.Configs:GetChildren()) do
				local ok, result = pcall(require, child)

				if ok and type(result) == "table" and type(result.BatControllerData) == "table" then
					for _, v in ipairs({
						child.Name,
						result._id,
						result.DisplayName,
						result.ToolModel
					}) do
						if type(v) == "string" then
							t128[v:lower()] = true
						end
					end
				end
			end
		end)

		if next(t128) then
			u3017 = t128
		end

		return t128
	end
	local function v3026(p753)
		if not p753 or not p753:IsA("Tool") then
			return false
		end

		if p753:GetAttribute("IsBat") == true then
			return true
		end

		local attribute = p753:GetAttribute("ItemType")

		if attribute ~= nil and attribute ~= "Gear" then
			return false
		end

		local v3028 = v3018()
		local v3029 = tostring(p753:GetAttribute("GearName") or ""):lower()
		local v3030 = tostring(p753.Name or ""):gsub("%s*%[.-%]%s*$", ""):lower()

		if v3028[v3029] or v3028[v3030] then
			return true
		end

		return attribute == "Gear" and (v3029:find("bat", 1, true) ~= nil or v3030:find("bat", 1, true) ~= nil)
	end

	return v3026
end

genv.__SenaV4IsBatTool = v3016()

do
	local Players2 = game:GetService("Players")
	local RunService2 = game:GetService("RunService")
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local LocalPlayer2 = Players2.LocalPlayer
	local t129 = {
		pinConn = nil,
		holding = false,
		status = "Idle"
	}

	local function v3036()
		local ok, result = pcall(require, ReplicatedStorage2.Client.EggState)

		return ok and result or nil
	end
	local function v3039()
		local ok, result = pcall(require, ReplicatedStorage2.Shared.Remotes)

		return ok and result or nil
	end
	local function v3042()
		local ok, result = pcall(require, ReplicatedStorage2.Shared.Types.AreaEggs)

		return ok and result and result.States or nil
	end
	local function v3045()
		local Character = LocalPlayer2.Character

		return Character and Character:FindFirstChild("HumanoidRootPart")
	end
	local function v3047()
		local Character = LocalPlayer2.Character

		return Character and Character:FindFirstChildOfClass("Humanoid")
	end
	local function v3049()
		return workspace:GetAttribute("Event_CaptureTheEggUid")
	end
	local function v3050(p754)
		if not p754 then
			return nil
		end

		local v3051 = v3036()

		if not v3051 then
			return nil
		end

		local ok, result = pcall(v3051.ReadFieldEgg, p754)

		return ok and result or nil
	end
	local function v3054(p755, p756)
		local v3055 = p756 or v3050(p755)
		local v3056 = v3042()

		if v3055 and v3056 then
			return v3055.State == v3056.Carried and v3055.CarrierUserId == LocalPlayer2.UserId
		end

		return false
	end
	local function v3057(p757)
		local v3058 = v3042()

		if p757 and v3058 then
			return p757.State == v3058.Slot or p757.State == v3058.Dropped
		end

		return false
	end
	local function v3059()
		local SenaCapturePlatform = workspace:FindFirstChild("SenaCapturePlatform")

		if SenaCapturePlatform then
			pcall(function()
				SenaCapturePlatform:Destroy()
			end)
		end
	end
	local function v3061(p758)
		local v3062 = p758 or v3045()

		if not v3062 then
			return
		end

		local SenaCapturePlatform = workspace:FindFirstChild("SenaCapturePlatform")

		if not SenaCapturePlatform then
			SenaCapturePlatform = Instance.new("Part")
			SenaCapturePlatform.Name = "SenaCapturePlatform"
			SenaCapturePlatform.Anchored = true
			SenaCapturePlatform.CanCollide = true
			SenaCapturePlatform.Size = Vector3.new(30, 1, 30)
			SenaCapturePlatform.Transparency = 0.5
			SenaCapturePlatform.Material = Enum.Material.Neon
			SenaCapturePlatform.Color = Color3.fromRGB(130, 90, 255)
			SenaCapturePlatform.TopSurface = Enum.SurfaceType.Smooth
			SenaCapturePlatform.BottomSurface = Enum.SurfaceType.Smooth
			SenaCapturePlatform.Parent = workspace
		end

		SenaCapturePlatform.CFrame = cFrameNew(v3062.Position.X, v3062.Position.Y - 3.4, v3062.Position.Z)
	end
	local function v3064()
		if t129.pinConn then
			return
		end

		t129.pinConn = RunService2.PreSimulation:Connect(function()
			if not senaV4Config.AutoStealCapture then
				return
			end

			local v3065 = v3045()

			if not v3065 then
				return
			end

			if v3065.Position.Y < 89 then
				v3065.CFrame = cFrameNew(v3065.Position.X, 90, v3065.Position.Z) * v3065.CFrame.Rotation
			end

			v3065.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			v3065.AssemblyAngularVelocity = Vector3.zero
			v3061(v3065)
		end)
	end
	local function v3066()
		if t129.pinConn then
			pcall(function()
				t129.pinConn:Disconnect()
			end)
			t129.pinConn = nil
		end

		v3059()
	end
	local function v3067(p759, p760)
		local v3068 = v3045()
		local v3069 = v3047()

		if not v3068 or not v3069 or not p760 or not p760.BottomCFrame then
			return false
		end

		v3066()

		local v3070 = p760.BottomCFrame.Position + Vector3.new(0, 3, 0)

		t129.status = "Flying to capture egg"
		pcall(v232, v3068, v3069, cFrameNew(v3070) * v3068.CFrame.Rotation, function()
			return not senaV4Config.AutoStealCapture or v3049() ~= p759 or v3054(p759)
		end)

		local v3071 = v3045()

		if not v3071 then
			return false
		end

		pcall(function()
			v3071.AssemblyLinearVelocity = Vector3.zero
			v3071.AssemblyAngularVelocity = Vector3.zero
		end)

		local v3072 = v3039()

		if not v3072 or not v3072.EggWorld or not v3072.EggWorld.AskFieldEggCarry then
			return false
		end

		t129.status = "Grabbing capture egg"

		local ok, result = pcall(function()
			return v3072.EggWorld.AskFieldEggCarry:InvokeServer({
				Uid = p759
			})
		end)
		local v3075 = ok and result == true

		return v3075
	end

	task.spawn(function()
		while v16() do
			if senaV4Config.AutoStealCapture then
				if not pcall(function()
					local v3076 = v3049()
					local v3077 = v3050(v3076)

					if v3076 and v3054(v3076, v3077) then
						t129.holding = true
						t129.status = "Holding capture egg"
						v3064()
					elseif v3076 and v3057(v3077) then
						t129.holding = false
						v3067(v3076, v3077)
					elseif not v3076 then
						t129.holding = false

						if t129.pinConn or workspace:FindFirstChild("SenaCapturePlatform") then
							v3066()
						end

						t129.status = "No capture event"
					elseif t129.holding then
						v3064()
						t129.status = "Egg taken - holding position"
					else
						if t129.pinConn or workspace:FindFirstChild("SenaCapturePlatform") then
							v3066()
						end

						t129.status = "Waiting for capture egg"
					end
				end) then
					v3066()
				end

				task.wait(0.3)
			else
				if t129.pinConn or workspace:FindFirstChild("SenaCapturePlatform") then
					v3066()
				end

				t129.holding = false
				t129.status = "Idle"
				task.wait(0.5)
			end
		end
	end)
	genv.__SenaV4AutoCapture = t129
end

do
	local Players2 = game:GetService("Players")
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local LocalPlayer2 = Players2.LocalPlayer

	local function v3081()
		local ok, result = pcall(require, ReplicatedStorage2.Shared.Save)

		return ok and result or nil
	end
	local function v3084()
		local ok, result = pcall(require, ReplicatedStorage2.Data.Assets)

		if ok then
			return result.Directory or result
		end

		return nil
	end
	local function v3087(p761)
		return "SENAVIS_" .. p761 .. "_" .. tostring(math.floor(os.clock() * 1000)) .. "_" .. tostring(math.random(1, 1000000))
	end

	local t130 = {
		held = {},
		categories = function(p762)
			local v3089 = v3084()
			local t131 = {}

			if not v3089 then
				return t131
			end

			for k, v in pairs(v3089) do
				if type(k) == "string" and type(v) == "table" and (p762 == "Pet" or v.Egg ~= nil) then
					t131[#t131 + 1] = k
				end
			end

			table.sort(t131)

			return t131
		end,
		spawnEgg = function(p763, p764)
			local v3093 = v3081()
			local v3094 = v3084()

			if not v3093 or not v3094 or not v3094[p763] then
				return nil
			end

			local v3095 = v3087("E")

			pcall(function()
				v3093.Amend("EggInventory", function(p765)
					p765[v3095] = {
						AssetCategory = p763,
						AssetScale = tonumber(p764) or 50,
						AssetColorIndex = 1,
						AssetColorSeed = math.random(1, 2e9),
						AssetEyeColor = "ffffff",
						HasParasite = false,
						Mutations = {}
					}
				end)
			end)

			return v3095
		end,
		spawnPet = function(p766, p767)
			local v3096 = v3081()
			local v3097 = v3084()

			if not v3096 or not v3097 or not v3097[p766] then
				return nil
			end

			local v3098 = v3087("P")

			pcall(function()
				v3096.Amend("Inventory", function(p768)
					p768[v3098] = {
						Category = p766,
						Scale = tonumber(p767) or 50,
						ColorIndex = 1,
						ColorSeed = math.random(1, 2e9),
						EyeColor = "ffffff",
						Gender = "Male",
						Personality = "Normal",
						InFuse = false,
						HasBeenFirstPlaced = false,
						Mutations = {}
					}
				end)
			end)

			return v3098
		end
	}

	local function v3099(p769)
		local Assets = ReplicatedStorage2:FindFirstChild("Assets")
		local Models = Assets and Assets:FindFirstChild("Models")
		local Eggs = Models and Models:FindFirstChild("Eggs")

		return Eggs and Eggs:FindFirstChild(p769)
	end
	local function v3103(p770)
		local AssetModels = ReplicatedStorage2:FindFirstChild("AssetModels")

		return AssetModels and AssetModels:FindFirstChild(p770)
	end
	local function v3105()
		for _, v in ipairs(t130.held) do
			pcall(function()
				v:Destroy()
			end)
		end

		t130.held = {}

		for _, v in ipairs({
			LocalPlayer2.Character,
			LocalPlayer2:FindFirstChild("Backpack")
		}) do
			if v then
				for _, child in ipairs(v:GetChildren()) do
					if child:IsA("Tool") then
						if child.Name:sub(1, 8) == "SENAVIS_" then
							pcall(function()
								child:Destroy()
							end)
						end
					end
				end
			end
		end
	end

	t130.hold = function(p771, p772, p773)
		local Character = LocalPlayer2.Character

		if not Character then
			return false
		end

		local v3113 = p772 and v3099(p771) or v3103(p771)

		if not v3113 then
			return false
		end

		local ok, result = pcall(function()
			return v3113:Clone()
		end)

		if not ok or not result or not result:IsA("Model") then
			return false
		end

		local PrimaryPart = result.PrimaryPart or result:FindFirstChildWhichIsA("BasePart")

		if not PrimaryPart then
			pcall(function()
				result:Destroy()
			end)

			return false
		end

		pcall(function()
			if not result.PrimaryPart then
				result.PrimaryPart = PrimaryPart
			end
		end)

		local v3117 = math.clamp(1 + (tonumber(p773) or 50) / 70, 1, 2.4) * (0.85 + math.random() * 0.4)

		pcall(function()
			if result.ScaleTo then
				result:ScaleTo(v3117)
			end
		end)

		local vector32 = Vector3.new(3, 3, 3)

		pcall(function()
			vector32 = result:GetExtentsSize()
		end)

		local Tool = Instance.new("Tool")

		Tool.Name = "SENAVIS_" .. p771
		Tool.RequiresHandle = true
		Tool.CanBeDropped = false

		local v3120 = v3084()
		local v3121 = v3120 and v3120[p771]
		local Icon = v3121 and (p772 and v3121.Egg and v3121.Egg.Icon or v3121.Icon)

		if type(Icon) == "string" then
			pcall(function()
				Tool.TextureId = Icon
			end)
		end

		PrimaryPart.Name = "Handle"

		for _, descendant in ipairs(result:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.Massless = true
				descendant.CanCollide = false
				descendant.Anchored = false

				if descendant ~= PrimaryPart then
					local WeldConstraint = Instance.new("WeldConstraint")

					WeldConstraint.Part0 = PrimaryPart
					WeldConstraint.Part1 = descendant
					WeldConstraint.Parent = PrimaryPart
				end
			end
		end

		for _, child in ipairs(result:GetChildren()) do
			child.Parent = Tool
		end

		PrimaryPart.Parent = Tool
		pcall(function()
			result:Destroy()
		end)
		pcall(function()
			Tool.Grip = cFrameNew(0, -(vector32.Y * 0.55), math.max(vector32.X, vector32.Z) * 0.5 + 0.5)
		end)
		Tool.Parent = LocalPlayer2:FindFirstChild("Backpack") or Character

		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			pcall(function()
				Humanoid:EquipTool(Tool)
			end)
		end

		t130.held[#t130.held + 1] = Tool

		return true
	end
	t130.spawn = function(p774, p775, p776, p777)
		if not p775 or p775 == "None" then
			return
		end

		local v3129 = tonumber(p776) or 50

		if p777 then
			pcall(t130.hold, p775, p774 ~= "Pet", v3129)
		elseif p774 == "Pet" then
			t130.spawnPet(p775, math.clamp(1 + v3129 / 25, 1.2, 5) * (0.85 + math.random() * 0.4))
		else
			t130.spawnEgg(p775, v3129 * (0.85 + math.random() * 0.5))
		end
	end
	t130.clear = function()
		local v3130 = v3081()

		if v3130 then
			pcall(function()
				v3130.Amend("EggInventory", function(p778)
					for k in pairs(p778) do
						if type(k) == "string" and k:sub(1, 8) == "SENAVIS_" then
							p778[k] = nil
						end
					end
				end)
			end)
			pcall(function()
				v3130.Amend("Inventory", function(p779)
					for k in pairs(p779) do
						if type(k) == "string" and k:sub(1, 8) == "SENAVIS_" then
							p779[k] = nil
						end
					end
				end)
			end)
			pcall(function()
				v3130.Amend("EquippedAssets", function(p780)
					for i = #p780, 1, -1 do
						local v3134 = p780[i]

						if type(v3134) == "string" and v3134:sub(1, 8) == "SENAVIS_" then
							table.remove(p780, i)
						end
					end
				end)
			end)
		end

		for _, v in ipairs(t130.held) do
			pcall(function()
				v:Destroy()
			end)
		end

		t130.held = {}

		for _, v in ipairs({
			LocalPlayer2.Character,
			LocalPlayer2:FindFirstChild("Backpack")
		}) do
			if v then
				for _, child in ipairs(v:GetChildren()) do
					if child:IsA("Tool") then
						if child.Name:sub(1, 8) == "SENAVIS_" then
							pcall(function()
								child:Destroy()
							end)
						end
					end
				end
			end
		end
	end
	genv.__SenaV4VisualSAE = t130
end

do
	local cameraMaxZoomDistance = (tonumber(game:GetService("StarterPlayer").CameraMaxZoomDistance) or 128) * 1.95

	local function v3142()
		if LocalPlayer.CameraMaxZoomDistance < cameraMaxZoomDistance then
			LocalPlayer.CameraMaxZoomDistance = cameraMaxZoomDistance
		end
	end

	pcall(v3142)
	LocalPlayer:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function()
		if v16() then
			pcall(v3142)
		end
	end)
end

do
	local function v3143()
		local HttpService = game:GetService("HttpService")
		local t132 = {
			base = "http://56.10.112.179:8080/visual/",
			manifest = nil,
			status = "Idle",
			spawned = {},
			backs = {},
			backRod = nil,
			remote = {}
		}
		local Unit = Vector3.new(0.3, 0.75, 0.6).Unit
		local t133 = {
			RightShoulder = Angles(0.69813170079773179, 0, 0.17453292519943295),
			RightElbow = Angles(1.7453292519943295, 0, 0),
			RightWrist = cFrameNew(),
			LeftShoulder = cFrameNew(),
			LeftElbow = cFrameNew(),
			LeftWrist = cFrameNew()
		}
		local v3148 = cFrameNew(0.5, 1.3, 1, -0.7071, -0.7071, 0, -0.7071, 0.7071, 0, 0, 0, -1):Inverse()

		local function v3149(p781)
			local s8 = ""

			for match in string.gmatch(p781, "[^/]+") do
				s8 = s8 == "" and match or s8 .. "/" .. match

				if not isfolder(s8) then
					makefolder(s8)
				end
			end
		end
		local function v3152(p782)
			local ok, result = pcall(function()
				return game:HttpGet(p782, true)
			end)

			if not ok or type(result) ~= "string" or result == "" then
				return nil
			end

			return result
		end

		t132.loadManifest = function()
			if t132.manifest then
				return t132.manifest
			end

			v3149("SenaVisual/cache")

			local json = v3152(t132.base .. "manifest.json")

			if json then
				pcall(writefile, "SenaVisual/cache/manifest.json", json)
			elseif isfile("SenaVisual/cache/manifest.json") then
				json = readfile("SenaVisual/cache/manifest.json")
			end

			local ok, manifest = pcall(function()
				return HttpService:JSONDecode(json)
			end)

			if ok and type(manifest) == "table" then
				t132.manifest = manifest
			end

			return t132.manifest
		end
		t132.names = function(p783)
			local t134 = {}
			local v3159 = t132.loadManifest()
			local ipairs_ = ipairs
			local v3161 = v3159 and v3159[p783] or {}

			for _, v in ipairs_(v3161) do
				local name = v.name

				if v.tier then
					name = v.name .. " [" .. v.tier .. "]"
				end

				table.insert(t134, name)
			end

			return t134
		end

		local function v3165(p784, p785)
			local v3166 = t132.loadManifest()
			local ipairs_ = ipairs
			local v3168 = v3166 and v3166[p784] or {}

			for _, v in ipairs_(v3168) do
				if v.name == p785 or v.name .. " [" .. tostring(v.tier) .. "]" == p785 then
					return v
				end
			end

			return nil
		end
		local function v3171(p786, p787)
			local v3172 = "SenaVisual/cache" .. "/" .. p786

			v3149(v3172)

			local v3173 = v3172 .. "/" .. p787.file

			if not isfile(v3173) then
				t132.status = "Downloading " .. p787.name .. "..."

				local v3174 = v3152(t132.base .. p786 .. "/" .. p787.file)

				if not v3174 then
					return nil, "Download failed"
				end

				writefile(v3173, v3174)
			end

			local ok, result = pcall(function()
				return game:GetObjects(getcustomasset(v3173))
			end)

			if not ok or not (type(result) == "table" and result[1]) then
				pcall(delfile, v3173)

				return nil, "Could not load model"
			end

			return result[1]
		end

		t132.rodScale = 1
		t132.fishWeight = 0

		local function v3177(p788, p789, p790)
			local t135 = {}

			for _, descendant in ipairs(p788:GetDescendants()) do
				if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") then
					descendant:Destroy()
				elseif descendant:IsA("BasePart") then
					table.insert(t135, descendant)
				elseif descendant:IsA("Script") or descendant:IsA("LocalScript") then
					descendant:Destroy()
				end
			end

			if #t135 == 0 then
				return nil
			end

			local Handle = p788:FindFirstChild("Handle", true)

			if not Handle or not Handle:IsA("BasePart") then
				Handle = t135[1]
			end

			if p789 or p790 and p790 ~= 1 then
				local boundingBox, v3183 = p788:GetBoundingBox()
				local v3184 = p790 or p789 / math.max(v3183.X, v3183.Y, v3183.Z, 0.01)

				if not p789 then
					boundingBox = Handle.CFrame
				end

				for _, v in ipairs(t135) do
					local v3187 = boundingBox:ToObjectSpace(v.CFrame)

					v.Size *= v3184
					v.CFrame = boundingBox * (cFrameNew(v3187.Position * v3184) * v3187.Rotation)
				end

				for _, descendant in ipairs(p788:GetDescendants()) do
					if descendant:IsA("Attachment") then
						if not descendant.Parent:IsA("Bone") then
							descendant.Position *= v3184
						end
					end
				end
			end

			for _, v in ipairs(t135) do
				v.Anchored = false
				v.CanCollide = false
				v.CanQuery = false
				v.CanTouch = false
				v.Massless = true

				if v ~= Handle then
					local Weld = Instance.new("Weld")

					Weld.Part0 = Handle
					Weld.Part1 = v
					Weld.C0 = Handle.CFrame:ToObjectSpace(v.CFrame)
					Weld.Parent = Handle
				end
			end

			Handle.Name = "Handle"

			return Handle, t135
		end
		local function v3193(p791, p792)
			local vector32 = Vector3.zero
			local vector33 = Vector3.zero

			for _, v in ipairs(p792) do
				if v ~= p791 and v.Transparency < 0.95 then
					local v3198 = v.Size / 2

					for _, v2 in ipairs({
						-1,
						1
					}) do
						for _, v3 in ipairs({
							-1,
							1
						}) do
							for _, v4 in ipairs({
								-1,
								1
							}) do
								local v3205 = p791.CFrame:PointToObjectSpace(v.CFrame:PointToWorldSpace(Vector3.new(v3198.X * v2, v3198.Y * v3, v3198.Z * v4)))

								vector32 = vector32:Min(v3205)
								vector33 = vector33:Max(v3205)
							end
						end
					end
				end
			end

			local v3206 = vector33 - vector32
			local vector34

			if v3206.Y <= v3206.X and v3206.Z <= v3206.X then
				vector34 = Vector3.new(vector33.X >= -vector32.X and 1 or -1, 0, 0)
			elseif v3206.Z <= v3206.Y then
				vector34 = Vector3.new(0, vector33.Y >= -vector32.Y and 1 or -1, 0)
			else
				vector34 = Vector3.new(0, 0, vector33.Z >= -vector32.Z and 1 or -1)
			end

			local vector35 = Vector3.xAxis

			if math.abs(vector34.X) > 0.5 then
				vector35 = v3206.Z >= v3206.Y and Vector3.zAxis or Vector3.yAxis
			elseif math.abs(vector34.Z) > 0.5 then
				vector35 = v3206.X >= v3206.Y and Vector3.xAxis or Vector3.yAxis
			end

			local v3209 = -math.min(vector32:Dot(vector34), vector33:Dot(vector34))

			return fromMatrix(Vector3.zero, vector35, vector34), math.max(0, v3209 - 0.6)
		end

		t132.updateBack = function()
			local Backpack = LocalPlayer:FindFirstChild("Backpack")

			for k, back in pairs(t132.backs) do
				back(k == t132.backRod and Backpack ~= nil and k.Parent == Backpack)
			end

			task.defer(t132.refreshQuality)
		end
		t132.refreshQuality = function()
			local v3213 = false
			local Character = LocalPlayer.Character

			if Character then
				for _, child in ipairs(Character:GetChildren()) do
					if child:IsA("Tool") and child:GetAttribute("SenaVisual") or child.Name == "SenaVisualBack" then
						v3213 = true

						break
					end
				end
			end

			if next(t132.remote) ~= nil then
				v3213 = true
			end

			pcall(function()
				if v3213 then
					settings().Rendering.QualityLevel = Enum.QualityLevel.Level10
				elseif senaV4Config.StartupBoost then
					settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
				end
			end)
		end

		local function v3217(p793, p794, p795)
			local v3218 = Vector3.one * 1e9
			local v3219 = -Vector3.one * 1e9
			local v3220, v3221, v3222 = ipairs(p795)

			for _, v in v3220, v3221, v3222 do
				local v3225 = v.Size / 2

				for _, v2 in ipairs({
					-1,
					1
				}) do
					for _, v3 in ipairs({
						-1,
						1
					}) do
						for _, v4 in ipairs({
							-1,
							1
						}) do
							local v3232 = v.CFrame:PointToWorldSpace(Vector3.new(v3225.X * v2, v3225.Y * v3, v3225.Z * v4))

							v3218 = v3218:Min(v3232)
							v3219 = v3219:Max(v3232)
						end
					end
				end
			end

			local v3233 = v3219 - v3218
			local t136 = {}
			local n57 = 0
			local vector32 = Vector3.zero
			local v3237, v3238, v3239 = ipairs(p795)

			for _, v in v3237, v3238, v3239 do
				if v.Transparency < 0.95 then
					local v3242 = math.max(v.Size.X * v.Size.Y * v.Size.Z, 0.0001)
					local v3243 = v.Size / 2
					local huge = math.huge

					for _, v2 in ipairs({
						-1,
						1
					}) do
						for _, v3 in ipairs({
							-1,
							1
						}) do
							for _, v4 in ipairs({
								-1,
								1
							}) do
								huge = math.min(huge, v.CFrame:PointToWorldSpace(Vector3.new(v3243.X * v2, v3243.Y * v3, v3243.Z * v4)).Y)
							end
						end
					end

					table.insert(t136, {
						y = huge,
						vol = v3242
					})
					n57 += v3242
					vector32 += v.Position * v3242
				end
			end

			local v3251 = (v3218 + v3219) / 2 - Vector3.new(0, v3233.Y / 2, 0)

			if n57 > 0 then
				table.sort(t136, function(p796, p797)
					return p796.y < p797.y
				end)

				local n58 = 0
				local y = t136[1].y
				local v3254, v3255, v3256 = ipairs(t136)
				local v3257 = geniter(v3254, v3255, v3256)

				while true do
					local v3258 = table.pack(v3257())

					if v3258[1] then
						local v3259 = v3258[3]

						n58 += v3259.vol
						y = v3259.y

						if n57 * 0.1 <= n58 then
							break
						end
					else
						break
					end
				end

				local v3260 = vector32 / n57

				v3251 = Vector3.new(v3260.X, y, v3260.Z)
			end

			local function v3261(p798)
				for _, v in ipairs(p795) do
					if v.Transparency < 0.95 then
						local v3264 = v.CFrame:PointToObjectSpace(p798)
						local v3265 = v.Size / 2 + Vector3.new(0.6, 0.6, 0.6)

						if math.abs(v3264.X) <= v3265.X and math.abs(v3264.Y) <= v3265.Y and math.abs(v3264.Z) <= v3265.Z then
							return true
						end
					end
				end

				return false
			end

			local n59 = 0

			while true do
				if n59 < 150 then
					local v3267 = v3251 - Vector3.new(0, 1.6 + n59, 0)

					if v3261(v3267) or v3261(v3267 - Vector3.new(0, 1.8, 0)) then
						n59 += 1

						continue
					end

					break
				end

				break
			end

			local function v3268(p799)
				local vector33 = Vector3.new(p799.X, 0, p799.Z)

				return vector33.Magnitude > 0.05 and vector33.Unit or nil
			end

			local v3270
			local v3271, v3272, v3273 = ipairs(p795)
			local v3274 = geniter(v3271, v3272, v3273)

			while true do
				local v3275 = table.pack(v3274())

				if v3275[1] then
					local v3276 = v3275[3]

					if string.find(string.lower(v3276.Name), "eye", 1, true) then
						v3270 = v3268(v3276.Position - v3251)

						break
					end
				else
					break
				end
			end

			if not v3270 then
				local v3277, v3278, v3279 = ipairs(p793:GetDescendants())

				for _, v in v3277, v3278, v3279 do
					local v3282 = string.lower(v.Name)

					if not v:IsA("Attachment") or not v3282:find("head") and not v3282:find("eye") and not v3282:find("jaw") and not v3282:find("mouth") then
						continue
					end

					v3270 = v3268(v.WorldPosition - v3251)

					if v3270 then
						break
					end
				end
			end

			local vector33 = v3270 or v3268(p794.CFrame.LookVector) or Vector3.zAxis
			local t137 = {
				lift = n59,
				rootRel = cFrameNew(v3251):ToObjectSpace(p794.CFrame),
				turn = lookAt(Vector3.zero, vector33):Inverse()
			}

			return t137
		end
		local function v3285(p800, p801, p802, p803)
			local v3286, v3287 = v3171(p800, p801)

			if not v3286 then
				return nil, v3287
			end

			local v3288, v3289

			if p800 == "fish" then
				local v3290 = tonumber(p801.minKg)
				local v3291 = tonumber(p801.bigMaxKg) or tonumber(p801.maxKg)
				local n60 = 1

				if v3290 and v3290 > 0 and v3291 then
					n60 = math.max(1, (v3290 + (v3291 - v3290) * (p802 or 0)) / v3290)
				end

				if (tonumber(p801.nativeLen) or 0) > 50 then
					n60 *= 0.8
				end

				v3288, v3289 = v3177(v3286, nil, n60)
			else
				v3288, v3289 = v3177(v3286, nil, p803 or 1)
			end

			if not v3288 then
				v3286:Destroy()

				return nil, "Empty model"
			end

			v3288.Parent = v3286

			local t138 = {
				model = v3286,
				handle = v3288,
				kind = p800
			}

			if p800 == "fish" then
				t138.overhead = v3217(v3286, v3288, v3289)
				v3288.Name = "FishRoot"
			else
				local v3294, v3295 = v3193(v3288, v3289)

				t138.rodAxis = v3294
				t138.gripShift = v3295
				v3288.Name = "RodRoot"
			end

			return t138
		end
		local function v3296(p804)
			local clone = p804.model:Clone()

			clone.Name = "SenaVisualBack"

			for _, descendant in ipairs(clone:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.Size *= 0.8
				elseif descendant:IsA("Weld") then
					descendant.C0 = cFrameNew(descendant.C0.Position * 0.8) * descendant.C0.Rotation
				elseif descendant:IsA("Attachment") then
					if not descendant.Parent:IsA("Bone") then
						descendant.Position *= 0.8
					end
				end
			end

			return clone, clone:FindFirstChild("RodRoot", true)
		end
		local function createWeld(p805, p806, p807, p808)
			local UpperTorso = p805 and (p805:FindFirstChild("UpperTorso") or p805:FindFirstChild("Torso"))

			if not UpperTorso or not p807 then
				return nil
			end

			p806.Parent = p805

			local Weld = Instance.new("Weld")

			Weld.Part0 = UpperTorso
			Weld.Part1 = p807
			Weld.C0 = v3148 * cFrameNew(0, p808.gripShift * 0.8, 0) * p808.rodAxis:Inverse()
			Weld.Parent = p807

			return Weld
		end
		local function v3303(p809, p810, p811)
			local RightHand = p809 and p809:FindFirstChild("RightHand")
			local UpperTorso = p809 and p809:FindFirstChild("UpperTorso")

			if not RightHand or not UpperTorso then
				local function v3306()
				end

				return v3306
			end

			local t139 = {}

			for k, v in pairs(t133) do
				local v3310 = p809:FindFirstChild(k, true)

				if v3310 and v3310:IsA("Motor6D") then
					t139[v3310] = v
				end
			end

			local u3311 = true
			local Weld
			local connection = RunService.PreSimulation:Connect(function()
				for k, v in pairs(t139) do
					k.Transform = v
				end
			end)

			task.spawn(function()
				RunService.PostSimulation:Wait()
				RunService.PostSimulation:Wait()

				if not u3311 or not p810.Parent then
					return
				end

				local v3316 = UpperTorso.CFrame:PointToObjectSpace(RightHand.Position) + Vector3.new(0, 0, -0.1)
				local Unit2 = (Vector3.xAxis - Unit * Vector3.xAxis:Dot(Unit)).Unit

				Weld = Instance.new("Weld")
				Weld.Part0 = UpperTorso
				Weld.Part1 = p810
				Weld.C0 = fromMatrix(v3316, Unit2, Unit) * cFrameNew(0, p811.gripShift, 0) * p811.rodAxis:Inverse()
				Weld.Parent = p810
			end)

			local function v3318()
				u3311 = false
				connection:Disconnect()

				if Weld then
					Weld:Destroy()
				end
			end

			return v3318
		end
		local function v3319(p812, p813, p814)
			local Head = p812 and p812:FindFirstChild("Head")

			if not Head then
				local function v3321()
				end

				return v3321
			end

			local overhead = p814.overhead
			local Weld = Instance.new("Weld")

			Weld.Part0 = Head
			Weld.Part1 = p813
			Weld.C0 = cFrameNew(0, Head.Size.Y / 2 + 1 + overhead.lift, 0) * overhead.turn * overhead.rootRel
			Weld.Parent = p813

			local cFrame = Angles(3.1415926535897931, 0, 0)
			local RightShoulder = p812:FindFirstChild("RightShoulder", true)
			local LeftShoulder = p812:FindFirstChild("LeftShoulder", true)
			local RightElbow = p812:FindFirstChild("RightElbow", true)
			local LeftElbow = p812:FindFirstChild("LeftElbow", true)
			local connection = RunService.PreSimulation:Connect(function()
				if RightShoulder then
					RightShoulder.Transform = cFrame * Angles(0, 0, -0.20943951023931956)
				end

				if LeftShoulder then
					LeftShoulder.Transform = cFrame * Angles(0, 0, 0.20943951023931956)
				end

				if RightElbow then
					RightElbow.Transform = cFrameNew()
				end

				if LeftElbow then
					LeftElbow.Transform = cFrameNew()
				end
			end)

			local function v3330()
				connection:Disconnect()
				Weld:Destroy()
			end

			return v3330
		end
		local function createTool(p815, p816)
			local v3332, v3333 = v3285(p815, p816, t132.fishWeight, t132.rodScale)

			if not v3332 then
				return nil, v3333
			end

			local model = v3332.model
			local handle = v3332.handle
			local Tool = Instance.new("Tool")

			Tool.Name = p816.name
			Tool.CanBeDropped = false
			Tool.RequiresHandle = false
			Tool:SetAttribute("SenaVisual", p815)

			if p815 == "fish" then
				Tool:SetAttribute("ItemType", "Phone")
				Tool.ToolTip = tostring(p816.tier or "Fish")
			else
				Tool.ToolTip = "Rod"
			end

			if p816.icon then
				Tool.TextureId = p816.icon
			end

			local v3337
			local v3338

			if p815 == "rods" then
				v3337, v3338 = v3296(v3332)
			end

			for _, child in ipairs(model:GetChildren()) do
				child.Parent = Tool
			end

			model:Destroy()
			Tool.Equipped:Connect(function()
				task.defer(t132.refreshQuality)
			end)
			Tool.Unequipped:Connect(function()
				task.defer(t132.refreshQuality)
			end)

			local u3341

			if p815 == "rods" then
				local u3342

				t132.backs[Tool] = function(p817)
					local Character = LocalPlayer.Character

					if not p817 or not Character then
						v3337.Parent = nil
					elseif v3337.Parent ~= Character then
						if u3342 then
							u3342:Destroy()
						end

						u3342 = createWeld(Character, v3337, v3338, v3332)
					end
				end
				Tool.Destroying:Connect(function()
					t132.backs[Tool] = nil
					v3337:Destroy()
				end)
				Tool.Equipped:Connect(function()
					t132.backRod = Tool
					t132.updateBack()

					if u3341 then
						u3341()
					end

					u3341 = v3303(Tool.Parent, handle, v3332)
				end)
				Tool.Unequipped:Connect(function()
					if u3341 then
						u3341()
						u3341 = nil
					end

					t132.backRod = Tool
					task.defer(t132.updateBack)
				end)
			else
				Tool.Equipped:Connect(function()
					if u3341 then
						u3341()
					end

					u3341 = v3319(Tool.Parent, handle, v3332)
				end)
				Tool.Unequipped:Connect(function()
					if u3341 then
						u3341()
						u3341 = nil
					end
				end)
			end

			return Tool
		end

		t132.spawn = function(p818, p819)
			local v3344 = v3165(p818, p819)

			if not v3344 then
				t132.status = "Pick an item first"

				return false
			end

			local Backpack = LocalPlayer:FindFirstChild("Backpack")

			if not Backpack then
				t132.status = "Backpack not ready"

				return false
			end

			local v3346 = Backpack:FindFirstChild(v3344.name)

			if v3346 and v3346:GetAttribute("SenaVisual") then
				t132.status = v3344.name .. " is already in your backpack"

				return true
			end

			t132.status = "Loading " .. v3344.name .. "..."

			local v3347, v3348 = createTool(p818, v3344)

			if not v3347 then
				t132.status = v3344.name .. ": " .. tostring(v3348)

				return false
			end

			v3347.Parent = Backpack

			if p818 == "rods" then
				t132.backRod = v3347
				t132.updateBack()
			end

			t132.spawned[p818 .. "|" .. v3344.name] = {
				kind = p818,
				label = v3344.name
			}
			t132.status = v3344.name .. " added to your backpack"

			return true
		end
		t132.respawn = function(p820)
			local t140 = {}

			for k, v in pairs(t132.spawned) do
				if v.kind == p820 then
					t140[k] = v
				end
			end

			for _, v in pairs(t140) do
				local ipairs_ = ipairs
				local t141 = {
					LocalPlayer:FindFirstChild("Backpack"),
					LocalPlayer.Character
				}

				for _, v2 in ipairs_(t141) do
					local VLabel = v2 and v2:FindFirstChild(v.label)

					if VLabel and VLabel:IsA("Tool") and VLabel:GetAttribute("SenaVisual") then
						VLabel:Destroy()
					end
				end

				t132.spawn(v.kind, v.label)
			end
		end
		t132.clear = function()
			t132.spawned = {}

			local ipairs_ = ipairs
			local t142 = {
				LocalPlayer:FindFirstChild("Backpack"),
				LocalPlayer.Character
			}

			for _, v in ipairs_(t142) do
				if v then
					for _, child in ipairs(v:GetChildren()) do
						if child:IsA("Tool") and child:GetAttribute("SenaVisual") then
							child:Destroy()
						end
					end
				end
			end

			t132.status = "Removed all visual items"
			task.defer(t132.refreshQuality)
		end

		local function v3365(p821)
			local v3366 = t132.remote[p821]

			if not v3366 then
				return
			end

			t132.remote[p821] = nil

			for _, v in ipairs(v3366.cleanup) do
				pcall(v)
			end
		end
		local function v3369(p822)
			local v3370, v3371, v3372 = string.match(p822 or "", "^(%a+)|([^|]+)|?(.*)$")

			return v3370, v3371, tonumber(v3372)
		end
		local function v3373(p823, p824, p825)
			local playerByUserId = Players:GetPlayerByUserId(tonumber(p823) or 0)
			local Character = playerByUserId and playerByUserId.Character

			if not Character then
				v3365(p823)

				return
			end

			local v3376 = p824 .. "#" .. p825
			local v3377 = t132.remote[p823]

			if v3377 and v3377.key == v3376 and v3377.char == Character then
				return
			end

			v3365(p823)

			local t143 = {
				key = v3376,
				char = Character,
				cleanup = {}
			}

			t132.remote[p823] = t143

			local v3379, v3380, v3381 = v3369(p824)
			local v3382 = (v3379 == "rods" or v3379 == "fish") and v3165(v3379, v3380) or nil

			if v3382 then
				local v3383 = v3285(v3379, v3382, v3379 == "fish" and (v3381 or 0) or 0, v3379 == "rods" and (v3381 or 1) or 1)

				if v3383 and t132.remote[p823] == t143 and Character.Parent then
					v3383.model.Name = "SenaVisualRemote"
					v3383.model.Parent = Character
					table.insert(t143.cleanup, (v3379 == "rods" and v3303 or v3319)(Character, v3383.handle, v3383))
					table.insert(t143.cleanup, function()
						v3383.model:Destroy()
					end)
				elseif v3383 then
					v3383.model:Destroy()
				end
			end

			local v3384, v3385 = v3369(p825)
			local v3386 = v3384 == "rods" and v3165("rods", v3385) or nil

			if v3386 and t132.remote[p823] == t143 then
				local v3387 = v3285("rods", v3386, 0, 1)

				if v3387 and t132.remote[p823] == t143 and Character.Parent then
					local v3388, v3389 = v3296(v3387)

					v3387.model:Destroy()
					createWeld(Character, v3388, v3389, v3387)
					table.insert(t143.cleanup, function()
						v3388:Destroy()
					end)
				elseif v3387 then
					v3387.model:Destroy()
				end
			end

			task.defer(t132.refreshQuality)
		end

		task.spawn(function()
			while v16() do
				local n61 = 6

				pcall(function()
					if #Players:GetPlayers() <= 1 then
						for k in pairs(t132.remote) do
							v3365(k)
						end

						return
					end

					local SenaBackend = genv.SenaBackend or {}
					local Api = SenaBackend.Api or "http://56.10.112.179:8080"
					local s9 = ""
					local s10 = ""
					local Character = LocalPlayer.Character

					if Character then
						for _, child in ipairs(Character:GetChildren()) do
							local attribute = child:IsA("Tool") and child:GetAttribute("SenaVisual")

							if attribute then
								s9 = attribute .. "|" .. child.Name .. "|" .. tostring(attribute == "fish" and t132.fishWeight or t132.rodScale)

								break
							end
						end

						if Character:FindFirstChild("SenaVisualBack") and t132.backRod then
							s10 = "rods|" .. t132.backRod.Name
						end
					end

					local data = HttpService:JSONDecode(game:HttpGet(string.format("%s/vstate?key=%s&job=%s&uid=%d&held=%s&back=%s", Api, HttpService:UrlEncode(SenaBackend.Key or "sena_20VvixjHsd1OPPwgHYJAstpM"), HttpService:UrlEncode(game.JobId), LocalPlayer.UserId, HttpService:UrlEncode(s9), HttpService:UrlEncode(s10)), true))

					if type(data) ~= "table" or data.ok ~= true then
						return
					end

					n61 = tonumber(data.poll) or 4

					local t144 = {}
					local pairs_ = pairs
					local players = data.players or {}

					for k, player in pairs_(players) do
						local v3406 = tostring(k)

						t144[v3406] = true
						v3373(v3406, tostring(player.held or ""), tostring(player.back or ""))
					end

					for k in pairs(t132.remote) do
						if not t144[k] then
							v3365(k)
						end
					end
				end)
				task.wait(n61)
			end

			for k in pairs(t132.remote) do
				v3365(k)
			end
		end)
		LocalPlayer.CharacterAdded:Connect(function()
			if not v16() then
				return
			end

			task.wait(1.5)

			for _, v in pairs(t132.spawned) do
				pcall(t132.spawn, v.kind, v.label)
			end
		end)

		return t132
	end

	genv.__SenaV4Visual = v3143()
end

do
	local HttpService = game:GetService("HttpService")
	local t145 = {
		hopFailed = false,
		lastHopAt = 0
	}

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(p826)
			if p826 == LocalPlayer then
				t145.hopFailed = true
			end
		end)
	end)
	t145.collectServers = function(p827)
		local t146 = {}
		local s11 = ""

		for i = 1, 3 do
			local ok, result = pcall(function()
				local v3418 = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true"):format(game.PlaceId)

				if s11 ~= "" then
					v3418 ..= "&cursor=" .. s11
				end

				return HttpService:JSONDecode(game:HttpGet(v3418))
			end)

			if ok and type(result) == "table" then
				local ipairs_ = ipairs
				local data = result.data or {}

				for _, v in ipairs_(data) do
					if tostring(v.id) ~= game.JobId and v.playing and v.maxPlayers and v.playing < v.maxPlayers and (not p827 or v.playing <= p827) then
						t146[#t146 + 1] = {
							id = tostring(v.id),
							playing = v.playing
						}
					end
				end

				s11 = result.nextPageCursor or ""

				if s11 ~= "" then
					continue
				end
			end

			break
		end

		table.sort(t146, function(p828, p829)
			return p828.playing < p829.playing
		end)

		return t146
	end
	t145.hopToList = function(p830)
		if type(p830) ~= "table" or #p830 == 0 then
			return false
		end

		for _, v in ipairs(p830) do
			t145.hopFailed = false

			if pcall(function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, LocalPlayer)
			end) then
				local now = os.clock()

				while not t145.hopFailed and os.clock() - now < 6 do
					task.wait(0.25)
				end

				if not t145.hopFailed then
					return true
				end
			end

			task.wait(0.3)
		end

		return false
	end
	t145.hopEmptiest = function()
		return t145.hopToList(t145.collectServers(nil))
	end
	t145.privateStatus = "Pick a max player count, then Hop Server Now."
	t145.privateMax = function()
		return math.max(1, math.floor(tonumber(tostring(senaV4Config.PrivateServerMax or "2"):match("%d+")) or 2))
	end
	t145.findPrivateTargets = function()
		local v3426 = t145.privateMax()
		local v3427 = t145.collectServers(nil)

		if #v3427 == 0 then
			return nil
		end

		local t147 = {}

		for _, v in ipairs(v3427) do
			if v.playing + 1 <= v3426 then
				t147[#t147 + 1] = v
			end
		end

		local v3431 = t147

		if #v3431 == 0 then
			local playing = v3427[1].playing

			for _, v in ipairs(v3427) do
				if v.playing == playing then
					v3431[#v3431 + 1] = v
				end
			end
		end

		local t148 = {}

		while #v3431 > 0 and #t148 < 5 do
			t148[#t148 + 1] = table.remove(v3431, math.random(1, #v3431))
		end

		return t148
	end
	t145.hopPrivateOnce = function()
		local v3436 = t145.privateMax()
		local v3437 = #Players:GetPlayers()

		if v3437 <= v3436 then
			t145.privateStatus = "This server is good (" .. v3437 .. " player(s), max " .. v3436 .. ")."

			return false
		end

		if t145.hubBusy() then
			t145.privateStatus = "Waiting until you finish stealing..."

			return false
		end

		t145.privateStatus = "Searching for a quieter server..."

		local v3438 = t145.findPrivateTargets()

		if not v3438 or #v3438 == 0 then
			t145.privateStatus = "Could not load the server list. Try again."

			return false
		end

		t145.privateStatus = "Teleporting..."
		t145.lastHopAt = os.clock()

		if t145.hopToList(v3438) then
			return true
		end

		t145.privateStatus = "Teleport failed. Trying again soon."

		return false
	end
	t145.startPrivateAutoHop = function()
		if t145.privateAutoRunning then
			return
		end

		t145.privateAutoRunning = true
		task.spawn(function()
			while v16() and senaV4Config.PrivateServerAuto do
				local v3439 = t145.privateMax()

				if v3439 >= #Players:GetPlayers() then
					t145.privateStatus = "Good server found. Waiting..."
					task.wait(3)
				else
					t145.hopPrivateOnce()
					task.wait(5)
				end
			end

			t145.privateAutoRunning = false

			if not senaV4Config.PrivateServerAuto then
				t145.privateStatus = "Auto hop stopped."
			end
		end)
	end

	local function hubBusy()
		if senaV4Config.IsStealing or senaV4Config.IsPlacing then
			return true
		end

		local __SenaV4EggRuntime = genv.__SenaV4EggRuntime

		if __SenaV4EggRuntime and (__SenaV4EggRuntime.running or __SenaV4EggRuntime.travelBusy or __SenaV4EggRuntime.carry and __SenaV4EggRuntime.carry.active) then
			return true
		end

		local __SenaV4PlayerSteal = genv.__SenaV4PlayerSteal

		if __SenaV4PlayerSteal and __SenaV4PlayerSteal.running then
			return true
		end

		return false
	end

	t145.hubBusy = hubBusy
	t145.startHopLoop = function()
		if t145.hopLoopRunning then
			return
		end

		t145.hopLoopRunning = true
		task.spawn(function()
			while v16() do
				task.wait(2)

				if senaV4Config.HopNoMatch and not t145.hubBusy() then
					if (tonumber(senaV4Config.HopCooldown) or 5) < os.clock() - t145.lastHopAt then
						local __SenaV4EggRuntime = genv.__SenaV4EggRuntime

						if senaV4Config.AutoSteal and (__SenaV4EggRuntime and __SenaV4EggRuntime.stats and __SenaV4EggRuntime.stats.matching or 0) <= 0 and not v177() then
							t145.lastHopAt = os.clock()
							t145.hopEmptiest()
						end
					end
				end
			end

			t145.hopLoopRunning = false
		end)
	end
	t145.startAntiTreadmillLoop = function()
		if t145.antiTreadmillRunning then
			return
		end

		t145.antiTreadmillRunning = true
		task.spawn(function()
			while v16() do
				if senaV4Config.AntiTreadmill then
					local __SenaV4TreadmillManager = genv.__SenaV4TreadmillManager

					pcall(function()
						if __SenaV4TreadmillManager and __SenaV4TreadmillManager.activeTreadmill ~= nil then
							__SenaV4TreadmillManager:_cancelIdle(true)
							__SenaV4TreadmillManager:_requestUnequip()
						end
					end)

					local Character = LocalPlayer.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart and HumanoidRootPart.Anchored then
						pcall(function()
							HumanoidRootPart.Anchored = false
						end)
					end
				end

				task.wait(0.3)
			end

			t145.antiTreadmillRunning = false
		end)
	end
	t145.setBackpackRates = function(p831)
		senaV4Config.BackpackRateEsp = p831 == true

		if not t145.backpackRatesRunning then
			t145.backpackRatesRunning = true
			task.spawn(function()
				local EggRecords
				local Save

				pcall(function()
					EggRecords = require(ReplicatedStorage.Shared.Util.EggRecords)
					Save = require(ReplicatedStorage.Shared.Save)
				end)

				while v16() do
					local ScrollingFrame

					pcall(function()
						ScrollingFrame = LocalPlayer.PlayerGui.BackpackGui.Backpack.Main.Inventory.ScrollingFrame
					end)

					local __SenaV4Webhook = genv.__SenaV4Webhook
					local SenaDiscord = ScrollingFrame and ScrollingFrame.Parent:FindFirstChild("SenaDiscord")

					if ScrollingFrame and senaV4Config.BackpackRateEsp and not SenaDiscord then
						local TextLabel = Instance.new("TextLabel")

						TextLabel.Name = "SenaDiscord"
						TextLabel.BackgroundTransparency = 1
						TextLabel.Position = UDim2.new(0.34, 0, 0.017, 0)
						TextLabel.Size = UDim2.new(0.3, 0, 0.09, 0)
						TextLabel.Font = Enum.Font.GothamBlack
						TextLabel.Text = "discord.gg/senahub"
						TextLabel.TextScaled = true
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextStrokeTransparency = 0
						TextLabel.ZIndex = 40
						TextLabel.Parent = ScrollingFrame.Parent
					elseif SenaDiscord and not senaV4Config.BackpackRateEsp then
						SenaDiscord:Destroy()
					end

					if ScrollingFrame then
						local t149 = {}

						if senaV4Config.BackpackRateEsp and EggRecords and Save and __SenaV4Webhook then
							local v3454 = (Save.Peek or Save.Get)()
							local pairs_ = pairs
							local EggInventory = v3454 and v3454.EggInventory or {}

							for _, v in pairs_(EggInventory) do
								local ok, result = pcall(EggRecords.DisplayNameWithWeight, v)

								if ok and type(result) == "string" then
									t149[result] = t149[result] or {}
									table.insert(t149[result], v)
								end
							end
						end

						local t150 = {}

						for _, child in ipairs(ScrollingFrame:GetChildren()) do
							local ToolName = child:IsA("GuiButton") and child:FindFirstChild("ToolName")

							if ToolName then
								local Text = ToolName.Text
								local v3466 = (t150[Text] or 0) + 1
								local v3467 = t149[Text] and t149[Text][v3466]
								local SenaRate = child:FindFirstChild("SenaRate")

								if v3467 then
									t150[Text] = v3466

									if not SenaRate then
										SenaRate = Instance.new("TextLabel")
										SenaRate.Name = "SenaRate"
										SenaRate.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
										SenaRate.BackgroundTransparency = 0.35
										SenaRate.BorderSizePixel = 0
										SenaRate.Position = UDim2.new(0.04, 0, 0, 3)
										SenaRate.Size = UDim2.new(0.92, 0, 0.24, 0)
										SenaRate.Font = Enum.Font.GothamBlack
										SenaRate.TextScaled = true
										SenaRate.TextColor3 = Color3.fromRGB(73, 211, 31)
										SenaRate.TextStrokeTransparency = 0
										SenaRate.ZIndex = 40

										local UICorner = Instance.new("UICorner")

										UICorner.CornerRadius = UDim.new(0, 6)
										UICorner.Parent = SenaRate

										local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

										UITextSizeConstraint.MaxTextSize = 20
										UITextSizeConstraint.Parent = SenaRate
										SenaRate.Parent = child
									end

									SenaRate.Text = __SenaV4Webhook.compact(__SenaV4Webhook.rateOf(v3467)) .. "/s"
								elseif SenaRate then
									SenaRate:Destroy()
								end
							end
						end
					end

					if not senaV4Config.BackpackRateEsp then
						break
					end

					task.wait(1)
				end

				t145.backpackRatesRunning = false
			end)

			return
		end
	end

	local function v3471()
		local t151 = {
			status = "Disabled",
			banner = "Unknown",
			rotation = 0,
			pity = 0,
			pityMax = 100,
			free = 0,
			trades = 0,
			demands = "-",
			stock = "-",
			ready = 0,
			total = 3,
			missing = "None",
			cache = nil,
			cacheAt = 0,
			lastReroll = 0
		}
		local Directory
		local AssetItems
		local AssetEarnings
		local Save

		pcall(function()
			Directory = require(ReplicatedStorage.Data.Assets).Directory
		end)
		pcall(function()
			AssetItems = require(ReplicatedStorage.Shared.Util.AssetItems)
		end)
		pcall(function()
			AssetEarnings = require(ReplicatedStorage.Shared.Util.AssetEarnings)
		end)
		pcall(function()
			Save = require(ReplicatedStorage.Shared.Save)
		end)

		local function v3477()
			local ok, result = pcall(function()
				return require(ReplicatedStorage.Shared.Remotes).ScrambleTradeIn
			end)
			local v3480 = ok and result or nil

			return v3480
		end
		local function v3481()
			return senaV4Config.ScrambleTradeInTrade or senaV4Config.ScrambleTradeInReroll
		end
		local function v3482(p832)
			return ((tostring(p832 or ""):lower():match("^%s*(.-)%s*$") or ""):gsub("%s*egg$", ""))
		end
		local function matches(p833, p834)
			local v3484 = v3482(p833)
			local v3485 = v3482(p834)

			if v3484 == "" or v3485 == "" then
				return false
			end

			if v3484 == v3485 then
				return true
			end

			if not Directory or Directory[p833] then
				return false
			end

			local v3486 = Directory[p834]

			return type(v3486) == "table" and type(v3486.DisplayName) == "string" and v3482(v3486.DisplayName) == v3484
		end

		t151.matches = matches

		local function v3487(p835)
			local v3488 = Directory and Directory[p835]
			local DisplayName = type(v3488) == "table" and v3488.DisplayName

			return type(DisplayName) == "string" and DisplayName ~= "" and DisplayName or tostring(p835)
		end
		local function v3490(p836, p837)
			local t152 = {}

			for i, v in ipairs(p836) do
				t152[i] = v3487(v)
			end

			return table.concat(t152, p837)
		end

		t151.state = function(p838)
			local now = os.clock()

			if not p838 and t151.cache and now - t151.cacheAt < 2.5 then
				return t151.cache
			end

			local v3495 = v3477()

			if not v3495 or not v3495.AskState then
				return t151.cache
			end

			local ok, cache = pcall(function()
				return v3495.AskState:InvokeServer()
			end)

			if ok and type(cache) == "table" then
				t151.cache = cache
				t151.cacheAt = now
			end

			return t151.cache
		end

		local function v3498(p839)
			local ScrambleTradeInBanners = senaV4Config.ScrambleTradeInBanners

			if type(ScrambleTradeInBanners) ~= "table" or #ScrambleTradeInBanners == 0 then
				return true
			end

			if not p839 or not p839.BannerId then
				return true
			end

			local v3500 = v3482(p839.BannerId)
			local v3501 = v3482(p839.BannerDisplayName)

			for _, ScrambleTradeInBanner in ipairs(ScrambleTradeInBanners) do
				local v3504 = v3482(ScrambleTradeInBanner)

				if v3504 == v3500 or v3501 ~= "" and v3504 == v3501 then
					return true
				end
			end

			return false
		end
		local function v3505(p840)
			return p840 and type(p840.Requirements) == "table" and p840.Requirements or {}
		end
		local function v3506()
			local u3507

			if Save then
				pcall(function()
					u3507 = (Save.Peek or Save.Get)()
				end)
			end

			return u3507
		end
		local function v3508(p841)
			local t153 = {}

			if not p841 or not AssetItems then
				return t153
			end

			local t154 = {}
			local ipairs_ = ipairs
			local EquippedAssets = p841.EquippedAssets or {}

			for _, EquippedAsset in ipairs_(EquippedAssets) do
				t154[EquippedAsset] = true
			end

			local t155 = {}

			pcall(function()
				for k in pairs(require(ReplicatedStorage.Client.AssetRoster).ReadOwnerPen(LocalPlayer.UserId)) do
					t155[k] = true
				end
			end)

			local pairs_ = pairs
			local Inventory = p841.Inventory or {}

			for k, v in pairs_(Inventory) do
				local ok, result = pcall(AssetItems.Decode, v)

				if ok and type(result) == "table" and result.Category and not result.IsFavorite and not result.InFuse and not t154[k] and not t155[k] then
					local huge = math.huge

					if AssetEarnings then
						local ok2, result2 = pcall(AssetEarnings.LiveRatePerSecond, {
							Category = result.Category,
							Scale = math.max(tonumber(result.Scale) or 1, 0.01),
							Mutations = type(result.Mutations) == "table" and result.Mutations or {}
						}, p841.Gamepasses, p841.Products)

						if ok2 and type(result2) == "number" then
							huge = result2
						end
					end

					t153[#t153 + 1] = {
						uid = k,
						category = result.Category,
						rate = huge
					}
				end
			end

			table.sort(t153, function(p842, p843)
				if p842.rate == p843.rate then
					return tostring(p842.uid) < tostring(p843.uid)
				end

				return p842.rate < p843.rate
			end)

			return t153
		end
		local function selectPets(p844, p845)
			local v3527 = v3508(p845)
			local t156 = {}
			local t157 = {}
			local t158 = {}

			for i, v in ipairs(p844) do
				local v3533

				for _, v2 in ipairs(v3527) do
					if not t156[v2.uid] and matches(v2.category, v) then
						v3533 = v2

						break
					end
				end

				if v3533 then
					t156[v3533.uid] = true
					t157[i] = v3533
				else
					t158[#t158 + 1] = v
				end
			end

			return t157, t158, v3527
		end

		t151.selectPets = selectPets

		local function v3536(p846, p847, p848)
			local t159 = {}
			local t160 = {}

			for _, v in ipairs(p846) do
				if not t159[v] then
					t160[#t160 + 1] = v
				end

				t159[v] = (t159[v] or 0) + 1
			end

			local t161 = {}

			for _, v in ipairs(t160) do
				local n62 = 0

				for _, v2 in ipairs(p848) do
					if matches(v2.category, v) then
						n62 += 1
					end
				end

				local pairs_ = pairs
				local EggInventory = p847 and p847.EggInventory or {}

				for _, v2 in pairs_(EggInventory) do
					if type(v2) == "table" and matches(v2.AssetCategory, v) then
						n62 += 1
					end
				end

				t161[#t161 + 1] = string.format("%s %d/%d", v3487(v), math.min(n62, t159[v]), t159[v])
			end

			return table.concat(t161, "  ")
		end
		local function teleport()
			local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart then
				return false
			end

			local v3553 = v14()
			local Machines = v3553 and v3553:FindFirstChild("Machines")
			local RiftMachine = Machines and Machines:FindFirstChild("RiftMachine")
			local Machine = RiftMachine and RiftMachine:FindFirstChild("Machine")

			HumanoidRootPart.CFrame = Machine and Machine:IsA("BasePart") and Machine.CFrame * cFrameNew(0, Machine.Size.Y * 0.5 + 3, 4) or cFrameNew(533.4, 72, -330)
			HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero

			return true
		end

		t151.teleport = teleport
		t151.openUI = function()
			return (pcall(function()
				require(ReplicatedStorage.Client.Tabs).Activate("DrScrambleTradeIn")
			end))
		end

		local function v3557(p849, p850)
			local v3558 = v3477()

			if not v3558 or not v3558.AskTradeIn then
				return false, "Trade remote unavailable"
			end

			local t162 = {}

			for i = 1, #p849 do
				local v3561 = p850[i]

				if v3561 then
					t162[#t162 + 1] = v3561.uid

					continue
				end

				return false, "Requirements incomplete"
			end

			t151.status = "Trading pets into Dr Scramble"

			local ok, result = pcall(function()
				return v3558.AskTradeIn:InvokeServer(t162)
			end)

			if (not ok or result == false) and teleport() then
				task.wait(0.3)
				ok, result = pcall(function()
					return v3558.AskTradeIn:InvokeServer(t162)
				end)
			end

			if not ok or result == false then
				local v3564 = false
				local tostring_ = tostring
				local v3566 = result or "Trade rejected"

				return v3564, tostring_(v3566)
			end

			pcall(function()
				if v3558.AskFinishReveal then
					v3558.AskFinishReveal:InvokeServer()
				end
			end)
			t151.trades += 1
			t151.state(true)

			return true
		end

		t151.tradeOnce = function()
			local v3567 = v3505(t151.state(true))

			if #v3567 < 3 then
				return false, "Cannot read the recipe"
			end

			local v3568, v3569 = selectPets(v3567, v3506())

			if #v3569 > 0 then
				return false, "Missing: " .. v3490(v3569, ", ")
			end

			return v3557(v3567, v3568)
		end
		t151.reroll = function()
			local v3570 = t151.state(false)

			if (tonumber(v3570 and v3570.FreeRefreshesRemaining) or 0) <= 0 then
				return false, "No free rerolls left"
			end

			local v3571 = v3477()

			if not v3571 or not v3571.AskRefresh then
				return false, "Refresh remote unavailable"
			end

			if not pcall(function()
				return v3571.AskRefresh:InvokeServer()
			end) then
				return false, "Reroll failed"
			end

			t151.state(true)

			return true
		end
		t151.tick = function()
			local v3572 = t151.state(false)

			if not v3572 then
				t151.status = "Trade-In state unavailable"

				return
			end

			if v3572.Unlocked == false then
				t151.status = "Dr Scramble Trade-In is locked"

				return
			end

			t151.banner = tostring(v3572.BannerDisplayName or v3572.BannerId or "Unknown")
			t151.rotation = math.max(0, math.floor(tonumber(v3572.SecondsUntilRotation) or 0))
			t151.pity = tonumber(v3572.PityCount) or 0
			t151.pityMax = tonumber(v3572.PityThreshold) or 100
			t151.free = tonumber(v3572.FreeRefreshesRemaining) or 0

			if v3572.PendingReward then
				t151.status = "Finishing reward"

				local v3573 = v3477()

				pcall(function()
					if v3573 and v3573.AskFinishReveal then
						v3573.AskFinishReveal:InvokeServer()
					end
				end)
				t151.cache = nil

				return
			end

			if not v3498(v3572) then
				t151.status = "Waiting for banner (now: " .. t151.banner .. ")"
				t151.demands = "-"
				t151.stock = "-"
				t151.ready = 0
				t151.missing = "None"

				return
			end

			local v3574 = v3505(v3572)

			t151.total = #v3574
			t151.demands = #v3574 > 0 and v3490(v3574, " / ") or "-"

			if #v3574 < 3 then
				t151.status = "Waiting for requirements"

				return
			end

			local v3575 = v3506()
			local v3576, v3577, v3578 = selectPets(v3574, v3575)

			t151.stock = v3536(v3574, v3575, v3578)
			t151.ready = #v3574 - #v3577
			t151.missing = #v3577 > 0 and v3490(v3577, ", ") or "None"

			if #v3577 == 0 then
				if senaV4Config.ScrambleTradeInTrade then
					t151.status = "Requirements complete, submitting"

					local v3579, v3580 = v3557(v3574, v3576)

					t151.status = v3579 and "Trade complete" or "Trade: " .. tostring(v3580)
				else
					t151.status = "Ready to trade (Auto Trade-In is off)"
				end

				return
			end

			if senaV4Config.ScrambleTradeInReroll and t151.free > 0 and os.clock() - t151.lastReroll > 3 then
				t151.lastReroll = os.clock()
				t151.status = "Rerolling the recipe"
				t151.reroll()

				return
			end

			t151.status = #v3577 > 0 and "Waiting for " .. t151.missing or t151.status
		end
		task.spawn(function()
			while v16() do
				if v3481() then
					local ok, result = pcall(t151.tick)

					if not ok then
						t151.status = "Trade-In error: " .. tostring(result)
					end
				elseif t151.status ~= "Disabled" then
					t151.status = "Disabled"
				end

				task.wait(1)
			end
		end)
		genv.__SenaV4ScrambleTradeIn = t151
	end

	v3471()

	local function v3583()
		local LocalPlayer2 = game:GetService("Players").LocalPlayer
		local t163 = {
			status = "Disabled",
			inArena = false,
			joins = 0,
			hits = 0,
			dodges = 0
		}
		local ScrambleBossHazards

		pcall(function()
			ScrambleBossHazards = require(ReplicatedStorage.Shared.Util.ScrambleBossHazards)
		end)

		local function v3587()
			local ok, result = pcall(function()
				return require(ReplicatedStorage.Shared.Remotes)
			end)
			local v3590 = ok and result or nil

			return v3590
		end
		local function v3591()
			return workspace:FindFirstChild("ScrambleArena")
		end
		local function v3592()
			return workspace:FindFirstChild("ScrambleArenaPortal")
		end
		local function v3593()
			local Character = LocalPlayer2.Character

			if Character then
				return Character:FindFirstChild("HumanoidRootPart"), Character:FindFirstChildOfClass("Humanoid"), Character
			end

			return nil
		end
		local function amInArena()
			local v3596 = v3591()

			if not v3596 then
				return false
			end

			local v3597 = v3593()

			if not v3597 then
				return false
			end

			local attribute = v3596:GetAttribute("Center")

			if typeof(attribute) == "Vector3" then
				return (v3597.Position - attribute).Magnitude < (tonumber(v3596:GetAttribute("Radius")) or 500) + 80
			end

			return false
		end

		t163.amInArena = amInArena

		local function v3599()
			local __SenaV4StealWantsCharacter = genv.__SenaV4StealWantsCharacter

			return senaV4Config.AutoSteal == true and __SenaV4StealWantsCharacter ~= nil and __SenaV4StealWantsCharacter() == true
		end

		local t164 = {}

		pcall(function()
			local v3602 = v3587()

			if v3602 and v3602.ScrambleBoss and v3602.ScrambleBoss.Hazard then
				v3602.ScrambleBoss.Hazard.OnClientEvent:Connect(function(p851)
					if type(p851) == "table" and p851.Id then
						t164[p851.Id] = p851
						task.delay((p851.Warn or 0) + (ScrambleBossHazards and ScrambleBossHazards.ActiveSeconds(p851) or 0.25) + 1.5, function()
							if t164[p851.Id] == p851 then
								t164[p851.Id] = nil
							end
						end)
					end
				end)
			end
		end)

		local function v3603(p852, p853, p854)
			if not ScrambleBossHazards then
				return false
			end

			local v3604 = p854 - (p852.At or p854)
			local v3605 = ScrambleBossHazards.ActiveSeconds(p852)

			if not (v3604 >= 0) or not (v3604 <= v3605) then
				if v3604 < 0 and v3604 > -2.2 then
					for i = 0, 5 do
						if ScrambleBossHazards.Contains(p852, i / 5 * v3605, p853, false, 3.5) then
							return true
						end
					end
				end
			elseif ScrambleBossHazards.Contains(p852, v3604, p853, false, 3.5) then
				return true
			end

			return false
		end
		local function v3607(p855, p856)
			for _, v in pairs(t164) do
				if v3603(v, p855, p856) then
					return false
				end
			end

			return true
		end
		local function v3610(p857)
			local v3611 = v3593()

			if v3611 then
				return not v3607(v3611.Position, p857)
			end

			return false
		end
		local function v3612(p858)
			local v3613 = v3593()
			local v3614 = v3591()

			if not v3613 or not v3614 then
				return nil
			end

			local attribute = v3614:GetAttribute("Center")
			local v3616 = tonumber(v3614:GetAttribute("HubRadius")) or 88
			local Y = tonumber(v3614:GetAttribute("FloorY")) or v3613.Position.Y
			local Position = v3613.Position

			for _, v in ipairs({
				9,
				15,
				23,
				33,
				45
			}) do
				local v3621
				local v3622

				for i = 0, 11 do
					local v3624 = i / 12 * 3.1415926535897931 * 2
					local vector32 = Vector3.new(Position.X + math.cos(v3624) * v, Y + 3, Position.Z + math.sin(v3624) * v)

					if (typeof(attribute) ~= "Vector3" or Vector3.new(vector32.X - attribute.X, 0, vector32.Z - attribute.Z).Magnitude <= v3616 + 8) and v3607(vector32, p858) then
						local Magnitude = (vector32 - Position).Magnitude

						if not v3622 or Magnitude < v3622 then
							v3621 = vector32
							v3622 = Magnitude
						end
					end
				end

				if v3621 then
					return v3621
				end
			end

			return nil
		end
		local function v3627(p859)
			if not v3610(p859) then
				return false
			end

			local v3628 = v3612(p859)

			if not v3628 then
				return false
			end

			local v3629 = v3593()

			if v3629 then
				v3629.CFrame = cFrameNew(v3628)
				v3629.AssemblyLinearVelocity = Vector3.zero
				t163.dodges += 1
			end

			return true
		end

		local n63 = 0

		local function v3631()
			local _, v3633, v3634 = v3593()

			if not v3634 then
				return nil
			end

			local __SenaV4IsBatTool = genv.__SenaV4IsBatTool or function(p860)
				return p860:IsA("Tool") and p860:GetAttribute("IsBat") == true
			end

			for _, child in ipairs(v3634:GetChildren()) do
				if not __SenaV4IsBatTool(child) then
					continue
				end

				return child
			end

			local Backpack = LocalPlayer2:FindFirstChild("Backpack")

			if Backpack and v3633 then
				for _, child in ipairs(Backpack:GetChildren()) do
					if not __SenaV4IsBatTool(child) then
						continue
					end

					pcall(function()
						v3633:EquipTool(child)
					end)

					return child
				end
			end

			return nil
		end
		local function v3641(p861)
			local v3642 = v3631()

			if not v3642 then
				return
			end

			local serverTimeNow = workspace:GetServerTimeNow()

			if serverTimeNow - n63 < 0.22 then
				return
			end

			n63 = serverTimeNow
			pcall(function()
				v3642:Activate()
			end)

			local Handle = v3642:FindFirstChild("Handle") or v3642:FindFirstChildWhichIsA("BasePart", true)

			if Handle and p861 and type(firetouchinterest) == "function" then
				pcall(function()
					firetouchinterest(Handle, p861, 0)
					task.wait(0.02)
					firetouchinterest(Handle, p861, 1)
				end)
			end

			t163.hits += 1
			pcall(function()
				local v3645 = v3587()

				if v3645 and v3645.BatSwing then
					v3645.BatSwing.Trigger:FireServer(nil, string.format("%d:%d:%d", LocalPlayer2.UserId, t163.hits, math.floor(serverTimeNow * 1000)))
				end
			end)
		end

		local t165 = {
			Floor = true,
			Structure = true,
			Collision = true,
			Windows = true,
			BackgroundCrates = true,
			Crates = true,
			Cranes = true,
			VFX = true,
			Coils = true,
			Center = true,
			BossSpawn = true,
			PlayerSpawn = true,
			LeaveTeleport = true,
			HubBlocker = true,
			FloorSlime = true,
			Drones = true,
			ScrambleHazards = true
		}

		local function v3647(p862)
			if p862:IsA("BasePart") then
				return p862
			end

			return p862.PrimaryPart or p862:FindFirstChild("Core") or p862:FindFirstChild("Hitbox") or p862:FindFirstChild("HumanoidRootPart") or p862:FindFirstChildWhichIsA("BasePart", true)
		end
		local function v3648(p863)
			local v3649 = v3593()

			if not v3649 then
				return nil
			end

			local u3650
			local u3651
			local u3652

			local function v3653(p864, p865)
				local v3654 = v3647(p864)

				if not v3654 then
					return
				end

				local Magnitude = (v3654.Position - v3649.Position).Magnitude

				if not u3651 or p865 < u3651 or p865 == u3651 and Magnitude < u3652 then
					u3650 = v3654
					u3651 = p865
					u3652 = Magnitude
				end
			end

			for _, v in ipairs({
				"Mech",
				"Ball",
				"Croc",
				"Human",
				"DrScramble",
				"Pilot"
			}) do
				local v3658 = p863:FindFirstChild(v)

				if v3658 then
					v3653(v3658, 1)
				end
			end

			for _, child in ipairs(p863:GetChildren()) do
				if not t165[child.Name] and child:IsA("Model") and child.Name ~= "Mech" and child:FindFirstChildOfClass("Humanoid") then
					v3653(child, 1)
				end
			end

			local Drones = p863:FindFirstChild("Drones")

			if Drones then
				for _, child in ipairs(Drones:GetChildren()) do
					if child:IsA("Model") then
						local Hitbox = child:FindFirstChild("Hitbox") or child.PrimaryPart

						if Hitbox then
							v3653(Hitbox, 2)
						end
					end
				end
			end

			return u3650
		end
		local function v3665()
			if LocalPlayer2:GetAttribute("ScrambleGrabbed") == true then
				pcall(function()
					local v3666 = v3587()

					if v3666 and v3666.ScrambleBoss then
						v3666.ScrambleBoss.HazardHit:FireServer(-2)
					end
				end)

				return true
			end

			return false
		end
		local function v3667(p866, p867)
			local v3668 = v3593()

			if not v3668 then
				return
			end

			local v3669 = p866 - v3668.Position
			local Magnitude = v3669.Magnitude

			if Magnitude < 0.5 then
				return
			end

			v3668.CFrame = cFrameNew(v3668.Position + v3669.Unit * math.min(Magnitude, p867 or 40))
			v3668.AssemblyLinearVelocity = Vector3.zero
		end
		local function v3671(p868)
			local v3672 = v3593()

			if not v3672 then
				return
			end

			local Position = v3672.Position
			local v3674 = math.max(1, math.ceil((p868 - Position).Magnitude / 140))

			for i = 1, v3674 do
				local v3676 = v3593()

				if not v3676 then
					return
				end

				v3676.CFrame = cFrameNew(Position:Lerp(p868, i / v3674))
				v3676.AssemblyLinearVelocity = Vector3.zero
				task.wait(0.08)
			end
		end
		local function leaveArena()
			local v3678 = v3591()

			if not v3678 then
				return false
			end

			local v3679 = v3593()

			if not v3679 then
				return false
			end

			local LeaveTeleport = v3678:FindFirstChild("LeaveTeleport")
			local isBasePart = LeaveTeleport and (LeaveTeleport:IsA("BasePart") and LeaveTeleport or LeaveTeleport:FindFirstChildWhichIsA("BasePart", true))

			if not isBasePart then
				return false
			end

			v3679.CFrame = cFrameNew(isBasePart.Position + Vector3.new(0, 3, 0))
			v3679.AssemblyLinearVelocity = Vector3.zero

			return true
		end

		t163.leaveArena = leaveArena

		local n64 = 0

		task.spawn(function()
			while v16() do
				if not senaV4Config.ScrambleBossAuto or v3599() then
					if senaV4Config.ScrambleBossAuto and v3599() then
						t163.status = "Yielding to Auto Steal"

						if amInArena() and os.clock() - n64 > 3 then
							n64 = os.clock()
							leaveArena()
						end
					elseif t163.status ~= "Disabled" then
						t163.status = "Disabled"
					end

					task.wait(0.3)
				else
					local v3683 = v3591()

					if amInArena() then
						t163.inArena = true

						local serverTimeNow = workspace:GetServerTimeNow()

						if v3627(serverTimeNow) then
							t163.status = "Dodging"
						elseif v3665() then
							t163.status = "Breaking free"
						else
							v3631()

							local v3685 = v3648(v3683)

							if v3685 then
								local v3686 = v3593()

								if v3686 and (v3686.Position - v3685.Position).Magnitude > 12 then
									v3667(v3685.Position + Vector3.new(0, 2, 0), 42)
								end

								v3641(v3685)
								t163.status = "Fighting (" .. tostring(v3683:GetAttribute("Phase")) .. ")"
							else
								t163.status = "In arena (" .. tostring(v3683:GetAttribute("Phase")) .. ")"
							end
						end

						task.wait(0.06)
					elseif v3592() then
						t163.status = "Boss up - joining"

						local v3687 = v3592()
						local Position = v3687 and (v3687:IsA("Model") and select(1, v3687:GetPivot()).Position or v3687.Position)

						if Position then
							local v3689 = v3593()

							if v3689 and v612 and (v3689.Position - Position).Magnitude > 600 and not v612:_isInSafeArea(v3689) then
								local v3690 = v612:_resolveSafeCFrame(v3689)

								if v3690 then
									t163.status = "Heading to the safe zone first"
									v3671(v3690.Position)
								end
							end

							v3671(Position + Vector3.new(0, 3, 0))
							t163.joins += 1
						end

						task.wait(1.2)
					else
						t163.inArena = false
						t163.status = "Waiting for boss"
						task.wait(0.4)
					end
				end
			end
		end)
		task.spawn(function()
			while v16() do
				if senaV4Config.AutoSteal and not senaV4Config.ScrambleBossAuto and amInArena() then
					leaveArena()
					task.wait(0.5)
				end

				task.wait(0.25)
			end
		end)
		genv.__SenaV4ScrambleBoss = t163
	end

	v3583()

	local senaPanels = {}

	local function v3692()
		game:GetService("UserInputService")

		local Assets = require(ReplicatedStorage.Data.Assets)
		local EggState2 = require(ReplicatedStorage.Client.EggState)
		local Save = require(ReplicatedStorage.Shared.Save)
		local t166 = {
			strokeCol = Color3.fromRGB(36, 36, 42),
			accent = Color3.fromRGB(26, 147, 250),
			accentA = Color3.fromRGB(19, 96, 250),
			accentB = Color3.fromRGB(33, 198, 250),
			surface = Color3.fromRGB(22, 22, 27),
			surfaceHi = Color3.fromRGB(28, 28, 34),
			text = Color3.fromRGB(235, 236, 245),
			btnText = Color3.fromRGB(186, 184, 198),
			muted = Color3.fromRGB(156, 154, 170),
			shadow = Color3.fromRGB(4, 4, 8),
			obsTop = Color3.fromRGB(18, 18, 24),
			obsMid = Color3.fromRGB(12, 12, 16),
			obsLow = Color3.fromRGB(10, 14, 26),
			btnBg = Color3.fromRGB(30, 30, 36),
			btnHover = Color3.fromRGB(44, 44, 52),
			inputBg = Color3.fromRGB(14, 14, 18),
			switchOff = Color3.fromRGB(42, 42, 48),
			good = Color3.fromRGB(163, 230, 53)
		}
		local v3697 = t166

		local function v3698()
			pcall(function()
				if type(setthreadidentity) == "function" then
					setthreadidentity(8)
				elseif genv and type(genv.__SenaV4IdentitySetter) == "function" then
					genv.__SenaV4IdentitySetter(8)
				end
			end)
		end
		local function v3699()
			local PlayerGui = LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui")

			if PlayerGui then
				return PlayerGui
			end

			local ok, result = pcall(function()
				return game:GetService("CoreGui")
			end)

			if not ok or not result then
				return game:GetService("CoreGui")
			end

			return result
		end
		local function v3703(p869)
			local v3704 = tonumber(p869) or 0

			if v3704 >= 1e12 then
				return string.format("%.2fT", v3704 / 1e12)
			end

			if v3704 >= 1e9 then
				return string.format("%.2fB", v3704 / 1e9)
			end

			if v3704 >= 1000000 then
				return string.format("%.2fM", v3704 / 1000000)
			end

			if v3704 >= 1000 then
				return string.format("%.2fK", v3704 / 1000)
			end

			return string.format("%d", v3704)
		end
		local function v3705(p870)
			return v3703(p870)
		end
		local function v3706(p871)
			if typeof(p871) == "Color3" then
				return string.format("#%02x%02x%02x", math.floor(p871.R * 255), math.floor(p871.G * 255), math.floor(p871.B * 255))
			end

			return "#ffffff"
		end
		local function v3707(p872)
			local Directory = Assets.Directory and Assets.Directory[p872]

			if not Directory or not Directory.Rarity then
				return 0, "?", nil
			end

			local DisplayName = Directory.Rarity.DisplayName or Directory.Rarity._id or "?"

			return v611.rarityRank(DisplayName), DisplayName, Directory.Rarity.Color
		end
		local function v3710(p873)
			local Directory = Assets.Directory and Assets.Directory[p873]

			if type(Directory) ~= "table" then
				return nil
			end

			local function v3712(p874)
				if type(p874) == "string" and p874 ~= "" then
					if p874:find("rbxassetid") or p874:find("rbxthumb") then
						return p874
					end

					if p874:match("^%d+$") then
						return "rbxassetid://" .. p874
					end
				elseif type(p874) == "number" and p874 > 0 then
					return "rbxassetid://" .. tostring(p874)
				end

				return nil
			end

			local t167 = {
				"Image",
				"Icon",
				"Thumbnail",
				"ImageId",
				"IconId",
				"Texture",
				"Asset",
				"DisplayImage"
			}

			for _, v in ipairs(t167) do
				local v3716 = v3712(Directory[v])

				if not v3716 then
					continue
				end

				return v3716
			end

			if type(Directory.Egg) == "table" then
				for _, v in ipairs(t167) do
					local v3719 = v3712(Directory.Egg[v])

					if not v3719 then
						continue
					end

					return v3719
				end
			end

			return nil
		end

		local t168 = {}
		local t169 = {}
		local pairs_ = pairs
		local Directory = Assets.Directory or {}

		for k, v in pairs_(Directory) do
			if type(v) == "table" and v.Rarity then
				local DisplayName = v.Rarity.DisplayName or v.Rarity._id or "?"
				local v3727 = v611.rarityRank(DisplayName)

				t169[DisplayName] = v3727
				table.insert(t168, {
					cat = k,
					rnum = v3727,
					rname = DisplayName
				})
			end
		end

		table.sort(t168, function(p875, p876)
			if p875.rnum == p876.rnum then
				return p875.cat < p876.cat
			end

			return p875.rnum > p876.rnum
		end)

		local function v3728()
			local t170 = {}
			local t171 = {}

			for _, v in ipairs(t168) do
				if not t170[v.rname] then
					t170[v.rname] = true
					table.insert(t171, {
						v.rname,
						v.rnum
					})
				end
			end

			table.sort(t171, function(p877, p878)
				return p877[2] > p878[2]
			end)

			local t172 = { "Any" }

			for _, v in ipairs(t171) do
				table.insert(t172, v[1])
			end

			return t172
		end
		local function v3736()
			local t173 = {}

			for _, v in ipairs(v3728()) do
				if v ~= "Any" then
					table.insert(t173, v)
				end
			end

			return t173
		end
		local function v3740(p879)
			local n65 = 0

			pcall(function()
				n65 = senaV4Config:getAreaEggValue(p879) or 0
			end)

			if n65 > 0 then
				return n65
			end

			pcall(function()
				local AssetEarnings = require(ReplicatedStorage.Shared.Util.AssetEarnings)

				if AssetEarnings and type(AssetEarnings.LiveRatePerSecond) == "function" then
					n65 = AssetEarnings.LiveRatePerSecond(p879) or 0
				end
			end)

			local v3743 = n65 or 0

			return v3743
		end
		local function v3744(p880)
			local n66 = 0

			pcall(function()
				local EggRecords = require(ReplicatedStorage.Shared.Util.EggRecords)
				local AssetCategory = p880.AssetCategory or p880.Category

				n66 = EggRecords.WeightKgForScale(AssetCategory, p880.AssetScale or p880.Scale or 1)
			end)

			local v3748 = n66 or 0

			return v3748
		end
		local function v3749()
			local n67 = 0
			local n68 = 0

			pcall(function()
				local pairs_2 = pairs
				local v3753 = EggState2.ReadOwnerEggs(LocalPlayer.UserId) or {}

				for _, v in pairs_2(v3753) do
					if v.Placement == nil then
						n68 += 1
					else
						n67 += 1
					end
				end
			end)

			return n67, math.max(0, 50 - n67), n68
		end

		local t174 = {}

		local function v3757(p881)
			local AssetCategory = p881 and (p881.AssetCategory or p881.Category)

			if not AssetCategory then
				return
			end

			local v3759 = t174[AssetCategory]

			if not v3759 then
				local v3760, v3761, v3762 = v3707(AssetCategory)

				v3759 = {
					name = AssetCategory,
					rarity = v3761,
					rnum = v3760,
					color = v3762,
					count = 0,
					last = 0,
					image = v3710(AssetCategory)
				}
				t174[AssetCategory] = v3759
			end

			v3759.count += 1
			v3759.last = os.clock()
		end

		local windows = {}

		local function v3764(p882)
			local v3765 = windows[p882]

			return v3765 ~= nil and v3765.gui ~= nil and v3765.gui.Parent ~= nil and v3765.gui.Enabled or false
		end

		local v3766
		local v3767
		local v3768
		local t175 = {
			list = nil,
			headLbl = nil,
			countLbl = nil,
			statusBtn = nil,
			sel = nil,
			rows = {},
			picked = {},
			chips = {},
			sortBtns = {},
			modeBtns = {}
		}
		local t176 = {
			history = {},
			reportedUids = {},
			knownFieldUids = {},
			lastAlert = nil,
			lastReportTime = 0,
			lastSync = 0,
			onlineCount = 1,
			category = "targets",
			filter = "All"
		}

		local function v3771(p883)
			v3698()

			if p883 == "logs" then
				if v3766 then
					v3766()
				end
			elseif p883 == "eggs" then
				if v3767 then
					v3767()
				end
			elseif p883 == "inventory" then
				if v3768 then
					v3768()
				end
			elseif p883 == "checker" then
				if t175 and t175.refresh then
					t175.refresh()
				end
			elseif p883 == "eggdata" and t176 and t176.refresh then
				t176.refresh()
			end
		end

		local u3772
		local TextLabel
		local s12 = "rarity"
		local t177 = {}

		local function v3776()
			v3698()

			for k, v in pairs(t177) do
				local v3779 = k == s12

				v.BackgroundColor3 = v3779 and v3697.accent or Color3.fromRGB(255, 255, 255)
				v.BackgroundTransparency = v3779 and 0.15 or 0.88
				v.TextColor3 = v3779 and Color3.fromRGB(255, 255, 255) or v3697.btnText

				local UIStroke = v:FindFirstChildOfClass("UIStroke")

				if UIStroke then
					UIStroke.Transparency = v3779 and 0 or 1
				end
			end
		end

		v3766 = function()
			v3698()

			if not u3772 then
				return
			end

			for _, child in ipairs(u3772:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end

			local t178 = {}
			local n69 = 0

			for _, v in pairs(t174) do
				table.insert(t178, v)
				n69 += v.count
			end

			if s12 == "count" then
				table.sort(t178, function(p884, p885)
					if p884.count == p885.count then
						return (p884.rnum or 0) > (p885.rnum or 0)
					end

					return p884.count > p885.count
				end)
			elseif s12 == "name" then
				table.sort(t178, function(p886, p887)
					return tostring(p886.name) < tostring(p887.name)
				end)
			else
				table.sort(t178, function(p888, p889)
					if p888.rnum == p889.rnum then
						return p888.count > p889.count
					end

					return (p888.rnum or 0) > (p889.rnum or 0)
				end)
			end

			for i, v in ipairs(t178) do
				local Frame = Instance.new("Frame")

				Frame.Size = UDim2.new(1, -6, 0, 34)
				Frame.BackgroundColor3 = v3697.surface
				Frame.BackgroundTransparency = 0.12
				Frame.BorderSizePixel = 0
				Frame.LayoutOrder = i
				Frame.Parent = u3772
				Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 4)

				local UIStroke = Instance.new("UIStroke", Frame)

				UIStroke.Color = v3697.strokeCol
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.72

				local Frame2 = Instance.new("Frame")

				Frame2.Size = UDim2.new(0, 3, 1, -10)
				Frame2.Position = UDim2.fromOffset(0, 5)
				Frame2.BorderSizePixel = 0
				Frame2.BackgroundColor3 = v.color or v3697.accent
				Frame2.Parent = Frame
				Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

				local ImageLabel = Instance.new("ImageLabel")

				ImageLabel.Position = UDim2.fromOffset(10, 5)
				ImageLabel.Size = UDim2.fromOffset(24, 24)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = v.image and 0.9 or 0.94
				ImageLabel.BorderSizePixel = 0
				ImageLabel.ScaleType = Enum.ScaleType.Fit
				ImageLabel.Image = v.image or ""
				ImageLabel.Parent = Frame
				Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(0, 4)

				if not v.image then
					local Frame3 = Instance.new("Frame")

					Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
					Frame3.Position = UDim2.fromScale(0.5, 0.5)
					Frame3.Size = UDim2.fromOffset(9, 9)
					Frame3.BackgroundColor3 = v.color or v3697.accent
					Frame3.BorderSizePixel = 0
					Frame3.Parent = ImageLabel
					Instance.new("UICorner", Frame3).CornerRadius = UDim.new(1, 0)
				end

				local TextLabel2 = Instance.new("TextLabel")

				TextLabel2.BackgroundTransparency = 1
				TextLabel2.Position = UDim2.fromOffset(42, 0)
				TextLabel2.Size = UDim2.new(0.5, -42, 1, 0)
				TextLabel2.Font = Enum.Font.GothamBold
				TextLabel2.TextSize = 13
				TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel2.TextTruncate = Enum.TextTruncate.AtEnd
				TextLabel2.TextColor3 = v3697.text
				TextLabel2.Text = tostring(v.name)
				TextLabel2.Parent = Frame

				local TextLabel3 = Instance.new("TextLabel")

				TextLabel3.BackgroundTransparency = 1
				TextLabel3.Position = UDim2.new(0.5, 0, 0, 0)
				TextLabel3.Size = UDim2.new(0.3, 0, 1, 0)
				TextLabel3.Font = Enum.Font.GothamBold
				TextLabel3.TextSize = 12
				TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel3.TextColor3 = v.color or v3697.muted
				TextLabel3.Text = tostring(v.rarity)
				TextLabel3.Parent = Frame

				local TextLabel4 = Instance.new("TextLabel")

				TextLabel4.BackgroundTransparency = 1
				TextLabel4.Position = UDim2.new(0.8, 0, 0, 0)
				TextLabel4.Size = UDim2.new(0.2, -12, 1, 0)
				TextLabel4.Font = Enum.Font.GothamBold
				TextLabel4.TextSize = 13
				TextLabel4.TextXAlignment = Enum.TextXAlignment.Right
				TextLabel4.TextColor3 = v3697.accent
				TextLabel4.Text = "x" .. tostring(v.count)
				TextLabel4.Parent = Frame
			end

			u3772.CanvasSize = UDim2.new(0, 0, 0, #t178 * 38 + 6)

			if TextLabel then
				TextLabel.Text = "Total: " .. tostring(n69)
			end
		end

		local function v3797(p890)
			TextLabel = Instance.new("TextLabel")
			TextLabel.BackgroundTransparency = 1
			TextLabel.Position = UDim2.new(1, -150, 0, 4)
			TextLabel.Size = UDim2.fromOffset(110, 22)
			TextLabel.Font = Enum.Font.GothamBold
			TextLabel.TextSize = 12
			TextLabel.TextXAlignment = Enum.TextXAlignment.Right
			TextLabel.TextColor3 = v3697.muted
			TextLabel.Text = "Total: 0"
			TextLabel.Parent = p890

			local Frame = Instance.new("Frame")

			Frame.Position = UDim2.fromOffset(14, 4)
			Frame.Size = UDim2.new(1, -28, 0, 28)
			Frame.BackgroundTransparency = 1
			Frame.Parent = p890

			local UIListLayout = Instance.new("UIListLayout", Frame)

			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.Padding = UDim.new(0, 6)
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

			local function v3800(p891, p892, p893)
				local TextButton = Instance.new("TextButton")

				TextButton.Size = UDim2.fromOffset(p893, 26)
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 0.88
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.GothamBold
				TextButton.TextSize = 12
				TextButton.TextColor3 = v3697.btnText
				TextButton.Text = p891
				TextButton.Parent = Frame
				Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 4)

				local UIStroke = Instance.new("UIStroke", TextButton)

				UIStroke.Color = v3697.accent
				UIStroke.Thickness = 1
				UIStroke.Transparency = 1
				TextButton.MouseButton1Click:Connect(function()
					s12 = p892
					v3776()
					v3766()
				end)
				t177[p892] = TextButton
			end

			v3800("Rarity", "rarity", 66)
			v3800("Amount", "count", 66)
			v3800("Name", "name", 58)

			local TextButton = Instance.new("TextButton")

			TextButton.Size = UDim2.fromOffset(54, 26)
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 0.88
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.GothamBold
			TextButton.TextSize = 12
			TextButton.TextColor3 = v3697.btnText
			TextButton.Text = "Clear"
			TextButton.Parent = Frame
			Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 4)

			local UIStroke = Instance.new("UIStroke", TextButton)

			UIStroke.Color = v3697.accent
			UIStroke.Thickness = 1
			UIStroke.Transparency = 1
			TextButton.MouseButton1Click:Connect(function()
				t174 = {}
				v3766()
			end)

			local Frame2 = Instance.new("Frame")

			Frame2.Position = UDim2.fromOffset(16, 38)
			Frame2.Size = UDim2.new(1, -32, 0, 18)
			Frame2.BackgroundTransparency = 1
			Frame2.Parent = p890

			local function v3806(p894, p895, p896, p897)
				local TextLabel2 = Instance.new("TextLabel")

				TextLabel2.BackgroundTransparency = 1
				TextLabel2.Position = p895
				TextLabel2.Size = p896
				TextLabel2.Font = Enum.Font.GothamBold
				TextLabel2.TextSize = 11
				TextLabel2.TextColor3 = v3697.muted
				TextLabel2.TextXAlignment = p897
				TextLabel2.Text = p894
				TextLabel2.Parent = Frame2
			end

			v3806("EGG", UDim2.fromOffset(26, 0), UDim2.new(0.5, -26, 1, 0), Enum.TextXAlignment.Left)
			v3806("RARITY", UDim2.new(0.5, 0, 0, 0), UDim2.new(0.3, 0, 1, 0), Enum.TextXAlignment.Left)
			v3806("AMOUNT", UDim2.new(0.8, 0, 0, 0), UDim2.new(0.2, -12, 1, 0), Enum.TextXAlignment.Right)

			local ScrollingFrame = Instance.new("ScrollingFrame")

			ScrollingFrame.Position = UDim2.fromOffset(14, 60)
			ScrollingFrame.Size = UDim2.new(1, -28, 1, -68)
			ScrollingFrame.BackgroundTransparency = 1
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.ScrollBarThickness = 3
			ScrollingFrame.ScrollBarImageColor3 = v3697.accent
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame.Parent = p890

			local UIListLayout2 = Instance.new("UIListLayout", ScrollingFrame)

			UIListLayout2.Padding = UDim.new(0, 4)
			UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
			u3772 = ScrollingFrame
			v3776()
			v3766()
		end

		local u3810
		local TextLabel2
		local startPlacing
		local TextLabel3
		local s13 = "All"
		local t179 = {}
		local t180 = {}

		local function v3817()
			v3698()

			for k, v in pairs(t179) do
				local v3820 = k == s13

				v.BackgroundColor3 = v3820 and v3697.accent or Color3.fromRGB(255, 255, 255)
				v.BackgroundTransparency = v3820 and 0.15 or 0.88
				v.TextColor3 = v3820 and Color3.fromRGB(255, 255, 255) or v3697.btnText

				local UIStroke = v:FindFirstChildOfClass("UIStroke")

				if UIStroke then
					UIStroke.Transparency = v3820 and 0 or 1
				end
			end
		end

		v3767 = function()
			v3698()

			if not u3810 then
				return
			end

			for _, child in ipairs(u3810:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end

			local ok, result = pcall(function()
				return EggState2.ReadOwnerEggs(LocalPlayer.UserId)
			end)

			if not ok or type(result) ~= "table" then
				if TextLabel3 then
					TextLabel3.Text = "Total: 0  ON: 0"
				end

				return
			end

			local t181 = {}
			local n70 = 0

			for k, v in pairs(result) do
				if v.Placement == nil then
					local v3830, v3831, v3832 = v3707(v.AssetCategory)

					if s13 == "All" or v3831 == s13 then
						local v3833 = t180[k] ~= false

						if v3833 then
							n70 += 1
						end

						local Directory2 = Assets.Directory and Assets.Directory[v.AssetCategory]

						table.insert(t181, {
							uid = k,
							name = Directory2 and Directory2.DisplayName or v.AssetCategory or tostring(k):sub(1, 8),
							rarity = v3831,
							rnum = v3830,
							color = v3832,
							image = v3710(v.AssetCategory),
							enabled = v3833
						})
					end
				end
			end

			table.sort(t181, function(p898, p899)
				if p898.rnum == p899.rnum then
					return p898.name < p899.name
				end

				return (p898.rnum or 0) > (p899.rnum or 0)
			end)

			for i, v in ipairs(t181) do
				local Frame = Instance.new("Frame")

				Frame.Size = UDim2.new(1, -6, 0, 34)
				Frame.BackgroundColor3 = v3697.surface
				Frame.BackgroundTransparency = 0.12
				Frame.BorderSizePixel = 0
				Frame.LayoutOrder = i
				Frame.Parent = u3810
				Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 4)

				local UIStroke = Instance.new("UIStroke", Frame)

				UIStroke.Color = v3697.strokeCol
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.72

				local Frame2 = Instance.new("Frame")

				Frame2.Size = UDim2.new(0, 3, 1, -10)
				Frame2.Position = UDim2.fromOffset(0, 5)
				Frame2.BorderSizePixel = 0
				Frame2.BackgroundColor3 = v.color or v3697.accent
				Frame2.Parent = Frame
				Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

				local ImageLabel = Instance.new("ImageLabel")

				ImageLabel.Position = UDim2.fromOffset(10, 5)
				ImageLabel.Size = UDim2.fromOffset(24, 24)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.BorderSizePixel = 0
				ImageLabel.ScaleType = Enum.ScaleType.Fit
				ImageLabel.Image = v.image or ""
				ImageLabel.Parent = Frame
				Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(0, 4)

				if not v.image then
					local Frame3 = Instance.new("Frame")

					Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
					Frame3.Position = UDim2.fromScale(0.5, 0.5)
					Frame3.Size = UDim2.fromOffset(9, 9)
					Frame3.BackgroundColor3 = v.color or v3697.accent
					Frame3.BorderSizePixel = 0
					Frame3.Parent = ImageLabel
					Instance.new("UICorner", Frame3).CornerRadius = UDim.new(1, 0)
				end

				local TextLabel4 = Instance.new("TextLabel")

				TextLabel4.BackgroundTransparency = 1
				TextLabel4.Position = UDim2.fromOffset(42, 0)
				TextLabel4.Size = UDim2.new(0.55, -42, 1, 0)
				TextLabel4.Font = Enum.Font.GothamBold
				TextLabel4.TextSize = 12
				TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel4.TextTruncate = Enum.TextTruncate.AtEnd
				TextLabel4.TextColor3 = v3697.text
				TextLabel4.Text = tostring(v.name)
				TextLabel4.Parent = Frame

				local TextLabel5 = Instance.new("TextLabel")

				TextLabel5.BackgroundTransparency = 1
				TextLabel5.Position = UDim2.new(0.55, 0, 0, 0)
				TextLabel5.Size = UDim2.new(0.23, 0, 1, 0)
				TextLabel5.Font = Enum.Font.GothamBold
				TextLabel5.TextSize = 11
				TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel5.TextColor3 = v.color or v3697.muted
				TextLabel5.Text = tostring(v.rarity)
				TextLabel5.Parent = Frame

				local TextButton = Instance.new("TextButton")

				TextButton.Position = UDim2.new(1, -62, 0, 5)
				TextButton.Size = UDim2.fromOffset(56, 24)
				TextButton.BackgroundColor3 = v.enabled and v3697.accent or Color3.fromRGB(78, 78, 96)
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.GothamBold
				TextButton.TextSize = 11
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.Text = v.enabled and "ON" or "OFF"
				TextButton.Parent = Frame
				Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 5)

				local UIStroke2 = Instance.new("UIStroke", TextButton)

				UIStroke2.Color = v3697.strokeCol
				UIStroke2.Thickness = 1
				UIStroke2.Transparency = 0.6
				TextButton.MouseButton1Click:Connect(function()
					if t180[v.uid] == false then
						t180[v.uid] = nil
					else
						t180[v.uid] = false
					end

					v3767()
				end)
			end

			u3810.CanvasSize = UDim2.new(0, 0, 0, #t181 * 38 + 6)

			if TextLabel3 then
				TextLabel3.Text = string.format("Total: %d  ON: %d", #t181, n70)
			end

			if TextLabel2 then
				local v3846, v3847, v3848 = v3749()

				if v3847 <= 0 then
					TextLabel2.Text = string.format("Plot FULL - %d/50 placed, %d waiting", v3846, v3848)
				else
					TextLabel2.Text = string.format("Plot %d/50 - room for %d more, %d waiting", v3846, v3847, v3848)
				end
			end
		end

		local function v3849(p900)
			local Frame = Instance.new("Frame")

			Frame.Size = UDim2.fromScale(1, 1)
			Frame.BackgroundTransparency = 1
			Frame.BorderSizePixel = 0
			Frame.Parent = p900
			TextLabel3 = Instance.new("TextLabel")
			TextLabel3.BackgroundTransparency = 1
			TextLabel3.Position = UDim2.new(0, 236, 1, -60)
			TextLabel3.Size = UDim2.new(1, -250, 0, 26)
			TextLabel3.Font = Enum.Font.GothamBold
			TextLabel3.TextSize = 12
			TextLabel3.TextXAlignment = Enum.TextXAlignment.Right
			TextLabel3.TextColor3 = v3697.muted
			TextLabel3.Text = "Total: 0  ON: 0"
			TextLabel3.Parent = Frame

			local ScrollingFrame = Instance.new("ScrollingFrame")

			ScrollingFrame.Position = UDim2.fromOffset(14, 4)
			ScrollingFrame.Size = UDim2.new(1, -28, 0, 28)
			ScrollingFrame.BackgroundTransparency = 1
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.ScrollBarThickness = 3
			ScrollingFrame.ScrollBarImageColor3 = v3697.accent
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame.Parent = Frame

			local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)

			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.Padding = UDim.new(0, 6)
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			t179 = {}

			local n71 = 0

			local function v3854(p901)
				local TextButton = Instance.new("TextButton")
				local v3856 = math.max(42, #p901 * 6 + 12)

				TextButton.Size = UDim2.fromOffset(v3856, 24)
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 0.88
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.GothamBold
				TextButton.TextSize = 12
				TextButton.TextColor3 = v3697.btnText
				TextButton.Text = p901
				TextButton.Parent = ScrollingFrame
				Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 4)

				local UIStroke = Instance.new("UIStroke", TextButton)

				UIStroke.Color = v3697.accent
				UIStroke.Thickness = 1
				UIStroke.Transparency = 1
				TextButton.MouseButton1Click:Connect(function()
					s13 = p901
					v3817()
					v3767()
				end)
				t179[p901] = TextButton
				n71 = n71 + v3856 + 6
			end

			v3854("All")

			for _, v in ipairs(v3736()) do
				v3854(v)
			end

			ScrollingFrame.CanvasSize = UDim2.new(0, n71 + 4, 0, 0)
			v3817()

			local Frame2 = Instance.new("Frame")

			Frame2.Position = UDim2.fromOffset(16, 38)
			Frame2.Size = UDim2.new(1, -32, 0, 18)
			Frame2.BackgroundTransparency = 1
			Frame2.Parent = Frame

			local function v3861(p902, p903, p904, p905)
				local TextLabel4 = Instance.new("TextLabel")

				TextLabel4.BackgroundTransparency = 1
				TextLabel4.Position = p903
				TextLabel4.Size = p904
				TextLabel4.Font = Enum.Font.GothamBold
				TextLabel4.TextSize = 11
				TextLabel4.TextColor3 = v3697.muted
				TextLabel4.TextXAlignment = p905
				TextLabel4.Text = p902
				TextLabel4.Parent = Frame2
			end

			v3861("EGG", UDim2.fromOffset(26, 0), UDim2.new(0.55, -26, 1, 0), Enum.TextXAlignment.Left)
			v3861("RARITY", UDim2.new(0.55, 0, 0, 0), UDim2.new(0.23, 0, 1, 0), Enum.TextXAlignment.Left)
			v3861("PLACE", UDim2.new(1, -62, 0, 0), UDim2.fromOffset(56, 18), Enum.TextXAlignment.Center)

			local ScrollingFrame2 = Instance.new("ScrollingFrame")

			ScrollingFrame2.Position = UDim2.fromOffset(14, 60)
			ScrollingFrame2.Size = UDim2.new(1, -28, 1, -126)
			ScrollingFrame2.BackgroundTransparency = 1
			ScrollingFrame2.BorderSizePixel = 0
			ScrollingFrame2.ScrollBarThickness = 3
			ScrollingFrame2.ScrollBarImageColor3 = v3697.accent
			ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame2.Parent = Frame

			local UIListLayout2 = Instance.new("UIListLayout", ScrollingFrame2)

			UIListLayout2.Padding = UDim.new(0, 4)
			UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
			u3810 = ScrollingFrame2

			local function createTextButton(p906, p907, p908, p909)
				local TextButton = Instance.new("TextButton")

				TextButton.Size = UDim2.fromOffset(p907, 28)
				TextButton.BackgroundColor3 = p908 or v3697.accent
				TextButton.BackgroundTransparency = 0.15
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.GothamBold
				TextButton.TextSize = 12
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.Text = p906
				TextButton.LayoutOrder = p909 or 1
				Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 4)

				local UIStroke = Instance.new("UIStroke", TextButton)

				UIStroke.Color = v3697.strokeCol
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.6

				return TextButton
			end

			local Frame3 = Instance.new("Frame")

			Frame3.Position = UDim2.new(0, 14, 1, -60)
			Frame3.Size = UDim2.new(0, 220, 0, 28)
			Frame3.BackgroundTransparency = 1
			Frame3.Parent = Frame

			local UIListLayout3 = Instance.new("UIListLayout", Frame3)

			UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout3.Padding = UDim.new(0, 6)
			UIListLayout3.VerticalAlignment = Enum.VerticalAlignment.Center

			local toggleAll = createTextButton("Toggle All", 80, Color3.fromRGB(60, 70, 95), 1)

			toggleAll.Parent = Frame3
			toggleAll.MouseButton1Click:Connect(function()
				local ok, result = pcall(function()
					return EggState2.ReadOwnerEggs(LocalPlayer.UserId)
				end)

				if not ok or type(result) ~= "table" then
					return
				end

				local v3873 = false
				local v3874, v3875, v3876 = pairs(result)
				local v3877 = geniter(v3874, v3875, v3876)

				while true do
					local v3878 = table.pack(v3877())

					if v3878[1] then
						if (v3878[3]).Placement == nil and t180[v3878[2]] == false then
							v3873 = true

							break
						end
					else
						break
					end
				end

				local v3879, v3880, v3881 = pairs(result)

				for k, v in v3879, v3880, v3881 do
					if v.Placement == nil then
						if v3873 then
							t180[k] = nil
						else
							t180[k] = false
						end
					end
				end

				v3767()
			end)
			startPlacing = createTextButton("Start Placing", 120, v3697.accent, 2)
			startPlacing.Parent = Frame3
			startPlacing.MouseButton1Click:Connect(function()
				pcall(function()
					if type(applyAutoPlace) == "function" then
						applyAutoPlace(true)
					elseif type(t24) == "table" and type(t24.AutoPlaceLoop) == "function" then
						senaV4Config.AutoPlace = true
						task.spawn(t24.AutoPlaceLoop)
					end
				end)
			end)
			TextLabel2 = Instance.new("TextLabel")
			TextLabel2.BackgroundTransparency = 1
			TextLabel2.Position = UDim2.new(0, 16, 1, -26)
			TextLabel2.Size = UDim2.new(1, -32, 0, 18)
			TextLabel2.Font = Enum.Font.GothamMedium
			TextLabel2.TextSize = 11
			TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel2.TextColor3 = v3697.muted
			TextLabel2.Text = ""
			TextLabel2.Parent = Frame
			v3767()
		end

		local u3884
		local TextLabel4
		local s14 = "backpack"
		local s15 = "moneys"
		local u3888 = false
		local t182 = {}
		local t183 = {}

		local function v3891()
			v3698()

			for k, v in pairs(t183) do
				local v3894 = k == s14

				v.BackgroundColor3 = v3894 and v3697.accent or Color3.fromRGB(255, 255, 255)
				v.BackgroundTransparency = v3894 and 0.15 or 0.88
				v.TextColor3 = v3894 and Color3.fromRGB(255, 255, 255) or v3697.btnText

				local UIStroke = v:FindFirstChildOfClass("UIStroke")

				if UIStroke then
					UIStroke.Transparency = v3894 and 0 or 1
				end
			end
		end
		local function v3896()
			v3698()

			for k, v in pairs(t182) do
				local v3899 = k == s15

				v.BackgroundColor3 = v3899 and v3697.accent or Color3.fromRGB(255, 255, 255)
				v.BackgroundTransparency = v3899 and 0.15 or 0.88
				v.TextColor3 = v3899 and Color3.fromRGB(255, 255, 255) or v3697.btnText

				local UIStroke = v:FindFirstChildOfClass("UIStroke")

				if UIStroke then
					UIStroke.Transparency = v3899 and 0 or 1
				end
			end
		end

		v3768 = function()
			v3698()

			if not u3884 then
				return
			end

			for _, child in ipairs(u3884:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end

			local v3903 = (Save.Peek or Save.Get)() or {}
			local t184 = {}
			local n72 = 0

			local function v3906(p910)
				local AssetCategory = p910.AssetCategory or p910.Category
				local Directory2 = Assets.Directory and Assets.Directory[AssetCategory]
				local v3909, v3910, v3911 = v3707(AssetCategory)
				local v3912 = v3740({
					AssetCategory = AssetCategory,
					AssetScale = p910.Scale or p910.AssetScale or 1,
					Mutations = p910.Mutations or {}
				})
				local v3913 = v3744(p910)

				n72 += v3912
				table.insert(t184, {
					name = Directory2 and Directory2.DisplayName or tostring(AssetCategory),
					icon = v3710(AssetCategory),
					kg = v3913,
					kgS = string.format("%.1fKg", v3913),
					moneys = v3912,
					rnum = v3909,
					rarity = v3910,
					color = v3911
				})
			end

			if s14 == "inplot" then
				local ipairs_ = ipairs
				local EquippedAssets = v3903.EquippedAssets or {}

				for _, EquippedAsset in ipairs_(EquippedAssets) do
					local Inventory = v3903.Inventory and v3903.Inventory[EquippedAsset]

					if Inventory then
						v3906(Inventory)
					end
				end
			else
				local pairs_2 = pairs
				local Inventory = v3903.Inventory or {}

				for _, v in pairs_2(Inventory) do
					if type(v) == "table" and (v.AssetCategory or v.Category) then
						v3906(v)
					end
				end
			end

			local v3923 = s15 == "rarity" and "rnum" or s15

			table.sort(t184, function(p911, p912)
				if p911[v3923] == p912[v3923] then
					return p911.name < p912.name
				end

				if u3888 then
					return (p911[v3923] or 0) < (p912[v3923] or 0)
				end

				return (p911[v3923] or 0) > (p912[v3923] or 0)
			end)

			for i, v in ipairs(t184) do
				local Frame = Instance.new("Frame")

				Frame.Size = UDim2.new(1, -6, 0, 34)
				Frame.BackgroundColor3 = v3697.surface
				Frame.BackgroundTransparency = 0.12
				Frame.BorderSizePixel = 0
				Frame.LayoutOrder = i
				Frame.Parent = u3884
				Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 4)

				local UIStroke = Instance.new("UIStroke", Frame)

				UIStroke.Color = v3697.strokeCol
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.72

				local Frame2 = Instance.new("Frame")

				Frame2.Size = UDim2.new(0, 3, 1, -10)
				Frame2.Position = UDim2.fromOffset(0, 5)
				Frame2.BorderSizePixel = 0
				Frame2.BackgroundColor3 = v.color or v3697.accent
				Frame2.Parent = Frame
				Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

				local ImageLabel = Instance.new("ImageLabel")

				ImageLabel.Position = UDim2.fromOffset(10, 5)
				ImageLabel.Size = UDim2.fromOffset(24, 24)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.BorderSizePixel = 0
				ImageLabel.ScaleType = Enum.ScaleType.Fit
				ImageLabel.Image = v.icon or ""
				ImageLabel.Parent = Frame
				Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(0, 4)

				if not v.icon then
					local Frame3 = Instance.new("Frame")

					Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
					Frame3.Position = UDim2.fromScale(0.5, 0.5)
					Frame3.Size = UDim2.fromOffset(9, 9)
					Frame3.BackgroundColor3 = v.color or v3697.accent
					Frame3.BorderSizePixel = 0
					Frame3.Parent = ImageLabel
					Instance.new("UICorner", Frame3).CornerRadius = UDim.new(1, 0)
				end

				local TextLabel5 = Instance.new("TextLabel")

				TextLabel5.BackgroundTransparency = 1
				TextLabel5.Position = UDim2.fromOffset(42, 0)
				TextLabel5.Size = UDim2.new(0.42, -42, 1, 0)
				TextLabel5.Font = Enum.Font.GothamBold
				TextLabel5.TextSize = 12
				TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel5.TextTruncate = Enum.TextTruncate.AtEnd
				TextLabel5.TextColor3 = v3697.text
				TextLabel5.Text = tostring(v.name)
				TextLabel5.Parent = Frame

				local TextLabel6 = Instance.new("TextLabel")

				TextLabel6.BackgroundTransparency = 1
				TextLabel6.Position = UDim2.new(0.42, 0, 0, 0)
				TextLabel6.Size = UDim2.new(0.18, 0, 1, 0)
				TextLabel6.Font = Enum.Font.GothamBold
				TextLabel6.TextSize = 11
				TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel6.TextColor3 = v.color or v3697.muted
				TextLabel6.Text = tostring(v.rarity)
				TextLabel6.Parent = Frame

				local TextLabel7 = Instance.new("TextLabel")

				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Position = UDim2.new(0.6, 0, 0, 0)
				TextLabel7.Size = UDim2.new(0.18, 0, 1, 0)
				TextLabel7.Font = Enum.Font.GothamBold
				TextLabel7.TextSize = 11
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Right
				TextLabel7.TextColor3 = v3697.btnText
				TextLabel7.Text = tostring(v.kgS)
				TextLabel7.Parent = Frame

				local TextLabel8 = Instance.new("TextLabel")

				TextLabel8.BackgroundTransparency = 1
				TextLabel8.Position = UDim2.new(0.78, 0, 0, 0)
				TextLabel8.Size = UDim2.new(0.22, -12, 1, 0)
				TextLabel8.Font = Enum.Font.GothamBold
				TextLabel8.TextSize = 11
				TextLabel8.TextXAlignment = Enum.TextXAlignment.Right
				TextLabel8.TextColor3 = v.moneys > 0 and v3697.text or v3697.muted
				TextLabel8.Text = v3705(v.moneys) .. "/s"
				TextLabel8.Parent = Frame
			end

			u3884.CanvasSize = UDim2.new(0, 0, 0, #t184 * 38 + 6)

			if TextLabel4 then
				if s14 == "inplot" then
					TextLabel4.Text = string.format("%d equipped | %s/s", #t184, v3705(n72))
				else
					TextLabel4.Text = string.format("%d pets", #t184)
				end
			end
		end

		local function v3935(p913)
			TextLabel4 = Instance.new("TextLabel")
			TextLabel4.BackgroundTransparency = 1
			TextLabel4.Position = UDim2.new(1, -190, 0, 4)
			TextLabel4.Size = UDim2.fromOffset(180, 22)
			TextLabel4.Font = Enum.Font.GothamBold
			TextLabel4.TextSize = 12
			TextLabel4.TextXAlignment = Enum.TextXAlignment.Right
			TextLabel4.TextColor3 = v3697.muted
			TextLabel4.Text = "0 pets"
			TextLabel4.Parent = p913

			local Frame = Instance.new("Frame")

			Frame.Position = UDim2.fromOffset(14, 4)
			Frame.Size = UDim2.new(0, 180, 0, 28)
			Frame.BackgroundTransparency = 1
			Frame.Parent = p913

			local UIListLayout = Instance.new("UIListLayout", Frame)

			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.Padding = UDim.new(0, 6)
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			t183 = {}

			local function v3938(p914, p915, p916)
				local TextButton = Instance.new("TextButton")

				TextButton.Size = UDim2.fromOffset(p916, 26)
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 0.88
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.GothamBold
				TextButton.TextSize = 12
				TextButton.TextColor3 = v3697.btnText
				TextButton.Text = p914
				TextButton.Parent = Frame
				Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 4)

				local UIStroke = Instance.new("UIStroke", TextButton)

				UIStroke.Color = v3697.accent
				UIStroke.Thickness = 1
				UIStroke.Transparency = 1
				TextButton.MouseButton1Click:Connect(function()
					s14 = p915
					v3891()
					v3768()
				end)
				t183[p915] = TextButton
			end

			v3938("Backpack", "backpack", 78)
			v3938("Base", "inplot", 54)

			local Frame2 = Instance.new("Frame")

			Frame2.Position = UDim2.fromOffset(14, 36)
			Frame2.Size = UDim2.new(1, -28, 0, 28)
			Frame2.BackgroundTransparency = 1
			Frame2.Parent = p913

			local UIListLayout2 = Instance.new("UIListLayout", Frame2)

			UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout2.Padding = UDim.new(0, 6)
			UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
			t182 = {}

			local function v3943(p917, p918, p919)
				local TextButton = Instance.new("TextButton")

				TextButton.Size = UDim2.fromOffset(p919, 26)
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 0.88
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.GothamBold
				TextButton.TextSize = 12
				TextButton.TextColor3 = v3697.btnText
				TextButton.Text = p917
				TextButton.Parent = Frame2
				Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 4)

				local UIStroke = Instance.new("UIStroke", TextButton)

				UIStroke.Color = v3697.accent
				UIStroke.Thickness = 1
				UIStroke.Transparency = 1
				TextButton.MouseButton1Click:Connect(function()
					if s15 == p918 then
						u3888 = not u3888
					else
						s15 = p918
						u3888 = false
					end

					v3896()
					v3768()
				end)
				t182[p918] = TextButton
			end

			v3943("Money/s", "moneys", 86)
			v3943("Kg", "kg", 56)
			v3943("Rarity", "rarity", 76)
			v3943("Name", "name", 66)

			local Frame3 = Instance.new("Frame")

			Frame3.Position = UDim2.fromOffset(16, 66)
			Frame3.Size = UDim2.new(1, -32, 0, 18)
			Frame3.BackgroundTransparency = 1
			Frame3.Parent = p913

			local function v3947(p920, p921, p922, p923)
				local TextLabel5 = Instance.new("TextLabel")

				TextLabel5.BackgroundTransparency = 1
				TextLabel5.Position = p921
				TextLabel5.Size = p922
				TextLabel5.Font = Enum.Font.GothamBold
				TextLabel5.TextSize = 11
				TextLabel5.TextColor3 = v3697.muted
				TextLabel5.TextXAlignment = p923
				TextLabel5.Text = p920
				TextLabel5.Parent = Frame3
			end

			v3947("PET", UDim2.fromOffset(26, 0), UDim2.new(0.42, -26, 1, 0), Enum.TextXAlignment.Left)
			v3947("RARITY", UDim2.new(0.42, 0, 0, 0), UDim2.new(0.18, 0, 1, 0), Enum.TextXAlignment.Left)
			v3947("KG", UDim2.new(0.6, 0, 0, 0), UDim2.new(0.18, 0, 1, 0), Enum.TextXAlignment.Right)
			v3947("MONEY/S", UDim2.new(0.78, 0, 0, 0), UDim2.new(0.22, -12, 1, 0), Enum.TextXAlignment.Right)

			local ScrollingFrame = Instance.new("ScrollingFrame")

			ScrollingFrame.Position = UDim2.fromOffset(14, 88)
			ScrollingFrame.Size = UDim2.new(1, -28, 1, -96)
			ScrollingFrame.BackgroundTransparency = 1
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.ScrollBarThickness = 3
			ScrollingFrame.ScrollBarImageColor3 = v3697.accent
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame.Parent = p913

			local UIListLayout3 = Instance.new("UIListLayout", ScrollingFrame)

			UIListLayout3.Padding = UDim.new(0, 4)
			UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
			u3884 = ScrollingFrame
			v3891()
			v3896()
			v3768()
		end

		t175.sort = "value"
		t175.rarity = "All"
		t175.picked = {}
		t175.chips = {}
		t175.sortBtns = {}
		t175.modeBtns = {}
		t175.rows = {}
		t175.scan = function()
			local u3951

			pcall(function()
				u3951 = EggState2.ReadFieldEggs()
			end)

			local t185 = {}
			local ipairs_ = ipairs
			local Records = u3951 and u3951.Records or {}

			for _, Record in ipairs_(Records) do
				if Record.State ~= "Claimed" and Record.State ~= "Carried" and not Record.CarrierUserId and Record.BottomCFrame then
					if not tostring(Record.Uid):find("FirstAreaEgg") then
						local AssetCategory = Record.AssetCategory
						local Directory2 = AssetCategory and Assets.Directory and Assets.Directory[AssetCategory]
						local v3959, v3960, v3961 = v3707(AssetCategory)
						local v3962 = v3740({
							AssetCategory = AssetCategory,
							Category = AssetCategory,
							AssetScale = Record.AssetScale or Record.Scale or 1,
							Scale = Record.AssetScale or Record.Scale or 1,
							Mutations = Record.Mutations or {}
						})
						local v3963 = v3744(Record)
						local v3964 = #t185 + 1
						local t186 = {
							rec = Record,
							uid = Record.Uid
						}
						local DisplayName = Directory2 and Directory2.DisplayName

						if not DisplayName then
							DisplayName = tostring(AssetCategory or "Egg")
						end

						t186.name = DisplayName
						t186.rarity = v3960
						t186.rnum = v3959
						t186.color = v3961
						t186.area = tostring(Record.AreaId or "?")
						t186.rate = v3962
						t186.kg = v3963
						t186.icon = v3710(AssetCategory)
						t185[v3964] = t186
					end
				end
			end

			if t175.rarity ~= "All" then
				local t187 = {}

				for _, v in ipairs(t185) do
					if v.rarity == t175.rarity then
						t187[#t187 + 1] = v
					end
				end

				t185 = t187
			end

			table.sort(t185, function(p924, p925)
				if t175.sort == "rarity" then
					if p924.rnum == p925.rnum then
						return (p924.rate or 0) > (p925.rate or 0)
					end

					return (p924.rnum or 0) > (p925.rnum or 0)
				end

				if p924.rate == p925.rate then
					return (p924.rnum or 0) > (p925.rnum or 0)
				end

				return (p924.rate or 0) > (p925.rate or 0)
			end)

			return t185
		end
		t175.paintChips = function()
			for k, chip in pairs(t175.chips) do
				local v3972 = k == t175.rarity

				chip.BackgroundTransparency = v3972 and 0.1 or 0.9
				chip.TextColor3 = v3972 and Color3.fromRGB(255, 255, 255) or chip:GetAttribute("chipColor") and Color3.fromHex(chip:GetAttribute("chipColor")) or v3697.btnText

				local UIStroke = chip:FindFirstChildOfClass("UIStroke")

				if UIStroke then
					UIStroke.Transparency = v3972 and 0 or 0.65
				end
			end

			for k, sortBtn in pairs(t175.sortBtns) do
				local v3976 = k == t175.sort

				sortBtn.BackgroundColor3 = v3976 and v3697.accent or Color3.fromRGB(255, 255, 255)
				sortBtn.BackgroundTransparency = v3976 and 0.12 or 0.9
				sortBtn.TextColor3 = v3976 and Color3.fromRGB(255, 255, 255) or v3697.btnText
			end

			local __SenaV4StealMode = genv.__SenaV4StealMode or "Fly"
			local pairs_2 = pairs
			local modeBtns = t175.modeBtns or {}

			for k, modeBtn in pairs_2(modeBtns) do
				local v3982 = __SenaV4StealMode == k

				modeBtn.BackgroundColor3 = v3982 and v3697.accent or Color3.fromRGB(255, 255, 255)
				modeBtn.BackgroundTransparency = v3982 and 0.12 or 0.9
				modeBtn.TextColor3 = v3982 and Color3.fromRGB(255, 255, 255) or v3697.btnText

				local UIStroke = modeBtn:FindFirstChildOfClass("UIStroke")

				if UIStroke then
					UIStroke.Transparency = v3982 and 0 or 0.7
				end
			end
		end
		t175.paintRows = function()
			local n73 = 0

			for _, row in ipairs(t175.rows) do
				local v3987 = t175.picked[tostring(row.uid)] == true

				if v3987 then
					n73 += 1
				end

				row.frame.BackgroundTransparency = v3987 and 0.02 or 0.14

				local UIStroke = row.frame:FindFirstChildOfClass("UIStroke")

				if UIStroke then
					UIStroke.Transparency = v3987 and 0 or 0.78
				end

				if row.tick then
					row.tick.BackgroundTransparency = v3987 and 0.05 or 0.86
					row.tick.Text = v3987 and "OK" or ""
				end
			end

			if t175.statusBtn and not t175.running then
				t175.statusBtn.Text = n73 > 0 and "Steal Selected (" .. n73 .. ")" or "Steal Selected"
			end

			if t175.headLbl then
				t175.headLbl.Text = n73 > 0 and n73 .. " picked" or "Tap eggs to pick them"
			end
		end
		t175.refresh = function()
			v3698()

			if not t175.list then
				return
			end

			for _, child in ipairs(t175.list:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end

			t175.rows = {}

			local v3991 = t175.scan()
			local t188 = {}

			for _, v in ipairs(v3991) do
				t188[tostring(v.uid)] = true
			end

			for k in pairs(t175.picked) do
				if not t188[k] then
					t175.picked[k] = nil
				end
			end

			for i, v in ipairs(v3991) do
				local Frame = Instance.new("Frame")

				Frame.Size = UDim2.new(1, -6, 0, 46)
				Frame.BackgroundColor3 = v3697.surface
				Frame.BackgroundTransparency = 0.14
				Frame.BorderSizePixel = 0
				Frame.LayoutOrder = i
				Frame.Parent = t175.list
				Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 7)

				local UIStroke = Instance.new("UIStroke", Frame)

				UIStroke.Color = v.color or v3697.accent
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.78

				local Frame2 = Instance.new("Frame")

				Frame2.Size = UDim2.new(0, 3, 1, -12)
				Frame2.Position = UDim2.fromOffset(0, 6)
				Frame2.BorderSizePixel = 0
				Frame2.BackgroundColor3 = v.color or v3697.accent
				Frame2.Parent = Frame
				Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

				local TextLabel5 = Instance.new("TextLabel")

				TextLabel5.Position = UDim2.fromOffset(10, 11)
				TextLabel5.Size = UDim2.fromOffset(24, 24)
				TextLabel5.BackgroundColor3 = v3697.accent
				TextLabel5.BackgroundTransparency = 0.86
				TextLabel5.Font = Enum.Font.GothamBold
				TextLabel5.TextSize = 11
				TextLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel5.Text = ""
				TextLabel5.Parent = Frame
				Instance.new("UICorner", TextLabel5).CornerRadius = UDim.new(0, 5)

				local UIStroke2 = Instance.new("UIStroke", TextLabel5)

				UIStroke2.Color = v3697.accent
				UIStroke2.Thickness = 1
				UIStroke2.Transparency = 0.6

				local ImageLabel = Instance.new("ImageLabel")

				ImageLabel.Position = UDim2.fromOffset(42, 7)
				ImageLabel.Size = UDim2.fromOffset(30, 30)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.BorderSizePixel = 0
				ImageLabel.ScaleType = Enum.ScaleType.Fit
				ImageLabel.Image = v.icon or ""
				ImageLabel.Parent = Frame
				Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(0, 4)

				if not v.icon then
					local Frame3 = Instance.new("Frame")

					Frame3.AnchorPoint = Vector2.new(0.5, 0.5)
					Frame3.Position = UDim2.fromScale(0.5, 0.5)
					Frame3.Size = UDim2.fromOffset(10, 10)
					Frame3.BackgroundColor3 = v.color or v3697.accent
					Frame3.BorderSizePixel = 0
					Frame3.Parent = ImageLabel
					Instance.new("UICorner", Frame3).CornerRadius = UDim.new(1, 0)
				end

				local TextLabel6 = Instance.new("TextLabel")

				TextLabel6.BackgroundTransparency = 1
				TextLabel6.Position = UDim2.fromOffset(78, 6)
				TextLabel6.Size = UDim2.new(1, -184, 0, 17)
				TextLabel6.Font = Enum.Font.GothamBold
				TextLabel6.TextSize = 13
				TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel6.TextTruncate = Enum.TextTruncate.AtEnd
				TextLabel6.TextColor3 = v3697.text
				TextLabel6.Text = tostring(v.name)
				TextLabel6.Parent = Frame

				local TextLabel7 = Instance.new("TextLabel")

				TextLabel7.BackgroundTransparency = 1
				TextLabel7.Position = UDim2.fromOffset(78, 24)
				TextLabel7.Size = UDim2.new(1, -184, 0, 17)
				TextLabel7.Font = Enum.Font.GothamBold
				TextLabel7.TextSize = 11
				TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel7.TextTruncate = Enum.TextTruncate.AtEnd
				TextLabel7.TextColor3 = v.color or v3697.muted
				TextLabel7.Text = string.format("%s  -  %s%s", tostring(v.rarity or "?"), tostring(v.area), v.kg and string.format("  -  %.1fkg", v.kg) or "")
				TextLabel7.Parent = Frame

				local TextLabel8 = Instance.new("TextLabel")

				TextLabel8.BackgroundTransparency = 1
				TextLabel8.AnchorPoint = Vector2.new(1, 0.5)
				TextLabel8.Position = UDim2.new(1, -12, 0.5, 0)
				TextLabel8.Size = UDim2.fromOffset(96, 20)
				TextLabel8.Font = Enum.Font.GothamBold
				TextLabel8.TextSize = 13
				TextLabel8.TextXAlignment = Enum.TextXAlignment.Right
				TextLabel8.TextColor3 = Color3.fromRGB(126, 224, 151)
				TextLabel8.Text = v3703(v.rate) .. "/s"
				TextLabel8.Parent = Frame

				local TextButton = Instance.new("TextButton")

				TextButton.Size = UDim2.fromScale(1, 1)
				TextButton.BackgroundTransparency = 1
				TextButton.Text = ""
				TextButton.AutoButtonColor = false
				TextButton.Parent = Frame

				local v4009 = tostring(v.uid)

				TextButton.MouseButton1Click:Connect(function()
					t175.picked[v4009] = not t175.picked[v4009] or nil
					t175.paintRows()
				end)
				t175.rows[#t175.rows + 1] = {
					uid = v.uid,
					frame = Frame,
					tick = TextLabel5
				}
			end

			if t175.countLbl then
				pcall(function()
					t175.countLbl.Text = #v3991 .. " eggs"
				end)
			end

			pcall(function()
				t175.list.CanvasSize = UDim2.new(0, 0, 0, #v3991 * 50 + 8)
			end)
			pcall(t175.paintChips)
			pcall(t175.paintRows)
		end
		t175.build = function(p926)
			local Frame = Instance.new("Frame")

			Frame.Size = UDim2.fromScale(1, 1)
			Frame.BackgroundTransparency = 1
			Frame.BorderSizePixel = 0
			Frame.Parent = p926
			t175.countLbl = Instance.new("TextLabel")
			t175.countLbl.BackgroundTransparency = 1
			t175.countLbl.AnchorPoint = Vector2.new(1, 0)
			t175.countLbl.Position = UDim2.new(1, -16, 0, 2)
			t175.countLbl.Size = UDim2.fromOffset(110, 18)
			t175.countLbl.Font = Enum.Font.GothamBold
			t175.countLbl.TextSize = 12
			t175.countLbl.TextXAlignment = Enum.TextXAlignment.Right
			t175.countLbl.TextColor3 = v3697.muted
			t175.countLbl.Text = "0 eggs"
			t175.countLbl.Parent = Frame
			t175.headLbl = Instance.new("TextLabel")
			t175.headLbl.BackgroundTransparency = 1
			t175.headLbl.Position = UDim2.fromOffset(14, 2)
			t175.headLbl.Size = UDim2.new(1, -135, 0, 18)
			t175.headLbl.Font = Enum.Font.GothamBold
			t175.headLbl.TextSize = 12
			t175.headLbl.TextXAlignment = Enum.TextXAlignment.Left
			t175.headLbl.TextTruncate = Enum.TextTruncate.AtEnd
			t175.headLbl.TextColor3 = v3697.muted
			t175.headLbl.Text = "Tap eggs to pick them"
			t175.headLbl.Parent = Frame

			local ScrollingFrame = Instance.new("ScrollingFrame")

			ScrollingFrame.Position = UDim2.fromOffset(14, 24)
			ScrollingFrame.Size = UDim2.new(1, -28, 0, 36)
			ScrollingFrame.BackgroundTransparency = 1
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.ScrollBarThickness = 3
			ScrollingFrame.ScrollBarImageColor3 = v3697.accent
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame.Parent = Frame

			local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)

			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.Padding = UDim.new(0, 6)
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

			local n74 = 0

			t175.chips = {}

			local function v4014(p927, p928)
				local TextButton = Instance.new("TextButton")
				local v4016 = math.max(48, #p927 * 7 + 16)

				TextButton.Size = UDim2.fromOffset(v4016, 24)
				TextButton.BackgroundColor3 = p928 or v3697.accent
				TextButton.BackgroundTransparency = 0.9
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.GothamBold
				TextButton.TextSize = 12
				TextButton.TextColor3 = p928 or v3697.btnText
				TextButton.Text = p927

				if p928 then
					TextButton:SetAttribute("chipColor", p928:ToHex())
				end

				local UIStroke = Instance.new("UIStroke", TextButton)

				UIStroke.Color = p928 or v3697.accent
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.65
				TextButton.Parent = ScrollingFrame
				Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 0)
				TextButton.MouseButton1Click:Connect(function()
					t175.rarity = p927
					t175.paintChips()
					t175.refresh()
				end)
				t175.chips[p927] = TextButton
				n74 = n74 + v4016 + 6
			end

			v4014("All", nil)

			for _, v in ipairs(v3736()) do
				local v4020

				for _, v2 in ipairs(t168) do
					if v2.rname == v then
						local _, _, v4025 = v3707(v2.cat)

						v4020 = v4025

						break
					end
				end

				v4014(v, v4020)
			end

			ScrollingFrame.CanvasSize = UDim2.new(0, n74 + 6, 0, 0)

			local Frame2 = Instance.new("Frame")

			Frame2.Position = UDim2.fromOffset(14, 66)
			Frame2.Size = UDim2.new(1, -28, 0, 26)
			Frame2.BackgroundTransparency = 1
			Frame2.Parent = Frame

			local UIListLayout2 = Instance.new("UIListLayout", Frame2)

			UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout2.Padding = UDim.new(0, 6)
			UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
			t175.sortBtns = {}

			local function v4028(p929, p930)
				local TextButton = Instance.new("TextButton")

				TextButton.Size = UDim2.fromOffset(96, 24)
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 0.9
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.GothamBold
				TextButton.TextSize = 12
				TextButton.TextColor3 = v3697.btnText
				TextButton.Text = p930
				TextButton.Parent = Frame2
				Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 5)
				TextButton.MouseButton1Click:Connect(function()
					t175.sort = p929
					t175.paintChips()
					t175.refresh()
				end)
				t175.sortBtns[p929] = TextButton
			end

			v4028("value", "Best Value")
			v4028("rarity", "Rarity")

			local TextButton = Instance.new("TextButton")

			TextButton.Size = UDim2.fromOffset(76, 24)
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 0.9
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.GothamBold
			TextButton.TextSize = 12
			TextButton.TextColor3 = v3697.btnText
			TextButton.Text = "Clear"
			TextButton.Parent = Frame2
			Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 5)
			TextButton.MouseButton1Click:Connect(function()
				t175.picked = {}
				t175.paintRows()
			end)

			local Frame3 = Instance.new("Frame")

			Frame3.Position = UDim2.fromOffset(14, 96)
			Frame3.Size = UDim2.new(1, -28, 0, 26)
			Frame3.BackgroundTransparency = 1
			Frame3.Parent = Frame

			local UIListLayout3 = Instance.new("UIListLayout", Frame3)

			UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout3.Padding = UDim.new(0, 4)
			UIListLayout3.VerticalAlignment = Enum.VerticalAlignment.Center

			local TextLabel5 = Instance.new("TextLabel")

			TextLabel5.Size = UDim2.fromOffset(38, 24)
			TextLabel5.BackgroundTransparency = 1
			TextLabel5.Font = Enum.Font.GothamBold
			TextLabel5.TextSize = 11
			TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel5.TextColor3 = v3697.muted
			TextLabel5.Text = "MOVE"
			TextLabel5.Parent = Frame3
			t175.modeBtns = {}

			local function v4034(p931, p932)
				local TextButton2 = Instance.new("TextButton")

				TextButton2.Size = UDim2.fromOffset(68, 24)
				TextButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton2.BackgroundTransparency = 0.9
				TextButton2.AutoButtonColor = false
				TextButton2.Font = Enum.Font.GothamBold
				TextButton2.TextSize = 12
				TextButton2.TextColor3 = v3697.btnText
				TextButton2.Text = p931
				TextButton2.Parent = Frame3
				Instance.new("UICorner", TextButton2).CornerRadius = UDim.new(0, 5)

				local UIStroke = Instance.new("UIStroke", TextButton2)

				UIStroke.Color = v3697.accent
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.7
				TextButton2.MouseButton1Click:Connect(function()
					v3698()
					genv.__SenaV4StealMode = p932
					pcall(function()
						if type(applyStealMode) == "function" then
							applyStealMode(p932)
						end
					end)
					t175.paintChips()
				end)
				t175.modeBtns[p932] = TextButton2
			end

			v4034("Low Speed User", "Instant")
			v4034("High Speed User", "Fly")

			local ScrollingFrame2 = Instance.new("ScrollingFrame")

			ScrollingFrame2.Position = UDim2.fromOffset(14, 128)
			ScrollingFrame2.Size = UDim2.new(1, -28, 1, -188)
			ScrollingFrame2.BackgroundTransparency = 1
			ScrollingFrame2.BorderSizePixel = 0
			ScrollingFrame2.ScrollBarThickness = 3
			ScrollingFrame2.ScrollBarImageColor3 = v3697.accent
			ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame2.Parent = Frame

			local UIListLayout4 = Instance.new("UIListLayout", ScrollingFrame2)

			UIListLayout4.Padding = UDim.new(0, 4)
			UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
			t175.list = ScrollingFrame2

			local Frame4 = Instance.new("Frame")

			Frame4.Position = UDim2.new(0, 14, 1, -52)
			Frame4.Size = UDim2.new(1, -28, 0, 38)
			Frame4.BackgroundTransparency = 1
			Frame4.Parent = Frame

			local TextButton2 = Instance.new("TextButton")

			TextButton2.Size = UDim2.new(0.3, -4, 1, 0)
			TextButton2.BackgroundColor3 = Color3.fromRGB(90, 100, 140)
			TextButton2.BackgroundTransparency = 0.15
			TextButton2.AutoButtonColor = false
			TextButton2.Font = Enum.Font.GothamBold
			TextButton2.TextSize = 13
			TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton2.Text = "Refresh"
			TextButton2.Parent = Frame4
			Instance.new("UICorner", TextButton2).CornerRadius = UDim.new(0, 6)
			TextButton2.MouseButton1Click:Connect(function()
				pcall(function()
					EggState2.SyncFieldEggs()
				end)
				t175.refresh()
			end)
			t175.statusBtn = Instance.new("TextButton")
			t175.statusBtn.AnchorPoint = Vector2.new(1, 0)
			t175.statusBtn.Position = UDim2.fromScale(1, 0)
			t175.statusBtn.Size = UDim2.new(0.69, -4, 1, 0)
			t175.statusBtn.BackgroundColor3 = v3697.accent
			t175.statusBtn.BackgroundTransparency = 0.12
			t175.statusBtn.AutoButtonColor = false
			t175.statusBtn.Font = Enum.Font.GothamBold
			t175.statusBtn.TextSize = 13
			t175.statusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			t175.statusBtn.Text = "Steal Selected"
			t175.statusBtn.Parent = Frame4
			Instance.new("UICorner", t175.statusBtn).CornerRadius = UDim.new(0, 6)
			t175.statusBtn.MouseButton1Click:Connect(function()
				if t175.running then
					return
				end

				local t189 = {}

				for k in pairs(t175.picked) do
					table.insert(t189, k)
				end

				if #t189 == 0 then
					t175.statusBtn.Text = "Pick an egg first"
					task.delay(1.5, function()
						if t175.statusBtn and not t175.running then
							t175.paintRows()
						end
					end)

					return
				end

				local __SenaV4EggRuntime = genv.__SenaV4EggRuntime

				if __SenaV4EggRuntime and type(__SenaV4EggRuntime.queueManual) == "function" then
					local v4044 = __SenaV4EggRuntime:queueManual(t189)

					t175.picked = {}
					t175.statusBtn.Text = "Queued " .. v4044
					task.delay(1.5, function()
						if t175.statusBtn and not t175.running then
							t175.paintRows()
						end
					end)
					t175.refresh()
				else
					t175.statusBtn.Text = "Runtime not ready"
					task.delay(1.5, function()
						if t175.statusBtn and not t175.running then
							t175.paintRows()
						end
					end)
				end
			end)
			t175.paintChips()
			t175.refresh()
		end

		local function v4045(p933)
			if not p933 or type(p933) ~= "string" then
				return "unknown"
			end

			local v4046 = p933:lower()

			if v4046:find("kong") or v4046:find("gorilla") then
				return "gorillaking"
			end

			if v4046:find("phoenix") then
				return "phoenix"
			end

			if v4046:find("lunar") or v4046:find("dragon.-lunar") then
				return "lunardragon"
			end

			if v4046:find("mosa") then
				return "mosasaurus"
			end

			if v4046:find("tiger") or v4046:find("oni") then
				return "onitiger"
			end

			if v4046:find("kitsune") then
				return "kitsune"
			end

			if v4046:find("unicorn") then
				return "unicorn"
			end

			if v4046:find("godzilla") then
				return "godzilla"
			end

			if v4046:find("pegasus") then
				return "pegasus"
			end

			if v4046:find("archangel") then
				return "archangel"
			end

			if v4046:find("ice.-dragon") then
				return "icedragon"
			end

			if v4046:find("lava.-dragon") or v4046:find("dragon") then
				return "lavadragon"
			end

			if v4046:find("cosmic.-dragon") or v4046:find("ember") then
				return "cosmicdragon"
			end

			if v4046:find("trex") or v4046:find("tyranno") or v4046:find("t%-rex") then
				return "trex"
			end

			if v4046:find("gargoyle") then
				return "gargoyle"
			end

			if v4046:find("cerberus") then
				return "cerberus"
			end

			if v4046:find("yeti") then
				return "yeti"
			end

			if v4046:find("dreadscale") then
				return "dreadscale"
			end

			if v4046:find("el.-maja") then
				return "elmaja"
			end

			return (v4046:gsub("eternal", ""):gsub("ascended", ""):gsub("vermilion", ""):gsub("divine", ""):gsub("secret", ""):gsub("egg", ""):gsub("[^%a%d]", ""))
		end
		local function v4047(p934)
			if not p934 or p934 <= 0 then
				return 0
			end

			return math.floor((p934 + 150) / 300) * 300
		end
		local function v4048(p935, p936)
			if not p935 or p935 <= 0 then
				return "--:--"
			end

			local now = os.time()
			local v4050 = os.date("*t", now)
			local v4051 = os.date("*t", p935)
			local s16

			if v4051.year == v4050.year and v4051.yday == v4050.yday then
				s16 = "Today"
			elseif v4051.year == v4050.year and v4051.yday == v4050.yday - 1 then
				s16 = "Yesterday"
			elseif v4051.year == v4050.year and v4051.yday == v4050.yday + 1 then
				s16 = "Tomorrow"
			else
				s16 = string.format("%02d/%02d", v4051.month, v4051.day)
			end

			if p936 then
				return string.format("%s %02d:%02d:%02d", s16, v4051.hour, v4051.min, v4051.sec)
			end

			return string.format("%s %02d:%02d", s16, v4051.hour, v4051.min)
		end
		local function v4053(p937)
			if not p937 or p937 <= 0 then
				return ""
			end

			local v4054 = os.time() - p937

			if v4054 < 0 then
				local v4055 = -v4054

				if v4055 < 60 then
					return "in <1m"
				end

				if v4055 < 3600 then
					return string.format("in %dm", math.floor(v4055 / 60))
				end

				return string.format("in %.1fh", v4055 / 3600)
			end

			if v4054 < 60 then
				return "Just now"
			end

			if v4054 < 3600 then
				return string.format("%dm ago", math.floor(v4054 / 60))
			end

			if v4054 < 86400 then
				return string.format("%.1fh ago", v4054 / 3600)
			end

			return string.format("%.1fd ago", v4054 / 86400)
		end
		local function v4056(p938, p939)
			local v4057 = v4047(p938)
			local v4058 = v4047(p939)
			local now = os.time()
			local v4060 = os.date("*t", now)
			local v4061 = os.date("*t", v4057)
			local v4062 = os.date("*t", v4058)

			local function v4063(p940)
				if p940.year == v4060.year and p940.yday == v4060.yday then
					return "Today"
				end

				if p940.year == v4060.year and p940.yday == v4060.yday + 1 then
					return "Tomorrow"
				end

				if p940.year == v4060.year and p940.yday == v4060.yday - 1 then
					return "Yesterday"
				end

				return string.format("%02d/%02d", p940.month, p940.day)
			end

			local v4064 = v4063(v4061)
			local v4065 = v4063(v4062)

			if v4064 == v4065 then
				return string.format("%s %02d:%02d - %02d:%02d", v4064, v4061.hour, v4061.min, v4062.hour, v4062.min)
			end

			return string.format("%s %02d:%02d - %s %02d:%02d", v4064, v4061.hour, v4061.min, v4065, v4062.hour, v4062.min)
		end

		local t190 = {
			Mosasaurus = "rbxassetid://124293259998827",
			["Oni Tiger"] = "rbxassetid://109908891899435",
			["Eternal Lunar Dragon"] = "rbxassetid://93762296316916",
			["Lunar Dragon"] = "rbxassetid://93762296316916",
			["King Kong"] = "rbxassetid://135650224014044",
			["Gorilla King"] = "rbxassetid://135650224014044",
			["Ice Dragon"] = "rbxassetid://101397684798718",
			Phoenix = "rbxassetid://118067990008425",
			["Ascended Vermilion Phoenix"] = "rbxassetid://118067990008425",
			Dragon = "rbxassetid://78935088838538",
			["Lava Dragon"] = "rbxassetid://78935088838538",
			["Dragon (Lava)"] = "rbxassetid://78935088838538",
			Pegasus = "rbxassetid://112830316982322",
			["El Maja"] = "rbxassetid://77518688092604",
			Kitsune = "rbxassetid://107842067813602",
			Unicorn = "rbxassetid://70463817382627",
			Godzilla = "rbxassetid://102979882140882",
			ArchAngel = "rbxassetid://113289118499426",
			["Cosmic Dragon"] = "rbxassetid://107923370723949",
			TRex = "rbxassetid://124293259998827",
			Gargoyle = "rbxassetid://137949993315884",
			["King Snake"] = "rbxassetid://77518688092604"
		}
		local t191 = {}

		local function v4068(p941)
			if not p941 then
				return ""
			end

			if t190[p941] then
				return t190[p941]
			end

			if t191[p941] ~= nil then
				return t191[p941]
			end

			t191[p941] = v3710(p941) or ""

			return t191[p941]
		end
		local function v4069(p942)
			local request_ = syn and syn.request or http and http.request or request or http_request

			if request_ then
				local u4071

				if pcall(function()
					u4071 = request_(p942)
				end) and u4071 then
					return u4071
				end
			end

			if p942.Method == "GET" and game and game.HttpGet then
				local response

				if pcall(function()
					response = game:HttpGet(p942.Url, true)
				end) and response then
					return {
						StatusCode = 200,
						Body = response
					}
				end
			end

			return nil
		end

		local t192 = {
			{
				id = "eternal_fast",
				title = "Eternal",
				cycleLabel = "45 - 90m",
				rarity = "Eternal",
				windowMin = 45,
				windowMax = 90,
				priority = 1,
				color = Color3.fromRGB(255, 215, 0),
				candidates = {
					{
						name = "Mosasaurus",
						area = "Prehistoric",
						chance = "10.85%",
						icon = "rbxassetid://124293259998827"
					},
					{
						name = "Oni Tiger",
						area = "Cherry Blossom",
						chance = "10.85%",
						icon = "rbxassetid://109908891899435"
					},
					{
						name = "Lunar Dragon",
						area = "Cosmic",
						chance = "10.85%",
						icon = "rbxassetid://93762296316916"
					},
					{
						name = "Gorilla King",
						area = "Titan Temple",
						chance = "10.85%",
						icon = "rbxassetid://135650224014044"
					},
					{
						name = "Ice Dragon",
						area = "Snow",
						chance = "10.85%",
						icon = "rbxassetid://101397684798718"
					},
					{
						name = "Phoenix",
						area = "Volcano",
						chance = "10.85%",
						icon = "rbxassetid://118067990008425"
					}
				}
			},
			{
				id = "divine_fast",
				title = "Divine",
				cycleLabel = "1.5 - 3h",
				rarity = "Divine",
				windowMinH = 1.5,
				windowMaxH = 3,
				priority = 2,
				color = Color3.fromRGB(255, 255, 255),
				candidates = {
					{
						name = "Kitsune",
						area = "Cherry Blossom",
						chance = "20%",
						icon = "rbxassetid://107842067813602"
					},
					{
						name = "ArchAngel",
						area = "Heaven",
						chance = "20%",
						icon = "rbxassetid://113289118499426"
					},
					{
						name = "Godzilla",
						area = "Prehistoric",
						chance = "20%",
						icon = "rbxassetid://102979882140882"
					},
					{
						name = "Pegasus",
						area = "Fantasy",
						chance = "20%",
						icon = "rbxassetid://112830316982322"
					},
					{
						name = "Unicorn",
						area = "Magical Forest",
						chance = "20%",
						icon = "rbxassetid://70463817382627"
					}
				}
			}
		}

		local function v4074(p943)
			if not p943 or not p943.name then
				return false
			end

			local now = tonumber(p943.ts) or os.time()

			p943.ts = now

			local v4076 = (p943.rarity or ""):lower()

			if v4076 ~= "eternal" and v4076 ~= "divine" then
				return false
			end

			local v4077 = v4045(p943.name)

			for _, v in ipairs(t176.history) do
				if v.uid and p943.uid and v.uid == p943.uid then
					return false
				end

				if v4045(v.name) ~= v4077 then
					continue
				end

				if not (math.abs((v.ts or 0) - now) < 600) then
					continue
				end

				return false
			end

			table.insert(t176.history, p943)
			table.sort(t176.history, function(p944, p945)
				return (p944.ts or 0) > (p945.ts or 0)
			end)

			if v4076 == "eternal" then
				if not t176.lastEternal then
					t176.lastEternal = p943
				elseif (t176.lastEternal.ts or 0) <= now then
					t176.lastEternal = p943

					return true
				end
			elseif v4076 == "divine" then
				if not t176.lastDivine then
					t176.lastDivine = p943
				elseif (t176.lastDivine.ts or 0) <= now then
					t176.lastDivine = p943

					return true
				end
			end

			return true
		end

		t176.getLatestSpawn = function(p946, p947)
			for _, v in ipairs(t176.history) do
				if p946 and (not v.rarity or v.rarity:lower() ~= p946:lower()) then
					continue
				end

				if not p947 or not (#p947 > 0) then
					return v
				end

				local v4082 = v4045(v.name)

				for _, v2 in ipairs(p947) do
					if v4045(v2.name) == v4082 then
						return v
					end
				end
			end

			return nil
		end

		for _, v in ipairs({
			{
				uid = "afad935fc39f4ad0a28d83d74dad60f8",
				name = "Ice Dragon",
				area = "Snow",
				rarity = "Eternal",
				ts = 1789738200,
				reporter = "Server Alert"
			},
			{
				uid = "aac1107e3c3a428c93ecc8d5c4c03296",
				name = "Mosasaurus",
				area = "Prehistoric",
				rarity = "Eternal",
				ts = 1789735200,
				reporter = "Server Alert"
			},
			{
				uid = "2f08670c03054614b5c088092e0eab9e",
				name = "Eternal Lunar Dragon",
				area = "Cosmic",
				rarity = "Eternal",
				ts = 1789733400,
				reporter = "Server Alert"
			},
			{
				uid = "d2c1c02c35224ca78eddeda7128643a6",
				name = "Skeleton Horse",
				area = "Light Dark",
				rarity = "Eternal",
				ts = 1789731600,
				reporter = "Server Alert"
			},
			{
				uid = "a9f84b4645bd4d23a2a8887923febe6e",
				name = "Gorilla King",
				area = "Titan Temple",
				rarity = "Eternal",
				ts = 1789729800,
				reporter = "Server Alert"
			},
			{
				uid = "seed_divine_1",
				name = "Kitsune",
				area = "Cherry Blossom",
				rarity = "Divine",
				ts = 1789678800,
				reporter = "Server Alert"
			}
		}) do
			v4074(v)
		end

		local function v4087(p948)
			if not p948 or type(p948) ~= "string" then
				return nil
			end

			if not p948:find("spawned in") then
				return nil
			end

			local v4088 = p948:gsub("<[^>]+>", ""):gsub("[%c]", "")
			local match, match2, v4091 = v4088:match("A%s+(%a+)%s+(.-)%s+Egg%s+spawned%s+in%s+([^!]+)")

			if not match or not match2 or not v4091 then
				match2, match, v4091 = v4088:match("([%w%s]+)%s*%((%a+)%)%s+has%s+spawned%s+in%s+([^!]+)")
			end

			if not match or not match2 or not v4091 then
				return nil
			end

			local v4092 = v4091:gsub("%s+$", ""):gsub("^%s+", "")
			local v4093 = match2:gsub("%s+$", ""):gsub("^%s+", "")

			return match:gsub("%s+$", ""):gsub("^%s+", ""), v4093, v4092
		end
		local function v4094(p949)
			local v4095, v4096, v4097 = v4087(p949)

			if not v4095 or not v4096 or not v4097 then
				return
			end

			local now = os.time()
			local v4099 = v4045(v4096)
			local v4100 = math.floor(now / 300)
			local v4101 = string.format("alert_%s_%s_%d", v4099, v4097:lower(), v4100)

			if t176.reportedUids[v4101] then
				return
			end

			t176.reportedUids[v4101] = now
			t176.lastAlert = {
				pet = v4096,
				area = v4097,
				rarity = v4095,
				ts = now,
				norm = v4099
			}

			if v4074({
				uid = v4101,
				name = v4096,
				area = v4097,
				rarity = v4095,
				ts = now,
				reporter = "Server Alert"
			}) then
				pcall(t176.paint)
			end
		end

		t176.reportSpawn = function(p950, p951, p952, p953, p954)
			if not p950 or t176.reportedUids[p950] then
				return
			end

			local now = os.time()
			local v4103 = tonumber(p954) or now

			if now - t176.lastReportTime < 3 then
				return
			end

			t176.reportedUids[p950] = v4103
			t176.lastReportTime = now

			local Name = LocalPlayer and LocalPlayer.Name or "Player"

			if v4074({
				uid = tostring(p950),
				name = p951,
				area = p952,
				rarity = p953,
				ts = v4103,
				reporter = Name
			}) then
				pcall(t176.paint)
			end
		end
		t176.syncBackend = function()
			local now = os.time()

			if now - t176.lastSync < 10 then
				return
			end

			t176.lastSync = now
			task.spawn(function()
				local SenaBackend = getgenv and getgenv().SenaBackend or {}
				local Api = SenaBackend.Api or "http://56.10.112.179:8080"
				local Key = SenaBackend.Key or ""
				local v4109 = LocalPlayer and tostring(LocalPlayer.UserId) or "0"
				local v4110 = v4069({
					Url = Api .. "/egg/latest?key=" .. tostring(Key) .. "&uid=" .. tostring(v4109) .. "&t=" .. tostring(now),
					Method = "GET"
				})

				if v4110 and (v4110.StatusCode == 200 or v4110.Status == 200) and v4110.Body then
					local HttpService2 = game:GetService("HttpService")
					local ok, result = pcall(function()
						return HttpService2:JSONDecode(v4110.Body)
					end)

					if ok and type(result) == "table" and result.ok then
						if result.last_eternal and type(result.last_eternal) == "table" and result.last_eternal.name then
							v4074(result.last_eternal)
						end

						if result.last_divine and type(result.last_divine) == "table" and result.last_divine.name then
							v4074(result.last_divine)
						end

						if type(result.recent_spawns) == "table" then
							for _, recentSpawn in ipairs(result.recent_spawns) do
								v4074(recentSpawn)
							end
						end

						pcall(t176.paint)
					end
				end
			end)
		end
		t176.scanField = function()
			local u4116

			pcall(function()
				u4116 = EggState2.ReadFieldEggs()
			end)

			if not u4116 or not u4116.Records then
				return
			end

			local now = os.time()

			if not t176._fieldInitialized then
				t176._fieldInitialized = true

				for _, record in ipairs(u4116.Records) do
					if record.Uid then
						t176.knownFieldUids[record.Uid] = true
					end
				end

				return
			end

			for _, record in ipairs(u4116.Records) do
				if record.Uid and not t176.knownFieldUids[record.Uid] then
					t176.knownFieldUids[record.Uid] = true

					if record.State ~= "Claimed" and record.BottomCFrame then
						local AssetCategory = record.AssetCategory
						local _, v4124 = v3707(AssetCategory)

						if v4124 == "Divine" or v4124 == "Eternal" then
							local v4125 = AssetCategory == "King Kong" and "Gorilla King" or AssetCategory == "Ascended Vermilion Phoenix" and "Phoenix" or AssetCategory
							local ts = now

							if t176.lastAlert then
								if now - (t176.lastAlert.ts or 0) <= 60 and v4045(t176.lastAlert.pet) == v4045(v4125) then
									if t176.lastAlert.area:lower() == (record.AreaId or ""):lower() then
										ts = t176.lastAlert.ts
									end
								end
							end

							t176.reportSpawn(record.Uid, v4125, record.AreaId or "Field", v4124, ts)
						end
					end
				end
			end
		end
		t176.paint = function()
			v3698()

			if not t176.list or not t176.list.Parent then
				return
			end

			for _, child in ipairs(t176.list:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end

			local now = os.time()
			local eternal = t176.getLatestSpawn("eternal")
			local divine = t176.getLatestSpawn("divine")
			local ts = eternal and eternal.ts or 1789738200
			local ts2 = divine and divine.ts or 1789678800

			if t176.catBtnTargets and t176.catBtnHistory then
				local v4134 = t176.category == "targets"

				t176.catBtnTargets.BackgroundColor3 = v4134 and v3697.accent or Color3.fromRGB(24, 26, 36)
				t176.catBtnTargets.TextColor3 = v4134 and Color3.fromRGB(255, 255, 255) or v3697.btnText

				local UIStroke = t176.catBtnTargets:FindFirstChildOfClass("UIStroke")

				if UIStroke then
					UIStroke.Color = v4134 and v3697.accent or v3697.strokeCol
				end

				t176.catBtnHistory.BackgroundColor3 = not v4134 and v3697.accent or Color3.fromRGB(24, 26, 36)
				t176.catBtnHistory.TextColor3 = not v4134 and Color3.fromRGB(255, 255, 255) or v3697.btnText

				local UIStroke2 = t176.catBtnHistory:FindFirstChildOfClass("UIStroke")

				if UIStroke2 then
					UIStroke2.Color = not v4134 and v3697.accent or v3697.strokeCol
				end
			end

			if t176.noticeBox then
				t176.noticeBox.Visible = t176.category == "targets"
			end

			if t176.summaryBox then
				t176.summaryBox.Visible = t176.category == "history"

				if t176.summaryText and t176.category == "history" then
					local v4137 = eternal
					local name = v4137 and v4137.name or "Phoenix"
					local area = v4137 and v4137.area or "Volcano"
					local ts3 = v4137 and v4137.ts or ts
					local v4141 = v4048(ts3, true)
					local v4142 = v4053(ts3)
					local v4143 = divine
					local name2 = v4143 and v4143.name or "Kitsune"
					local area2 = v4143 and v4143.area or "Cherry Blossom"
					local ts4 = v4143 and v4143.ts or ts2
					local v4147 = v4048(ts4, true)
					local v4148 = v4053(ts4)

					t176.summaryText.Text = string.format("<b>LAST ETERNAL:</b> <font color='#ffd700'><b>%s</b></font> (%s) - %s <font color='#8899aa'>(%s)</font>\n<b>LAST DIVINE:</b> <font color='#ffffff'><b>%s</b></font> (%s) - %s <font color='#8899aa'>(%s)</font>", name, area, v4141, v4142, name2, area2, v4147, v4148)
				end
			end

			if t176.refreshBtn then
				t176.refreshBtn.Text = t176.category == "targets" and "Refresh Targets" or "Refresh History"
			end

			if t176.category == "targets" then
				local n75 = 0

				for i, v in ipairs(t192) do
					if t176.filter == "All" or t176.filter == v.rarity then
						n75 += 1

						local divine2 = t176.getLatestSpawn(v.rarity, v.candidates) or eternal

						if v.rarity == "Divine" then
							divine2 = t176.getLatestSpawn("divine") or divine
						end

						local ts3 = divine2 and divine2.ts or v.rarity == "Divine" and ts2 or ts
						local v4154 = v.windowMinH and v.windowMinH * 3600

						if not v4154 then
							v4154 = (v.windowMin or 45) * 60
						end

						local v4155 = v.windowMaxH and v.windowMaxH * 3600

						if not v4155 then
							v4155 = (v.windowMax or 90) * 60
						end

						local v4156 = v4155 - v4154
						local v4157 = ts3 + v4154
						local v4158 = ts3 + v4155

						if v.rarity == "Eternal" and v4154 * 0.75 < now - v4158 then
							while v4154 * 0.75 < now - v4158 do
								v4157 = v4158 + v4154
								v4158 = v4157 + v4156
							end
						end

						local v4159 = v4047(v4157)
						local v4160 = v4047(v4158)
						local text = "UPCOMING"
						local color3 = Color3.fromRGB(100, 200, 255)

						if v4160 < now then
							local v4163 = math.ceil((now - v4160) / 60)

							text = v4163 >= 60 and string.format("OVERDUE +%.1fh", v4163 / 60) or string.format("OVERDUE +%dm", v4163)
							color3 = Color3.fromRGB(255, 0, 128)
						elseif v4159 <= now and now <= v4160 then
							text = "IN WINDOW"
							color3 = Color3.fromRGB(0, 255, 136)
						else
							local v4164 = math.ceil((v4159 - now) / 60)

							if v4164 > 0 and v4164 < 60 then
								text = string.format("IN %dm", v4164)
								color3 = Color3.fromRGB(80, 210, 255)
							elseif v4164 >= 60 then
								text = string.format("IN %.1fh", v4164 / 60)
								color3 = Color3.fromRGB(80, 210, 255)
							end
						end

						local Frame = Instance.new("Frame")

						Frame.Size = UDim2.new(1, -6, 0, 122)
						Frame.BackgroundColor3 = v3697.surface
						Frame.BackgroundTransparency = 0.15
						Frame.BorderSizePixel = 0
						Frame.LayoutOrder = i
						Frame.Parent = t176.list
						Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

						local UIStroke = Instance.new("UIStroke", Frame)

						UIStroke.Color = v.color or v3697.accent
						UIStroke.Thickness = 1
						UIStroke.Transparency = 0.78

						local Frame2 = Instance.new("Frame")

						Frame2.Size = UDim2.new(0, 4, 1, -12)
						Frame2.Position = UDim2.fromOffset(0, 6)
						Frame2.BorderSizePixel = 0
						Frame2.BackgroundColor3 = v.color or v3697.accent
						Frame2.Parent = Frame
						Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

						local TextLabel5 = Instance.new("TextLabel")

						TextLabel5.BackgroundTransparency = 1
						TextLabel5.Position = UDim2.fromOffset(12, 6)
						TextLabel5.Size = UDim2.new(0.5, 0, 0, 16)
						TextLabel5.Font = Enum.Font.GothamBold
						TextLabel5.TextSize = 13
						TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
						TextLabel5.TextColor3 = v.color or Color3.fromRGB(255, 255, 255)
						TextLabel5.Text = string.format("%s Window (%s)", v.title, v.cycleLabel)
						TextLabel5.Parent = Frame

						local TextLabel6 = Instance.new("TextLabel")

						TextLabel6.Position = UDim2.new(1, -12, 0, 6)
						TextLabel6.AnchorPoint = Vector2.new(1, 0)
						TextLabel6.Size = UDim2.fromOffset(math.max(76, #text * 7 + 14), 18)
						TextLabel6.BackgroundColor3 = color3
						TextLabel6.BackgroundTransparency = 0.2
						TextLabel6.Font = Enum.Font.GothamBold
						TextLabel6.TextSize = 10
						TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel6.Text = text
						TextLabel6.Parent = Frame
						Instance.new("UICorner", TextLabel6).CornerRadius = UDim.new(0, 4)

						local TextLabel7 = Instance.new("TextLabel")

						TextLabel7.BackgroundTransparency = 1
						TextLabel7.Position = UDim2.fromOffset(12, 24)
						TextLabel7.Size = UDim2.new(1, -24, 0, 14)
						TextLabel7.Font = Enum.Font.GothamMedium
						TextLabel7.TextSize = 10
						TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
						TextLabel7.TextColor3 = Color3.fromRGB(150, 180, 220)
						TextLabel7.Text = string.format("Window: %s", v4056(v4159, v4160))
						TextLabel7.Parent = Frame

						local ScrollingFrame = Instance.new("ScrollingFrame")

						ScrollingFrame.Position = UDim2.fromOffset(12, 42)
						ScrollingFrame.Size = UDim2.new(1, -24, 0, 72)
						ScrollingFrame.BackgroundTransparency = 1
						ScrollingFrame.BorderSizePixel = 0
						ScrollingFrame.ScrollBarThickness = 2
						ScrollingFrame.ScrollBarImageColor3 = v.color or v3697.accent
						ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
						ScrollingFrame.CanvasSize = UDim2.new(0, #v.candidates * 64 + 4, 0, 0)
						ScrollingFrame.Parent = Frame

						local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)

						UIListLayout.FillDirection = Enum.FillDirection.Horizontal
						UIListLayout.Padding = UDim.new(0, 6)

						for _, candidate in ipairs(v.candidates) do
							local Frame3 = Instance.new("Frame")

							Frame3.Size = UDim2.fromOffset(58, 68)
							Frame3.BackgroundColor3 = Color3.fromRGB(22, 26, 36)
							Frame3.BackgroundTransparency = 0.3
							Frame3.BorderSizePixel = 0
							Frame3.Parent = ScrollingFrame
							Instance.new("UICorner", Frame3).CornerRadius = UDim.new(0, 6)

							local UIStroke2 = Instance.new("UIStroke", Frame3)

							UIStroke2.Color = v.color or v3697.strokeCol
							UIStroke2.Thickness = 1
							UIStroke2.Transparency = 0.75

							local ImageLabel = Instance.new("ImageLabel")

							ImageLabel.Position = UDim2.fromOffset(15, 4)
							ImageLabel.Size = UDim2.fromOffset(28, 28)
							ImageLabel.BackgroundColor3 = Color3.fromRGB(30, 34, 46)
							ImageLabel.BackgroundTransparency = 0.4
							ImageLabel.BorderSizePixel = 0
							ImageLabel.ScaleType = Enum.ScaleType.Fit
							ImageLabel.Image = candidate.icon or v4068(candidate.name)
							ImageLabel.Parent = Frame3
							Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(0, 4)

							local TextLabel8 = Instance.new("TextLabel")

							TextLabel8.Position = UDim2.new(0, 1, 0, 34)
							TextLabel8.Size = UDim2.new(1, -2, 0, 12)
							TextLabel8.BackgroundTransparency = 1
							TextLabel8.Font = Enum.Font.GothamBold
							TextLabel8.TextSize = 8
							TextLabel8.TextTruncate = Enum.TextTruncate.AtEnd
							TextLabel8.TextColor3 = Color3.fromRGB(230, 235, 245)
							TextLabel8.TextXAlignment = Enum.TextXAlignment.Center
							TextLabel8.Text = candidate.name
							TextLabel8.Parent = Frame3

							local TextLabel9 = Instance.new("TextLabel")

							TextLabel9.Position = UDim2.new(0, 1, 0, 46)
							TextLabel9.Size = UDim2.new(1, -2, 0, 11)
							TextLabel9.BackgroundTransparency = 1
							TextLabel9.Font = Enum.Font.GothamMedium
							TextLabel9.TextSize = 7
							TextLabel9.TextTruncate = Enum.TextTruncate.AtEnd
							TextLabel9.TextColor3 = v3697.muted
							TextLabel9.TextXAlignment = Enum.TextXAlignment.Center
							TextLabel9.Text = candidate.area
							TextLabel9.Parent = Frame3

							local TextLabel10 = Instance.new("TextLabel")

							TextLabel10.Position = UDim2.new(0, 1, 0, 58)
							TextLabel10.Size = UDim2.new(1, -2, 0, 11)
							TextLabel10.BackgroundTransparency = 1
							TextLabel10.Font = Enum.Font.GothamBold
							TextLabel10.TextSize = 8
							TextLabel10.TextColor3 = Color3.fromRGB(255, 185, 0)
							TextLabel10.TextXAlignment = Enum.TextXAlignment.Center
							TextLabel10.Text = candidate.chance
							TextLabel10.Parent = Frame3
						end
					end
				end

				t176.list.CanvasSize = UDim2.new(0, 0, 0, n75 * 128 + 10)
			else
				local t193 = {}

				for _, v in ipairs(t176.history) do
					if t176.filter == "All" or t176.filter == v.rarity then
						local _, _, v4186 = v3707(v.name)

						table.insert(t193, {
							name = v.name,
							area = v.area,
							rarity = v.rarity,
							subText1 = string.format("[%s] - %s", (v.rarity or "Eternal"):upper(), v.area or "Field"),
							subText2 = string.format("Source: %s", v.reporter or "Server Alert"),
							rateText = v4048(v.ts, false),
							badge = v4053(v.ts),
							badgeColor = Color3.fromRGB(0, 255, 136),
							color = v4186 or v.rarity == "Divine" and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 215, 0),
							icon = v4068(v.name),
							order = 1e10 - (v.ts or 0)
						})
					end
				end

				for i, v in ipairs(t193) do
					local Frame = Instance.new("Frame")

					Frame.Size = UDim2.new(1, -6, 0, 54)
					Frame.BackgroundColor3 = v3697.surface
					Frame.BackgroundTransparency = 0.15
					Frame.BorderSizePixel = 0
					Frame.LayoutOrder = i
					Frame.Parent = t176.list
					Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

					local UIStroke = Instance.new("UIStroke", Frame)

					UIStroke.Color = v.color or v3697.accent
					UIStroke.Thickness = 1
					UIStroke.Transparency = 0.78

					local Frame2 = Instance.new("Frame")

					Frame2.Size = UDim2.new(0, 4, 1, -12)
					Frame2.Position = UDim2.fromOffset(0, 6)
					Frame2.BorderSizePixel = 0
					Frame2.BackgroundColor3 = v.color or v3697.accent
					Frame2.Parent = Frame
					Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

					local ImageLabel = Instance.new("ImageLabel")

					ImageLabel.Position = UDim2.fromOffset(10, 8)
					ImageLabel.Size = UDim2.fromOffset(38, 38)
					ImageLabel.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
					ImageLabel.BackgroundTransparency = 0.4
					ImageLabel.BorderSizePixel = 0
					ImageLabel.ScaleType = Enum.ScaleType.Fit
					ImageLabel.Image = v.icon or ""
					ImageLabel.Parent = Frame
					Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(0, 6)

					local TextLabel5 = Instance.new("TextLabel")

					TextLabel5.BackgroundTransparency = 1
					TextLabel5.Position = UDim2.fromOffset(56, 6)
					TextLabel5.Size = UDim2.new(1, -165, 0, 16)
					TextLabel5.Font = Enum.Font.GothamBold
					TextLabel5.TextSize = 12
					TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
					TextLabel5.TextTruncate = Enum.TextTruncate.AtEnd
					TextLabel5.TextColor3 = v3697.text
					TextLabel5.Text = v.name
					TextLabel5.Parent = Frame

					local TextLabel6 = Instance.new("TextLabel")

					TextLabel6.BackgroundTransparency = 1
					TextLabel6.Position = UDim2.fromOffset(56, 22)
					TextLabel6.Size = UDim2.new(1, -165, 0, 14)
					TextLabel6.Font = Enum.Font.GothamMedium
					TextLabel6.TextSize = 10
					TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
					TextLabel6.TextTruncate = Enum.TextTruncate.AtEnd
					TextLabel6.TextColor3 = v3697.muted
					TextLabel6.Text = v.subText1
					TextLabel6.Parent = Frame

					local TextLabel7 = Instance.new("TextLabel")

					TextLabel7.BackgroundTransparency = 1
					TextLabel7.Position = UDim2.fromOffset(56, 36)
					TextLabel7.Size = UDim2.new(1, -165, 0, 13)
					TextLabel7.Font = Enum.Font.GothamMedium
					TextLabel7.TextSize = 9
					TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
					TextLabel7.TextTruncate = Enum.TextTruncate.AtEnd
					TextLabel7.TextColor3 = Color3.fromRGB(150, 180, 220)
					TextLabel7.Text = v.subText2
					TextLabel7.Parent = Frame

					local Frame3 = Instance.new("Frame")

					Frame3.BackgroundTransparency = 1
					Frame3.AnchorPoint = Vector2.new(1, 0.5)
					Frame3.Position = UDim2.new(1, -8, 0.5, 0)
					Frame3.Size = UDim2.fromOffset(105, 38)
					Frame3.Parent = Frame

					local TextLabel8 = Instance.new("TextLabel")

					TextLabel8.BackgroundTransparency = 1
					TextLabel8.Size = UDim2.new(1, 0, 0, 18)
					TextLabel8.Font = Enum.Font.GothamBold
					TextLabel8.TextSize = 11
					TextLabel8.TextXAlignment = Enum.TextXAlignment.Right
					TextLabel8.TextTruncate = Enum.TextTruncate.AtEnd
					TextLabel8.TextColor3 = v.badgeColor
					TextLabel8.Text = string.format("[%s]", v.badge)
					TextLabel8.Parent = Frame3

					local TextLabel9 = Instance.new("TextLabel")

					TextLabel9.BackgroundTransparency = 1
					TextLabel9.Position = UDim2.new(0, 0, 0, 18)
					TextLabel9.Size = UDim2.new(1, 0, 0, 16)
					TextLabel9.Font = Enum.Font.GothamBold
					TextLabel9.TextSize = 10
					TextLabel9.TextXAlignment = Enum.TextXAlignment.Right
					TextLabel9.TextTruncate = Enum.TextTruncate.AtEnd
					TextLabel9.TextColor3 = Color3.fromRGB(170, 185, 210)
					TextLabel9.Text = v.rateText
					TextLabel9.Parent = Frame3
				end

				t176.list.CanvasSize = UDim2.new(0, 0, 0, #t193 * 58 + 10)
			end
		end
		t176.build = function(p955)
			local Frame = Instance.new("Frame")

			Frame.Size = UDim2.fromScale(1, 1)
			Frame.BackgroundTransparency = 1
			Frame.BorderSizePixel = 0
			Frame.Parent = p955
			t176.headLbl = Instance.new("TextLabel")
			t176.headLbl.BackgroundTransparency = 1
			t176.headLbl.Position = UDim2.fromOffset(14, 2)
			t176.headLbl.Size = UDim2.new(1, -28, 0, 18)
			t176.headLbl.Font = Enum.Font.GothamBold
			t176.headLbl.TextSize = 12
			t176.headLbl.TextXAlignment = Enum.TextXAlignment.Left
			t176.headLbl.TextTruncate = Enum.TextTruncate.AtEnd
			t176.headLbl.TextColor3 = v3697.accent
			t176.headLbl.Text = "Global Egg Data & History"
			t176.headLbl.Parent = Frame

			local Frame2 = Instance.new("Frame")

			Frame2.Position = UDim2.fromOffset(14, 22)
			Frame2.Size = UDim2.new(1, -28, 0, 32)
			Frame2.BackgroundTransparency = 1
			Frame2.Parent = Frame

			local UIListLayout = Instance.new("UIListLayout", Frame2)

			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.Padding = UDim.new(0, 8)

			local TextButton = Instance.new("TextButton")

			TextButton.Size = UDim2.new(0.5, -4, 1, 0)
			TextButton.BackgroundColor3 = v3697.accent
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.GothamBold
			TextButton.TextSize = 12
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.Text = "Egg Data (Targets)"
			TextButton.Parent = Frame2
			Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 6)

			local UIStroke = Instance.new("UIStroke", TextButton)

			UIStroke.Color = v3697.accent
			UIStroke.Thickness = 1
			t176.catBtnTargets = TextButton

			local TextButton2 = Instance.new("TextButton")

			TextButton2.Size = UDim2.new(0.5, -4, 1, 0)
			TextButton2.BackgroundColor3 = Color3.fromRGB(24, 26, 36)
			TextButton2.AutoButtonColor = false
			TextButton2.Font = Enum.Font.GothamBold
			TextButton2.TextSize = 12
			TextButton2.TextColor3 = v3697.btnText
			TextButton2.Text = "Egg History"
			TextButton2.Parent = Frame2
			Instance.new("UICorner", TextButton2).CornerRadius = UDim.new(0, 6)

			local UIStroke2 = Instance.new("UIStroke", TextButton2)

			UIStroke2.Color = v3697.strokeCol
			UIStroke2.Thickness = 1
			t176.catBtnHistory = TextButton2
			TextButton.MouseButton1Click:Connect(function()
				t176.category = "targets"
				t176.filter = "All"

				for k, chip in pairs(t176.chips) do
					local v4208 = k == "All"

					chip.BackgroundColor3 = v4208 and v3697.accent or Color3.fromRGB(255, 255, 255)
					chip.BackgroundTransparency = v4208 and 0.15 or 0.9
					chip.TextColor3 = v4208 and Color3.fromRGB(255, 255, 255) or v3697.btnText
				end

				t176.paint()
			end)
			TextButton2.MouseButton1Click:Connect(function()
				t176.category = "history"
				t176.filter = "All"

				for k, chip in pairs(t176.chips) do
					local v4211 = k == "All"

					chip.BackgroundColor3 = v4211 and v3697.accent or Color3.fromRGB(255, 255, 255)
					chip.BackgroundTransparency = v4211 and 0.15 or 0.9
					chip.TextColor3 = v4211 and Color3.fromRGB(255, 255, 255) or v3697.btnText
				end

				t176.paint()
			end)

			local Frame3 = Instance.new("Frame")

			Frame3.Position = UDim2.fromOffset(14, 58)
			Frame3.Size = UDim2.new(1, -28, 0, 44)
			Frame3.BackgroundColor3 = Color3.fromRGB(16, 20, 32)
			Frame3.BorderSizePixel = 0
			Frame3.Parent = Frame
			Instance.new("UICorner", Frame3).CornerRadius = UDim.new(0, 6)

			local UIStroke3 = Instance.new("UIStroke", Frame3)

			UIStroke3.Color = Color3.fromRGB(50, 80, 130)
			UIStroke3.Thickness = 1
			t176.noticeBox = Frame3

			local TextLabel5 = Instance.new("TextLabel")

			TextLabel5.Position = UDim2.new(0, 8, 0, 4)
			TextLabel5.Size = UDim2.new(1, -16, 1, -8)
			TextLabel5.BackgroundTransparency = 1
			TextLabel5.Font = Enum.Font.GothamMedium
			TextLabel5.TextSize = 10
			TextLabel5.TextColor3 = Color3.fromRGB(180, 205, 235)
			TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel5.TextWrapped = true
			TextLabel5.RichText = true
			TextLabel5.Text = "<b>Note:</b> These are estimated spawn targets based on cycle timing, not 100% guaranteed predictions."
			TextLabel5.Parent = Frame3
			t176.noticeText = TextLabel5

			local Frame4 = Instance.new("Frame")

			Frame4.Position = UDim2.fromOffset(14, 58)
			Frame4.Size = UDim2.new(1, -28, 0, 44)
			Frame4.BackgroundColor3 = Color3.fromRGB(22, 18, 28)
			Frame4.BorderSizePixel = 0
			Frame4.Visible = false
			Frame4.Parent = Frame
			Instance.new("UICorner", Frame4).CornerRadius = UDim.new(0, 6)

			local UIStroke4 = Instance.new("UIStroke", Frame4)

			UIStroke4.Color = Color3.fromRGB(130, 80, 40)
			UIStroke4.Thickness = 1
			t176.summaryBox = Frame4

			local TextLabel6 = Instance.new("TextLabel")

			TextLabel6.Position = UDim2.new(0, 8, 0, 4)
			TextLabel6.Size = UDim2.new(1, -16, 1, -8)
			TextLabel6.BackgroundTransparency = 1
			TextLabel6.Font = Enum.Font.GothamMedium
			TextLabel6.TextSize = 10
			TextLabel6.TextColor3 = Color3.fromRGB(240, 220, 200)
			TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel6.TextWrapped = true
			TextLabel6.RichText = true
			TextLabel6.Text = ""
			TextLabel6.Parent = Frame4
			t176.summaryText = TextLabel6

			local ScrollingFrame = Instance.new("ScrollingFrame")

			ScrollingFrame.Position = UDim2.fromOffset(14, 106)
			ScrollingFrame.Size = UDim2.new(1, -28, 0, 26)
			ScrollingFrame.BackgroundTransparency = 1
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.ScrollBarThickness = 2
			ScrollingFrame.ScrollBarImageColor3 = v3697.accent
			ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
			ScrollingFrame.CanvasSize = UDim2.new(0, 220, 0, 0)
			ScrollingFrame.Parent = Frame
			t176.chipBar = ScrollingFrame

			local UIListLayout2 = Instance.new("UIListLayout", ScrollingFrame)

			UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout2.Padding = UDim.new(0, 6)
			UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center
			t176.chips = {}

			for _, v in ipairs({
				"All",
				"Eternal",
				"Divine"
			}) do
				local TextButton3 = Instance.new("TextButton")

				TextButton3.Size = UDim2.fromOffset(60, 24)
				TextButton3.BackgroundColor3 = t176.filter == v and v3697.accent or Color3.fromRGB(255, 255, 255)
				TextButton3.BackgroundTransparency = t176.filter == v and 0.15 or 0.9
				TextButton3.AutoButtonColor = false
				TextButton3.Font = Enum.Font.GothamBold
				TextButton3.TextSize = 11
				TextButton3.TextColor3 = t176.filter == v and Color3.fromRGB(255, 255, 255) or v3697.btnText
				TextButton3.Text = v
				TextButton3.Parent = ScrollingFrame
				Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(1, 0)

				local UIStroke5 = Instance.new("UIStroke", TextButton3)

				UIStroke5.Color = v3697.accent
				UIStroke5.Thickness = 1
				UIStroke5.Transparency = 0.65
				TextButton3.MouseButton1Click:Connect(function()
					t176.filter = v

					for k, chip in pairs(t176.chips) do
						local v4226 = k == v

						chip.BackgroundColor3 = v4226 and v3697.accent or Color3.fromRGB(255, 255, 255)
						chip.BackgroundTransparency = v4226 and 0.15 or 0.9
						chip.TextColor3 = v4226 and Color3.fromRGB(255, 255, 255) or v3697.btnText
					end

					t176.paint()
				end)
				t176.chips[v] = TextButton3
			end

			local ScrollingFrame2 = Instance.new("ScrollingFrame")

			ScrollingFrame2.Position = UDim2.fromOffset(14, 136)
			ScrollingFrame2.Size = UDim2.new(1, -28, 1, -180)
			ScrollingFrame2.BackgroundTransparency = 1
			ScrollingFrame2.BorderSizePixel = 0
			ScrollingFrame2.ScrollBarThickness = 4
			ScrollingFrame2.ScrollBarImageColor3 = v3697.accent
			ScrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
			ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame2.Parent = Frame

			local UIListLayout3 = Instance.new("UIListLayout", ScrollingFrame2)

			UIListLayout3.Padding = UDim.new(0, 6)
			UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
			t176.list = ScrollingFrame2

			local Frame5 = Instance.new("Frame")

			Frame5.Position = UDim2.new(0, 14, 1, -40)
			Frame5.Size = UDim2.new(1, -28, 0, 32)
			Frame5.BackgroundTransparency = 1
			Frame5.Parent = Frame

			local TextButton3 = Instance.new("TextButton")

			TextButton3.Size = UDim2.new(0.48, -4, 1, 0)
			TextButton3.BackgroundColor3 = Color3.fromRGB(60, 70, 95)
			TextButton3.BackgroundTransparency = 0.15
			TextButton3.AutoButtonColor = false
			TextButton3.Font = Enum.Font.GothamBold
			TextButton3.TextSize = 11
			TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton3.Text = "Refresh Targets"
			TextButton3.Parent = Frame5
			Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(0, 6)
			TextButton3.MouseButton1Click:Connect(function()
				t176.scanField()
				t176.syncBackend()
				t176.paint()
			end)
			t176.refreshBtn = TextButton3

			local TextLabel7 = Instance.new("TextLabel")

			TextLabel7.AnchorPoint = Vector2.new(1, 0)
			TextLabel7.Position = UDim2.fromScale(1, 0)
			TextLabel7.Size = UDim2.new(0.5, -4, 1, 0)
			TextLabel7.BackgroundColor3 = Color3.fromRGB(20, 24, 34)
			TextLabel7.BackgroundTransparency = 0.2
			TextLabel7.Font = Enum.Font.GothamBold
			TextLabel7.TextSize = 11
			TextLabel7.TextColor3 = Color3.fromRGB(0, 255, 136)
			TextLabel7.Text = "Online Synced"
			TextLabel7.Parent = Frame5
			Instance.new("UICorner", TextLabel7).CornerRadius = UDim.new(0, 6)
			t176.statusLbl = TextLabel7

			if not t176.bound then
				t176.bound = true
				pcall(function()
					local ExperienceChat = game:GetService("CoreGui"):FindFirstChild("ExperienceChat")

					if ExperienceChat then
						for _, descendant in ipairs(ExperienceChat:GetDescendants()) do
							if descendant:IsA("TextLabel") then
								if descendant.Text:find("spawned in") then
									local v4235, v4236, v4237 = v4087(descendant.Text)

									if v4235 and v4236 and v4237 then
										local v4238 = string.format("init_%s_%s", v4045(v4236), v4237:lower())

										if not t176.reportedUids[v4238] then
											t176.reportedUids[v4238] = os.time()
											v4074({
												uid = v4238,
												name = v4236,
												area = v4237,
												rarity = v4235,
												ts = os.time() - 120,
												reporter = "Server Alert"
											})
										end
									end
								end
							end
						end

						ExperienceChat.DescendantAdded:Connect(function(descendant)
							if descendant:IsA("TextLabel") then
								if descendant.Text:find("spawned in") then
									task.wait(0.05)
									v4094(descendant.Text)
								end
							end
						end)
					end
				end)
				pcall(function()
					game:GetService("TextChatService").MessageReceived:Connect(function(p956)
						if p956 and p956.Text then
							if p956.Text:find("spawned in") then
								v4094(p956.Text)
							end
						end
					end)
				end)
			end

			t176.scanField()
			t176.syncBackend()
			t176.paint()
		end
		t176.refresh = function()
			t176.scanField()
			t176.syncBackend()
			t176.paint()
		end

		local t194 = {
			"logs",
			"eggs",
			"inventory",
			"checker",
			"eggdata"
		}
		local t195 = {
			logs = {
				name = "Egg Logs",
				w = 420,
				h = 500,
				build = function(p957)
					return v3797(p957)
				end
			},
			eggs = {
				name = "Egg Board",
				w = 420,
				h = 500,
				build = function(p958)
					return v3849(p958)
				end
			},
			inventory = {
				name = "Inventory & Base",
				w = 440,
				h = 510,
				build = function(p959)
					return v3935(p959)
				end
			},
			checker = {
				name = "Egg Checker",
				w = 420,
				h = 500,
				build = function(p960)
					return t175.build(p960)
				end
			},
			eggdata = {
				name = "Egg Data & History",
				w = 380,
				h = 570,
				build = function(p961)
					return t176.build(p961)
				end
			}
		}

		local function v4241(p962)
			v3698()

			local v4242 = t195[p962]

			if not v4242 then
				return
			end

			local name = "__SNE_Panel_" .. p962

			local function v4244()
				local ok, result = pcall(function()
					return LocalPlayer:FindFirstChild("PlayerGui")
				end)
				local v4247 = ok and result or nil

				return v4247
			end

			for _, v in ipairs({
				game:GetService("CoreGui"),
				v4244()
			}) do
				if v then
					pcall(function()
						for _, descendant in ipairs(v:GetDescendants()) do
							if descendant.Name == name and descendant:IsA("ScreenGui") then
								pcall(function()
									descendant:Destroy()
								end)
							end
						end
					end)
				end
			end

			local v4252 = v3699()
			local ScreenGui = Instance.new("ScreenGui")

			ScreenGui.Name = name
			ScreenGui.ResetOnSpawn = false
			ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			ScreenGui.DisplayOrder = 99999
			ScreenGui.Parent = v4252

			local n76 = 0

			for i, v in ipairs(t194) do
				if v == p962 then
					n76 = i - 1
				end
			end

			local Frame = Instance.new("Frame")

			Frame.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame.Size = UDim2.fromOffset(v4242.w, v4242.h)
			Frame.BackgroundTransparency = 1
			Frame.Active = true
			Frame.Parent = ScreenGui

			local UIScale = Instance.new("UIScale")

			UIScale.Name = "WindowScale"
			UIScale.Scale = 1
			UIScale.Parent = Frame

			local UserInputService = game:GetService("UserInputService")

			local function v4260(p963)
				local CurrentCamera = workspace.CurrentCamera
				local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1024, 768)

				if ViewportSize.X <= 0 or ViewportSize.Y <= 0 then
					return
				end

				local v4263 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled or ViewportSize.Y < 550
				local v4264 = math.min(1, ViewportSize.X * (v4263 and 0.86 or 0.94) / v4242.w, ViewportSize.Y * (v4263 and 0.88 or 0.92) / v4242.h)

				if v4263 and v4264 > 0.82 then
					v4264 = 0.82
				end

				UIScale.Scale = math.clamp(v4264, 0.48, 1)

				local Scale = UIScale.Scale
				local v4266 = v4242.w * Scale
				local v4267 = v4242.h * Scale

				if p963 then
					if v4263 then
						local v4268 = ViewportSize.X - math.floor(v4266 / 2) - 14
						local v4269 = math.floor(ViewportSize.Y / 2)

						Frame.Position = UDim2.fromOffset(v4268, v4269)
					else
						local v4270 = n76 * 20

						Frame.Position = UDim2.fromOffset(math.floor(ViewportSize.X / 2 + n76 * 24), math.floor(ViewportSize.Y / 2 + v4270))
					end
				end

				local v4271 = v4266 / 2
				local v4272 = v4267 / 2
				local v4273 = math.min(v4271 + 8, ViewportSize.X / 2)
				local v4274 = math.max(ViewportSize.X - v4271 - 8, ViewportSize.X / 2)
				local v4275 = math.min(v4272 + 8, ViewportSize.Y / 2)
				local v4276 = math.max(ViewportSize.Y - v4272 - 8, ViewportSize.Y / 2)
				local v4277 = Frame.Position.Y.Scale * ViewportSize.Y + Frame.Position.Y.Offset
				local floor = math.floor

				Frame.Position = UDim2.fromOffset(math.floor(math.clamp(Frame.Position.X.Scale * ViewportSize.X + Frame.Position.X.Offset, v4273, v4274)), floor(math.clamp(v4277, v4275, v4276)))
			end

			local ImageLabel = Instance.new("ImageLabel")

			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
			ImageLabel.Size = UDim2.new(1, 40, 1, 40)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Image = "rbxassetid://6015897843"
			ImageLabel.ImageColor3 = t166.shadow
			ImageLabel.ImageTransparency = 0.52
			ImageLabel.ScaleType = Enum.ScaleType.Slice
			ImageLabel.SliceCenter = Rect.new(49, 49, 450, 450)
			ImageLabel.ZIndex = 0
			ImageLabel.Parent = Frame

			local Frame2 = Instance.new("Frame")

			Frame2.Size = UDim2.fromScale(1, 1)
			Frame2.Position = UDim2.fromScale(0, 0)
			Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame2.BackgroundTransparency = 0
			Frame2.BorderSizePixel = 0
			Frame2.ZIndex = 1
			Frame2.Parent = Frame
			Instance.new("UICorner", Frame2).CornerRadius = UDim.new(0, 8)

			local UIGradient = Instance.new("UIGradient", Frame2)

			UIGradient.Rotation = 16
			UIGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, t166.obsTop),
				ColorSequenceKeypoint.new(0.52, t166.obsMid),
				ColorSequenceKeypoint.new(1, t166.obsLow)
			})

			local UIStroke = Instance.new("UIStroke", Frame2)

			UIStroke.Color = t166.strokeCol
			UIStroke.Thickness = 1
			UIStroke.Transparency = 0.72

			local TextLabel5 = Instance.new("TextLabel")

			TextLabel5.BackgroundTransparency = 1
			TextLabel5.Position = UDim2.fromOffset(42, 12)
			TextLabel5.Size = UDim2.fromOffset(200, 22)
			TextLabel5.Font = Enum.Font.GothamBold
			TextLabel5.TextSize = 16
			TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel5.TextColor3 = t166.text
			TextLabel5.Text = "Sena"
			TextLabel5.Parent = Frame2

			local ImageLabel2 = Instance.new("ImageLabel")

			ImageLabel2.AnchorPoint = Vector2.new(0, 0.5)
			ImageLabel2.Position = UDim2.fromOffset(11, 23)
			ImageLabel2.Size = UDim2.fromOffset(20, 20)
			ImageLabel2.BackgroundTransparency = 1
			ImageLabel2.Image = "rbxassetid://96240498384290"
			ImageLabel2.ScaleType = Enum.ScaleType.Fit
			ImageLabel2.Parent = Frame2

			local Frame3 = Instance.new("Frame")

			Frame3.Position = UDim2.fromOffset(14, 44)
			Frame3.Size = UDim2.fromOffset(math.max(90, #v4242.name * 8 + 26), 24)
			Frame3.BackgroundColor3 = t166.accent
			Frame3.BackgroundTransparency = 0.82
			Frame3.BorderSizePixel = 0
			Frame3.Parent = Frame2
			Instance.new("UICorner", Frame3).CornerRadius = UDim.new(0, 6)

			local UIStroke2 = Instance.new("UIStroke", Frame3)

			UIStroke2.Color = t166.accent
			UIStroke2.Thickness = 1
			UIStroke2.Transparency = 0.45

			local TextLabel6 = Instance.new("TextLabel")

			TextLabel6.BackgroundTransparency = 1
			TextLabel6.Size = UDim2.fromScale(1, 1)
			TextLabel6.Font = Enum.Font.GothamBold
			TextLabel6.TextSize = 12
			TextLabel6.TextColor3 = t166.text
			TextLabel6.Text = v4242.name
			TextLabel6.Parent = Frame3

			local TextButton = Instance.new("TextButton")

			TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton.Position = UDim2.new(0.5, 0, 1, -36)
			TextButton.Size = UDim2.fromOffset(176, 22)
			TextButton.BackgroundColor3 = t166.btnBg
			TextButton.BackgroundTransparency = 0.15
			TextButton.AutoButtonColor = false
			TextButton.Text = ""
			TextButton.Parent = Frame2
			Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 6)

			local UIStroke3 = Instance.new("UIStroke", TextButton)

			UIStroke3.Color = t166.strokeCol
			UIStroke3.Thickness = 1
			UIStroke3.Transparency = 0.6

			local ImageLabel3 = Instance.new("ImageLabel")

			ImageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel3.Position = UDim2.new(0, 12, 0.5, 0)
			ImageLabel3.Size = UDim2.fromOffset(12, 12)
			ImageLabel3.BackgroundTransparency = 1
			ImageLabel3.Image = "rbxassetid://94434236999817"
			ImageLabel3.ScaleType = Enum.ScaleType.Fit
			ImageLabel3.Parent = TextButton

			local TextLabel7 = Instance.new("TextLabel")

			TextLabel7.BackgroundTransparency = 1
			TextLabel7.Position = UDim2.fromOffset(24, 0)
			TextLabel7.Size = UDim2.new(1, -28, 1, 0)
			TextLabel7.Font = Enum.Font.GothamBold
			TextLabel7.TextSize = 12
			TextLabel7.TextXAlignment = Enum.TextXAlignment.Center
			TextLabel7.TextColor3 = t166.text
			TextLabel7.Text = "discord.gg/senahub"
			TextLabel7.Parent = TextButton
			TextButton.MouseButton1Click:Connect(function()
				pcall(function()
					setclipboard("https://discord.gg/senahub")
				end)
			end)

			local TextButton2 = Instance.new("TextButton")

			TextButton2.Position = UDim2.new(1, -36, 0, 8)
			TextButton2.Size = UDim2.fromOffset(26, 26)
			TextButton2.BackgroundColor3 = t166.btnBg
			TextButton2.BackgroundTransparency = 0.15
			TextButton2.AutoButtonColor = false
			TextButton2.Font = Enum.Font.GothamBold
			TextButton2.TextSize = 13
			TextButton2.TextColor3 = t166.btnText
			TextButton2.Text = "X"
			TextButton2.ZIndex = 5
			TextButton2.Parent = Frame2
			Instance.new("UICorner", TextButton2).CornerRadius = UDim.new(0, 4)

			local UIStroke4 = Instance.new("UIStroke", TextButton2)

			UIStroke4.Color = t166.strokeCol
			UIStroke4.Thickness = 1
			UIStroke4.Transparency = 0.6
			TextButton2.MouseButton1Click:Connect(function()
				v3698()
				ScreenGui.Enabled = false
			end)

			local Frame4 = Instance.new("Frame")

			Frame4.Position = UDim2.fromOffset(0, 72)
			Frame4.Size = UDim2.new(1, 0, 1, -120)
			Frame4.BackgroundTransparency = 1
			Frame4.BorderSizePixel = 0
			Frame4.Parent = Frame2

			local u4295 = false
			local Position
			local Position2

			local function v4298(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					u4295 = true
					Position = input.Position
					Position2 = Frame.Position
				end
			end

			TextLabel5.InputBegan:Connect(v4298)
			Frame3.InputBegan:Connect(v4298)
			Frame2.InputBegan:Connect(function(input)
				if input.Position.Y - Frame.AbsolutePosition.Y <= 44 * (UIScale and UIScale.Scale or 1) then
					v4298(input)
				end
			end)
			UserInputService.InputChanged:Connect(function(input)
				if u4295 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					local v4299 = input.Position - Position

					Frame.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset + v4299.X, Position2.Y.Scale, Position2.Y.Offset + v4299.Y)
				end
			end)
			UserInputService.InputEnded:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and u4295 then
					u4295 = false
					pcall(v4260, false)
				end
			end)
			v4260(true)

			local CurrentCamera = workspace.CurrentCamera

			if CurrentCamera then
				CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
					if ScreenGui and ScreenGui.Parent and ScreenGui.Enabled then
						pcall(v4260, false)
					end
				end)
			end

			windows[p962] = {
				gui = ScreenGui,
				page = Frame4,
				holder = Frame,
				fitScale = v4260
			}
			pcall(function()
				v4242.build(Frame4)
			end)
			pcall(function()
				v3771(p962)
			end)
		end
		local function v4301(p964)
			v3698()

			local v4302 = p964 or "logs"
			local v4303 = windows[v4302]

			if not v4303 or not v4303.gui or not v4303.gui.Parent then
				v4241(v4302)

				return
			end

			v4303.gui.Enabled = true

			if v4303.fitScale then
				pcall(v4303.fitScale, false)
			end

			pcall(function()
				v3771(v4302)
			end)
		end
		local function v4304()
			for _, v in ipairs(t194) do
				v4301(v)
			end
		end
		local function v4307()
			for _, window in pairs(windows) do
				if window and window.gui then
					window.gui.Enabled = false
				end
			end
		end

		task.spawn(function()
			while v16() do
				pcall(function()
					local v4310 = EggState2.ReadFieldEggs()

					if v4310 and v4310.Records then
						for _, record in ipairs(v4310.Records) do
							v3757(record)
						end
					end
				end)
				pcall(function()
					if t176 and type(t176.scanField) == "function" then
						t176.scanField()
					end
				end)

				for _, v in ipairs({
					"logs",
					"eggs",
					"inventory",
					"checker",
					"eggdata"
				}) do
					if v3764(v) then
						pcall(v3771, v)
					end
				end

				task.wait(2)
			end
		end)
		senaPanels.windows = windows
		senaPanels.openLogs = function()
			v4301("logs")
		end
		senaPanels.openBoard = function()
			v4301("eggs")
		end
		senaPanels.openInventory = function()
			v4301("inventory")
		end
		senaPanels.openChecker = function()
			v4301("checker")
		end
		senaPanels.openAnalyst = function()
			v4301("eggdata")
		end
		senaPanels.openAll = function()
			v4304()
		end
		senaPanels.closeAll = function()
			v4307()
		end
		pcall(function()
			getgenv().SenaPanels = senaPanels
		end)
	end

	v3692()

	local function v4315()
		pcall(function()
			local ChloeX_Instance = genv.ChloeX_Instance

			if type(ChloeX_Instance) == "table" and type(ChloeX_Instance.DestroyGui) == "function" then
				ChloeX_Instance:DestroyGui()
			end
		end)
		genv.ChloeX_Running = nil
		genv.ChloeX_ReopenPrompt = nil
		genv.ChloeX_Instance = nil

		local SenaLibOverride = genv.SenaLibOverride

		do
			if type(SenaLibOverride) ~= "table" then
				local ok, result = pcall(function()
					return loadstring(game:HttpGet("https://senahub.xyz/raw/libsenuy"))()
				end)

				SenaLibOverride = ok and type(result) == "table" and result or nil
			end
		end

		if not SenaLibOverride then
			warn("[Sena] UI library failed to load")

			return
		end

		local function v4320(p965)
			local t196 = {}
			local ipairs_ = ipairs
			local v4323 = type(p965) == "table" and p965 or {}

			for _, v in ipairs_(v4323) do
				if v ~= "None" and v ~= "" then
					t196[#t196 + 1] = v
				end
			end

			return t196
		end
		local function v4326()
			local t197 = {}

			pcall(function()
				for _, v in ipairs(v611.getRarities()) do
					t197[#t197 + 1] = v
				end
			end)

			if #t197 == 0 then
				t197 = {
					"Common",
					"Uncommon",
					"Rare",
					"Epic",
					"Legendary",
					"Mythic",
					"Cosmic",
					"Secret",
					"Eternal",
					"Divine"
				}
			end

			return t197
		end
		local function v4330(p966)
			local t198 = { "All" }

			for _, v in ipairs(p966) do
				if v ~= "All" then
					t198[#t198 + 1] = v
				end
			end

			return t198
		end

		local t199 = {}

		pcall(function()
			for _, v in ipairs(v611.getMutations()) do
				t199[#t199 + 1] = v
			end
		end)

		if #t199 == 0 then
			t199 = {
				"Golden",
				"Rainbow",
				"Shocked",
				"Frozen",
				"Burnt",
				"Boss"
			}
		end

		local t200 = { "None" }

		if not pcall(function()
			local Directory = require(game:GetService("ReplicatedStorage").Data.Areas).Directory
			local ok, result = pcall(function()
				return require(game:GetService("ReplicatedStorage").Data.Assets)
			end)

			if ok and result and result.Directory then
				local Directory2 = result.Directory
				local t201 = {}

				for _, v in pairs(Directory) do
					if type(v) == "table" and type(v.DropTable) == "table" then
						for _, v2 in ipairs(v.DropTable) do
							local v4347 = v2[1]

							if type(v4347) == "string" and not t201[v4347] then
								t201[v4347] = true

								local v4348 = Directory2[v4347]

								t200[#t200 + 1] = v4348 and v4348.DisplayName or v4347
							end
						end
					end
				end
			end
		end) or #t200 <= 1 then
			t200 = { "None" }
		end

		table.sort(t200, function(p967, p968)
			if p967 == "None" then
				return true
			end

			if p968 == "None" then
				return false
			end

			return p967 < p968
		end)

		local t202 = { "None" }

		do
			local t203 = {
				"Lake",
				"Jungle",
				"Desert",
				"Snow",
				"Volcano",
				"Abyss Ocean",
				"Prehistoric",
				"Cosmic",
				"Cherry Blossom",
				"Titan Temple"
			}
			local t204 = {}

			if not pcall(function()
				for k, v in pairs(require(game:GetService("ReplicatedStorage").Data.Areas).Directory) do
					if type(v) == "table" and type(v.DropTable) == "table" then
						t204[k] = true
					end
				end
			end) or next(t204) == nil then
				for _, v in ipairs(t203) do
					t204[v] = true
				end
			end

			local t205 = {
				None = true,
				Forest = true,
				["Titan Temple"] = true
			}

			for _, v in ipairs(t203) do
				if v ~= "Titan Temple" and t204[v] then
					table.insert(t202, v)
					t205[v] = true
				end
			end

			local t206 = {}

			for k in pairs(t204) do
				if not t205[k] then
					table.insert(t206, k)
				end
			end

			table.sort(t206)

			for _, v in ipairs(t206) do
				table.insert(t202, v)
			end

			if t204["Titan Temple"] then
				table.insert(t202, "Titan Temple")
			end
		end

		t24.AutoPlaceLoop = function()
			if senaV4Config.IsAutoPlaceWorkerRunning then
				return
			end

			senaV4Config.IsAutoPlaceWorkerRunning = true

			while senaV4Config.AutoPlace and v16() do
				task.wait(1.5)

				local ok, result = pcall(function()
					if senaV4Config.IsStealing then
						return
					end

					local ReplicatedStorage2 = game:GetService("ReplicatedStorage")

					game:GetService("HttpService")

					local EggState2 = require(ReplicatedStorage2.Client.EggState)
					local Assets = require(ReplicatedStorage2.Data.Assets)
					local v4368
					local Plots = workspace:FindFirstChild("Plots")

					if Plots then
						local v4370, v4371, v4372 = ipairs(Plots:GetChildren())
						local v4373 = geniter(v4370, v4371, v4372)

						while true do
							local v4374 = table.pack(v4373())

							if not v4374[1] then
								break
							end

							local v4375 = v4374[3]
							local PlotSign = v4375:FindFirstChild("PlotSign")

							if PlotSign then
								local PlayerPlotSign = PlotSign:FindFirstChild("PlayerPlotSign")

								if PlayerPlotSign and PlayerPlotSign:FindFirstChild("Frame") then
									if PlayerPlotSign.Frame:FindFirstChild("PlayerName") then
										local v4378 = string.gsub(PlayerPlotSign.Frame.PlayerName.Text, "<[^>]+>", "")

										if string.find(string.lower(v4378), string.lower(LocalPlayer.Name)) or string.find(string.lower(v4378), string.lower(LocalPlayer.DisplayName)) then
											v4368 = v4375

											break
										end
									end
								end
							end
						end
					end

					if not v4368 then
						return
					end

					local ToUpdate = v4368:FindFirstChild("ToUpdate")
					local PetArea = ToUpdate and ToUpdate:FindFirstChild("PetArea")
					local CenterPoint = v4368:FindFirstChild("CenterPoint") or PetArea

					if not PetArea then
						return
					end

					local t207 = {}
					local v4383 = EggState2.GetOwnerRuntimeRecords(LocalPlayer.UserId)
					local n77 = 0

					if type(v4383) == "table" then
						local v4385, v4386, v4387 = pairs(v4383)

						for k, v in v4385, v4386, v4387 do
							if v.Placement == nil then
								local AssetCategory = v.AssetCategory
								local v4391 = AssetCategory and Assets.Directory[AssetCategory]
								local s17 = "Unknown"

								if v4391 and v4391.Rarity then
									local Rarity = v4391.Rarity

									s17 = Rarity.DisplayName or Rarity._id or Rarity.Name or "Unknown"
								end

								local v4394

								if #senaV4Config.PlaceRarities == 0 or table.find(senaV4Config.PlaceRarities, "None") or table.find(senaV4Config.PlaceRarities, "All") then
									v4394 = true
								else
									v4394 = table.find(senaV4Config.PlaceRarities, s17) ~= nil
								end

								local v4395 = tonumber(v.Kg) or tonumber(v.Weight) or tonumber(v.kg)

								if not v4395 and v4391 then
									v4395 = tonumber(v4391.Kg) or tonumber(v4391.Weight) or tonumber(v4391.kg)
								end

								local v4396 = v4395 or 0

								if v4394 then
									table.insert(t207, {
										Uid = k,
										Rarity = s17,
										Kg = v4396
									})
								end
							else
								n77 += 1
							end
						end
					end

					table.sort(t207, function(p969, p970)
						return p969.Kg > p970.Kg
					end)

					local Character = LocalPlayer.Character

					if Character then
						Character:FindFirstChild("HumanoidRootPart")
					end

					if Character then
						Character:FindFirstChildOfClass("Humanoid")
					end

					local CFrame_2

					if #t207 == 0 or n77 >= 30 then
						return
					end

					local function v4399()
						local __SenaV4StealWantsCharacter = genv.__SenaV4StealWantsCharacter

						if __SenaV4StealWantsCharacter and __SenaV4StealWantsCharacter() then
							return true
						end

						local __SenaV4DronesWantCharacter = genv.__SenaV4DronesWantCharacter

						return __SenaV4DronesWantCharacter ~= nil and __SenaV4DronesWantCharacter() == true
					end

					if senaV4Config.IsStealing or v4399() then
						return
					end

					senaV4Config.IsPlacing = true

					local __SenaV4TreadmillManager = genv.__SenaV4TreadmillManager

					if __SenaV4TreadmillManager and __SenaV4TreadmillManager.activeTreadmill ~= nil then
						local v4403 = os.clock() + 5

						while __SenaV4TreadmillManager.activeTreadmill ~= nil and os.clock() < v4403 do
							pcall(function()
								__SenaV4TreadmillManager:_requestUnequip()
							end)
							task.wait(0.3)
						end
					end

					local Character2 = LocalPlayer.Character
					local HumanoidRootPart = Character2 and Character2:FindFirstChild("HumanoidRootPart")
					local Humanoid = Character2 and Character2:FindFirstChildOfClass("Humanoid")

					if HumanoidRootPart and HumanoidRootPart.Anchored then
						pcall(function()
							HumanoidRootPart.Anchored = false
						end)
					end

					if Humanoid then
						pcall(function()
							Humanoid:UnequipTools()
						end)
					end

					if HumanoidRootPart then
						CFrame_2 = HumanoidRootPart.CFrame
					end

					local function v4407()
						return not senaV4Config.AutoPlace or senaV4Config.IsStealing or v4399()
					end

					if HumanoidRootPart then
						local v4408 = PetArea.CFrame * cFrameNew(0, 3, 0)

						if not v588(HumanoidRootPart.Position + Vector3.new(0, 2, 0), v4408.Position + Vector3.new(0, 2, 0), Character2) then
							v232(HumanoidRootPart, Humanoid, cFrameNew(518.66, 70.57, -364.73) * Angles(3.1415926535897931, -1.5676547341413067, 3.1415926535897931), v4407)

							if v4407() then
								return
							end
						end

						v232(HumanoidRootPart, Humanoid, v4408, v4407)

						if v4407() then
							return
						end

						local n78 = 0

						while n78 < 0.5 and not v4407() do
							task.wait(0.05)
							n78 += 0.05
						end

						if v4407() then
							return
						end
					end

					local v4410 = false
					local t208 = {}
					local v4412, v4413, v4414 = pairs(v4383)

					for _, v in v4412, v4413, v4414 do
						if v.Placement then
							local Position

							if typeof(v.Placement) == "CFrame" then
								Position = v.Placement.Position
							elseif typeof(v.Placement) == "Vector3" then
								Position = v.Placement
							else
								Position = v.Placement.Position or Position
							end

							if Position then
								table.insert(t208, Position)
							end
						end
					end

					local n79 = 0
					local v4419, v4420, v4421 = ipairs(t207)

					for _, v in v4419, v4420, v4421 do
						if not senaV4Config.AutoPlace or v4410 then
							break
						end

						if n77 >= 30 then
							break
						end

						if v4407() then
							return
						end

						local Uid = v.Uid
						local v4425 = EggState2.GetOwnerRuntimeRecords(LocalPlayer.UserId)[Uid]
						local v4426 = EggState2.RequestEquipTool(Uid)

						if not v4426 then
							continue
						end

						if v4407() then
							return
						end

						task.wait(0.15)

						local v4428 = false

						while n79 < 30 and not v4428 do
							local v4429

							if CenterPoint then
								while n79 < 30 do
									local v4430 = PetArea.Size.X - 6
									local v4431 = v4430 / 10
									local v4432 = CenterPoint.CFrame:PointToObjectSpace(PetArea.CFrame * Vector3.new(-(v4430 / 2) + v4431 / 2 + n79 % 10 * v4431, 0, -((PetArea.Size.Z - 6) / 2) + 3 + math.floor(n79 / 10) * 6))
									local cFrame = cFrameNew(v4432.X, -0.5, v4432.Z)
									local v4434 = false

									for _, v2 in ipairs(t208) do
										if (v2 - cFrame.Position).Magnitude < 1 then
											v4434 = true

											break
										end
									end

									if not v4434 then
										v4429 = cFrame

										break
									end

									n79 += 1
								end
							end

							if not v4429 then
								v4410 = true

								break
							end

							if v4407() then
								return
							end

							local v4437, v4438 = EggState2.RequestPlaceEgg(Uid, v4429)

							if v4437 then
								table.insert(t208, v4429.Position)
								n77 += 1
								v4428 = true
								task.wait(0.15)

								continue
							end

							local v4439 = v4438 and string.lower(tostring(v4438)) or ""

							if not string.find(v4439, "full") and not string.find(v4439, "limit") and not string.find(v4439, "capacity") and not string.find(v4439, "maximum") then
								table.insert(t208, v4429.Position)
								n79 += 1
								task.wait(0.1)

								continue
							end

							if senaV4Config.AutoPlace then
								senaV4Config.AutoPlace = false
							end

							v4410 = true

							break
						end
					end

					if CFrame_2 and HumanoidRootPart and not v4407() then
						if not v588(HumanoidRootPart.Position + Vector3.new(0, 2, 0), CFrame_2.Position + Vector3.new(0, 2, 0), Character2) then
							v232(HumanoidRootPart, Humanoid, cFrameNew(518.66, 70.57, -364.73) * Angles(3.1415926535897931, -1.5676547341413067, 3.1415926535897931), v4407)
						end

						if v4407() then
							return
						end

						v232(HumanoidRootPart, Humanoid, CFrame_2, v4407)
						task.wait(0.2)
					end
				end)

				senaV4Config.IsPlacing = false

				if not ok then
					warn("Auto Place Error: " .. tostring(result))
				end
			end

			senaV4Config.IsAutoPlaceWorkerRunning = false
		end

		do
			t24.AutoHatchLoop = function()
				if senaV4Config.IsAutoHatchWorkerRunning then
					return
				end

				senaV4Config.IsAutoHatchWorkerRunning = true
				task.spawn(function()
					local t209 = {}

					while senaV4Config.AutoHatch and v16() do
						task.wait(1.5)
						pcall(function()
							local EggState2 = require(game:GetService("ReplicatedStorage").Client.EggState)
							local v4442 = EggState2.GetOwnerRuntimeRecords(LocalPlayer.UserId)

							if not v4442 then
								return
							end

							local t210 = {}

							for k, v in pairs(v4442) do
								if v.Placement ~= nil then
									table.insert(t210, k)
								end
							end

							local now = os.time()

							for _, v in ipairs(t210) do
								if not senaV4Config.AutoHatch then
									break
								end

								if not t209[v] or not (now < t209[v]) then
									local v4449 = v4442[v]
									local v4450 = false

									if type(EggState2.IsReadyToHatch) == "function" then
										local ok, result = pcall(EggState2.IsReadyToHatch, v)

										v4450 = ok and result == true
									end

									if v4450 or v4449.Ready == true or not t209[v] then
										if EggState2.RequestHatchEgg(v) then
											EggState2.RequestCompleteHatchEgg(v)
											t209[v] = nil
											task.wait(0.1)
										else
											t209[v] = now + 10
										end
									end
								end
							end
						end)
					end

					senaV4Config.IsAutoHatchWorkerRunning = false
				end)
			end
		end

		do
			local u4453 = false

			t24.mutationSweep = function()
				local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
				local EggState2 = require(ReplicatedStorage2.Client.EggState)
				local Remotes = require(ReplicatedStorage2.Shared.Remotes)
				local Directory

				pcall(function()
					local Assets = require(ReplicatedStorage2.Data.Assets)

					Directory = Assets.Directory or Assets
				end)

				local function v4459(p971)
					local Category = p971.Category or p971.AssetCategory
					local v4461 = Directory and Category and Directory[Category]

					return v4461 and v4461.DisplayName or Category
				end
				local function v4462(p972)
					local Category = p972.Category or p972.AssetCategory
					local v4464 = Directory and Category and Directory[Category]
					local Rarity = v4464 and v4464.Rarity

					return Rarity and (Rarity.DisplayName or Rarity._id) or nil
				end
				local function v4466()
					if senaV4Config.IsStealing == true or senaV4Config.IsPlacing == true then
						return true
					end

					local __SenaV4StealWantsCharacter = genv.__SenaV4StealWantsCharacter

					if __SenaV4StealWantsCharacter and __SenaV4StealWantsCharacter() then
						return true
					end

					local __SenaV4DronesWantCharacter = genv.__SenaV4DronesWantCharacter

					if __SenaV4DronesWantCharacter ~= nil and __SenaV4DronesWantCharacter() == true then
						return true
					end

					return false
				end

				local v4469 = senaV4Config.MutationChoice == "Fractured" and "Boss" or "Scrambled"

				local function v4470()
					for _, v in ipairs({
						LocalPlayer.Character,
						LocalPlayer:FindFirstChildOfClass("Backpack")
					}) do
						if not v then
							continue
						end

						for _, child in ipairs(v:GetChildren()) do
							if child:IsA("Tool") and child:GetAttribute("ItemType") == "MutationConsumable" and child:GetAttribute("MutationId") == v4469 then
								return child
							end
						end
					end

					return nil
				end
				local function v4475(p973)
					local Mutations = p973 and p973.Mutations

					if Mutations == nil then
						return false
					end

					if type(Mutations) ~= "table" then
						return tostring(Mutations):find(v4469) ~= nil
					end

					for _, Mutation in ipairs(Mutations) do
						if Mutation == v4469 then
							return true
						end
					end

					for k, Mutation in pairs(Mutations) do
						if k == v4469 or Mutation == v4469 then
							return true
						end
					end

					return false
				end

				if v4466() then
					return
				end

				local v4481 = v4470()

				if not v4481 then
					if not u4453 then
						warn("[AutoMutation] " .. tostring(senaV4Config.MutationChoice or "Scrambled") .. " consumable habis / gak ada di inventory - ronde di-skip.")
						u4453 = true
					end

					return
				end

				u4453 = false

				local Character = LocalPlayer.Character
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

				if not Humanoid then
					return
				end

				if not Character:FindFirstChild(v4481.Name) then
					pcall(function()
						Humanoid:EquipTool(v4481)
					end)
					task.wait(0.15)
				end

				local v4484 = EggState2.GetOwnerRuntimeRecords(LocalPlayer.UserId)

				if type(v4484) ~= "table" then
					return
				end

				local MutationSpecies = senaV4Config.MutationSpecies
				local v4486 = type(MutationSpecies) == "table" and #MutationSpecies > 0
				local MutationRarities = senaV4Config.MutationRarities
				local v4488 = type(MutationRarities) == "table" and #MutationRarities > 0

				for k, v in pairs(v4484) do
					if not v4466() then
						if type(v) ~= "table" or v.Placement == nil or v4475(v) then
							continue
						end

						local Category = v.Category or v.AssetCategory
						local v4492 = v4459(v)
						local v4493 = true

						if v4486 then
							v4493 = false

							local v4494, v4495, v4496 = ipairs(MutationSpecies)
							local v4497 = geniter(v4494, v4495, v4496)

							while true do
								local v4498 = table.pack(v4497())

								if v4498[1] then
									local v4499 = v4498[3]

									if v4499 == v4492 or v4499 == Category then
										v4493 = true

										break
									end
								else
									break
								end
							end
						end

						if v4493 and v4488 then
							local v4500 = v4462(v)

							v4493 = false

							local v4501, v4502, v4503 = ipairs(MutationRarities)
							local v4504 = geniter(v4501, v4502, v4503)

							while true do
								local v4505 = table.pack(v4504())

								if v4505[1] then
									if v4505[3] == v4500 then
										v4493 = true

										break
									end
								else
									break
								end
							end
						end

						if not v4493 then
							continue
						end

						local v4506 = v4470()

						if v4506 then
							if not Character:FindFirstChild(v4506.Name) then
								pcall(function()
									Humanoid:EquipTool(v4506)
								end)
								task.wait(0.1)
							end

							local n80 = 0
							local v4508 = false

							while not v4466() and v4470() ~= nil do
								local ok, result = pcall(function()
									return Remotes.BossMastery.AskUseMutationConsumable:InvokeServer(k)
								end)

								n80 += 1

								if ok and type(result) == "table" then
									if result.Mutated == true then
										v4508 = true
									end

									if result.Success == true then
										task.wait(0.25)

										if not v4508 and senaV4Config.MutationRetry and not (n80 >= 40) then
											continue
										end
									end
								end

								break
							end

							continue
						end
					end

					break
				end
			end
		end

		do
			t24.AutoMutationLoop = function()
				if senaV4Config.IsAutoMutationWorkerRunning then
					return
				end

				senaV4Config.IsAutoMutationWorkerRunning = true
				task.spawn(function()
					while senaV4Config.AutoMutation and v16() do
						task.wait(1)
						pcall(t24.mutationSweep)
					end

					senaV4Config.IsAutoMutationWorkerRunning = false
				end)
			end
		end

		do
			t24.RingEventLoop = function()
				if not senaV4Config.IsRingEventRunning then
					senaV4Config.IsRingEventRunning = true
					task.spawn(function()
						local cFrame = cFrameNew(544.76, 71.5, -416.48)
						local cFrame2 = cFrameNew(602, 70.78, -372)
						local cFrame3 = cFrameNew(5573, 70.77, -363)

						local function v4514()
							return not senaV4Config.AutoRingEvent or not v16()
						end
						local function v4515(p974)
							if v4514() then
								return false
							end

							local Character = LocalPlayer.Character
							local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
							local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

							if not HumanoidRootPart or not Humanoid then
								task.wait(0.3)

								return not v4514()
							end

							v232(HumanoidRootPart, Humanoid, p974, v4514, false, nil, true)

							return not v4514()
						end

						while true do
							if not v4514() and v4515(cFrame) then
								if not v4515(cFrame2) then
									break
								elseif v4515(cFrame3) and v4515(cFrame2) then
									continue
								end

								break
							end

							break
						end

						senaV4Config.IsRingEventRunning = false
					end)

					return
				end
			end
		end

		local v4519
		local v4520
		local v4521
		local v4522, v4523, v4524, v4525, v4526, v4527, v4528, v4529, v4530, v4531
		local v4532, v4533, v4534, v4535, v4536, v4537, v4538, v4539, v4540, v4541
		local v4542, v4543, v4544, v4545, v4546, v4547, v4548, v4549, v4550, v4551
		local v4552, v4553, v4554, v4555, v4556, v4557, v4558, v4559, v4560, v4561
		local v4562, runOnce, v4564, v4565, v4566, v4567, v4568, v4569, v4570, v4571
		local v4572, v4573, v4574, v4575, v4576, v4577

		do
			local AssetEarnings

			local function v4579(p975)
				if AssetEarnings == nil then
					pcall(function()
						AssetEarnings = require(game:GetService("ReplicatedStorage").Shared.Util.AssetEarnings)
					end)
				end

				if not AssetEarnings then
					return 0
				end

				for _, v in ipairs({
					AssetEarnings.LiveRatePerSecond,
					AssetEarnings.RatePerSecond,
					AssetEarnings.CatalogRatePerSecond
				}) do
					if type(v) == "function" then
						local ok, result = pcall(v, p975)

						if not ok or not (type(result) == "number" and result > 0) then
							continue
						end

						return result
					end
				end

				return 0
			end
			local function v4584(p976)
				local v4585 = string.lower(tostring(p976 or "")):gsub("[%s,]", "")

				if v4585 == "" then
					return 0
				end

				local v4586, v4587 = string.match(v4585, "^([%d]+%.?[%d]*)([kmb]?)$")
				local v4588 = tonumber(v4586)

				if not v4588 then
					return 0
				end

				local n81 = 1

				if v4587 == "k" then
					n81 = 1000
				elseif v4587 == "m" then
					n81 = 1000000
				elseif v4587 == "b" then
					n81 = 1e9
				end

				return v4588 * n81
			end

			local u4590 = false

			t24.startAutoSellLoop = function()
				if u4590 then
					return
				end

				u4590 = true
				task.spawn(function()
					local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
					local Assets = require(ReplicatedStorage2.Data.Assets)
					local Save = require(ReplicatedStorage2.Shared.Save)
					local AssetRoster = require(ReplicatedStorage2.Client.AssetRoster)
					local Remotes = require(ReplicatedStorage2.Shared.Remotes)
					local LocalPlayer2 = game:GetService("Players").LocalPlayer

					local function v4597()
						local ok, result = pcall(function()
							return AssetRoster.ReadOwnerPen(LocalPlayer2.UserId)
						end)

						if not ok or type(result) ~= "table" then
							return nil
						end

						local t211 = {}

						for k, v in pairs(result) do
							if type(k) == "string" then
								t211[k] = true
							end

							if type(v) == "table" and v.UID then
								t211[v.UID] = true
							end
						end

						return t211
					end
					local function v4603(p977, p978)
						if not senaV4Config.AutoSell then
							return false, "toggle Auto Sell Pet udah OFF", "global"
						end

						if not v198() then
							return false, "Auto Steal lagi megang kendali", "global"
						end

						local v4604 = v205(v4519)
						local v4605 = v205(v4520)

						if not v4604 or not v4605 then
							return false, "filter dropdown gak bisa dibaca", "global"
						end

						if type(p978) ~= "table" then
							return false, "status pet dipajang gak bisa diverifikasi", "global"
						end

						if p978[p977.uid] then
							return false, "pet ini dipajang di plot", "pet"
						end

						if not v211(p977.petName, p977.rarity, v4604, v4605) then
							return false, "pet ini udah gak match filter yang sekarang", "pet"
						end

						local v4606 = (Save.Peek or Save.Get)()
						local Inventory = v4606 and v4606.Inventory and v4606.Inventory[p977.uid]

						if Inventory == nil then
							return false, "pet ini udah gak ada di inventory", "pet"
						end

						local SellPetMaxRate = senaV4Config.SellPetMaxRate or 0

						if SellPetMaxRate > 0 then
							if SellPetMaxRate < v4579({
								Category = Inventory.Category or Inventory.AssetCategory,
								Scale = Inventory.Scale or Inventory.AssetScale or 1,
								Mutations = Inventory.Mutations or {}
							}) then
								return false, "money/s pet ini di atas batas value", "pet"
							end
						end

						if Inventory.IsFavorite == true then
							return false, "pet ini di-favorite", "pet"
						end

						if Inventory.InFuse == true then
							return false, "pet ini sedang di-fuse", "pet"
						end

						if table.find(v4606.EquippedAssets or {}, p977.uid) == nil then
							return true
						end

						return false, "pet ini sedang dipasang", "pet"
					end

					while senaV4Config.AutoSell and v16() do
						local ok, result = pcall(function()
							if not v198() then
								return
							end

							local v4611 = v205(v4519)
							local v4612 = v205(v4520)

							if not v4611 or not v4612 then
								warn("[AutoSell] Filter dropdown gak bisa dibaca - ronde ini di-SKIP, gak ada yang dijual. Kalau ini terus-terusan, matiin Auto Sell Pet dan lapor.")

								return
							end

							local v4613 = (Save.Peek or Save.Get)()
							local Inventory = v4613 and v4613.Inventory or {}
							local v4615 = v4597()

							if not v4615 then
								warn("[AutoSell] Status pet yang dipajang gak bisa diverifikasi - ronde ini di-SKIP, gak ada yang dijual.")

								return
							end

							local t212 = {}
							local n82 = 0

							if type(Inventory) == "table" then
								for k, v in pairs(Inventory) do
									n82 += 1

									if n82 % 250 == 0 then
										RunService.Heartbeat:Wait()

										if not senaV4Config.AutoSell then
											return
										end
									end

									if type(v) == "table" then
										local v4620 = v4615[k] == true
										local v4621 = v.IsFavorite == true or v["Jadikan Favorit"] == true or v.Favorite == true
										local v4622 = table.find(v4613.EquippedAssets or {}, k) ~= nil
										local v4623 = v.InFuse == true
										local Category = v.Category or v.id or v.AssetCategory or v.ItemId
										local v4625 = Category and Assets.Directory[Category]
										local DisplayName = v4625 and (v4625.DisplayName or v4625._id or v4625.Name) or "Unknown"
										local Rarity = v4625 and v4625.Rarity
										local DisplayName2 = Rarity and (Rarity.DisplayName or Rarity._id or Rarity.Name) or "Unknown"
										local v4629 = v211(DisplayName, DisplayName2, v4611, v4612)
										local v4630 = true
										local SellPetMaxRate = senaV4Config.SellPetMaxRate or 0

										if SellPetMaxRate > 0 then
											v4630 = v4579({
												Category = Category,
												Scale = v.Scale or v.AssetScale or 1,
												Mutations = v.Mutations or {}
											}) <= SellPetMaxRate
										end

										if v4629 and v4630 and not v4621 and not v4620 and not v4622 and not v4623 then
											table.insert(t212, {
												uid = k,
												petName = DisplayName,
												rarity = DisplayName2
											})
										end
									end
								end
							end

							if #t212 > 0 then
								for _, v in ipairs(t212) do
									local v4634 = v4597()
									local v4635, v4636, v4637 = v4603(v, v4634)

									if not v4635 then
										warn("[AutoSell] Gak jual " .. tostring(v.petName) .. " - " .. tostring(v4636))

										if v4637 ~= "global" then
											continue
										end
									elseif v198() then
										local Character = LocalPlayer2.Character
										local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
										local v4640

										for _, v2 in ipairs({
											LocalPlayer2.Backpack,
											Character
										}) do
											if v2 then
												for _, child in ipairs(v2:GetChildren()) do
													if child:IsA("Tool") and child:GetAttribute("UID") == v.uid then
														v4640 = child

														break
													end
												end
											end

											if v4640 then
												break
											end
										end

										if not v4640 or not Humanoid then
											continue
										end

										Humanoid:EquipTool(v4640)
										task.wait(0.2)

										if v198() then
											local v4645 = v4597()
											local v4646, v4647, v4648 = v4603(v, v4645)

											if v4646 then
												Remotes.PetSatchel.SellPet:FireServer({ v.uid })
												task.wait(0.05)

												continue
											else
												warn("[AutoSell] Batal di detik terakhir, gak jual " .. tostring(v.petName) .. " - " .. tostring(v4647))

												if v4648 ~= "global" then
													continue
												end
											end
										end
									end

									break
								end
							end
						end)

						if not ok then
							warn("Auto Sell Error:", result)
						end

						task.wait(1.5)
					end

					u4590 = false
				end)
			end

			local u4649 = false
			local u4650 = false

			local function v4651()
				if not senaV4Config.AutoSellEgg then
					return false
				end

				local v4652 = v205(v4521)

				if not v4652 or #v4652 == 0 or table.find(v4652, "None") then
					return false
				end

				local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
				local ok, result = pcall(function()
					return require(ReplicatedStorage2.Shared.Save)
				end)

				if not ok or not result then
					return false
				end

				local v4656 = (result.Peek or result.Get)()
				local EggInventory = v4656 and v4656.EggInventory

				if type(EggInventory) ~= "table" then
					return false
				end

				local ok2, result2 = pcall(function()
					return require(ReplicatedStorage2.Data.Assets)
				end)
				local Directory = ok2 and result2 and result2.Directory

				if not Directory then
					return false
				end

				for _, v in pairs(EggInventory) do
					local v4663 = type(v) == "table" and Directory[v.AssetCategory]
					local DisplayName = v4663 and v4663.Rarity and (v4663.Rarity.DisplayName or v4663.Rarity._id)
					local v4665 = true
					local SellEggMaxRate = senaV4Config.SellEggMaxRate or 0

					if SellEggMaxRate > 0 and type(v) == "table" then
						v4665 = v4579({
							Category = v.AssetCategory,
							Scale = v.AssetScale or 1,
							Mutations = v.Mutations or {}
						}) <= SellEggMaxRate
					end

					if v.Placement == nil and v4665 then
						if not v214(DisplayName or "Unknown", v4652) then
							continue
						end

						return true
					end
				end

				return false
			end

			genv.__SenaV4IsAutoSellEggBusy = function()
				return u4650 or v4651()
			end
			t24.startAutoSellEggLoop = function()
				if not u4649 then
					u4649 = true
					task.spawn(function()
						local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
						local Directory = require(ReplicatedStorage2.Data.Assets).Directory
						local EggState2 = require(ReplicatedStorage2.Client.EggState)
						local Remotes = require(ReplicatedStorage2.Shared.Remotes)
						local Save = require(ReplicatedStorage2.Shared.Save)

						while senaV4Config.AutoSellEgg and v16() do
							local v4672 = v205(v4521)
							local v4673 = (Save.Peek or Save.Get)()
							local EggInventory = v4673 and v4673.EggInventory

							if v4672 and type(EggInventory) == "table" and v198() then
								for k, v in pairs(EggInventory) do
									if senaV4Config.AutoSellEgg and v198() then
										local v4677 = type(v) == "table" and Directory[v.AssetCategory]
										local DisplayName = v4677 and v4677.Rarity and (v4677.Rarity.DisplayName or v4677.Rarity._id)
										local v4679 = true
										local SellEggMaxRate = senaV4Config.SellEggMaxRate or 0

										if SellEggMaxRate > 0 and type(v) == "table" then
											v4679 = v4579({
												Category = v.AssetCategory,
												Scale = v.AssetScale or 1,
												Mutations = v.Mutations or {}
											}) <= SellEggMaxRate
										end

										if not (v.Placement == nil and v4679) then
											continue
										end

										if not v214(DisplayName or "Unknown", v4672) then
											continue
										end

										if v198() then
											u4650 = true

											if genv.__SenaV4TreadmillManager and genv.__SenaV4TreadmillManager.activeTreadmill ~= nil then
												genv.__SenaV4TreadmillManager:_cancelIdle(true)
												task.wait(0.25)
											end

											if not EggState2.WearEggTool(k) then
												continue
											end

											task.wait(0.2)

											if v198() then
												local v4681 = (Save.Peek or Save.Get)()
												local EggInventory2 = v4681 and v4681.EggInventory and v4681.EggInventory[k]

												if EggInventory2 and EggInventory2.Placement == nil then
													Remotes.PetSatchel.SellPet:FireServer({ k })
													task.wait(0.25)
												end

												continue
											end
										end
									end

									break
								end
							end

							u4650 = false
							task.wait(0.5)
						end

						u4650 = false
						u4649 = false
					end)

					return
				end
			end

			local t213 = {
				"None",
				"All"
			}

			pcall(function()
				local t214 = {}

				for _, v in pairs(require(game:GetService("ReplicatedStorage").Data.Assets).Directory) do
					if type(v) == "table" and (v.DisplayName or v._id or v.Name) then
						local DisplayName = v.DisplayName or v._id or v.Name

						if not t214[DisplayName] then
							t214[DisplayName] = true
							table.insert(t213, DisplayName)
						end
					end
				end

				table.sort(t213, function(p979, p980)
					if p979 == "None" then
						return true
					end

					if p980 == "None" then
						return false
					end

					if p979 == "All" then
						return true
					end

					if p980 == "All" then
						return false
					end

					return p979 < p980
				end)
			end)
			v4522 = v4320(t200)
			v4523 = v4320(t202)
			v4524 = v4326()
			v4525 = v4330(v4320(t213))
			v4526 = function(p981)
				senaV4Config.AutoSteal = p981 == true

				if v612 then
					v612:setEnabled(senaV4Config.AutoSteal)
				end

				if type(genv.__SenaV4SetStealDeclutter) == "function" then
					pcall(genv.__SenaV4SetStealDeclutter, senaV4Config.AutoSteal)
				end
			end
			v4527 = function(p982)
				senaV4Config.StealHoldSeconds = math.clamp(math.floor((tonumber(p982) or 5) + 0.5), 1, 10)
			end
			v4528 = function(p983)
				senaV4Config.GodMode = p983 == true

				if v615 then
					v615:setEnabled(senaV4Config.GodMode)
				end
			end

			local function v4688()
				return genv.__SenaV4TreadmillManager
			end

			v4529 = function(p984)
				senaV4Config.AutoTreadmillIdle = p984 == true

				local v4689 = v4688()

				if v4689 then
					v4689:setIdleFarm(senaV4Config.AutoTreadmillIdle and not senaV4Config.AntiTreadmill)
				end
			end
			v4530 = function(p985)
				senaV4Config.AntiTreadmill = p985 == true

				local v4690 = v4688()

				if senaV4Config.AntiTreadmill then
					if v4690 then
						v4690:setIdleFarm(false)
					end

					t145.startAntiTreadmillLoop()
				elseif v4690 then
					v4690:setIdleFarm(senaV4Config.AutoTreadmillIdle)
				end
			end
			v4531 = function(p986)
				senaV4Config.HopNoMatch = p986 == true

				if senaV4Config.HopNoMatch then
					t145.startHopLoop()
				end
			end
			v4532 = function(p987)
				if type(p987) == "table" then
					p987 = p987[1]
				end

				senaV4Config.PrivateServerMax = tostring(p987 or "2")
			end
			v4533 = function(p988)
				senaV4Config.PrivateServerAuto = p988 == true

				if senaV4Config.PrivateServerAuto then
					t145.startPrivateAutoHop()
				end
			end
			v4534 = function(p989)
				senaV4Config.HopCooldown = math.max(1, math.floor(tonumber(p989) or 5))
			end
			v4535 = function(p990)
				senaV4Config.AutoTreadmillUpgrade = p990 == true

				local v4691 = v4688()

				if v4691 then
					v4691:setAutoUpgrade(senaV4Config.AutoTreadmillUpgrade)
				end
			end
			v4536 = function(p991)
				local v4692 = type(p991) == "string" and p991 or ""
				local stealMode = (v4692:find("Fly") or v4692:find("High")) and "Fly" or "Instant"
				local flyAerial = stealMode == "Fly" and (v4692:find("%(Fly%)") ~= nil or v4692:lower():find("aerial") ~= nil)

				senaV4Config.StealMode = stealMode
				senaV4Config.FlyAerial = flyAerial

				if v612 then
					v612:setStealMode(stealMode, flyAerial)
				end
			end
			v4537 = function(p992)
				local v4695 = math.floor(math.clamp(math.floor((tonumber(p992) or 600) + 0.5), 500, 1000) / 10 + 0.5)

				v223(v4695)

				if v612 then
					v612:setSpeed(v4695)
				end
			end
			v4538 = function(p993, p994, p995)
				local v4696 = v4320(p995)

				if p993 == "names" then
					senaV4Config.StealNamesFilter = v4696
				elseif p993 == "areas" then
					senaV4Config.StealAreas = v4696
				elseif p993 == "rarities" then
					senaV4Config.StealRarities = v4696
				end

				if v612 then
					v612:setFilter(p993, v4696)
					v612:setFilterEnabled(p994, #v4696 > 0)
				end
			end
			v4539 = function(p996)
				senaV4Config:applyStealValueInput(p996)

				if v612 then
					v612:setMinValuePerSec(senaV4Config.StealMinValue or 0)
				end
			end
			v4540 = function(p997)
				local v4697 = v4320(p997)

				senaV4Config.StealMutations = v4697

				if v612 then
					v612:setFilter("mutations", v4697)
					v612:setFilterEnabled("mutation", #v4697 > 0)
				end
			end
			v4541 = function(p998)
				local tonumber_ = tonumber
				local v4699 = tostring(p998 or ""):gsub("[^%d%.]", "")
				local stealMinWeight = tonumber_(v4699) or 0

				senaV4Config.StealMinWeight = stealMinWeight

				if v612 then
					v612:setMinWeightKg(stealMinWeight)
				end
			end
			v4542 = function(p999)
				senaV4Config.StealPriority = tostring(p999 or "Rarity")

				if v612 then
					v612:setHighestValueFirst(senaV4Config.StealPriority == "Highest Value")
					v612:setHeaviestFirst(senaV4Config.StealPriority == "Heaviest")
				end
			end
			v4543 = function(p1000)
				senaV4Config.EggESP = p1000 == true

				if v612 then
					v612:setEggEsp(senaV4Config.EggESP)
				end
			end
			v4544 = function(p1001)
				local v4701 = v4320(p1001)

				senaV4Config.EspDetails = v4701

				if not v612 then
					return
				end

				local t215 = {}

				for _, v in ipairs(v4701) do
					t215[v] = true
				end

				v612:setEspOption("name", t215.Name == true)
				v612:setEspOption("rarity", t215.Rarity == true)
				v612:setEspOption("value", t215.Value == true)
				v612:setEspOption("kg", t215.Weight == true)
				v612:setEspOption("mutation", t215.Mutation == true)
				v612:setEspOption("placed", t215["Placed Eggs"] == true)
			end
			v4545 = function(p1002)
				senaV4Config.ScrambleTradeInBanners = v4320(p1002)
			end
			v4546 = function(p1003)
				t145.setBackpackRates(p1003 == true)
			end
			v4547 = function(p1004)
				senaV4Config.AntiGuardKnockback = p1004 == true

				local __SenaV4AntiGuard = genv.__SenaV4AntiGuard

				if __SenaV4AntiGuard and type(__SenaV4AntiGuard.setEnabled) == "function" then
					pcall(__SenaV4AntiGuard.setEnabled, __SenaV4AntiGuard, senaV4Config.AntiGuardKnockback)
				end
			end
			v4548 = function(p1005)
				senaV4Config.AutoFavorite = p1005 == true
			end
			v4549 = function(p1006)
				senaV4Config.FavMode = p1006 == "Species" and "Species" or "Rarity"
			end
			v4550 = function(p1007)
				senaV4Config.FavRarities = v4320(p1007)
			end
			v4551 = function(p1008)
				senaV4Config.FavSpecies = v4320(p1008)
			end
			v4552 = function(p1009)
				senaV4Config.AutoEquipBest = p1009 == true
			end
			v4553 = function(p1010)
				senaV4Config.AutoClaimOffline = p1010 == true
			end
			v4554 = function(p1011)
				senaV4Config.AutoBaseUpgrade = p1011 == true
			end
			v4555 = function(p1012)
				senaV4Config.AutoClaimAlmanac = p1012 == true
			end
			v4556 = function(p1013)
				senaV4Config.AutoFusePets = p1013 == true
			end
			v4557 = function(p1014)
				senaV4Config.FuseSelectedOnly = p1014 == "Selected Species"
			end
			v4558 = function(p1015)
				senaV4Config.FuseRarities = v4320(p1015)
			end
			v4559 = function(p1016)
				senaV4Config.FuseSpecies = v4320(p1016)
			end
			v4560 = function(p1017)
				local __SenaV4Roaming = genv.__SenaV4Roaming

				if __SenaV4Roaming and type(__SenaV4Roaming.setNoclip) == "function" then
					pcall(__SenaV4Roaming.setNoclip, p1017 == true)
				end
			end
			v4561 = function(p1018)
				local __SenaV4Roaming = genv.__SenaV4Roaming

				if __SenaV4Roaming and type(__SenaV4Roaming.setBottingMode) == "function" then
					pcall(__SenaV4Roaming.setBottingMode, p1018 == true)
				end
			end
			v4562 = function(p1019)
				senaV4Config.AntiCutscene = p1019 == true
			end
			runOnce = function(p1020, p1021, p1022)
				local v4708 = senaV4Config[p1020]

				senaV4Config[p1020] = true
				task.spawn(p1021)
				task.delay(2.4, function()
					local v4709 = os.clock() + 30

					while senaV4Config.IsPlacing and os.clock() < v4709 do
						task.wait(0.25)
					end

					senaV4Config[p1020] = v4708

					if p1022 then
						pcall(p1022)
					end
				end)
			end
			t24.runOnce = runOnce

			local function v4710(p1023)
				senaV4Config.ScrambleFarmDrones = p1023 == true
			end
			local function v4711(p1024)
				senaV4Config.ScrambleLostParts = p1024 == true
			end
			local function v4712(p1025)
				senaV4Config.ScrambleCollectSamples = p1025 == true
			end
			local function v4713(p1026)
				senaV4Config.ScrambleAutoVault = p1026 == true
			end

			v4564 = function(p1027)
				senaV4Config.ScrambleAutoBuy = p1027 == true
			end

			local function v4714(p1028)
				senaV4Config.ScrambleAreas = v4320(p1028)
			end
			local function v4715(p1029)
				senaV4Config.ScrambleDroneTypes = v4320(p1029)
			end

			v4565 = function(p1030)
				senaV4Config.ScrambleBuyList = v4320(p1030)
			end
			v4566 = function(p1031)
				senaV4Config.AutoPlace = p1031 == true

				if senaV4Config.AutoPlace then
					task.spawn(t24.AutoPlaceLoop)
				end
			end
			v4567 = function(p1032)
				senaV4Config.AutoHatch = p1032 == true

				if senaV4Config.AutoHatch then
					task.spawn(t24.AutoHatchLoop)
				end
			end
			v4568 = function(p1033)
				senaV4Config.AutoMutation = p1033 == true

				if senaV4Config.AutoMutation then
					task.spawn(t24.AutoMutationLoop)
				end
			end
			v4569 = function(p1034)
				senaV4Config.AutoRingEvent = p1034 == true

				if senaV4Config.AutoRingEvent then
					t24.RingEventLoop()
				end
			end
			v4570 = function(p1035)
				senaV4Config.MutationChoice = p1035 == "Fractured" and "Fractured" or "Scrambled"
			end
			v4571 = function(p1036)
				senaV4Config.MutationSpecies = v4320(p1036)
			end
			v4572 = function(p1037)
				senaV4Config.MutationRarities = v4320(p1037)
			end
			v4573 = function(p1038)
				senaV4Config.MutationRetry = p1038 == true
			end
			v4574 = function(p1039)
				senaV4Config.AutoSell = p1039 == true

				if senaV4Config.AutoSell then
					t24.startAutoSellLoop()
				end
			end
			v4575 = function(p1040)
				senaV4Config.AutoSellEgg = p1040 == true

				if senaV4Config.AutoSellEgg then
					t24.startAutoSellEggLoop()
				end
			end
			v4576 = function(p1041)
				senaV4Config.SellPetMaxRate = v4584(p1041)
			end
			v4577 = function(p1042)
				senaV4Config.SellEggMaxRate = v4584(p1042)
			end
		end

		local u4716 = false

		local function v4717(p1043)
			local v4718 = senaV4Config.StartupBoost == true

			senaV4Config.StartupBoost = p1043 == true

			if not senaV4Config.StartupBoost then
				u4716 = false

				if v4718 or t15.snapshot then
					task.spawn(t15.revert)
				end

				return
			end

			if senaV4Config.StartupBoost and not u4716 then
				u4716 = true
				task.spawn(function()
					task.wait(1.5)

					if v16() and senaV4Config.StartupBoost then
						v390()
					end

					task.wait(4)

					if v16() and senaV4Config.StartupBoost then
						v390()
					end
				end)
			end
		end
		local function v4719(p1044)
			if p1044 == true then
				task.spawn(v391)
			end
		end
		local function v4720(p1045)
			local __SenaV4SetCapFps = genv.__SenaV4SetCapFps

			if type(__SenaV4SetCapFps) == "function" then
				__SenaV4SetCapFps(p1045 == true and 240 or 60)
			end
		end

		local v4722, v4723, v4724, v4725, v4726, v4727, v4728, v4729, v4730, v4731
		local v4732, __SenaV4PlayerSteal, v4734, v4735, v4736, v4737, v4738, v4739, v4740, v4741
		local v4742, t216, t217, u4745, t218

		do
			local function v4747()
				return genv.__SenaV4MovementExtras
			end

			v4722 = function(p1046)
				senaV4Config.FlyForCapture = p1046 == true

				local v4748 = v4747()

				if v4748 then
					v4748:setFlyForCapture(senaV4Config.FlyForCapture)
				end
			end
			v4723 = function(p1047)
				senaV4Config.InstantGrab = p1047 == true

				local v4749 = v4747()

				if v4749 then
					v4749:setInstantGrab(senaV4Config.InstantGrab)
				end
			end

			local function v4750(p1048)
				genv.__SenaV4AdminBoost = p1048 == true

				if v612 then
					v612:setSpeed(senaV4Config.TweenSpeedMultiplier or 60)
				end

				genv.__SenaV4AdminBoostSpeedGen = (genv.__SenaV4AdminBoostSpeedGen or 0) + 1

				local __SenaV4AdminBoostSpeedGen = genv.__SenaV4AdminBoostSpeedGen

				if p1048 == true then
					task.spawn(function()
						local RunService2 = game:GetService("RunService")
						local v4753
						local v4754

						while genv.__SenaV4AdminBoostSpeedGen == __SenaV4AdminBoostSpeedGen and v16() do
							local Character = LocalPlayer.Character
							local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

							if Humanoid then
								local WalkSpeed = Humanoid.WalkSpeed

								if v4753 == nil or v4754 == nil or math.abs(WalkSpeed - v4754) > 0.5 then
									v4753 = WalkSpeed > 900 and WalkSpeed / 10 or WalkSpeed
								end

								if v4753 and v4753 > 0 then
									local walkSpeed = v4753 * 10

									Humanoid.WalkSpeed = walkSpeed
									v4754 = walkSpeed
								end
							else
								v4753 = nil
								v4754 = nil
							end

							RunService2.Heartbeat:Wait()
						end
					end)
				end
			end

			v4724 = function(p1049)
				senaV4Config.AutoStealCapture = p1049 == true
			end
			v4725 = function(p1050)
				senaV4Config.InfiniteJump = p1050 == true

				local v4759 = v4747()

				if v4759 then
					v4759:setInfiniteJump(senaV4Config.InfiniteJump)
				end
			end

			local function v4760(p1051)
				senaV4Config.WalkSpeedMultiplier = math.clamp(tonumber(p1051) or 1, 1, 2.1)

				local v4761 = v4747()

				if v4761 then
					v4761:setSpeedMultiplier(senaV4Config.WalkSpeedMultiplier)
				end
			end

			v4726 = function(p1052)
				senaV4Config.AntiHitGuard = p1052 == true

				local __SenaV4AntiHitGuard = genv.__SenaV4AntiHitGuard

				if __SenaV4AntiHitGuard then
					__SenaV4AntiHitGuard:setEnabled(senaV4Config.AntiHitGuard)
				end
			end
			v4727 = function(p1053)
				senaV4Config.AntiAFK = p1053 == true
				genv.__SenaV4AntiAfkEnabled = senaV4Config.AntiAFK

				if type(genv.__SenaV4SetAntiAfkEnabled) == "function" then
					genv.__SenaV4SetAntiAfkEnabled(senaV4Config.AntiAFK)
				end
			end
			v4728 = function(p1054)
				senaV4Config.AutoReconnect = p1054 == true
				v2526.autoReconnect = senaV4Config.AutoReconnect

				if getgenv then
					getgenv().SNE_AutoReconnect = senaV4Config.AutoReconnect
				end
			end
			v4729 = function(p1055)
				senaV4Config.AutoExecute = p1055 == true
				v2526.autoExecute = senaV4Config.AutoExecute

				if getgenv then
					getgenv().SNE_AutoExecute = senaV4Config.AutoExecute
				end

				if p1055 then
					pcall(v2528)
				else
					pcall(v2530)
				end
			end

			local function v4763()
				local __SenaV4IdentitySetter = genv.__SenaV4IdentitySetter or type(setthreadidentity) == "function" and setthreadidentity or type(set_thread_identity) == "function" and set_thread_identity or type(setidentity) == "function" and setidentity or type(syn) == "table" and type(syn.set_thread_identity) == "function" and syn.set_thread_identity
				local __SenaV4UICapabilityIdentity = genv.__SenaV4UICapabilityIdentity or 8

				local function v4766()
					if type(__SenaV4IdentitySetter) == "function" then
						pcall(__SenaV4IdentitySetter, __SenaV4UICapabilityIdentity)
					end
				end

				return v4766
			end

			v4730 = v4763()
			v4731 = true
			v4732 = function(p1056)
				local function v4767(p1057)
					if type(v4730) == "function" then
						v4730()
					end

					if v4731 then
						return
					end

					if type(p1056) == "function" then
						p1056(p1057)
					end
				end

				return v4767
			end
			__SenaV4PlayerSteal = genv.__SenaV4PlayerSteal
			v4734 = function(p1058)
				senaV4Config.StealPlayers = p1058 == true

				if __SenaV4PlayerSteal then
					__SenaV4PlayerSteal:setEnabled(senaV4Config.StealPlayers)
				end
			end
			v4735 = function(p1059)
				senaV4Config.StealPlayerRarities = v4320(p1059)
			end

			local function v4768(p1060)
				local v4769 = string.lower(tostring(p1060 or "")):gsub("[%s,]", "")

				if v4769 == "" then
					return 0
				end

				local v4770, v4771 = string.match(v4769, "^([%d]+%.?[%d]*)([kmb]?)$")
				local v4772 = tonumber(v4770)

				if not v4772 then
					return 0
				end

				if v4771 == "k" then
					return v4772 * 1000
				end

				if v4771 == "m" then
					return v4772 * 1000000
				end

				if v4771 == "b" then
					return v4772 * 1e9
				end

				return v4772
			end

			v4736 = function(p1061)
				senaV4Config.StealPlayerMinValue = v4768(p1061)
			end
			v4737 = function(p1062)
				senaV4Config.AutoIndex = p1062 == true

				if v612 then
					v612:setIndexObjective(senaV4Config.AutoIndex)
				end
			end
			v4738 = function(p1063)
				senaV4Config.WebhookEnabled = p1063 == true
			end
			v4739 = function(p1064)
				senaV4Config.WebhookURL = type(p1064) == "string" and p1064 or ""
			end
			v4740 = function(p1065)
				senaV4Config.WebhookRarities = v4320(p1065)
			end
			v4741 = function(p1066)
				senaV4Config.WebhookMinValue = v4768(p1066)
			end

			local t219 = {
				"Set",
				"SetValue",
				"LoadValue",
				"ResetValue",
				"SetContent",
				"SetTitle",
				"SetOptions",
				"Update",
				"Refresh",
				"Lock",
				"Unlock",
				"SetVisible"
			}

			local function v4774(p1067)
				if type(p1067) ~= "table" then
					return p1067
				end

				if rawget(p1067, "__senaElevated") then
					return p1067
				end

				for _, v in ipairs(t219) do
					local value = rawget(p1067, v)

					if type(value) == "function" then
						rawset(p1067, v, function(...)
							v4730()

							return value(...)
						end)
					end
				end

				rawset(p1067, "__senaElevated", true)

				return p1067
			end

			local t220 = {
				"AddToggle",
				"AddSlider",
				"AddDropdown",
				"AddInput",
				"AddButton",
				"AddParagraph",
				"AddKeybind",
				"AddColorPicker",
				"AddActionList",
				"AddLiveChat",
				"AddSupportCard",
				"AddSubSection",
				"AddSection",
				"AddTab",
				"AddForum"
			}

			local function v4779(p1068)
				if type(p1068) ~= "table" then
					return p1068
				end

				v4774(p1068)

				if rawget(p1068, "__senaFactoryGuarded") then
					return p1068
				end

				for _, v in ipairs(t220) do
					local value = rawget(p1068, v)

					if type(value) == "function" then
						rawset(p1068, v, function(...)
							v4730()

							local v4783 = table.pack(value(...))

							if v4783.n > 0 then
								v4783[1] = v4779(v4783[1])
							end

							return table.unpack(v4783, 1, v4783.n)
						end)
					end
				end

				rawset(p1068, "__senaFactoryGuarded", true)

				return p1068
			end

			v4730()
			v4742 = SenaLibOverride:Window({
				Title = "Sena BETA |",
				Footer = "Steal An Egg",
				Folder = "SenaSAEv4",
				Version = 1,
				Color = Color3.fromRGB(232, 232, 238),
				Image = "http://56.10.112.179:8080/visual/sena_bg.jpg"
			})
			v4779(v4742)
			t216 = {}
			t217 = { "Respawn Point" }

			local __SenaV4Roaming = genv.__SenaV4Roaming

			if __SenaV4Roaming and type(__SenaV4Roaming.waypointList) == "function" then
				local ok, result = pcall(__SenaV4Roaming.waypointList)

				if ok and type(result) == "table" and #result > 0 then
					t217 = result
				end
			end

			u4745 = t217[1]
			t218 = {}

			local __SenaV4ScrambleRuntime = genv.__SenaV4ScrambleRuntime

			if __SenaV4ScrambleRuntime and type(__SenaV4ScrambleRuntime.snapshot) == "function" then
				pcall(function()
					local v4788 = __SenaV4ScrambleRuntime.snapshot()

					if v4788 and type(v4788.Shop) == "table" then
						for _, v in pairs(v4788.Shop) do
							if v and v.Label then
								t218[#t218 + 1] = tostring(v.Label)
							end
						end
					end
				end)
			end

			local v4791 = v4742:AddTab({
				Name = "Admin Abuse",
				Icon = "flame"
			})

			t216.autoStealCapture = v4791:AddSection("Capture The Egg"):AddToggle({
				Title = "Auto Steal Capture",
				Content = "For the Capture The Egg event. Grabs the event egg for you and keeps you holding it in a safe spot so your time keeps going. Turn off normal Auto Steal while using this.",
				Default = false,
				Callback = v4732(v4724)
			})

			local Movement = v4791:AddSection("Movement")

			t216.adminBoost = Movement:AddToggle({
				Title = "Admin Abuse Boost",
				Content = "Only works during Admin Abuse. Do not use it when there is no Admin Abuse.",
				Default = false,
				Callback = v4732(v4750)
			})
			t216.flyForCapture = Movement:AddToggle({
				Title = "Fly For Capture",
				Content = "For the Capture The Egg event. After you pick up an egg, you fly up and stay still in the air so nobody can take it.",
				Default = false,
				Callback = v4732(v4722)
			})
			t216.instantGrab = Movement:AddToggle({
				Title = "Instant Grab",
				Content = "Picking up an egg only needs a quick tap instead of a long hold.",
				Default = false,
				Callback = v4732(v4723)
			})
			t216.infiniteJump = Movement:AddToggle({
				Title = "Infinite Jump",
				Content = "Jump again in mid-air, as often as you like.",
				Default = false,
				Callback = v4732(v4725)
			})
			t216.noclip = Movement:AddToggle({
				Title = "Noclip",
				Content = "Walk through walls and doors.",
				Default = false,
				Callback = v4732(v4560)
			})
			t216.autoRingEvent = v4791:AddSection("Ring Event"):AddToggle({
				Title = "Auto Ring Event",
				Content = "Starts at the safe zone, then glides Forest -> Angels & Demons -> back to Forest on a loop. Turn off Auto Steal while using this.",
				Default = false,
				Callback = v4732(v4569)
			})
		end

		do
			local v4793 = v4742:AddTab({
				Name = "Main",
				Icon = "home"
			})
			local v4794 = v4793:AddSection("Auto Steal")

			t216.autoSteal = v4794:AddToggle({
				Title = "Auto Steal",
				Content = "Steals eggs that match your filters and brings them home.",
				Default = false,
				Callback = v4732(v4526)
			})
			t216.helpFriend = v4794:AddToggle({
				Title = "Help Friend",
				Content = "Instead of banking a stolen egg, drops it just before the safe zone line so a friend can pick it up.",
				Default = false,
				Callback = v4732(function(p1069)
					senaV4Config.HelpFriend = p1069 == true
				end)
			})
			v4794:AddButton({
				Title = "Egg Checker",
				Content = "Every egg on the field right now, best money first. Pick one and steal it.",
				Callback = v4732(function()
					senaPanels.openChecker()
				end)
			})
			v4794:AddButton({
				Title = "Egg Spawn Analyst",
				Content = "Live global spawn tracker, timeline & forecast synced across active online players.",
				Callback = v4732(function()
					senaPanels.openAnalyst()
				end)
			})
			t216.godMode = v4794:AddToggle({
				Title = "Aura Bat",
				Content = "",
				Default = false,
				Callback = v4732(v4528)
			})
			t216.stealMode = v4794:AddDropdown({
				Title = "Steal Mode",
				Content = "If you have good speed better use High Speed User, but if you are newbie, use Low Speed User",
				Options = {
					"Low Speed User",
					"High Speed User",
					"High Speed User (Fly)"
				},
				MaxVisible = 3,
				Default = "High Speed User",
				Multi = false,
				Callback = v4732(v4536)
			})

			if (tonumber(senaV4Config.StealHoldSeconds) or 5) > 10 then
				senaV4Config.StealHoldSeconds = 5
			end

			t216.stealHold = v4794:AddSlider({
				Title = "Low Speed Multiplier",
				Content = "For Low Speed User. Higher = faster grab, lower = safer. Lower it if steals keep failing.",
				Min = 1,
				Max = 10,
				Default = 5,
				Increment = 1,
				Callback = v4732(v4527)
			})
			t216.lowSpeedBoost = v4794:AddToggle({
				Title = "Boost for Mode Low Speed",
				Content = "Auto-upgrade for Low Speed User (from Sena). Faster steals on every area except Forest (~6s/egg). Leave ON.",
				Default = true,
				Callback = v4732(function(pBoost)
					senaV4Config.LowSpeedBoost = pBoost ~= false
				end)
			})

			local v4795 = v4793:AddSection("Egg Filter")

			v4795:AddSubSection("Egg")
			t216.names = v4795:AddDropdown({
				Title = "Filter By Egg Name",
				Content = "Only steal these eggs. Leave empty for any egg.",
				Options = v4522,
				Multi = true,
				Default = {},
				Callback = v4732(function(p1070)
					v4538("names", "name", p1070)
				end)
			})
			t216.rarities = v4795:AddDropdown({
				Title = "Filter By Rarity",
				Content = "Only steal these rarities. Leave empty for any rarity.",
				Options = v4524,
				Multi = true,
				Default = {},
				Callback = v4732(function(p1071)
					v4538("rarities", "rarity", p1071)
				end)
			})
			v4795:AddSubSection("Area & Value")
			t216.areas = v4795:AddDropdown({
				Title = "Select Area",
				Content = "Only steal from these areas. Leave empty for every area.",
				Options = v4523,
				Multi = true,
				Default = {},
				Callback = v4732(function(p1072)
					v4538("areas", "area", p1072)
				end)
			})
			t216.value = v4795:AddInput({
				Title = "Steal By Value",
				Content = "Minimum money per second. Supports k, m and b.",
				Placeholder = "e.g. 500k, 2m, 1b",
				Default = "",
				Callback = v4732(v4539)
			})
			t216.mutations = v4795:AddDropdown({
				Title = "Filter By Mutation",
				Content = "Only steal eggs carrying one of these mutations. Leave empty for any egg.",
				Options = t199,
				Multi = true,
				Default = {},
				Callback = v4732(v4540)
			})
			t216.weight = v4795:AddInput({
				Title = "Steal By Weight",
				Content = "Minimum egg weight in kilograms. 0 accepts any weight.",
				Placeholder = "e.g. 12000",
				Default = "",
				Callback = v4732(v4541)
			})
			t216.priority = v4795:AddDropdown({
				Title = "Steal Priority",
				Content = "Which egg to go for first when more than one passes the filters.",
				Options = {
					"Rarity",
					"Highest Value",
					"Heaviest"
				},
				Default = "Rarity",
				Callback = v4732(v4542)
			})
			t216.autoIndex = v4795:AddToggle({
				Title = "Auto Index",
				Content = "Also steal eggs whose pet is still missing from your Pet Index, in any area, on top of the filters above. An egg you already hold counts as covered until it hatches.",
				Default = false,
				Callback = v4732(v4737)
			})

			local v4796 = v4793:AddSection("Egg ESP")

			t216.eggEsp = v4796:AddToggle({
				Title = "Egg ESP",
				Content = "Draws a label over every egg on the field so you can read it from across the map.",
				Default = false,
				Callback = v4732(v4543)
			})
			t216.espDetails = v4796:AddDropdown({
				Title = "ESP Details",
				Content = "What each label shows. Placed Eggs also labels the eggs sitting on plots.",
				Options = {
					"Name",
					"Rarity",
					"Value",
					"Weight",
					"Mutation",
					"Placed Eggs"
				},
				Multi = true,
				Default = {
					"Name",
					"Rarity",
					"Value"
				},
				Callback = v4732(v4544)
			})
			t216.backpackRates = v4796:AddToggle({
				Title = "Backpack Value/s",
				Content = "Shows how much money per second each egg in your backpack makes, right on its slot.",
				Default = false,
				Callback = v4732(v4546)
			})

			local v4797 = v4793:AddSection("Steal Webhook")

			t216.webhookEnabled = v4797:AddToggle({
				Title = "Steal Webhook",
				Content = "Posts a Discord embed the moment a stolen egg is banked, with its rarity, size, weight and cash per second.",
				Default = false,
				Callback = v4732(v4738)
			})
			t216.webhookUrl = v4797:AddInput({
				Title = "Webhook URL",
				Content = "Paste the Discord webhook URL for the channel you want.",
				Placeholder = "https://discord.com/api/webhooks/...",
				Default = "",
				Callback = v4732(v4739)
			})
			v4797:AddSubSection("Filter")
			t216.webhookRarities = v4797:AddDropdown({
				Title = "Notify Rarities",
				Content = "Only post these rarities. Empty = every egg you steal.",
				Options = v4524,
				Multi = true,
				Default = {},
				Callback = v4732(v4740)
			})
			t216.webhookValue = v4797:AddInput({
				Title = "Notify Minimum Value",
				Content = "Only post eggs worth at least this per second. Supports k, m and b.",
				Placeholder = "e.g. 500k, 2m, 1b",
				Default = "",
				Callback = v4732(v4741)
			})
			v4797:AddButton({
				Title = "Test Webhook",
				Content = "Sends one test embed so you can confirm the URL works.",
				Callback = v4732(function()
					local __SenaV4Webhook = genv.__SenaV4Webhook

					if not __SenaV4Webhook or not __SenaV4Webhook.test() then
						SenaLibOverride:Notify({
							Title = "Steal Webhook",
							Content = "Enter a webhook URL first",
							Duration = 3
						})

						return
					end

					SenaLibOverride:Notify({
						Title = "Steal Webhook",
						Content = "Test embed sent",
						Duration = 3
					})
				end)
			})
		end

		do
			local v4799 = v4742:AddTab({
				Name = "Auto",
				Icon = "repeat"
			})

			t216.privateTab = v4742:AddTab({
				Name = "Private Server",
				Icon = "users"
			})

			local v4800 = v4799:AddSection("Egg Automation")

			v4800:AddSubSection("Place")
			t216.autoPlace = v4800:AddToggle({
				Title = "Auto Place Egg",
				Content = "Places eggs from your inventory on your plot.",
				Default = false,
				Callback = v4732(v4566)
			})
			t216.placeRarity = v4800:AddDropdown({
				Title = "Place Egg Rarity",
				Content = "Only place these rarities. Leave empty for all.",
				Options = v4524,
				Multi = true,
				Default = {},
				Callback = v4732(function(p1073)
					senaV4Config.PlaceRarities = v4320(p1073)
				end)
			})
			v4800:AddSubSection("Hatch")
			t216.autoHatch = v4800:AddToggle({
				Title = "Auto Hatch Egg",
				Content = "Hatches your placed eggs when they are ready.",
				Default = false,
				Callback = v4732(v4567)
			})
			v4800:AddSubSection("Mutate")
			t216.mutationChoice = v4800:AddDropdown({
				Title = "Select Mutation",
				Content = "Which mutation to apply to your placed eggs.",
				Options = {
					"Scrambled",
					"Fractured"
				},
				Multi = false,
				Default = "Scrambled",
				Callback = v4732(v4570)
			})
			t216.mutationSpecies = v4800:AddDropdown({
				Title = "Mutate Egg Name",
				Content = "Only mutate these eggs by name. Leave empty for every placed egg.",
				Options = v4522,
				Multi = true,
				Default = {},
				Callback = v4732(v4571)
			})
			t216.mutationRarity = v4800:AddDropdown({
				Title = "Mutate Egg Rarity",
				Content = "Only mutate placed eggs of these rarities. Leave empty for every rarity.",
				Options = v4524,
				Multi = true,
				Default = {},
				Callback = v4732(v4572)
			})
			t216.mutationRetry = v4800:AddToggle({
				Title = "Retry Until Mutated",
				Content = "Keep applying to one egg until it mutates or charges run out (10% per use).",
				Default = true,
				Callback = v4732(v4573)
			})
			t216.autoMutation = v4800:AddToggle({
				Title = "Auto Apply Mutation",
				Content = "Equips the selected mutation consumable and applies it to your placed eggs.",
				Default = false,
				Callback = v4732(v4568)
			})
			v4800:AddButton({
				Title = "Apply Mutation Now",
				Content = "Run one mutation pass over your placed eggs right now.",
				Callback = v4732(function()
					task.spawn(function()
						pcall(t24.mutationSweep)
					end)
				end)
			})

			local v4801 = v4742:AddTab({
				Name = "Pets",
				Icon = "sparkles"
			})
			local v4802 = v4801:AddSection("Pet Selling")

			t216.autoSell = v4802:AddToggle({
				Title = "Auto Sell Pet",
				Content = "Sells pets that match a filter below. Favorite, placed and equipped pets are kept.",
				Default = false,
				Callback = v4732(v4574)
			})
			v4802:AddSubSection("Filter")
			v4519 = v4802:AddDropdown({
				Title = "Pet Name Filter",
				Content = "Pets to sell by name. Pick All for every name.",
				Options = v4525,
				Multi = true,
				Default = {},
				Callback = v4732(function(p1074)
					senaV4Config.SellNames = v4320(p1074)
				end)
			})
			v4520 = v4802:AddDropdown({
				Title = "Pet Rarity Filter",
				Content = "Pets to sell by rarity. Pick All for every rarity.",
				Options = v4330(v4524),
				Multi = true,
				Default = {},
				Callback = v4732(function(p1075)
					senaV4Config.SellRarities = v4320(p1075)
				end)
			})
			t216.sellPetValue = v4802:AddInput({
				Flag = "sellPetValue",
				Title = "Sell By Value (max money/s)",
				Content = "Only sell pets whose money per second is this or lower. Blank = no value limit. Supports k, m, b.",
				Placeholder = "e.g. 100k, 2m",
				Default = "",
				Callback = v4732(v4576)
			})

			local v4803 = v4801:AddSection("Egg Selling")

			t216.autoSellEgg = v4803:AddToggle({
				Title = "Auto Sell Egg",
				Content = "Sells unplaced eggs of the rarities below.",
				Default = false,
				Callback = v4732(v4575)
			})
			v4521 = v4803:AddDropdown({
				Title = "Egg Rarity Filter",
				Content = "Egg rarities to sell. Pick All for every rarity.",
				Options = v4330(v4524),
				Multi = true,
				Default = {},
				Callback = v4732(function(p1076)
					senaV4Config.SellEggRarities = v4320(p1076)
				end)
			})
			t216.sellEggValue = v4803:AddInput({
				Flag = "sellEggValue",
				Title = "Sell By Value (max money/s)",
				Content = "Only sell eggs whose money per second is this or lower. Blank = no value limit. Supports k, m, b.",
				Placeholder = "e.g. 100k, 2m",
				Default = "",
				Callback = v4732(v4577)
			})

			local v4804 = v4742:AddTab({
				Name = "Events",
				Icon = "flame"
			})
			local v4805 = v4801:AddSection("Pet Favorite")

			t216.autoFavorite = v4805:AddToggle({
				Title = "Auto Favorite",
				Content = "Marks every pet that matches the rule below as a favorite, so Auto Sell and Auto Fuse leave it alone.",
				Default = false,
				Callback = v4732(v4548)
			})
			t216.favoriteRule = v4805:AddDropdown({
				Title = "Favorite Rule",
				Content = "Match pets by rarity or by species.",
				Options = {
					"Rarity",
					"Species"
				},
				Default = "Rarity",
				Callback = v4732(v4549)
			})
			v4805:AddSubSection("Only when Rule = Rarity")
			t216.favoriteRarities = v4805:AddDropdown({
				Title = "Rarities to Keep",
				Content = "Pets of these rarities get favorited.",
				Options = v4524,
				Multi = true,
				Default = {},
				Callback = v4732(v4550)
			})
			v4805:AddSubSection("Only when Rule = Species")
			t216.favoriteSpecies = v4805:AddDropdown({
				Title = "Species to Keep",
				Content = "Pets of these species get favorited.",
				Options = v4522,
				Multi = true,
				Default = {},
				Callback = v4732(v4551)
			})
			t216.unfavoriteAll = v4805:AddButton({
				Title = "Unfavorite Everything",
				Content = "Clears the favorite flag on every pet you own.",
				Callback = v4732(function()
					local __SenaV4PetBarn = genv.__SenaV4PetBarn
					local n83 = 0

					if __SenaV4PetBarn and type(__SenaV4PetBarn.unfavoriteAll) == "function" then
						n83 = __SenaV4PetBarn.unfavoriteAll() or 0
					end

					SenaLibOverride:Notify({
						Title = "Pet Favorite",
						Content = n83 .. " pets unfavorited",
						Duration = 3
					})
				end)
			})

			local v4808 = v4801:AddSection("Pet Fusion")

			t216.autoFuse = v4808:AddToggle({
				Title = "Auto Fuse",
				Content = "Feeds three matching pets into the Fusion machine over and over. Favorited and equipped pets are never used.",
				Default = false,
				Callback = v4732(v4556)
			})
			t216.fuseRule = v4808:AddDropdown({
				Title = "Fusion Rule",
				Content = "Fuse anything that passes the rarity filter, or only the species you pick below.",
				Options = {
					"Any Species",
					"Selected Species"
				},
				Default = "Any Species",
				Callback = v4732(v4557)
			})
			t216.fuseRarities = v4808:AddDropdown({
				Title = "Rarities to Fuse",
				Content = "Only fuse pets of these rarities. Leave empty for any rarity.",
				Options = v4524,
				Multi = true,
				Default = {},
				Callback = v4732(v4558)
			})
			v4808:AddSubSection("Only when Rule = Selected Species")
			t216.fuseSpecies = v4808:AddDropdown({
				Title = "Species to Fuse",
				Content = "Only these species go into the machine.",
				Options = v4522,
				Multi = true,
				Default = {},
				Callback = v4732(v4559)
			})

			local v4809 = v4799:AddSection("Equip & Collect")

			t216.autoEquipBest = v4809:AddToggle({
				Title = "Auto Equip Best",
				Content = "Keeps your strongest pets equipped as better ones hatch.",
				Default = false,
				Callback = v4732(v4552)
			})
			t216.autoClaimOffline = v4809:AddToggle({
				Title = "Collect Offline Income",
				Content = "Claims the money your base earned while you were away, as soon as there is any.",
				Default = false,
				Callback = v4732(v4553)
			})
			t216.autoBaseUpgrade = v4809:AddToggle({
				Title = "Auto Upgrade Base",
				Content = "Buys the next base tier the moment you can afford it.",
				Default = false,
				Callback = v4732(v4554)
			})
			t216.autoClaimAlmanac = v4809:AddToggle({
				Title = "Auto Claim Almanac",
				Content = "Redeems every Pet Index reward that is ready. This is the reward claim, not the steal objective.",
				Default = false,
				Callback = v4732(v4555)
			})
			t216.upgradeBaseOnce = v4809:AddButton({
				Title = "Upgrade Base Now",
				Content = "Buys one base tier right away.",
				Callback = v4732(function()
					local __SenaV4Upgrades = genv.__SenaV4Upgrades
					local v4811 = false
					local s18 = "Upgrades not ready"

					if __SenaV4Upgrades and type(__SenaV4Upgrades.upgradeBase) == "function" then
						v4811, s18 = __SenaV4Upgrades.upgradeBase()
					end

					local v4813 = SenaLibOverride
					local Notify = SenaLibOverride.Notify
					local t221 = {
						Title = "Base"
					}
					local content = v4811 and "Base upgraded"

					if not content then
						content = tostring(s18 or "Could not upgrade")
					end

					t221.Content = content
					t221.Duration = 3
					Notify(v4813, t221)
				end)
			})

			local __SenaV4ButterflyRuntime = genv.__SenaV4ButterflyRuntime
			local v4818 = v4804:AddSection("Butterfly Bloom")
			local v4819 = v4818:AddParagraph({
				Title = "Bloom Status",
				Content = "Reading the Bloom schedule..."
			})

			t216.bloomAutoNet = v4818:AddToggle({
				Title = "Auto Claim Net",
				Content = "Goes into the Enchanted Tree and claims your free Butterfly Net once.",
				Default = false,
				Callback = v4732(function(p1077)
					senaV4Config.ButterflyAutoNet = p1077 == true
				end)
			})
			t216.bloomAutoCatch = v4818:AddToggle({
				Title = "Auto Catch",
				Content = "During every Bloom (every 30 min, 5 min long) flies to the Enchanted Forest, equips the net and catches with the Catch Mode below.",
				Default = false,
				Callback = v4732(function(p1078)
					senaV4Config.ButterflyAutoCatch = p1078 == true
				end)
			})

			local v4820 = __SenaV4ButterflyRuntime and __SenaV4ButterflyRuntime.modeOptions() or { "Tween to Butterfly" }

			t216.bloomMode = v4818:AddDropdown({
				Title = "Catch Mode",
				Content = "Tween to Butterfly chases one butterfly at a time. Stand waits in the thickest part of the swarm, Zigzag sweeps back and forth across the forest, Circle loops around the swarm.",
				Options = v4820,
				Multi = false,
				Default = v4820[1],
				Callback = v4732(function(p1079)
					if __SenaV4ButterflyRuntime then
						__SenaV4ButterflyRuntime.setMode(p1079)
					end
				end)
			})
			t216.bloomTiers = v4818:AddDropdown({
				Title = "Catch Tiers",
				Content = "Only swing at these butterflies. Leave empty to catch every tier.",
				Options = __SenaV4ButterflyRuntime and __SenaV4ButterflyRuntime.tierOptions() or {
					"Radiant",
					"Amethyst",
					"Sapphire",
					"Emerald"
				},
				Multi = true,
				Default = {},
				Callback = v4732(function(p1080)
					if __SenaV4ButterflyRuntime then
						__SenaV4ButterflyRuntime.setTiers(v4320(p1080))
					end
				end)
			})
			t216.bloomEsp = v4818:AddToggle({
				Title = "Butterfly ESP",
				Content = "Shows every butterfly's tier and distance while a Bloom is live.",
				Default = false,
				Callback = v4732(function(p1081)
					senaV4Config.ButterflyEsp = p1081 == true
				end)
			})
			v4818:AddSubSection("Trade & Craft")
			t216.bloomAutoTrade = v4818:AddToggle({
				Title = "Auto Trade Up",
				Content = "After each Bloom, trades your butterflies up at the machine inside the Enchanted Tree.",
				Default = false,
				Callback = v4732(function(p1082)
					senaV4Config.ButterflyAutoTrade = p1082 == true
				end)
			})

			local v4821 = __SenaV4ButterflyRuntime and __SenaV4ButterflyRuntime.recipeOptions() or { "All Recipes" }

			t216.bloomRecipe = v4818:AddDropdown({
				Title = "Trade Recipe",
				Content = "Which trade Auto Trade Up runs. For Essence only trades up what the essence recipe is still short of.",
				Options = v4821,
				Multi = false,
				Default = v4821[1],
				Callback = v4732(function(p1083)
					if __SenaV4ButterflyRuntime then
						__SenaV4ButterflyRuntime.setRecipe(p1083)
					end
				end)
			})
			t216.bloomAutoCraft = v4818:AddToggle({
				Title = "Auto Craft Essence",
				Content = "After each Bloom, crafts Enchanted Essence at the shrine once you hold the full recipe.",
				Default = false,
				Callback = v4732(function(p1084)
					senaV4Config.ButterflyAutoCraft = p1084 == true
				end)
			})

			local function v4822(p1085, p1086, p1087, p1088)
				v4818:AddButton({
					Title = p1085,
					Content = p1086,
					Callback = v4732(function()
						if not __SenaV4ButterflyRuntime then
							return
						end

						task.spawn(function()
							__SenaV4ButterflyRuntime.manual = true

							local ok, result, result2 = pcall(p1087)

							__SenaV4ButterflyRuntime.manual = false

							if not ok then
								local v4826 = result

								result = false
								result2 = v4826
							end

							local v4827 = SenaLibOverride
							local Notify = SenaLibOverride.Notify
							local t222 = {
								Title = "Butterfly Bloom"
							}
							local content = result and p1088(result2)

							if not content then
								content = tostring(result2 or "Could not do that")
							end

							t222.Content = content
							t222.Duration = 4
							Notify(v4827, t222)
						end)
					end)
				})
			end

			v4822("Claim Net Now", "Claims the Butterfly Net right now.", function()
				return __SenaV4ButterflyRuntime.claimNet()
			end, function()
				return "Butterfly Net claimed"
			end)
			v4822("Trade Up Now", "Runs the trade recipe once, even with Auto Trade Up off.", function()
				return __SenaV4ButterflyRuntime.tradeUp()
			end, function(p1089)
				return ("Traded up %d time(s)"):format(tonumber(p1089) or 0)
			end)
			v4822("Craft Essence Now", "Crafts Enchanted Essence right now if you hold the full recipe.", function()
				return __SenaV4ButterflyRuntime.craft()
			end, function(p1090)
				return ("Crafted %d Enchanted Essence"):format(tonumber(p1090) or 0)
			end)
			task.spawn(function()
				while v16() do
					if __SenaV4ButterflyRuntime then
						pcall(function()
							local snap = __SenaV4ButterflyRuntime.snap
							local v4832 = __SenaV4ButterflyRuntime.tiers() or {}
							local v4833

							if snap.active then
								local v4834 = math.floor(snap.left or 0)

								v4833 = ("LIVE - ends in %dm %02ds"):format(math.floor(v4834 / 60), v4834 % 60)
							elseif snap.enabled == false then
								v4833 = "Disabled on this server"
							elseif snap.nextIn then
								local v4835 = math.floor(snap.nextIn)

								v4833 = ("Next in %dm %02ds"):format(math.floor(v4835 / 60), v4835 % 60)
							else
								v4833 = "Not running"
							end

							local t223 = {}

							for _, v in ipairs({
								"Golden",
								"Purple",
								"Blue",
								"Green"
							}) do
								t223[#t223 + 1] = ("%s %d"):format(v4832[v] and v4832[v].name or v, snap.counts and snap.counts[v] or 0)
							end

							v4819:SetContent(("%s\n%s  ·  Essence %d  ·  Caught %d\n%s\n%s"):format(v4833, snap.net and (snap.holding and "Net equipped" or "Net owned") or "No Butterfly Net", snap.essence or 0, snap.caught or 0, table.concat(t223, "  ·  "), tostring(__SenaV4ButterflyRuntime.status or "Idle")))
						end)
					end

					task.wait(1)
				end
			end)

			local v4839 = v4804:AddSection("Dr Scramble Event")

			v4839:AddParagraph({
				Title = "About This Event",
				Content = "Dr Scramble's shop, trade-in and boss still run while the event is live. The drones, lost parts and vault are gone from the game."
			})
			t216.scrambleBuy = v4839:AddToggle({
				Title = "Auto Buy Shop",
				Content = "Spends samples on the shop items you pick below, as soon as you can afford them.",
				Default = false,
				Callback = v4732(v4564)
			})
			t216.scrambleBuyList = v4839:AddDropdown({
				Title = "Shop Buy List",
				Content = "Which shop items Auto Buy should purchase. This list fills in once the event shop is open.",
				Options = t218,
				Multi = true,
				Default = {},
				Callback = v4732(v4565)
			})
			v4839:AddSubSection("Trade-In (Experimental Pets)")
			t216.scrambleTradeInTrade = v4839:AddToggle({
				Title = "Auto Trade-In",
				Content = "When the recipe's three requirements are covered, sacrifices the cheapest pet that fits each slot. Favorited, equipped, placed and fusing pets are never spent.",
				Default = false,
				Callback = v4732(function(p1091)
					senaV4Config.ScrambleTradeInTrade = p1091 == true
				end)
			})
			t216.scrambleTradeInReroll = v4839:AddToggle({
				Title = "Auto Free Reroll",
				Content = "When pets are missing and a free reroll is left, rerolls the recipe instead of waiting.",
				Default = false,
				Callback = v4732(function(p1092)
					senaV4Config.ScrambleTradeInReroll = p1092 == true
				end)
			})
			t216.scrambleTradeInBanners = v4839:AddDropdown({
				Title = "Target Banners",
				Content = "Only work the trade-in while one of these banners is up. Leave empty to accept any banner.",
				Options = {
					"Biohazard Pets",
					"Experimental Pets",
					"Unstable DNA"
				},
				Multi = true,
				Default = {},
				Callback = v4732(v4545)
			})
			v4839:AddButton({
				Title = "Trade-In Once",
				Content = "Runs one sacrifice right now, even with Auto Trade-In off.",
				Callback = v4732(function()
					local __SenaV4ScrambleTradeIn = genv.__SenaV4ScrambleTradeIn
					local v4841 = false
					local s19 = "Trade-In not ready"

					if __SenaV4ScrambleTradeIn then
						v4841, s19 = __SenaV4ScrambleTradeIn.tradeOnce()
					end

					SenaLibOverride:Notify({
						Title = "Dr Scramble",
						Content = v4841 and "Sacrifice complete" or tostring(s19),
						Duration = 4
					})
				end)
			})
			v4839:AddButton({
				Title = "Use Free Reroll",
				Content = "Spends one of today's free rerolls on a new recipe.",
				Callback = v4732(function()
					local __SenaV4ScrambleTradeIn = genv.__SenaV4ScrambleTradeIn
					local v4844 = false
					local s20 = "Trade-In not ready"

					if __SenaV4ScrambleTradeIn then
						v4844, s20 = __SenaV4ScrambleTradeIn.reroll()
					end

					SenaLibOverride:Notify({
						Title = "Dr Scramble",
						Content = v4844 and "Recipe rerolled" or tostring(s20),
						Duration = 4
					})
				end)
			})
			v4839:AddButton({
				Title = "Open Trade-In UI",
				Content = "Opens Dr Scramble's Lab window so you can pick pets by hand.",
				Callback = v4732(function()
					if not pcall(function()
						require(ReplicatedStorage.Client.Tabs).Activate("DrScrambleTradeIn")
					end) then
						SenaLibOverride:Notify({
							Title = "Dr Scramble",
							Content = "Could not open the trade-in window",
							Duration = 3
						})
					end
				end)
			})

			local v4846 = v4839:AddParagraph({
				Title = "Trade-In Status",
				Content = "Turn a trade-in toggle on to start reading the recipe."
			})

			task.spawn(function()
				while v16() do
					local __SenaV4ScrambleTradeIn = genv.__SenaV4ScrambleTradeIn

					if __SenaV4ScrambleTradeIn then
						pcall(function()
							v4846:SetContent(string.format([[%s  ·  %s
Rotates in %02d:%02d  ·  Pity %d/%d  ·  Free rerolls %d  ·  Traded %d
Recipe (%d/%d): %s
Held: %s
Missing: %s]], __SenaV4ScrambleTradeIn.banner, __SenaV4ScrambleTradeIn.status, math.floor(__SenaV4ScrambleTradeIn.rotation / 60), __SenaV4ScrambleTradeIn.rotation % 60, __SenaV4ScrambleTradeIn.pity, __SenaV4ScrambleTradeIn.pityMax, __SenaV4ScrambleTradeIn.free, __SenaV4ScrambleTradeIn.trades, __SenaV4ScrambleTradeIn.ready, __SenaV4ScrambleTradeIn.total, __SenaV4ScrambleTradeIn.demands, __SenaV4ScrambleTradeIn.stock, __SenaV4ScrambleTradeIn.missing))
						end)
					end

					task.wait(1)
				end
			end)
			v4839:AddSubSection("Boss Fight")
			t216.scrambleBossAuto = v4839:AddToggle({
				Title = "Auto Boss",
				Content = "When Dr Scramble's boss is live, walks into the arena portal, joins the fight, hits the nearest target with your bat and breaks free from grabs. The clear reward lands automatically. While Auto Steal is on and this is off, an accidental touch on the arena portal is bounced back out so your steal is never hijacked.",
				Default = false,
				Callback = v4732(function(p1093)
					senaV4Config.ScrambleBossAuto = p1093 == true

					if v612 and type(v612._reconcileScramblePortal) == "function" then
						pcall(v612._reconcileScramblePortal, v612)
					end
				end)
			})

			local v4848 = v4839:AddParagraph({
				Title = "Boss Status",
				Content = "Turn Auto Boss on. It sits idle until the boss event goes live."
			})

			task.spawn(function()
				while v16() do
					local __SenaV4ScrambleBoss = genv.__SenaV4ScrambleBoss

					if __SenaV4ScrambleBoss then
						pcall(function()
							v4848:SetContent(string.format("%s  ·  joins %d  ·  hits %d", tostring(__SenaV4ScrambleBoss.status), __SenaV4ScrambleBoss.joins or 0, __SenaV4ScrambleBoss.hits or 0))
						end)
					end

					task.wait(1)
				end
			end)

			local Treadmill = v4799:AddSection("Treadmill")

			t216.autoTreadmill = Treadmill:AddToggle({
				Title = "Auto Treadmill",
				Content = "Walks to your treadmill and farms speed whenever nothing else is running.",
				Default = false,
				Callback = v4732(v4529)
			})
			t216.treadmillUpgrade = Treadmill:AddToggle({
				Title = "Auto Upgrade Treadmill",
				Content = "Buys the next treadmill tier with cash as soon as you can afford it.",
				Default = false,
				Callback = v4732(v4535)
			})
		end

		do
			local v4851 = v4742:AddTab({
				Name = "Misc",
				Icon = "settings"
			})
			local Performance = v4851:AddSection("Performance")

			t216.startupBoost = Performance:AddToggle({
				Title = "Startup Boost",
				Content = "Lowers graphics when the script starts. Turn it off to get the graphics back; hidden pets and eggs return after a rejoin.",
				Default = true,
				Callback = v4732(v4717)
			})
			t216.boostFps = Performance:AddToggle({
				Title = "Boost FPS",
				Content = "Removes extra map details and other players' plots for more FPS.",
				Default = false,
				Callback = v4732(v4719)
			})
			t216.uncapFps = Performance:AddToggle({
				Title = "Uncap FPS",
				Content = "Raises the FPS cap to 240.",
				Default = true,
				Callback = v4732(v4720)
			})

			local Guard = v4851:AddSection("Guard")

			t216.antiGuardKnockback = Guard:AddToggle({
				Title = "Anti Guard Knockback",
				Content = "Cancels the knockback the Forest guard puts on you, so a hit never throws you off the lane.",
				Default = true,
				Callback = v4732(v4547)
			})
			t216.antiHitGuard = Guard:AddToggle({
				Title = "Anti Hit Guard",
				Content = "For eggs you pick up by hand. Pins you in the safe zone behind a look-alike clone until the guard goes back to sleep. Auto Steal has its own guard handling and always wins.",
				Default = false,
				Callback = v4732(v4726)
			})

			local Windows = v4851:AddSection("Windows")

			Windows:AddButton({
				Title = "Egg Logs",
				Content = "Live feed of every egg that spawns on the server.",
				Callback = v4732(function()
					senaPanels.openLogs()
				end)
			})
			Windows:AddButton({
				Title = "Egg Board",
				Content = "Sortable list of the eggs currently up for grabs.",
				Callback = v4732(function()
					senaPanels.openBoard()
				end)
			})
			Windows:AddButton({
				Title = "Inventory & Base",
				Content = "Your pets, eggs and plot status in one window.",
				Callback = v4732(function()
					senaPanels.openInventory()
				end)
			})
			Windows:AddButton({
				Title = "Egg Checker",
				Content = "Pick eggs off the field by hand, then send them all to the steal queue.",
				Callback = v4732(function()
					senaPanels.openChecker()
				end)
			})
			Windows:AddButton({
				Title = "Egg Data & History",
				Content = "Drop-table values per area, plus what has actually spawned this session.",
				Callback = v4732(function()
					senaPanels.openAnalyst()
				end)
			})
			Windows:AddButton({
				Title = "Open All Windows",
				SubTitle = "Close All Windows",
				Content = "Opens every window at once, or hides them again.",
				Callback = v4732(function()
					senaPanels.openAll()
				end),
				SubCallback = v4732(function()
					senaPanels.closeAll()
				end)
			})
			t216.antiTreadmill = v4851:AddSection("Blocker"):AddToggle({
				Title = "Anti Treadmill",
				Content = "Never stay on a treadmill: any mount is dropped right away, and Auto Treadmill is held off while this is on.",
				Default = false,
				Callback = v4732(v4530)
			})

			local v4855 = v4851:AddSection("Server Hop")

			t216.hopNoMatch = v4855:AddToggle({
				Title = "Hop When Nothing Matches",
				Content = "Hop to the emptiest server when no egg matches your filters.",
				Default = false,
				Callback = v4732(v4531)
			})
			v4855:AddSubSection("Limits")
			t216.hopCooldown = v4855:AddSlider({
				Title = "Hop Cooldown",
				Content = "Seconds between auto hops and wait after rejoining.",
				Min = 1,
				Max = 60,
				Default = 5,
				Increment = 1,
				Callback = v4732(v4534)
			})

			local v4856 = t216.privateTab:AddSection("Find Private Server", true)
			local v4857 = v4856:AddParagraph({
				Title = "Current Server",
				Content = "Checking..."
			})

			t216.privateServerMax = v4856:AddDropdown({
				Title = "Max Players",
				Content = "The most players you want in your server, you included. 2 (you + 1) is the easiest to find.",
				Options = {
					"1",
					"2",
					"3",
					"4",
					"5"
				},
				Default = "2",
				Multi = false,
				Callback = v4732(v4532)
			})
			v4856:AddButton({
				Title = "Hop Server Now",
				Content = "Moves you to a quieter server right away.",
				Callback = v4732(function()
					task.spawn(function()
						t145.hopPrivateOnce()
					end)
				end)
			})
			t216.privateServerAuto = v4856:AddToggle({
				Title = "Auto Hop",
				Content = "Keeps moving you to quieter servers until the player count is at or under your max.",
				Default = false,
				Callback = v4732(v4533)
			})
			task.spawn(function()
				local v4858

				while v16() do
					local v4859 = "Now: " .. #Players:GetPlayers() .. " player(s)  ·  Max: " .. t145.privateMax() .. "\n" .. tostring(t145.privateStatus or "")

					if v4859 ~= v4858 then
						v4858 = v4859
						pcall(function()
							v4857:SetContent(v4859)
						end)
					end

					task.wait(1)
				end
			end)

			local Roaming = v4851:AddSection("Roaming")

			t216.waypoint = Roaming:AddDropdown({
				Title = "Waypoint",
				Content = "Pick a place, then hit Teleport below.",
				Options = t217,
				Default = t217[1],
				Callback = v4732(function(p1094)
					u4745 = p1094
				end)
			})
			Roaming:AddButton({
				Title = "Teleport To Waypoint",
				Content = "Moves you straight to the waypoint you picked.",
				Callback = v4732(function()
					local __SenaV4Roaming = genv.__SenaV4Roaming
					local v4862 = false

					if __SenaV4Roaming and type(__SenaV4Roaming.teleportWaypoint) == "function" then
						v4862 = __SenaV4Roaming.teleportWaypoint(u4745) == true
					end

					SenaLibOverride:Notify({
						Title = "Waypoint",
						Content = v4862 and "Moved to " .. tostring(u4745) or "That waypoint is not in this server",
						Duration = 3
					})
				end)
			})

			local v4863 = v4851:AddSection("Run Once")

			v4863:AddButton({
				Title = "Place Everything Now",
				Content = "Runs one pass of Auto Place, even while the toggle is off.",
				Callback = v4732(function()
					runOnce("AutoPlace", t24.AutoPlaceLoop)
				end)
			})
			v4863:AddButton({
				Title = "Hatch Everything Ready",
				Content = "Runs one pass of Auto Hatch, even while the toggle is off.",
				Callback = v4732(function()
					runOnce("AutoHatch", t24.AutoHatchLoop)
				end)
			})
			v4863:AddButton({
				Title = "Sell Pets Now",
				Content = "Runs one pass of Auto Sell Pet using the filters above.",
				Callback = v4732(function()
					runOnce("AutoSell", t24.startAutoSellLoop)
				end)
			})
			v4863:AddButton({
				Title = "Sell Eggs Now",
				Content = "Runs one pass of Auto Sell Egg using the filters above.",
				Callback = v4732(function()
					runOnce("AutoSellEgg", t24.startAutoSellEggLoop)
				end)
			})

			local Session = v4851:AddSection("Session")

			t216.bottingMode = Session:AddToggle({
				Title = "Botting Mode",
				Content = "Turns off 3D rendering and covers the screen in black. Everything keeps running, your GPU does not.",
				Default = false,
				Callback = v4732(v4561)
			})
			t216.antiCutscene = Session:AddToggle({
				Title = "Anti Cutscene",
				Content = "Closes event cutscenes and the intro as soon as the game opens them, so nothing locks your camera.",
				Default = false,
				Callback = v4732(v4562)
			})
			Session:AddButton({
				Title = "Rejoin This Server",
				Content = "Teleports you back into the exact server you are in now.",
				Callback = v4732(function()
					pcall(function()
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
					end)
				end)
			})
			Session:AddButton({
				Title = "Stop & Unload",
				Content = "Turns every loop off and closes the hub. Run the script again to bring it back.",
				Callback = v4732(function()
					for _, v in ipairs({
						"AutoSteal",
						"AutoPlace",
						"AutoHatch",
						"AutoSell",
						"AutoSellEgg",
						"StealPlayers",
						"AutoFavorite",
						"AutoFusePets",
						"AutoEquipBest",
						"AutoClaimOffline",
						"AutoBaseUpgrade",
						"AutoClaimAlmanac",
						"Noclip",
						"BottingMode",
						"AntiCutscene"
					}) do
						senaV4Config[v] = false
					end

					v4560(false)
					v4561(false)

					if v612 then
						pcall(v612.setEnabled, v612, false)
					end

					local __SenaV4HubShutdown = genv.__SenaV4HubShutdown

					if type(__SenaV4HubShutdown) == "function" then
						task.delay(0.2, function()
							pcall(__SenaV4HubShutdown)
						end)
					end
				end)
			})

			local Player = v4851:AddSection("Player")

			t216.antiAfk = Player:AddToggle({
				Title = "Anti AFK",
				Content = "Blocks the game's idle kick while the script runs.",
				Default = true,
				Callback = v4732(v4727)
			})
			t216.autoReconnect = Player:AddToggle({
				Title = "Auto Reconnect",
				Content = "Automatically reconnects you back to the server upon kick or disconnect.",
				Default = true,
				Callback = v4732(v4728)
			})
			t216.autoExecute = Player:AddToggle({
				Title = "Auto Execute (Rejoin)",
				Content = "Prepares the bootstrapper so the script runs automatically after teleport or reconnect.",
				Default = false,
				Callback = v4732(v4729)
			})
		end

		do
			local v4869 = v4742:AddTab({
				Name = "Steal Players",
				Icon = "swords"
			})
			local v4870 = v4869:AddSection("Auto Steal")

			t216.stealPlayers = v4870:AddToggle({
				Title = "Auto Steal From Players",
				Content = "Chases anyone carrying an egg in the field, bats them until the egg drops, grabs it and banks it. A carrier is only chased when the egg clears the filters below.",
				Default = false,
				Callback = v4732(v4734)
			})
			t216.stealPlayerRarities = v4870:AddDropdown({
				Title = "Rarity Filter",
				Content = "Only chase eggs of these rarities. Empty = uses the Auto Steal rarity filter.",
				Options = v4524,
				Multi = true,
				Default = {},
				Callback = v4732(v4735)
			})
			t216.stealPlayerValue = v4870:AddInput({
				Title = "Minimum Value",
				Content = "Skip carriers holding less than this per second. Supports k, m and b.",
				Placeholder = "e.g. 500k, 2m, 1b",
				Default = "",
				Callback = v4732(v4736)
			})

			local v4871 = v4869:AddSection("Steal From Specific Player", true)
			local v4872 = v4869:AddSection("Steal History", true)
			local v4873
			local v4874

			if v4871.AddActionList then
				v4873 = v4871:AddActionList({
					Title = "Players in this server",
					EmptyText = "Nobody else is in this server.",
					VisibleRows = 6,
					ButtonWidth = 76
				})
				v4874 = v4872:AddActionList({
					Title = "History of stolen eggs from players",
					EmptyText = "No player steals yet.",
					VisibleRows = 5,
					ButtonWidth = 72
				})
			else
				v4871:AddParagraph({
					Title = "Update required",
					Content = "This Sena UI build has no player list yet. Rejoin to pull the latest version."
				})
			end

			v4872:AddButton({
				Title = "Clear History",
				Content = "Wipe the list above.",
				Callback = v4732(function()
					if __SenaV4PlayerSteal then
						__SenaV4PlayerSteal:clearHistory()
					end
				end)
			})

			if __SenaV4PlayerSteal and v4873 then
				local __SenaV4IdentitySetter = genv.__SenaV4IdentitySetter
				local __SenaV4UICapabilityIdentity = genv.__SenaV4UICapabilityIdentity or 8

				local function v4877(p1095)
					if __SenaV4IdentitySetter then
						pcall(__SenaV4IdentitySetter, __SenaV4UICapabilityIdentity)
					end

					if not v4874 or not v4874:Alive() then
						return
					end

					local t224 = {}

					for i, v in ipairs(p1095.history) do
						t224[i] = {
							id = tostring(i),
							name = v.player,
							sub = string.format("<font color=\"#A2A2AE\">%s</font>", os.date("!%H:%M:%S", v.at)),
							status = v.egg,
							statusSub = v.outcome,
							button = false
						}
					end

					v4874:Update(t224)
				end

				__SenaV4PlayerSteal:onChanged(v4877)
				v4877(__SenaV4PlayerSteal)
				task.spawn(function()
					while genv.__SenaV4PlayerSteal == __SenaV4PlayerSteal do
						local ok, result = pcall(function()
							local v4883 = __SenaV4PlayerSteal:listEntries()

							if __SenaV4IdentitySetter then
								pcall(__SenaV4IdentitySetter, __SenaV4UICapabilityIdentity)
							end

							if v4873:Alive() then
								v4873:Update(v4883)
							end
						end)

						if not ok then
							warn("[Sena Steal] Player list update loop error:", result)
						end

						task.wait(1)
					end
				end)
			end
		end

		v4742:AddTab({
			Name = "Live Chat",
			Icon = "chat"
		}):AddSection("Global Chat", true):AddLiveChat({
			Title = "Live Chat",
			Height = 300
		})

		if type(v4742.AddForum) == "function" then
			v4742:AddForum({
				Name = "Forum",
				Icon = "forum",
				Section = "Config Forum"
			})
		end

		do
			local __SenaV4Visual = genv.__SenaV4Visual
			local v4885 = v4742:AddTab({
				Name = "Visual",
				Icon = "eye"
			})
			local t225 = {
				rods = nil,
				fish = nil
			}
			local v4887

			local function v4888()
				if v4887 and __SenaV4Visual then
					pcall(function()
						v4887:SetContent(__SenaV4Visual.status)
					end)
				end
			end
			local function v4889(p1096)
				if not __SenaV4Visual then
					return
				end

				task.spawn(function()
					__SenaV4Visual.spawn(p1096, t225[p1096])
					v4888()
					SenaLibOverride:Notify({
						Title = "Visual",
						Content = __SenaV4Visual.status,
						Duration = 3
					})
				end)
				task.delay(0.1, v4888)
			end

			local v4890 = v4885:AddSection("Fish It")

			v4890:AddSubSection("Rods")

			local v4891 = v4890:AddDropdown({
				Title = "Select Rod",
				Content = "Rods and skins from Fish It. Loading list...",
				Options = {},
				Multi = false,
				Default = nil,
				Callback = v4732(function(p1097)
					t225.rods = p1097
				end)
			})

			v4890:AddButton({
				Title = "Spawn Rod",
				Content = "Downloads the rod and puts it in your backpack. Equip it like a bat. Only you can see it.",
				Callback = v4732(function()
					v4889("rods")
				end)
			})
			v4890:AddSlider({
				Title = "Rod Size",
				Content = "1 = the size it has in Fish It. Spawned rods update right away.",
				Min = 0.5,
				Max = 2,
				Default = 1,
				Increment = 0.1,
				Callback = v4732(function(p1098)
					if not __SenaV4Visual or __SenaV4Visual.rodScale == p1098 then
						return
					end

					__SenaV4Visual.rodScale = p1098
					task.spawn(__SenaV4Visual.respawn, "rods")
				end)
			})
			v4890:AddSubSection("Fish")

			local v4892 = v4890:AddDropdown({
				Title = "Select Fish",
				Content = "Secret and Forgotten fish from Fish It. Loading list...",
				Options = {},
				Multi = false,
				Default = nil,
				Callback = v4732(function(p1099)
					t225.fish = p1099
				end)
			})

			v4890:AddButton({
				Title = "Spawn Fish",
				Content = "Downloads the fish and puts it in your backpack under Pets. Only you can see it.",
				Callback = v4732(function()
					v4889("fish")
				end)
			})
			v4890:AddSlider({
				Title = "Fish Weight",
				Content = "0% = lightest catch, 100% = heaviest Big catch. Size follows Fish It: weight / min weight.",
				Min = 0,
				Max = 100,
				Default = 0,
				Increment = 5,
				Callback = v4732(function(p1100)
					local fishWeight = (tonumber(p1100) or 0) / 100

					if not __SenaV4Visual or __SenaV4Visual.fishWeight == fishWeight then
						return
					end

					__SenaV4Visual.fishWeight = fishWeight
					task.spawn(__SenaV4Visual.respawn, "fish")
				end)
			})
			v4890:AddSubSection("Manage")
			v4887 = v4890:AddParagraph({
				Title = "Status",
				Content = "Idle"
			})
			v4890:AddButton({
				Title = "Remove All Visual Items",
				Content = "Takes every spawned rod and fish out of your backpack.",
				Callback = v4732(function()
					if __SenaV4Visual then
						__SenaV4Visual.clear()
					end

					v4888()
				end)
			})
			task.spawn(function()
				if not __SenaV4Visual then
					return
				end

				local rods = __SenaV4Visual.names("rods")
				local fish = __SenaV4Visual.names("fish")

				pcall(function()
					v4891:Refresh(rods)
				end)
				pcall(function()
					v4892:Refresh(fish)
				end)
				__SenaV4Visual.status = #rods > 0 and string.format("%d rods and %d fish available", #rods, #fish) or "Could not load the item list. Try again later."
				v4888()
			end)

			local v4896 = v4885:AddSection("Steal an Egg")
			local s21 = "Egg"
			local n84 = 50
			local Egg = genv.__SenaV4VisualSAE and genv.__SenaV4VisualSAE.categories("Egg") or {}
			local u4900 = Egg[1]

			v4896:AddDropdown({
				Title = "Type",
				Content = "Egg shows in the Eggs tab, Pet under Pets. Both are fake and local-only.",
				Options = {
					"Egg",
					"Pet"
				},
				Multi = false,
				Default = "Egg",
				Callback = v4732(function(p1101)
					s21 = p1101 or "Egg"
				end)
			})
			v4896:AddDropdown({
				Title = "Select Egg / Pet",
				Content = "Which egg or pet to spawn.",
				Options = Egg,
				Multi = false,
				Default = Egg[1],
				MaxVisible = 8,
				Callback = v4732(function(p1102)
					u4900 = p1102
				end)
			})
			v4896:AddSlider({
				Title = "Size / Flex",
				Content = "Bigger = heavier Kg & higher value (Kg = base weight x scale^3) AND a bigger egg in your hand. 50 hits the billions.",
				Min = 1,
				Max = 100,
				Default = 50,
				Increment = 1,
				Callback = v4732(function(p1103)
					n84 = tonumber(p1103) or 50
				end)
			})
			v4896:AddButton({
				Title = "Hold in Hand",
				Content = "Spawns a model of it in your hand. Press again for more. (In-hand only - use the other button to also add it to All Items.)",
				Callback = v4732(function()
					local __SenaV4VisualSAE = genv.__SenaV4VisualSAE

					if __SenaV4VisualSAE then
						__SenaV4VisualSAE.spawn(s21, u4900, n84, true)
					end
				end)
			})
			v4896:AddButton({
				Title = "Add to Backpack (Kg)",
				Content = "Drops it in All Items (eggs) or Pets with a huge Kg for the inventory flex. Press again for more.",
				Callback = v4732(function()
					local __SenaV4VisualSAE = genv.__SenaV4VisualSAE

					if __SenaV4VisualSAE then
						__SenaV4VisualSAE.spawn(s21, u4900, n84, false)
					end
				end)
			})
			v4896:AddButton({
				Title = "Remove Egg / Pet Visuals",
				Content = "Takes every spawned fake egg/pet and held model out.",
				Callback = v4732(function()
					local __SenaV4VisualSAE = genv.__SenaV4VisualSAE

					if __SenaV4VisualSAE then
						__SenaV4VisualSAE.clear()
					end
				end)
			})
		end

		v4742:AddTab({
			Name = "Donate",
			Icon = "donator"
		}):AddSection("Support Sena", true):AddSupportCard({})

		do
			local function v4904(p1104, p1105)
				v4730()

				if type(p1104) == "table" and p1104.Value ~= nil then
					pcall(p1105, p1104.Value)
				end
			end

			v4731 = false
			v4904(t216.speed, v4537)
			v4904(t216.stealMode, v4536)
			v4904(t216.stealHold, v4527)
			v4904(t216.antiTreadmill, v4530)
			v4904(t216.autoTreadmill, v4529)
			v4904(t216.treadmillUpgrade, v4535)
			v4904(t216.hopCooldown, v4534)
			v4904(t216.hopNoMatch, v4531)
			v4904(t216.privateServerMax, v4532)
			v4904(t216.privateServerAuto, v4533)
			v4904(t216.names, function(p1106)
				v4538("names", "name", p1106)
			end)
			v4904(t216.areas, function(p1107)
				v4538("areas", "area", p1107)
			end)
			v4904(t216.rarities, function(p1108)
				v4538("rarities", "rarity", p1108)
			end)
			v4904(t216.value, v4539)
			v4904(t216.autoIndex, v4737)
			v4904(t216.scrambleBuy, v4564)
			v4904(t216.scrambleBuyList, v4565)
			v4904(t216.bloomAutoNet, function(p1109)
				senaV4Config.ButterflyAutoNet = p1109 == true
			end)
			v4904(t216.bloomAutoCatch, function(p1110)
				senaV4Config.ButterflyAutoCatch = p1110 == true
			end)
			v4904(t216.bloomEsp, function(p1111)
				senaV4Config.ButterflyEsp = p1111 == true
			end)
			v4904(t216.bloomAutoTrade, function(p1112)
				senaV4Config.ButterflyAutoTrade = p1112 == true
			end)
			v4904(t216.bloomAutoCraft, function(p1113)
				senaV4Config.ButterflyAutoCraft = p1113 == true
			end)
			v4904(t216.bloomTiers, function(p1114)
				local __SenaV4ButterflyRuntime = genv.__SenaV4ButterflyRuntime

				if __SenaV4ButterflyRuntime then
					__SenaV4ButterflyRuntime.setTiers(v4320(p1114))
				end
			end)
			v4904(t216.bloomRecipe, function(p1115)
				local __SenaV4ButterflyRuntime = genv.__SenaV4ButterflyRuntime

				if __SenaV4ButterflyRuntime then
					__SenaV4ButterflyRuntime.setRecipe(p1115)
				end
			end)
			v4904(t216.bloomMode, function(p1116)
				local __SenaV4ButterflyRuntime = genv.__SenaV4ButterflyRuntime

				if __SenaV4ButterflyRuntime then
					__SenaV4ButterflyRuntime.setMode(p1116)
				end
			end)
			v4904(t216.noclip, v4560)
			v4904(t216.bottingMode, v4561)
			v4904(t216.antiCutscene, v4562)
			v4904(t216.waypoint, function(p1117)
				u4745 = p1117
			end)
			v4904(t216.autoFavorite, v4548)
			v4904(t216.favoriteRule, v4549)
			v4904(t216.favoriteRarities, v4550)
			v4904(t216.favoriteSpecies, v4551)
			v4904(t216.autoFuse, v4556)
			v4904(t216.fuseRule, v4557)
			v4904(t216.fuseRarities, v4558)
			v4904(t216.fuseSpecies, v4559)
			v4904(t216.autoEquipBest, v4552)
			v4904(t216.autoClaimOffline, v4553)
			v4904(t216.autoBaseUpgrade, v4554)
			v4904(t216.autoClaimAlmanac, v4555)
			v4904(t216.mutations, v4540)
			v4904(t216.weight, v4541)
			v4904(t216.priority, v4542)
			v4904(t216.eggEsp, v4543)
			v4904(t216.espDetails, v4544)
			v4904(t216.backpackRates, v4546)
			v4904(t216.antiGuardKnockback, v4547)
			v4904(t216.placeRarity, function(p1118)
				senaV4Config.PlaceRarities = v4320(p1118)
			end)
			v4904(v4519, function(p1119)
				senaV4Config.SellNames = v4320(p1119)
			end)
			v4904(v4520, function(p1120)
				senaV4Config.SellRarities = v4320(p1120)
			end)
			v4904(v4521, function(p1121)
				senaV4Config.SellEggRarities = v4320(p1121)
			end)
			v4904(t216.sellPetValue, v4576)
			v4904(t216.sellEggValue, v4577)
			v4904(t216.godMode, v4528)
			v4904(t216.antiAfk, v4727)
			v4904(t216.autoReconnect, v4728)
			v4904(t216.autoExecute, v4729)
			v4904(t216.antiHitGuard, v4726)
			v4904(t216.flyForCapture, v4722)
			v4904(t216.autoStealCapture, v4724)
			v4904(t216.instantGrab, v4723)
			v4904(t216.infiniteJump, v4725)
			v4904(t216.uncapFps, v4720)
			v4904(t216.startupBoost, v4717)
			v4904(t216.autoPlace, v4566)
			v4904(t216.autoHatch, v4567)
			v4904(t216.mutationChoice, v4570)
			v4904(t216.mutationSpecies, v4571)
			v4904(t216.mutationRarity, v4572)
			v4904(t216.mutationRetry, v4573)
			v4904(t216.autoMutation, v4568)
			v4904(t216.autoRingEvent, v4569)
			v4904(t216.autoSell, v4574)
			v4904(t216.autoSellEgg, v4575)
			v4904(t216.stealPlayerRarities, v4735)
			v4904(t216.stealPlayerValue, v4736)
			v4904(t216.webhookUrl, v4739)
			v4904(t216.webhookRarities, v4740)
			v4904(t216.webhookValue, v4741)
			v4904(t216.webhookEnabled, v4738)
			v4904(t216.helpFriend, function(p1122)
				senaV4Config.HelpFriend = p1122 == true
			end)
			v4904(t216.autoSteal, v4526)
			v4904(t216.stealPlayers, v4734)
		end

		do
			genv.__SenaV4HubShutdown = function()
				if __SenaV4PlayerSteal then
					pcall(__SenaV4PlayerSteal.setEnabled, __SenaV4PlayerSteal, false)
				end

				for _, v in ipairs({
					"AutoSteal",
					"AutoPlace",
					"AutoHatch",
					"AutoMutation",
					"AutoRingEvent",
					"AutoSell",
					"AutoSellEgg",
					"StealPlayers",
					"ScrambleBossAuto",
					"ButterflyAutoCatch",
					"ButterflyAutoNet",
					"ButterflyAutoTrade",
					"ButterflyAutoCraft"
				}) do
					senaV4Config[v] = false
				end

				if v612 then
					pcall(v612.setEnabled, v612, false)
				end
			end
		end
	end

	v4315()
end
