Facter.add(:is_puppetserver) do
  setcode do
  Facter.value(:fqdn) == 'puppet.minsk.epam.com'
  end
end
