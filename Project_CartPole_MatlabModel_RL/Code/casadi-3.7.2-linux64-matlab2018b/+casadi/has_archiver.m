function varargout = has_archiver(varargin)
    %HAS_ARCHIVER [INTERNAL] 
    %
    %  bool = HAS_ARCHIVER(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/archiver.hpp#L38
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/archiver.cpp#L38-L40
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(1207, varargin{:});
end
