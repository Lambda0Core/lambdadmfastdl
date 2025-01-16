-- Register the network message name (this should be in a server-side file)
util.AddNetworkString("VManipStateUpdate")

-----------------------------
-- Shotgun Pump Animation Replacement --
-----------------------------
if SERVER then
    -- Listen for the VManip state from the client
    net.Receive("VManipStateUpdate", function(len, ply)
        -- Get the VManip active state sent by the client
        local isVManipActive = net.ReadBool()

        -- Hook for player actions (like switching animations)
        hook.Add("PlayerPostThink", "ReplaceShotgunPumpAnimation", function(ply)
            if not ply:Alive() then return end

            local wep = ply:GetActiveWeapon()
            if not IsValid(wep) or wep:GetClass() ~= "weapon_shotgun" then return end

            local vm = ply:GetViewModel()
            if not IsValid(vm) then return end

            -- Get the current activity
            local currentActivity = vm:GetSequenceActivity(vm:GetSequence())

            -- Debug message to track VManip state
            if isVManipActive then
            else
            end

            -- Replace pump animation when VManip is active
            if currentActivity == ACT_SHOTGUN_PUMP and isVManipActive then
                -- Look up the custom animation sequence for VManip
                local customPumpSeq = vm:LookupSequence("ACT_SHOTGUN_PUMP_VMANIP") -- Replace "pump_vmanip" with your actual sequence name
                if customPumpSeq and customPumpSeq > 0 then
                    vm:SendViewModelMatchingSequence(customPumpSeq)
                    local duration = vm:SequenceDuration()

                    -- Adjust weapon timings to match the custom animation duration
                    wep:SetNextPrimaryFire(CurTime() + duration)
                    wep:SetNextSecondaryFire(CurTime() + duration)
                    wep:SetSaveValue("m_flTimeWeaponIdle", CurTime() + duration)
                    
                    -- Transition to the idle animation after the pump animation ends
                    timer.Simple(duration, function()
                        if IsValid(vm) and IsValid(wep) and ply:GetActiveWeapon() == wep then
                            local idleSeq = vm:LookupSequence("ACT_VM_IDLE")
                            if idleSeq then
                                vm:SendViewModelMatchingSequence(idleSeq)
                            end
                        end
                    end)
                end
            end
        end)
    end)
end
