FROM fedora

WORKDIR /home/app/resume
RUN dnf install -y make pandoc texlive-collection-context && dnf clean all