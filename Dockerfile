FROM alpine:latest

WORKDIR /hoodbot2

# Install deps
RUN apk add curl gcc clang

# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Copy over the Cargo.lock and Cargo.toml, add a fake lib.rs, build to get deps, and then remove the fake lib.rs
COPY Cargo.toml ./
COPY Cargo.lock ./
RUN mkdir -p ./src && echo "// Dummy lib" > ./src/lib.rs

# Install deps
RUN source "$HOME/.cargo/env" && cargo build --release

# Remove the fake lib.rs
RUN rm src/lib.rs

# Copy over the rest of the files
COPY ./ ./

# Rebuild
RUN source "$HOME/.cargo/env" && cargo build --release

CMD ["./target/release/hoodbot2"]