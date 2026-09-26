#!/usr/bin/env bash
set -e

BASE_URL="https://media.githubusercontent.com/media/rishikkotha/business-entity-resolution/main/6ab10eb3b23ba_student_resource/student_resource"

mkdir -p student_resource/dataset/train student_resource/dataset/test

files=(
  "dataset/train/train_ground_truth.tsv"
  "dataset/train/train_source1.tsv"
  "dataset/train/train_source2.tsv"
  "dataset/train/train_source3.tsv"
  "dataset/test/test_source1.tsv"
  "dataset/test/test_source2.tsv"
  "dataset/test/test_source3.tsv"
)

for f in "${files[@]}"; do
  dest="student_resource/$f"
  if [ -s "$dest" ]; then
    echo "Already exists: $dest"
  else
    echo "Downloading $f..."
    curl -f -C - -sL "$BASE_URL/$f" -o "$dest.tmp"
    mv "$dest.tmp" "$dest"
    echo "Completed $f: $(ls -lh "$dest" | awk '{print $5}')"
  fi
done

echo "All dataset files downloaded successfully!"
