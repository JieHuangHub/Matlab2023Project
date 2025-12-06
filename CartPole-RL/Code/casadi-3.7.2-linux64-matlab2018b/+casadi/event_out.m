function varargout = event_out(varargin)
    %EVENT_OUT [INTERNAL] 
    %
    %  {char} = EVENT_OUT()
    %
    %Get output scheme of an event transition functions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L260
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L260-L262
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(849, varargin{:});
end
