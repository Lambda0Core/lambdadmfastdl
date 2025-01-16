-- Send the VManip active state to the server
hook.Add("Think", "VManipStateCheck", function()
    if VManip and VManip.IsActive then
        local isActive = VManip:IsActive()

        -- Send the state to the server
        net.Start("VManipStateUpdate")
        net.WriteBool(isActive)
        net.SendToServer()
    end
end)
