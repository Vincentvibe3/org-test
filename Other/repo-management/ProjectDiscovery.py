import os 
import glob
import pathlib

dir_to_search = input()
path = dir_to_search
res = glob.glob("**/**.ioc", root_dir=path, recursive=True)
for path in res:
	print(pathlib.Path(path).absolute())
	print(pathlib.Path(path).parent.absolute())