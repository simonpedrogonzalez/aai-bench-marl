
# from 0:
uv init --python 3.11
uv add dm-meltingpot vmas

# using current pyproject.toml
uv sync

mkdir thirdparty
cd thirdparty
git clone https://github.com/facebookresearch/BenchMARL.git
cd ..
uv pip install -e thirdparty/BenchMARL

git clone https://github.com/pytorch/tensordict.git
cd tensordict
git checkout 3a0a8bb

cd ../..
uv pip install -e thirdparty/tensordict

