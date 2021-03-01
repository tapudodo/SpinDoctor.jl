@with_kw struct CellSetup
    name::String
    shape::String = "cylinder"
    ncell::Int = 1
    rmin::Union{Float64, Nothing} = nothing
    rmax::Union{Float64, Nothing} = nothing
    dmin::Union{Float64, Nothing} = nothing
    dmax::Union{Float64, Nothing} = nothing
    deformation::Tuple{Float64, Float64} = (0., 0.)
    height::Union{Float64, Nothing} = nothing
    include_in::Bool = false
    in_ratio::Float64 = 0.
    include_ecs::Bool = false
    ecs_shape::String = "box"
    ecs_ratio::Float64 = 0.
    refinement::Union{Float64, Nothing} = nothing
end

function check_consistency(setup::CellSetup)
    if setup.shape == "neuron"
        @assert setup.ncell == 1
        @assert setup.deformation[1] ≈ 0.
        @assert setup.deformation[2] ≈ 0.
    elseif setup.shape == "cylinder"
        @assert setup.ncell ≥ 1
        @assert setup.height > 0.
        @assert setup.deformation[1] ≥ 0.
        @assert setup.deformation[2] ≥ 0.
        @assert 0. < setup.rmin ≤ setup.rmax < Inf
        @assert 0. < setup.dmin ≤ setup.dmax < Inf
    elseif setup.shape == "sphere"
        @assert setup.ncell ≥ 1
        @assert setup.deformation[1] ≈ 0.
        @assert setup.deformation[2] ≈ 0.
        @assert 0. < setup.rmin ≤ setup.rmax < Inf
        @assert 0. < setup.dmin ≤ setup.dmax < Inf
    else
        error("""CellSetup shape must be "sphere", "cylinder" or "neuron".""")
    end
    setup.include_in ? (@assert setup.in_ratio > 0.) : nothing
    @assert setup.ecs_shape ∈ ["no_ecs", "box", "convexhull", "tightwrap"]
end

@with_kw struct DomainSetup
    σ_in::Float64
    σ_out::Float64
    σ_ecs::Float64
    T₂_in::Float64 = Inf
    T₂_out::Float64 = Inf
    T₂_ecs::Float64 = Inf
    ρ_in::Float64
    ρ_out::Float64
    ρ_ecs::Float64
    κ_in_out::Float64
    κ_out_ecs::Float64
    κ_in::Float64
    κ_out::Float64
    κ_ecs::Float64
end

@with_kw struct BTPDE
    odesolver::DiffEqBase.DEAlgorithm = Trapezoid()
    reltol::Float64 = 1e-04
    abstol::Float64 = 1e-06
    nsave::Int = 1
end

@with_kw struct HADC
    odesolver::DiffEqBase.DEAlgorithm = Trapezoid()
    reltol::Float64 = 1e-04
    abstol::Float64 = 1e-06
end

@with_kw struct MF
    length_scale::Float64 = 0.
    neig_max::Int = Inf
    ninterval::Int = 100
end

@with_kw struct ExperimentSetup
    ndirection::Int = 1
    flat_dirs::Bool = false
    direction::Array{Float64} = [1.; 0.; 0.]
    sequences::Array{TimeProfile}
    values::Array{Float64}
    values_type::Char
    btpde::Union{BTPDE, Nothing} = nothing
    hadc::Union{HADC, Nothing} = nothing
    mf::Union{MF, Nothing} = nothing
end
