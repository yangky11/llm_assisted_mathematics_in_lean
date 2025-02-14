import Lake
open Lake DSL

def moreServerArgs := #[
  "-Dpp.unicode.fun=true", -- pretty-prints `fun a ↦ b`
  "-DautoImplicit=false",
  "-DrelaxedAutoImplicit=false"
]

-- These settings only apply during `lake build`, but not in VSCode editor.
def moreLeanArgs := moreServerArgs

package mil where
  moreServerArgs := moreServerArgs
  moreLinkArgs := #[
    "-L./.lake/packages/LeanInfer/.lake/build/lib",
    "-lonnxruntime", "-lctranslate2"
  ]

@[default_target]
lean_lib MIL where
  moreLeanArgs := moreLeanArgs

lean_lib Gcd where
  moreLeanArgs := moreLeanArgs

require mathlib from git "https://github.com/leanprover-community/mathlib4" @ "master"
require LeanInfer from git "https://github.com/lean-dojo/LeanInfer.git" @ "main"
