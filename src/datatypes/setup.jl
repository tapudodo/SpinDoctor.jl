abstract type Setup end

Base.@kwdef struct SphereSetup <: Setup
    name::String
    ncell::Int
    rmin::Float64
    rmax::Float64
    dmin::Float64
    dmax::Float64
    include_in::Bool
    in_ratio::Float64
    ecs_shape::String
    ecs_ratio::Float64
    refinement::Union{Float64,Nothing} = nothing
    D_in::SMatrix{3, 3, Float64}
    D_out::SMatrix{3, 3, Float64}
    D_ecs::SMatrix{3, 3, Float64}
    T₂_in::Float64
    T₂_out::Float64
    T₂_ecs::Float64
    ρ_in::Float64
    ρ_out::Float64
    ρ_ecs::Float64
    κ_in_out::Float64
    κ_out_ecs::Float64
    κ_in::Float64
    κ_out::Float64
    κ_ecs::Float64
end

Base.@kwdef struct CylinderSetup <: Setup
    name::String
    ncell::Int
    rmin::Float64
    rmax::Float64
    dmin::Float64
    dmax::Float64
    height::Float64
    bend::Float64
    twist::Float64
    include_in::Bool
    in_ratio::Float64
    ecs_shape::String
    ecs_ratio::Float64
    refinement::Union{Float64,Nothing} = nothing
    D_in::SMatrix{3, 3, Float64}
    D_out::SMatrix{3, 3, Float64}
    D_ecs::SMatrix{3, 3, Float64}
    T₂_in::Float64
    T₂_out::Float64
    T₂_ecs::Float64
    ρ_in::Float64
    ρ_out::Float64
    ρ_ecs::Float64
    κ_in_out::Float64
    κ_out_ecs::Float64
    κ_in::Float64
    κ_out::Float64
    κ_ecs::Float64
end

Base.@kwdef struct NeuronSetup <: Setup
    name::String
    ncell::Int = 1
    include_in::Bool = false
    in_ratio::Float64 = 0.0
    ecs_shape::String
    ecs_ratio::Float64
    refinement::Union{Float64,Nothing} = nothing
    D_in::SMatrix{3, 3, Float64}
    D_out::SMatrix{3, 3, Float64}
    D_ecs::SMatrix{3, 3, Float64}
    T₂_in::Float64
    T₂_out::Float64
    T₂_ecs::Float64
    ρ_in::Float64
    ρ_out::Float64
    ρ_ecs::Float64
    κ_in_out::Float64
    κ_out_ecs::Float64
    κ_in::Float64
    κ_out::Float64
    κ_ecs::Float64
end
