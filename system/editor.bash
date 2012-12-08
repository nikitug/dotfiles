#!/bin/bash

if $(which mvim &>/dev/null)
then
  export EDITOR="mvim"
elif $(which gvim &>/dev/null)
then
  export EDITOR="gvim"
else
  export EDITOR="vim"
fi
