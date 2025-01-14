setup = CylinderSetup(
    name = "cylinders/somecylinders",
    ncell = 2,
    rmin = 2.0,
    rmax = 6.0,
    dmin = 0.2,
    dmax = 0.3,
    bend = 0.0,
    twist = 0.0,
    height = 20.0,
    include_in = true,
    in_ratio = 0.6,
    ecs_shape = "convex_hull",
    ecs_ratio = 0.5,
    refinement = 1,
    D_in = 0.002 * I(3),
    D_out = 0.002 * I(3),
    D_ecs = 0.002 * I(3),
    T₂_in = Inf,
    T₂_out = Inf,
    T₂_ecs = Inf,
    ρ_in = 1.0,
    ρ_out = 1.0,
    ρ_ecs = 1.0,
    κ_in_out = 1e-3,
    κ_out_ecs = 1e-3,
    κ_in = 0.0,
    κ_out = 0.0,
    κ_ecs = 0.0,
)

experiment = Experiment(
    gradient = (
        directions = create_directions([0.0; 0.0; 1.0]),
        sequences = [PGSE(1000.0, 5000.0)],
        values = [2000.0],
        values_type = "b",
    ),
    btpde = (odesolver = QNDF(), reltol = 1e-4, abstol = 1e-6, nsave = 1),
    btpde_midpoint = (θ = 0.5, timestep = 5),
    # mf = (length_scale = 3, neig_max = 400, ninterval = 500),
    hadc = (odesolver = QNDF(), reltol = 1e-4, abstol = 1e-6),
    karger = (odesolver = MagnusGL6(), timestep = 5),
)
