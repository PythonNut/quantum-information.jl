bloch(θ, ϕ) = [cos(θ/2), exp(ϕ*im) * sin(θ/2)]
dephase(ψ) = exp(-angle(ψ[1]) * im) .* ψ

function unbloch(ψ)
    ψ = dephase(ψ)
    θ = 2acos(ψ[1])
    φ = angle(ψ[2]/sqrt(1-ψ[1]^2))
    return θ, φ
end

⊗(A::AbstractArray, B::AbstractArray) = kron(A, B)

cnot = [1 0 0 0
        0 1 0 0
        0 0 0 1
        0 0 1 0]

H = [1 1; 1 -1]/sqrt(2)
X = [0 1; 1 0]

o = [0, 1]
z = [1, 0]
p = H * o
m = H * z

p_i = [1, im]/sqrt(2)
m_i = [1, -im]/sqrt(2)

Rz(β) = [exp(-β/2 * im) 0 ; 0 exp(β/2 * im)]
Ry(Δ) = [cos(Δ/2) -sin(Δ/2); sin(Δ/2) cos(Δ/2)]
