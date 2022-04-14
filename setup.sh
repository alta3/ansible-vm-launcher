echo Setting up your local machine

sudo apt install python3-pip -y
python3 -m pip install ansible
export PATH=$PATH:/home/$USER/.local/bin
echo "export PATH=$PATH:/home/$USER/.local/bin" >> ~/.bashrc
echo "where is ansible?"
which ansible

echo "Initialization Concluded"
