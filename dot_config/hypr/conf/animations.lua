-- =========================================================================
-- Animations
-- =========================================================================
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0.0 }, { 0, 1.0 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1.0 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0.0 }, { 0.8, 0.15 } } })

hl.curve("winIn", { type = "spring", mass = 1, stiffness = 350, dampening = 35 })
hl.curve("winOut", { type = "spring", mass = 1, stiffness = 320, dampening = 32 })
hl.curve("winMove", { type = "spring", mass = 1, stiffness = 300, dampening = 30 })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, spring = "winIn", style = "popin 85%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, spring = "winOut", style = "popin 85%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, spring = "winMove", style = "slide" })

hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "md3_standard" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 2, bezier = "md3_standard" })

hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3, bezier = "md3_decel", style = "slidefade 15%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3, bezier = "md3_accel", style = "slidefade 15%" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3, bezier = "md3_decel", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 3, bezier = "md3_accel", style = "slide top" })

hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "md3_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2, bezier = "md3_accel" })
