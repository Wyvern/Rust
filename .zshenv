. "/opt/Rust/.cargo/env"
export RUSTUP_HOME=/opt/Rust/.rustup
export CARGO_HOME=/opt/Rust/.cargo

alias gt='git clone --filter=tree:0 --depth=1 --single-branch'
alias daily='bun upgrade; rustup update; omz update --unattended; brew upgrade;'
alias ruster='cargo clean && cargo br'
alias rdd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias rz='rustc -Z help|grep -i'
alias rc='rustc -C help|grep -i'
alias rv='rustup -V; cargo -Vv; rustc -Vv'
