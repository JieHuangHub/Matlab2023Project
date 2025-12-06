function varargout = conic_options(varargin)
    %CONIC_OPTIONS [INTERNAL] 
    %
    %  {char} = CONIC_OPTIONS(char name)
    %
    %Get all options for a plugin.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1ek
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.hpp#L563
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.cpp#L563-L565
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(856, varargin{:});
end
