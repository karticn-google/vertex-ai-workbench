#!/bin/bash
cd /home/jupyter
git clone https://github.com/statmike/vertex-ai-mlops.git
sudo chown -R jupyter vertex-ai-mlops
sudo chgrp -R jupyter vertex-ai-mlops