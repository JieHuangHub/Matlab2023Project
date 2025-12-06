function varargout = stop_diff(varargin)
    %STOP_DIFF Stop derivatives of an expression wrt to a select set of symbolic 
    %
    %  MX = STOP_DIFF(MX expr, int order)
    %  MX = STOP_DIFF(MX expr, MX var, int order)
    %
    %
    %variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25o
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L906
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L906-L908
    %
    %
  [varargout{1:nargout}] = casadiMEX(941, varargin{:});
end
