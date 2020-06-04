from setuptools import setup, find_packages

with open('requirements.txt') as f:
    requires = f.read().splitlines()

setup(
    name='xgaia resume',
    version='0.0.1',
    description='xgaia resume',
    classifiers=[
        "Programming Language :: Python",
        "Topic :: Internet :: WWW/HTTP",
    ],
    maintainer='Xavier Garnier',
    url='https://me.xgaia.fr',
    packages=find_packages(),
    include_package_data=True,
    install_requires=requires,
)
