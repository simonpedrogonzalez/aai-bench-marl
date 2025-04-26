
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



gitkraken://repolink/116ce095680974c27a01a8cca6bc3bc286386ec2/commit/747e0c4cb0620301ad87fab72034614e267c69be?url=https%3A%2F%2Fgithub.com%2Ffacebookresearch%2FBenchMARL.git
