docker-neovim-master
--------------------

Allows users to run neovim master without installing or building anything. Used
as the base image for running http://github.com/ThePrimeagen/vim-be-good in
docker.

Build steps:

- `docker build --no-cache -t brandoncc/neovim-master:latest .`
- `docker push brandoncc/neovim-master:latest`

