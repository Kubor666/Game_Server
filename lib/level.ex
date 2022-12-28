defmodule SampleLevel do
  def level do
    %{
      {0,0} => :wall,
      {0,1} => :floor,
      {0,2} => :wall,
      {0,3} => :floor,
      {0,4} => :wall,
      {1,0} => :floor,
      {1,1} => :floor,
      {1,2} => :floor,
      {1,3} => :floor,
      {1,4} => :floor,
      {2,0} => :floor,
      {2,1} => :floor,
      {2,2} => :floor,
      {2,3} => :floor,
      {2,4} => :floor,
      {3,0} => :floor,
      {3,1} => :floor,
      {3,2} => :floor,
      {3,3} => :floor,
      {3,4} => :floor,
      {4,0} => :wall,
      {4,1} => :floor,
      {4,2} => :wall,
      {4,3} => :floor,
      {4,4} => :wall,
    }
  end
end
