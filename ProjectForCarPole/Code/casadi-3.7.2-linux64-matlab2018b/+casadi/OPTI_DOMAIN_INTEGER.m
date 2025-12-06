function v = OPTI_DOMAIN_INTEGER()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = casadiMEX(0, 161);
  end
  v = vInitialized;
end
