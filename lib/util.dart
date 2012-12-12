// Copyright 2012 Manuel Cerón <ceronman@gmail.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of cocos;

class EventListeners implements EventListenerList {
  var listeners;

  EventListeners() {
    this.listeners = [];
  }

  EventListeners add(EventListener handler, [bool useCapture=false]) {
    this.listeners.add(handler);
    return this;
  }

  EventListeners remove(EventListener handler, [bool useCapture=false]) {
    var index = listeners.indexOf(handler);
    listeners.removeRange(index, index);
    return this;
  }

  bool dispatch(Event event) {
    listeners.forEach((fn) {fn(event);});
    return true;
  }
}