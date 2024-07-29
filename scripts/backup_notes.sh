#!/bin/bash

rsync -av --exclude='.git/' ~/documents/zettelkasten/ ~/OneDriver/02_Dokumente/02_Notes/zettelkasten/
rsync -av --exclude='.git/' ~/documents/project_wiki/ ~/OneDriver/02_Dokumente/02_Notes/projects/
