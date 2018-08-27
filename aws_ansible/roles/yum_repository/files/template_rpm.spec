Name: helloworld
Version: 1
Release: 1
Summary: HelloWorld Application
License: GPL
Group: Development/Tools
SOURCE0 : helloworld.tar.gz
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}.buildroot
Packager: Richie Richard Rajkumar

%description
Creating a helloworld RPM to host a simple HTML page.

%prep
%setup -q -n %{name}

%build
# Empty section.

%install
mkdir -p "$RPM_BUILD_ROOT/opt/CHANGE_ME"
cp -r * "$RPM_BUILD_ROOT/opt/CHANGE_ME"

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)
