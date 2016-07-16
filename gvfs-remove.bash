#!/bin/bash
echo "fixing gvfs problem.."
sudo umount ~/.gvfs
sudo rm -rf .gvfs/

echo "done!"
