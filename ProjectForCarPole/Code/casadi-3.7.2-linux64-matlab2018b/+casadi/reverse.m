function varargout = reverse(varargin)
    %REVERSE Reverse a list.
    %
    %  {{DM}} = REVERSE({DM} ex, {DM} arg, {{DM}} v, struct opts)
    %  {{SX}} = REVERSE({SX} ex, {SX} arg, {{SX}} v, struct opts)
    %  {{MX}} = REVERSE({MX} ex, {MX} arg, {{MX}} v, struct opts)
    %
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1la
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/casadi_misc.hpp#L603
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/casadi_misc.hpp#L603-L607
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(931, varargin{:});
end
