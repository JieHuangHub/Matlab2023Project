function v = OPTI_INEQUALITY()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = casadiMEX(0, 153);
  end
  v = vInitialized;
end
