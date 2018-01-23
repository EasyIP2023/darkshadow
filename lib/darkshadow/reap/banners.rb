class Banners
  def self.rand_banner
    num = rand(1..5)
    (num == 1) ? dark_nuts : (num == 2) ? ds_banner : (num == 3) ? water_wet : (num == 4) ? prometheus : (num == 5) ? darkness_falls : ds_banner
  end

  def self.ds_banner
    `artii Dark Shadow`
  end

  def self.water_wet
    `artii Shadows  Dont  Get  Wet`
  end

  def self.dark_nuts
    `artii Dark Nuts`
  end

  def self.darkness_falls
    `artii Darkness Falls`
  end

  def self.prometheus
    `artii Prometheus Shadow`
  end
end
