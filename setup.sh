uv init --python 3.11
uv add dm-meltingpot vmas

cd thirdparty
git clone BenchMARL

uv pip install -e thirdparty/BenchMARL

git clone https://github.com/pytorch/tensordict.git

cd thirdparty/tensordict
git checkout 3a0a8bb
cd ../..
uv pip install -e thirdparty/tensordict

