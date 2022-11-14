. "/opt/Rust/.cargo/env"
export RUSTUP_HOME=/opt/Rust/.rustup
export CARGO_HOME=/opt/Rust/.cargo

export MACOSX_DEPLOYMENT_TARGET=13.0

alias gt='git clone --filter=tree:0 --depth=1 --single-branch'
alias daily='bun upgrade; rustup update; omz update --unattended; brew upgrade; brew cleanup; rdf;'
alias rdf='echo Comparing rustc -Z \<New vs Old\>: ; rustc -Z help|diff - ~/Desktop/rz.txt; echo Comparing rustc -C \<New vs Old\>: ; rustc -C help|diff - ~/Desktop/rc.txt; echo Comparing cargo -Z \<New vs Old\>: ; cargo -Z help|diff - ~/Desktop/cargo.txt'
alias rt='cargo clean && cargo br'
alias rla='rustc -Cllvm-args=--help|grep -i'
alias rdd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias rz='rustc -Z help|grep -i'
alias rc='rustc -C help|grep -i'
alias rv='rustup -V; cargo -Vv; rustc -Vv'
alias gi='grep -i'
alias pn='ps -alxmr|gi'

alias target='rustc -vV | grep -i host | cut -d: -f2'
