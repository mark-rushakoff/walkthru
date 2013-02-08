#!/usr/bin/env ruby

require 'walkthru'

w = Walkthru.create

w.say "I'm going to help you choose something to eat."

w.instruct "First, take a moment and figure out if it's close to time for a meal."

if w.no_yes 'Is it around breakfast time?'
  if w.yes_no 'Would you like a high-fiber breakfast?'
    w.say 'You should eat some shredded wheat.'
  else
    w.say 'You should eat an egg.  Be sure to cook it first!'
  end
elsif w.no_yes 'Is it around lunch time?'
  if w.yes_no 'Does Mexican food sound good right now?'
    w.say 'You should eat a burrito.'
  else
    w.say 'You should eat a peanut butter and jelly sandwich.'
  end
elsif w.no_yes 'Is it around dinner time?'
  if w.no_yes 'Do you want an expensive dinner?'
    w.say 'You should eat lobster and steak.'
  else
    w.say 'You should eat some ramen.'
  end
else
  w.say 'Okay, you must want a snack.'

  if w.yes_no 'Do you want a healthy snack?'
    w.say 'You should eat a banana.'
  else
    w.say 'You should eat a chocolate bar.'
  end
end
