#!/usr/bin/env bash
# Create svg or png diagrams from current model and controller

set -e
set -o pipefail

if  ! type dot > /dev/null 2>&1  ; then
  echo "You need to install graphviz on your system."
else
  # Diagram the controllers
  echo "Writing controller diagram"
  railroady -i -l -a --alphabetize -o controllers.dot -C
  neato -Tsvg controllers.dot > controllers.svg
  neato -Tpng controllers.dot > controllers.png
  rm controllers.dot

  # Diagram the models
  echo "Writing model diagram"
  railroady -i -l -a --show-belongs_to -o models.dot -M
  dot -Tpng models.dot > models.png
  dot -Tsvg models.dot > models.svg
  rm models.dot
fi

