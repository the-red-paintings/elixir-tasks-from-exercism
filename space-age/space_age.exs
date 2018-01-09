defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @earth_year 365.25
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    days = seconds / (3600 * 24)
    case planet do
      :mercury ->  (days / @earth_year) / 0.2408467
      :venus ->  (days / @earth_year) / 0.61519726
      :earth ->  (days / @earth_year)
      :mars ->  (days / @earth_year) / 1.8808158
      :jupiter ->  (days / @earth_year) / 11.862615
      :saturn ->  (days / @earth_year) / 29.447498
      :uranus ->  (days / @earth_year) / 84.016846
      :neptune ->  (days / @earth_year) / 164.79132
      _ -> {:error, "invalid planet"}
    end
  end
end
