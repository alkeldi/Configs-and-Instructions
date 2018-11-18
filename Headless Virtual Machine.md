
Virtual Box

#Install ssh server on the virtual machine
	
  `(client dependent)`

#Setup Port Forwarding 

` vboxmanage modifyvm "VM_NAME" --natpf1 "ssh,tcp,,3022,,22" `

#Start the virtual machine in the background

`vboxmanage startvm "VM_NAME"  --type headless`

#ssh to the virtual machine

`ssh -p 3022 127.0.0.1`

#Poweroff the virtual machine

`VBoxManage controlvm "VM_NAME" poweroff`
