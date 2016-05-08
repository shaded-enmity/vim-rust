FROM fedora-rust
MAINTAINER Pavel Odvody <podvody@redhat.com>

ENTRYPOINT ["/usr/bin/vim"]
ENV RUST_SRC_PATH="/home/fedora/.multirust/toolchains/stable/src/"
ENV PATH="/home/fedora/.multirust/toolchains/stable/cargo/bin:$PATH"
COPY Makefile /home/fedora/.multirust/
COPY .vimrc /home/fedora/

USER root
RUN dnf remove -y vim-minimal && dnf install -y vim make

USER fedora
RUN multirust default stable\
 && cd /home/fedora/.multirust/ && make toolchains/stable/src\
 && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim\
 && vim +PluginInstall! +qall!\
 && cargo install racer
