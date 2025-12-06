function varargout = has_integrator(varargin)
    %HAS_INTEGRATOR [INTERNAL] 
    %
    %  bool = HAS_INTEGRATOR(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L122
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L122-L124
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(837, varargin{:});
end
