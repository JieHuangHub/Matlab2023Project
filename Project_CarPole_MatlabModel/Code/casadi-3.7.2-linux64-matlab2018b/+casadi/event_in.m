function varargout = event_in(varargin)
    %EVENT_IN [INTERNAL] 
    %
    %  {char} = EVENT_IN()
    %
    %Get input scheme of an event transition function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L256
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L256-L258
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(848, varargin{:});
end
