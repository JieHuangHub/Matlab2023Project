function varargout = no_hess(varargin)
    %NO_HESS Stop second derivatives of an expression wrt to all its symbolic 
    %
    %  MX = NO_HESS(MX expr)
    %
    %variables.
    %
    %\\seealso stop_diff
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25n
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L898
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L898-L900
    %
    %
  [varargout{1:nargout}] = casadiMEX(943, varargin{:});
end
