Trash.define "test_motors" do
  5.times do
    press(:a, 200)
    press(:x, 200)
    press(:home, 200)
  end
end

Trash.define "zero_motors" do
  motor_angle(:a, 90)
  motor_angle(:x, 90)
  motor_angle(:home, 90)
end

Trash.define "test_a" do
  10.times do
    press(:a, 200)
  end
end

Trash.define "test_x" do
  10.times do
    press(:x, 200)
  end
end

Trash.define "test_home" do
  10.times do
    press(:home, 200)
  end
end

Trash.define "test_up" do
  10.times do
    press(:up, 200)
  end
end

Trash.define "test_right" do
  10.times do
    press(:right, 200)
  end
end