#!/usr/bin/env bash

# Copyright 2022 The Sigstore Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

pushd $(dirname "$0")/..
echo === Vendoring scripts
go mod vendor

source $(dirname "$0")/../vendor/knative.dev/hack/library.sh

go_update_deps "$@"

echo === Removing vendor/
rm -rf $REPO_ROOT_DIR/vendor/
