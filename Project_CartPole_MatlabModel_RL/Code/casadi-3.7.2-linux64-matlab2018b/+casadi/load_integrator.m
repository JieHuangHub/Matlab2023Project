function varargout = load_integrator(varargin)
    %LOAD_INTEGRATOR [INTERNAL] 
    %
    %  LOAD_INTEGRATOR(char name)
    %
    %Explicitly load a plugin dynamically.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L126
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L126-L128
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(838, varargin{:});
end
